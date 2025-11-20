# Lab4 实验报告

## 实验目的

- 了解内核线程创建/执行的管理过程
- 了解内核线程的切换和基本调度过程
- 掌握进程控制块（PCB）的分配和初始化
- 理解进程的创建、切换和调度机制

## 实验内容

本实验主要完成了三个练习：
1. 分配并初始化进程控制块
2. 为新创建的内核线程分配资源
3. 实现进程切换函数

---

## 练习1：分配并初始化进程控制块

### 实验要求

`alloc_proc` 函数负责分配并返回一个新的 `struct proc_struct` 结构，用于存储新建立的内核线程的管理信息。需要对这个结构进行最基本的初始化。

### 设计实现

在 `alloc_proc` 函数中，对 `proc_struct` 结构的各个字段进行初始化：

```c
static struct proc_struct *
alloc_proc(void)
{
    struct proc_struct *proc = kmalloc(sizeof(struct proc_struct));
    if (proc != NULL)
    {
        proc->state = PROC_UNINIT;                      // 设置进程为未初始化状态
        proc->pid = -1;                                 // 未初始化的进程id为-1
        proc->runs = 0;                                 // 初始化运行时间为0
        proc->kstack = 0;                               // 内核栈地址初始化为0
        proc->need_resched = 0;                         // 不需要调度
        proc->parent = NULL;                            // 父进程为空
        proc->mm = NULL;                                // 虚拟内存为空
        memset(&(proc->context), 0, sizeof(struct context)); // 初始化上下文
        proc->tf = NULL;                                // 中断帧指针为空
        proc->pgdir = boot_pgdir_pa;                    // 页目录表设为内核页目录表的基址
        proc->flags = 0;                                // 标志位为0
        memset(proc->name, 0, PROC_NAME_LEN + 1);       // 进程名清零
    }
    return proc;
}
```

### 初始化说明

各字段的初始化理由：

| 字段 | 初始值 | 说明 |
|------|--------|------|
| `state` | `PROC_UNINIT` | 进程处于未初始化状态 |
| `pid` | -1 | 表示尚未分配进程ID |
| `runs` | 0 | 进程尚未运行 |
| `kstack` | 0 | 内核栈稍后通过 `setup_kstack` 分配 |
| `need_resched` | 0 | 不需要重新调度 |
| `parent` | NULL | 父进程指针稍后设置 |
| `mm` | NULL | 内存管理结构稍后初始化 |
| `context` | 全0 | 进程上下文稍后在 `copy_thread` 中设置 |
| `tf` | NULL | 中断帧指针稍后在 `copy_thread` 中设置 |
| `pgdir` | `boot_pgdir_pa` | 使用内核页目录表 |
| `flags` | 0 | 无特殊标志 |
| `name` | 全0 | 进程名稍后通过 `set_proc_name` 设置 |

### 问题回答

**问题：请说明 `proc_struct` 中 `struct context context` 和 `struct trapframe *tf` 成员变量含义和在本实验中的作用是什么？**

#### 1. `struct context context`

**含义：** 进程上下文，用于保存进程切换时需要保存的寄存器状态。

**结构定义：**
```c
struct context {
    uintptr_t ra;   // 返回地址寄存器
    uintptr_t sp;   // 栈指针寄存器
    uintptr_t s0-s11; // 被调用者保存寄存器
};
```

**作用：**
- **进程切换时保存CPU状态**：在进程切换时（`switch_to` 函数），保存当前进程的关键寄存器值（ra、sp、s0-s11等被调用者保存寄存器）
- **恢复进程执行**：切换回该进程时，从 `context` 中恢复这些寄存器的值，使进程能够从之前暂停的地方继续执行
- **内核态切换**：`context` 用于内核线程之间的切换，不涉及用户态
- **轻量级**：只保存必要的被调用者保存寄存器，相比 `trapframe` 更轻量

#### 2. `struct trapframe *tf`

**含义：** 中断帧指针，指向内核栈中保存的中断/异常发生时的现场。

