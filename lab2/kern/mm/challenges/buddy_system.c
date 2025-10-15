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

