# 练习一
## 一、总体思想概述

first-fit（首次适应算法）是一种**连续内存分配算法**，其基本思想是：

> 从空闲块链表的头开始，找到第一个**能容纳所需大小的空闲块**，然后从其中分配所需的空间。

这种算法实现简单、速度快，但可能导致**外部碎片**（很多零散小空闲块）。

在 `default_pmm.c` 中，空闲块（free area）用链表 `free_list` 管理，每个空闲块用 `struct Page` 表示，块的大小记录在 `property` 字段中。

---

## 二、主要数据结构

```c
typedef struct {
    list_entry_t free_list; // 空闲块链表头
    size_t nr_free;         // 当前空闲页的总数
} free_area_t;

static free_area_t free_area;

#define free_list (free_area.free_list)
#define nr_free   (free_area.nr_free)
```

其中：

* `free_list` 维护所有空闲页块；
* 每个空闲页块的首页（即块首的Page）中：

  * `property` 表示连续空闲页的数量；
  * `PageProperty(p)` 标识该页是否是空闲块的首页。

---

## 三、核心函数分析

###  `default_init()`

```c
static void default_init(void) {
    list_init(&free_list);
    nr_free = 0;
}
```

**功能：**
初始化内存管理器，将空闲链表清空，空闲页计数归零。

**时机：**
系统启动时调用一次，为内存分配子系统初始化环境。

---

###  `default_init_memmap(struct Page *base, size_t n)`

**功能：**
初始化一段连续物理页（从 `base` 开始，共 `n` 页）为**可用空闲块**。

**过程：**

1. 遍历该区间，清空标志位、引用计数；
2. 设置 `base->property = n`，表示这是一段连续的 `n` 页；
3. 调用 `SetPageProperty(base)`，标记这是块首；
4. 把这个空闲块插入 `free_list` 链表（按地址顺序插入）；
5. 更新全局空闲页数 `nr_free += n`。

**结果：**
系统记录了一个新的空闲内存块。

---

###  `default_alloc_pages(size_t n)`

**功能：**
从空闲块链表中**分配连续 n 页物理内存**（采用 first-fit 算法）。

**过程：**

1. 若 `n > nr_free`，直接返回 `NULL`；
2. 从链表头开始遍历：

   * 找到第一个 `p->property >= n` 的空闲块；
   * 若找到则分配该块；
3. 若该块大小 > n：

   * 拆分该块；
   * 余下部分重新插入空闲链表；
4. 从链表中删除被分配部分；
5. 清除 `PageProperty` 标志；
6. 更新 `nr_free -= n`；
7. 返回分配的 `page` 指针。

**逻辑图：**

```
空闲链表: [10页] -> [8页] -> [6页]
请求分配 5 页
→ 命中第一个 [10页]
→ 分配前5页，剩余 [5页] 插回原位置
```

---

###  `default_free_pages(struct Page *base, size_t n)`

**功能：**
释放从 `base` 开始的 n 页，使之重新加入空闲块链表。

**过程：**

1. 检查页合法性；
2. 清除标志位、引用计数；
3. 设置 `base->property = n`，标记为空闲块首；
4. 插入 `free_list` 链表中（按物理地址顺序）；
5. **尝试合并相邻空闲块：**

   * 若前一个块的末尾紧邻当前块，则合并；
   * 若后一个块的开头紧邻当前块末尾，也合并。

**最终保证：**
空闲链表中不存在相邻可合并的块，防止外部碎片进一步扩大。

---

###  `default_nr_free_pages()`

返回当前系统空闲页总数。

---

###  `default_check()`

是系统的测试函数，用于验证 `first-fit` 分配逻辑是否正确。包括：

* 分配、释放页；
* 检查是否能正确分配期望大小；
* 检查是否能正确合并；
* 验证空闲页数量一致性。

---

## 四、内存分配过程总结（first-fit）

**示意流程：**