**结构定义：**
```c
struct trapframe {
    struct pushregs gpr;  // 通用寄存器
    uintptr_t status;     // 状态寄存器
    uintptr_t epc;        // 异常PC
    uintptr_t badvaddr;   // 错误地址
    uintptr_t cause;      // 异常原因
};
```

**作用：**
- **保存中断/异常现场**：当发生中断或系统调用时，硬件和软件协作将所有寄存器保存到内核栈，`tf` 指向这个保存区域
- **从内核态返回用户态**：通过 `trapframe` 可以恢复用户进程在中断前的完整状态（所有通用寄存器、PC、状态寄存器等）
- **进程创建**：在 `copy_thread` 中设置新进程的 `tf`，使新进程能够正确启动
- **系统调用参数传递**：系统调用的参数和返回值通过 `trapframe` 中的寄存器传递
- **完整保存**：保存所有寄存器状态，用于中断处理和用户态/内核态切换

#### 两者的区别

| 特性 | context | trapframe |
|------|---------|-----------|
| 保存内容 | 被调用者保存寄存器（ra, sp, s0-s11） | 所有寄存器 + 状态信息 |
| 使用场景 | 内核线程切换 | 中断处理、系统调用、用户态切换 |
| 大小 | 轻量级（约14个寄存器） | 重量级（所有寄存器+状态） |
| 切换开销 | 小 | 大 |

---

## 练习2：为新创建的内核线程分配资源

### 实验要求

创建一个内核线程需要分配和设置好很多资源。`kernel_thread` 函数通过调用 `do_fork` 函数完成具体内核线程的创建工作。需要完成 `do_fork` 函数的实现。

### 设计实现

`do_fork` 函数按照以下7个步骤实现：

```c
int do_fork(uint32_t clone_flags, uintptr_t stack, struct trapframe *tf)
{
    int ret = -E_NO_FREE_PROC;
    struct proc_struct *proc;
    if (nr_process >= MAX_PROCESS)
    {
        goto fork_out;
    }
    ret = -E_NO_MEM;

    // 1. 调用 alloc_proc 分配一个进程控制块
    if ((proc = alloc_proc()) == NULL)
    {
        goto fork_out;
    }
    
    // 2. 调用 setup_kstack 为子进程分配内核栈
    if (setup_kstack(proc) != 0)
    {
        goto bad_fork_cleanup_proc;
    }
    
    // 3. 调用 copy_mm 根据 clone_flag 复制或共享内存管理信息
    if (copy_mm(clone_flags, proc) != 0)
    {
        goto bad_fork_cleanup_kstack;
    }
    
    // 4. 调用 copy_thread 设置进程的中断帧和上下文
    copy_thread(proc, stack, tf);
    
    // 5. 将新进程插入到 hash_list 和 proc_list 中
    // 需要在关中断的情况下进行，保证原子性
    bool intr_flag;
    local_intr_save(intr_flag);
    {
        proc->pid = get_pid();              // 分配唯一的 PID
        hash_proc(proc);                    // 加入哈希表
        list_add(&proc_list, &(proc->list_link));  // 加入进程链表
        nr_process++;                       // 进程计数加1
    }
    local_intr_restore(intr_flag);
    
    // 6. 调用 wakeup_proc 设置新进程状态为 RUNNABLE
    wakeup_proc(proc);
    
    // 7. 返回新进程的 PID
    ret = proc->pid;
    
fork_out:
    return ret;

bad_fork_cleanup_kstack:
    put_kstack(proc);
bad_fork_cleanup_proc:
    kfree(proc);
    goto fork_out;
}
```

### 实现要点

1. **资源分配顺序**：按照从简单到复杂的顺序分配资源，便于出错时回收
   - 先分配进程控制块（内存较小）
   - 再分配内核栈（需要物理页面）
   - 然后复制内存管理信息

2. **错误处理**：使用 goto 标签实现资源的逐级清理
   - `bad_fork_cleanup_kstack`：释放内核栈
   - `bad_fork_cleanup_proc`：释放进程控制块

