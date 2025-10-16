#include <list.h>
#include <string.h>
#include <buddy_system.h>
#include <stdio.h>

#define MAX_ORDER 10   // 最大支持 2^10 = 1024 页

typedef struct {
    list_entry_t free_list[MAX_ORDER];  // 每阶一个空闲链表
    unsigned int nr_free[MAX_ORDER];    // 每阶空闲块数量
} buddy_area_t;

static buddy_area_t buddy_area;

static void
buddy_init(void) {
    for (int i = 0; i < MAX_ORDER; i++) {
        list_init(&buddy_area.free_list[i]);
        buddy_area.nr_free[i] = 0;
    }
}

static void
buddy_init(void) {
    for (int i = 0; i < MAX_ORDER; i++) {
        list_init(&buddy_area.free_list[i]);
        buddy_area.nr_free[i] = 0;
    }
}

static void
buddy_init_memmap(struct Page *base, size_t n) {
    assert(n > 0);
    struct Page *p = base;
    for (; p != base + n; p++) {
        p->flags = p->property = 0;
        set_page_ref(p, 0);
    }

    size_t remain = n;
    while (remain > 0) {
        int order = 0;
        while ((1 << (order + 1)) <= remain && (base - pmm_base) % (1 << (order + 1)) == 0)
            order++;
        base->property = 1 << order;
        SetPageProperty(base);
        list_add(&(buddy_area.free_list[order]), &(base->page_link));
        buddy_area.nr_free[order]++;
        remain -= (1 << order);
        base += (1 << order);
    }
}

static struct Page *
buddy_alloc_pages(size_t n) {
    assert(n > 0);
    int order = 0;
    while ((1 << order) < n && order < MAX_ORDER) order++;
    if (order >= MAX_ORDER) return NULL;

    int target = order;
    while (target < MAX_ORDER && list_empty(&buddy_area.free_list[target]))
        target++;
    if (target >= MAX_ORDER) return NULL;

    // 找到更大阶空闲块，逐级分裂
    struct Page *page = le2page(list_next(&buddy_area.free_list[target]), page_link);
    list_del(&(page->page_link));
    buddy_area.nr_free[target]--;

    while (target > order) {
        target--;
        struct Page *buddy = page + (1 << target);
        buddy->property = (1 << target);
        SetPageProperty(buddy);
        list_add(&(buddy_area.free_list[target]), &(buddy->page_link));
        buddy_area.nr_free[target]++;
    }

    ClearPageProperty(page);
    return page;
}

static void
buddy_free_pages(struct Page *base, size_t n) {
    assert(n > 0);
    int order = 0;
    while ((1 << order) < n && order < MAX_ORDER) order++;
    assert(order < MAX_ORDER);

    struct Page *buddy;
    uintptr_t addr = page2pa(base) / PGSIZE;  // 页号

    // 尝试向上合并
    while (order < MAX_ORDER - 1) {
        uintptr_t buddy_addr = addr ^ (1 << order);  // 伙伴地址
        buddy = pa2page(buddy_addr * PGSIZE);

        if (!PageProperty(buddy) || buddy->property != (1 << order))
            break; // 伙伴非空闲或阶不同

        // 合并：删除伙伴
        list_del(&(buddy->page_link));
        buddy_area.nr_free[order]--;
        ClearPageProperty(buddy);

        // 确定新块基地址
        if (buddy < base) base = buddy;
        addr = page2pa(base) / PGSIZE;
        order++;
    }

    base->property = 1 << order;
    SetPageProperty(base);
    list_add(&(buddy_area.free_list[order]), &(base->page_link));
    buddy_area.nr_free[order]++;
}
static size_t
buddy_nr_free_pages(void) {
    size_t total = 0;
    for (int i = 0; i < MAX_ORDER; i++) {
        total += buddy_area.nr_free[i] * (1 << i);
    }
    return total;
}
static void
buddy_check(void) {
    // 可以用 basic_check 测试基础分配/释放逻辑
    basic_check();
}