```
空闲链表:  [base1, size=4] -> [base2, size=6] -> [base3, size=8]
请求分配 n=5 页：

1. 从链表头开始遍历
2. base1.size=4 < 5  → 跳过
3. base2.size=6 >= 5 → 命中
4. 从 base2 分配前 5 页
5. 剩余 1 页，形成新块 [base2+5, size=1]
6. 更新链表、nr_free
```

---

## 五、设计实现过程说明

> 采用了 first-fit 连续物理内存分配算法。内存空闲区使用链表维护，每个空闲块用块首页记录连续页数。初始化时通过 `default_init_memmap` 将物理页标记为空闲块，并按地址顺序插入链表。分配时，遍历链表查找第一个能满足请求大小的块（first-fit），如块大于请求则进行分裂。释放时，将页重新插入空闲链表，并检查相邻块是否可以合并，保证空闲块尽可能大以减少碎片。

---

## 六、改进空间分析

当前 first-fit 算法虽然简单高效，但存在以下改进空间：

| 问题             | 改进思路                                              |
| -------------- | ------------------------------------------------- |
| **外部碎片严重**     | 使用 **best-fit** 或 **buddy system（伙伴系统）**，减少碎片；    |
| **查找效率较低**     | 可使用平衡树（如红黑树）、堆或分级链表（segregated free list）结构以加快查找； |
| **频繁合并/分裂**    | 引入延迟合并策略（deferred coalescing），减少开销；               |
| **空闲块维护复杂度较高** | 使用双向空闲区表或索引结构，快速查找合并位置；                           |
| **无法跨越不连续空闲区** | 改用 **分页+虚拟地址映射机制**，通过页表实现逻辑连续而物理不连续的分配。           |

---

## 七、总结

| 函数                        | 主要功能             |
| ------------------------- | ---------------- |
| `default_init()`          | 初始化空闲块链表         |
| `default_init_memmap()`   | 初始化可用物理页区域为一个空闲块 |
| `default_alloc_pages(n)`  | 首次适应算法分配连续 n 页   |
| `default_free_pages()`    | 释放并尝试合并相邻空闲块     |
| `default_nr_free_pages()` | 返回系统空闲页数         |
| `default_check()`         | 检查算法正确性          |

> **改进方向：** 可从减少外部碎片、优化查找效率、改用伙伴系统等方向进行提升。

---
# 练习二
## 一、设计与实现思路

`Best-Fit`（最佳适配）算法的核心思想是：

> 在所有空闲内存块中，选择**能够容纳请求内存且空间最小的空闲块**进行分配，从而尽量减少内存碎片。

相比 `First-Fit`（首次适配）算法只找到第一个满足要求的块，`Best-Fit` 需要**遍历整个空闲链表**，找到最“合适”的块。

---

### （1）核心数据结构

同样使用 `free_area_t` 管理空闲物理页：

```c
typedef struct {
    list_entry_t free_list; // 空闲块链表
    size_t nr_free;         // 当前空闲页总数
} free_area_t;

#define free_list (free_area.free_list)
#define nr_free (free_area.nr_free)
```

链表中每个节点对应一个**连续空闲物理页块**（`Page` 结构体的起始页），其成员：

* `property`：表示该空闲块的页数；
* `page_link`：用于将页块链接到 `free_list`；
* 标志位 `PageProperty` 用于标识该页块是否可分配。

---

### （2）初始化阶段：`best_fit_init` & `best_fit_init_memmap`

```c
static void best_fit_init(void) {
    list_init(&free_list);
    nr_free = 0;
}
```

初始化空闲链表为空，空闲页总数清零。

```c
static void best_fit_init_memmap(struct Page *base, size_t n)
```

主要任务：

1. 遍历 `base ~ base + n`，清空标志位与引用计数；
2. 标记 `base` 为该空闲块的起始页，并设置 `property = n`；
3. 将该页块按物理地址顺序插入到 `free_list` 中；
4. `nr_free += n`。

---

### （3）页面分配：`best_fit_alloc_pages`

```c
static struct Page *best_fit_alloc_pages(size_t n)
```