3. **原子性保护**：在分配 PID 和插入进程列表时关闭中断
   - 防止多个进程同时调用 `do_fork` 时产生竞态条件
   - 保证 PID 分配的唯一性
   - 保证进程列表操作的原子性

### 问题回答

**问题：请说明 ucore 是否做到给每个新 fork 的线程一个唯一的 id？请说明你的分析和理由。**

**答案：是的，ucore 能够保证给每个新 fork 的线程分配唯一的 PID。**

#### 分析和理由

##### 1. `get_pid()` 函数的设计保证了 PID 的唯一性

```c
static int get_pid(void)
{
    static_assert(MAX_PID > MAX_PROCESS);
    struct proc_struct *proc;
    list_entry_t *list = &proc_list, *le;
    static int next_safe = MAX_PID, last_pid = MAX_PID;
    
    if (++last_pid >= MAX_PID)
    {
        last_pid = 1;
        goto inside;
    }
    if (last_pid >= next_safe)
    {
    inside:
        next_safe = MAX_PID;
    repeat:
        le = list;
        while ((le = list_next(le)) != list)
        {
            proc = le2proc(le, list_link);
            if (proc->pid == last_pid)  // 发现冲突
            {
                if (++last_pid >= next_safe)
                {
                    if (last_pid >= MAX_PID)
                    {
                        last_pid = 1;
                    }
                    next_safe = MAX_PID;
                    goto repeat;  // 重新查找
                }
            }
            else if (proc->pid > last_pid && next_safe > proc->pid)
            {
                next_safe = proc->pid;
            }
        }
    }
    return last_pid;
}
```

**该函数的唯一性保证机制：**

- 使用静态变量 `last_pid` 记录上次分配的 PID
- 每次分配时先递增 `last_pid`
- 遍历所有现有进程，检查是否存在 PID 冲突
- 如果发现冲突，继续递增并重新检查
- 使用 `next_safe` 优化：记录下一个安全区间的边界，减少不必要的遍历

##### 2. 中断保护确保原子性

在 `do_fork` 中，PID 分配和进程插入列表的操作被放在关中断区域内：

```c
bool intr_flag;
local_intr_save(intr_flag);     // 关中断
{
    proc->pid = get_pid();       // 分配PID
    hash_proc(proc);             // 加入哈希表
    list_add(&proc_list, &(proc->list_link));  // 加入链表
    nr_process++;
}
local_intr_restore(intr_flag);   // 开中断
```

这确保了即使在多核或中断环境下，PID 分配过程也是原子的，不会出现：
- 两个进程同时获得相同的 PID
- 进程列表在 PID 分配过程中被修改

##### 3. PID 范围限制

- `MAX_PID = MAX_PROCESS * 2 = 8192`
- 实际最大进程数 `MAX_PROCESS = 4096`
- PID 空间是进程数的2倍，为回收的进程 PID 提供缓冲

**结论：** 通过 `get_pid()` 的冲突检测机制和中断保护的原子性保证，ucore 能够确保每个新 fork 的线程获得唯一的 PID。

---

## 练习3：编写 proc_run 函数

### 实验要求

`proc_run` 用于将指定的进程切换到 CPU 上运行。需要实现进程切换的完整流程。

### 设计实现

`proc_run` 函数实现如下：

```c
void proc_run(struct proc_struct *proc)
{
    if (proc != current)
    {
        bool intr_flag;
        struct proc_struct *prev = current, *next = proc;
        
        // 1. 禁用中断
        local_intr_save(intr_flag);
        {
            // 2. 切换当前进程为要运行的进程
            current = proc;
            
            // 3. 切换页表，使用新进程的地址空间
            lsatp(next->pgdir);
            
            // 4. 实现上下文切换
            switch_to(&(prev->context), &(next->context));
        }
        // 5. 允许中断
        local_intr_restore(intr_flag);
    }
}
```

### 实现要点说明

#### 1. 检查是否需要切换
```c
if (proc != current)
```
- 如果要切换的进程就是当前进程，则无需切换，直接返回
- 避免不必要的开销

