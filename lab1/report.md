# 练习1：理解内核启动中的程序入口操作
## 总体背景：内核启动流程

在 RISC-V 或类似体系结构中，**内核启动流程（boot process）** 通常如下：

1. **机器上电 → Bootloader（如 OpenSBI）运行**

   * 初始化最基本的硬件（MMU、页表、栈、内存布局）。
   * 把控制权转交给操作系统内核的入口点 `kern_entry`。

2. **进入 `kern_entry` 汇编函数**

   * 建立内核自己的运行栈。
   * 跳转到 C 语言的内核初始化函数 `kern_init`。

3. **在 `kern_init()` 中**

   * 初始化内存管理、异常处理、进程调度、文件系统等。

---

## 逐行分析 `entry.S`

### 源代码回顾

```asm
#include <mmu.h>
#include <memlayout.h>

.section .text,"ax",%progbits
.globl kern_entry
kern_entry:
    la sp, bootstacktop

    tail kern_init

.section .data
    .align PGSHIFT
    .global bootstack
bootstack:
    .space KSTACKSIZE
    .global bootstacktop
bootstacktop:
````

---

### 指令 1：`la sp, bootstacktop`

### 含义：

`la` 是 “load address” 指令，用来将符号（即变量或标签）的**地址**加载到寄存器。
所以：

```asm
la sp, bootstacktop
```

的作用是：
把标签 `bootstacktop` 的地址加载到 **栈指针寄存器 sp**（stack pointer）中。

### 这行代码完成的操作：

* 将内核启动栈（`bootstack`）的栈顶地址设置为当前栈指针。
* 换句话说，**为内核的第一段执行代码分配了一段可用的栈空间**。

### 背景说明：

在内核刚启动时（从 bootloader 跳进来的时候），CPU 的寄存器 `sp` 可能是未定义的或是 Bootloader 的临时栈。
所以内核第一件事必须是：

> 自己建立一块新的安全的栈空间。

而这块栈空间就是在 `.data` 段定义的：

```asm
bootstack:
    .space KSTACKSIZE        # 分配一段连续空间作为内核栈
bootstacktop:
```

假设：

* `KSTACKSIZE = 8KB`
* 那么 `bootstack` 是底部地址，`bootstacktop` 是栈顶。

由于栈在 RISC-V 是 **向低地址增长** 的，所以我们让 `sp` 指向“栈顶”（高地址）。

### **总结：**

| 指令                    | 操作              | 目的                                  |
| --------------------- | --------------- | ----------------------------------- |
| `la sp, bootstacktop` | 将内核栈顶地址加载到 `sp` | 为内核代码设置运行栈，保证后续函数调用、保存寄存器等操作有安全的栈空间 |

---

### 指令 2：`tail kern_init`

### 含义：

`tail` 是 GNU 汇编器（以及 RISC-V）中对：

```asm
j kern_init
```

或

```asm
jal kern_init
ret
```

的**优化伪指令**。
它的含义是：**无返回的跳转（尾调用）到另一个函数**。

### 这行代码完成的操作：

直接跳转到 C 函数 `kern_init`，并且：

* 不再保留当前 `kern_entry` 的返回地址；
* 不占用额外栈空间（节省指令和栈）。

这意味着：

> 从此刻开始，内核的执行正式进入 `kern_init()` 函数，`kern_entry` 不会再回来。

---

### **总结：**

| 指令               | 操作                    | 目的                          |
| ---------------- | --------------------- | --------------------------- |
| `tail kern_init` | 无返回地跳转到 `kern_init()` | 切换执行流到 C 语言内核初始化函数，开始系统级初始化 |

---

## 整体总结

| 阶段 | 汇编语句                  | 功能                | 目的                |
| -- | --------------------- | ----------------- | ----------------- |
| 1  | `la sp, bootstacktop` | 设置栈指针 `sp` 指向内核栈顶 | 为内核提供安全可用的运行栈     |
| 2  | `tail kern_init`      | 无返回跳转到内核初始化函数     | 开始执行 C 语言的系统初始化逻辑 |

---

## 扩展理解

在操作系统的启动过程中，**汇编部分只负责硬件态到内核 C 环境的“桥梁”工作**：

* 建立栈
* 设置全局寄存器（如 sp、gp）
* 初始化内存映射或页表（若需要）
* 跳转到 `kern_init()` 进入 C 世界

所以这一小段汇编虽然短，却是 **内核从“裸机”到“高层初始化”的关键过渡点**。