实现步骤：

1. 若 `n > nr_free`，返回 `NULL`；
2. 遍历整个 `free_list`：

   ```c
   size_t min_size = nr_free + 1;
   struct Page *page = NULL;

   while ((le = list_next(le)) != &free_list) {
       struct Page *p = le2page(le, page_link);
       if (p->property >= n && p->property < min_size) {
           min_size = p->property;
           page = p;
       }
   }
   ```

   找出满足要求且 **最小的空闲块**；
3. 若找到合适块 `page`：

   * 从 `free_list` 中删除；
   * 若空闲块大于所需页数，拆分剩余部分重新插入链表；
   * 更新 `nr_free -= n`；
   * 清除 `PageProperty(page)`；
   * 返回分配的页指针。

该过程即完成 **最佳适配分配**。

---

### （4）页面释放：`best_fit_free_pages`

```c
static void best_fit_free_pages(struct Page *base, size_t n)
```

主要步骤：

1. 清空标志与引用计数；
2. 标记 `base` 为新空闲块头，设置 `property = n`；
3. 插入 `free_list`（保持物理地址有序）；
4. 尝试**前后合并**相邻空闲块：

   ```c
   if (p + p->property == base) { /* 前向合并 */ }
   if (base + base->property == p) { /* 后向合并 */ }
   ```

   合并时更新 `property`，删除被合并节点；
5. 更新 `nr_free += n`。

---

## 二、物理内存分配与释放流程总结

| 操作阶段   | 关键函数                     | 功能说明                        |
| ------ | ------------------------ | --------------------------- |
| 初始化    | `best_fit_init`          | 清空空闲链表与计数器                  |
| 建立空闲块  | `best_fit_init_memmap`   | 将连续物理页初始化为空闲块并插入链表          |
| 分配内存   | `best_fit_alloc_pages`   | 遍历链表，选择最小满足条件的空闲块进行分配（最佳适配） |
| 释放内存   | `best_fit_free_pages`    | 将释放页重新插入空闲链表并尝试合并相邻空闲块      |
| 查询空闲页数 | `best_fit_nr_free_pages` | 返回当前剩余空闲页数                  |

---

## 三、Best-Fit算法的特点与改进空间

### 优点：

* 相比 `First-Fit`，**更节省空间**，减少大块空闲内存被切碎；
* 有助于**降低外部碎片率**。

### 缺点：

1. **时间复杂度高**：每次分配都需要遍历整个链表；
2. **碎片分布不稳定**：频繁的小块分配与释放可能导致很多极小碎片；
3. **不易缓存**：不像 `First-Fit` 可以记住上次分配位置，Best-Fit 每次都要全表扫描。

---

### 改进方向：

1. **增加空闲块排序结构**

   * 使用**平衡树（如红黑树）**或**最小堆**按块大小排序；
   * 分配时可在 `O(log n)` 时间找到最小合适块；
   * 释放时维护平衡树结构，提升整体效率。

2. **改进空闲块合并策略**

   * 采用**延迟合并**或**伙伴系统（Buddy System）**减少频繁操作；
   * 合并时维护双向指针以减少链表遍历。

3. **分级空闲表（Segregated Free Lists）**

   * 按块大小分类管理（如 4KB、8KB、16KB...），分配时直接查对应链表；
   * 常用于现代操作系统的 slab/slub 分配器中。

---

## 四、总结段

> 在本实验中，我基于 `kern/mm/default_pmm.c` 的 First-Fit 实现，编写了 Best-Fit 物理内存分配算法。
> 其主要思路是：遍历整个空闲页链表，找出能够满足所需页数且块大小最小的空闲区进行分配。
> 在分配后若剩余空间仍有页，则将剩余部分重新挂回空闲链表；释放时则通过合并相邻空闲块以减少碎片。
> 该算法相比 First-Fit 能更好地利用空间，但在时间效率上存在不足。后续可通过引入平衡树结构或分级空闲表来优化查找效率和碎片管理。

---