#### 2. 禁用中断（关中断）
```c
bool intr_flag;
local_intr_save(intr_flag);
```
- 使用 `local_intr_save()` 宏保存当前中断状态并关闭中断
- **原因**：进程切换是关键操作，必须保证原子性，不能被中断打断
- 如果在切换过程中发生中断，可能导致系统状态不一致

#### 3. 切换当前进程指针
```c
current = proc;
```
- 更新全局变量 `current`，使其指向即将运行的新进程
- 之后的代码（包括中断处理）都会认为新进程是当前进程

#### 4. 切换页表
```c
lsatp(next->pgdir);
```
- 调用 `lsatp()` 函数修改 SATP 寄存器
- **SATP 寄存器**：Supervisor Address Translation and Protection，保存页表基址
- 切换页表后，虚拟地址到物理地址的映射关系改变，使用新进程的地址空间
- **注意**：本实验中内核线程共享内核地址空间，pgdir 都指向 `boot_pgdir_pa`

#### 5. 上下文切换
```c
switch_to(&(prev->context), &(next->context));
```
- 调用汇编函数 `switch_to()` 进行真正的上下文切换
- 保存当前进程（prev）的寄存器状态到 `prev->context`
- 恢复新进程（next）的寄存器状态从 `next->context`
- **包括**：ra（返回地址）、sp（栈指针）、s0-s11（被调用者保存寄存器）

#### 6. 允许中断（开中断）
```c
local_intr_restore(intr_flag);
```
- 恢复之前保存的中断状态
- 如果之前中断是开启的，则重新开启中断

### 为什么要关中断？

1. **保证原子性**：进程切换是一系列紧密相关的操作，不能被分割
2. **避免数据不一致**：
   - 如果在修改 `current` 后、切换上下文前发生中断
   - 中断处理程序可能使用错误的进程信息
3. **防止死锁**：避免在关键数据结构更新过程中被抢占

### 问题回答

**问题：在本实验的执行过程中，创建且运行了几个内核线程？**

**答案：创建并运行了 2 个内核线程。**

#### 详细分析

##### 线程1：idleproc（idle 线程，PID=0）

在 `proc_init()` 函数中创建：

```c
void proc_init(void)
{
    // 直接通过 alloc_proc 创建（不是通过 do_fork）
    if ((idleproc = alloc_proc()) == NULL)
    {
        panic("cannot alloc idleproc.\n");
    }
    
    // 手动设置 idleproc 的属性
    idleproc->pid = 0;
    idleproc->state = PROC_RUNNABLE;
    idleproc->kstack = (uintptr_t)bootstack;
    idleproc->need_resched = 1;
    set_proc_name(idleproc, "idle");
    nr_process++;
    
    current = idleproc;  // 设为当前进程
}
```

**特点：**
- 第一个内核线程，由内核手动创建
- PID = 0
- 是系统的第0号进程
- 主要工作：在 `cpu_idle()` 中不断循环，检查是否需要调度其他进程
- 当没有其他进程可运行时，idle 进程占用 CPU

##### 线程2：initproc（init 线程，PID=1）

在 `proc_init()` 函数中通过 `kernel_thread()` 创建：

```c
void proc_init(void)
{
    // ...
    
    // 通过 kernel_thread -> do_fork 创建
    int pid = kernel_thread(init_main, "Hello world!!", 0);
    if (pid <= 0)
    {
        panic("create init_main failed.\n");
    }
    
    initproc = find_proc(pid);
    set_proc_name(initproc, "init");
    
    assert(initproc != NULL && initproc->pid == 1);
}
```

**创建流程：**
```
kernel_thread() 
  -> do_fork() 
    -> alloc_proc()         // 分配PCB
    -> setup_kstack()       // 分配内核栈
    -> copy_thread()        // 设置trapframe和context
    -> wakeup_proc()        // 设为RUNNABLE状态
```

**特点：**
- 通过标准的 fork 机制创建
- PID = 1
- 执行函数：`init_main()`
- 输出 "Hello world!!" 等信息
- 是系统中第一个通过 fork 创建的进程

#### 线程执行流程

```
kern_init()
  -> proc_init()
    - 创建 idleproc (PID=0)
    - 创建 initproc (PID=1)
  -> cpu_idle()
    - idleproc 开始执行
    - 发现 need_resched = 1
    - 调用 schedule()
      -> 选择 initproc (state=RUNNABLE)
      -> 调用 proc_run(initproc)
        -> 切换到 initproc
    - initproc 执行 init_main()
      -> 输出 "Hello world!!" 等信息
      -> 返回
    - 尝试调用 do_exit() 退出
      -> panic("process exit!!.")  // do_exit未实现
```

#### 总结

**两个内核线程：**
1. **idleproc (PID=0)**：空闲进程，系统默认进程
2. **initproc (PID=1)**：初始化进程，第一个用户进程的祖先

这是经典的 Unix/Linux 风格的进程管理方式，所有后续创建的进程都会是这两个进程的后代。

---

## 实验结果

### 编译结果

```bash
$ make
+ cc kern/init/entry.S
+ cc kern/init/init.c
+ cc kern/process/proc.c
+ ld bin/kernel
```

编译成功，无错误。

### 运行结果

```bash
$ make qemu
```

输出：
```
(THU.CST) os is loading ...
...
check_alloc_page() succeeded!
check_pgdir() succeeded!
check_boot_pgdir() succeeded!
kmalloc_init() succeeded!
alloc_proc() correct!
++ setup timer interrupts
this initproc, pid = 1, name = "init"
To U: "Hello world!!".
To U: "en.., Bye, Bye. :)"
kernel panic at kern/process/proc.c:402:
    process exit!!.
```

**说明：**
- ✅ `alloc_proc() correct!` - 练习1通过
- ✅ `this initproc, pid = 1, name = "init"` - 练习2通过
- ✅ 成功输出 "Hello world!!" - 练习3通过
- 最后的 panic 是预期行为，因为 `do_exit()` 尚未实现

### 评分结果

```bash
$ make grade
  -check alloc proc:                         OK
  -check initproc:                           OK
Total Score: 30/30
```

**满分通过！** ✅

---

## 实验总结

### 主要收获

1. **进程控制块（PCB）管理**
   - 理解了 PCB 的结构和各字段的含义
   - 掌握了进程控制块的分配和初始化方法
   - 理解了 context 和 trapframe 的区别和作用

2. **进程创建机制**
   - 掌握了 fork 机制的实现原理
   - 理解了进程资源分配的顺序和错误处理
   - 学会了使用关中断保证操作的原子性

3. **进程调度与切换**
   - 理解了进程切换的完整流程
   - 掌握了上下文切换的实现方法
   - 理解了页表切换和地址空间切换

4. **系统初始化**
   - 理解了系统启动时进程的创建过程
   - 掌握了 idleproc 和 initproc 的角色
   - 理解了进程调度的基本原理

### 遇到的问题

1. **PID 唯一性保证**
   - 问题：如何确保 PID 不重复？
   - 解决：通过 `get_pid()` 的冲突检测和中断保护机制

2. **进程切换时序**
   - 问题：何时关中断，何时开中断？
   - 解决：在修改全局状态前关中断，完成后恢复

3. **资源清理顺序**
   - 问题：分配失败时如何正确清理？
   - 解决：使用 goto 标签按分配的逆序清理

### 实验心得

本实验深入理解了操作系统进程管理的核心机制，特别是：

1. **进程抽象**：通过 PCB 统一管理进程的各种资源
2. **资源管理**：合理的资源分配和错误处理策略
3. **并发控制**：通过关中断保证关键操作的原子性
4. **上下文切换**：理解了硬件和软件协作实现进程切换

这些知识为后续学习进程通信、同步互斥等高级主题打下了坚实基础。

---

## 参考资料

1. uCore 实验指导书
2. RISC-V 特权级规范
3. 《操作系统概念》(Operating System Concepts)
4. uCore 源代码及注释
