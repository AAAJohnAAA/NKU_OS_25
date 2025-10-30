# Lab3 实验报告（RISC-V 中断与异常）

## 实验概述

本实验在 RISC-V RV64 架构下，完成内核的中断/异常入口配置与基础的时钟中断处理逻辑：设置异常向量、保存/恢复上下文、识别并处理时钟中断，使系统每累计 100 次时钟中断打印一次“100 ticks”，累计 10 次后调用关机接口退出模拟器。

涉及的主要源码文件：
- `kern/trap/trap.c`：中断/异常分发与处理逻辑，设置 `stvec`。
- `kern/trap/trapentry.S`：RISC-V Trap 入口，保存/恢复寄存器，跳转到 C 处理函数。
- `kern/driver/clock.c`：计时器初始化、设置下一次时钟中断事件。
- `libs/sbi.c`：通过 SBI 与 M 模式交互（设置计时器、关机等）。
- `Makefile`：提供 `make qemu` 运行目标。

实验完成后，在 QEMU 中运行，约每 1 秒输出一行“100 ticks”，共 10 行后自动关机。

## 实验环境

- 体系结构：RISC-V RV64（Supervisor 模式）
- 模拟器：QEMU `-machine virt -nographic`
- 交叉工具链：`riscv64-unknown-elf-*`
- 操作系统：可在 Windows 下通过 PowerShell 调用 `make`（需配置工具链和 QEMU），或在 WSL/Linux 环境下运行。

## 练习 1：完善中断处理（时钟中断）

目标：在 `kern/trap/trap.c` 的中断处理函数中完善时钟中断分支，使得：
- 每次时钟中断到来时，设置下一次时钟中断；
- 用计数器累计中断次数，每 100 次调用 `print_ticks()` 打印“100 ticks”；
- 当打印达到 10 次后，调用 `sbi_shutdown()` 关机。

### 关键实现位置与逻辑

1) 设置异常向量（trap 入口）
- 代码位置：`trap.c::idt_init`
- 核心语句：
  - `write_csr(sscratch, 0);` 将 `sscratch` 置 0，便于递归异常识别内核态来源；
  - `write_csr(stvec, &__alltraps);` 将异常向量入口设置为 `__alltraps`（在 `trapentry.S` 定义）。

2) Trap 入口与上下文保存/恢复
- 代码位置：`trapentry.S`
- `__alltraps` 调用 `SAVE_ALL` 宏：入栈保存通用寄存器，读取 `sstatus/sepc/sbadaddr/scause` 保存到栈帧，随后 `jal trap` 进入 C 处理函数；
- 处理结束后在 `__trapret` 使用 `RESTORE_ALL` 宏恢复寄存器并执行 `sret` 返回。

3) Trap 分发
- 代码位置：`trap.c::trap_dispatch`
- 根据 `tf->cause` 的符号位区分中断和异常：符号位为 1 表示中断，进入 `interrupt_handler`；否则进入 `exception_handler`。

4) 时钟中断处理
- 代码位置：`trap.c::interrupt_handler` 中 `case IRQ_S_TIMER:` 分支（已按实验要求补全）。
- 实现要点：
  - 调用 `clock_set_next_event();` 预约下一次定时事件（底层通过 SBI 设置时钟比较寄存器，会清除 `STIP`）。
  - 用静态变量 `ticks` 累计中断次数，每到 `TICK_NUM(=100)` 的倍数，调用 `print_ticks()` 打印“100 ticks”。
  - 用静态变量记录打印次数 `print_num`；当 `print_num >= 10`，调用 `sbi_shutdown()` 关机。

关键片段（节选）：

```c
case IRQ_S_TIMER:
    clock_set_next_event();
    {
        static int ticks = 0;
        static int print_num = 0;
        ticks++;
        if (ticks % TICK_NUM == 0) {
            print_ticks();      // 输出 "100 ticks"
            print_num++;
        }
        if (print_num >= 10) {
            sbi_shutdown();     // 关机
        }
    }
    break;
```

5) 定时器与时间基准
- 代码位置：`kern/driver/clock.c`
- `clock_init` 打开 `sie` 中的计时器中断位（`set_csr(sie, MIP_STIP)`），并调用 `clock_set_next_event` 开启第一次时钟事件；
- `timebase` 在本实验中硬编码为 `100000`，`clock_set_next_event()` 通过 `sbi_set_timer(get_cycles() + timebase)` 设定下一到期时间；
- 注释说明：在 QEMU(10MHz) 下可将 timebase 设为 `sbi_timebase()/100` 以实现 100Hz；这里硬编码 `timebase = 100000` 同样使时钟中断以约 100Hz 触发；累计 100 次即约 1 秒输出一次。

6) SBI 交互
- 代码位置：`libs/sbi.c`
- `sbi_set_timer()` 和 `sbi_shutdown()` 分别用于设置下一次计时器触发点与关机；
- SBI 在机器模式（M 模式）下提供服务，内核（S 模式）通过 `ecall` 调用。

### 时钟中断处理流程（文字版时序）

1. 启动时：`idt_init` 设置 `stvec = __alltraps`，`clock_init` 允许定时器中断并预约首次事件；
2. 定时到达：硬件置位 `SIP.STIP`，CPU 进入 `__alltraps`；
3. `SAVE_ALL` 保存上下文并构造 `trapframe`，`jal trap` 切到 C；
4. `trap_dispatch` 判断为中断，进入 `interrupt_handler`；
5. 命中 `IRQ_S_TIMER`：
   - `clock_set_next_event()` 设定下一个触发点（并清除 `STIP`），
   - `ticks++`，若 `ticks % 100 == 0` 调用 `print_ticks()` 输出，若输出达 10 次则 `sbi_shutdown()`；
6. 返回：`RESTORE_ALL` 恢复上下文，`sret` 回到中断前指令流。

### 实验结果与验证

- 运行时，每约 1 秒输出一行：
  
  ```
  100 ticks
  100 ticks
  ...（共 10 行）
  ```
  
- 当打印到第 10 行后调用 `sbi_shutdown()`，QEMU 退出（或显示关机）。

## 关键知识点与 OS 原理对应

- RISC-V Trap 统一机制（异常+中断）
  - 原理：异常与中断统一进入 Trap 入口，`stvec` 为入口地址，`scause` 标识原因，`sepc` 保存返回地址，`sstatus.SPP` 指示来源特权级。
  - 本实验：`trapentry.S` 保存上下文，`trap.c` 根据 `cause` 分发，体现了“统一入口，分发处理”的内核结构。

- 上下文保存/恢复与 Trapframe
  - 原理：中断/异常进入内核需完整保存通用寄存器和控制状态，以便恢复现场；
  - 本实验：`SAVE_ALL/RESTORE_ALL` 宏配合 `struct trapframe` 保存 `gpr/sstatus/sepc/stval/scause`，是后续调度、系统调用等机制的基础。

- 时钟中断（Timer Interrupt）与 OS 心跳（tick）
  - 原理：时钟中断提供内核的“时基”，用于时间片轮转、进程睡眠/唤醒、超时处理等；
  - 本实验：采用 100Hz 的 Tick 频率，每累计 100 个 Tick 视为约 1 秒，仅进行计数与打印，未引入调度与睡眠队列。

- SBI（RISC-V Supervisor Binary Interface）
  - 原理：S 模式内核通过 SBI 向 M 模式固件请求服务（定时器、关机、I/O 等），形成分层抽象；
  - 本实验：`sbi_set_timer` 预约下一次时钟事件，`sbi_shutdown` 触发关机，隐藏了底层 M 模式细节。

- 与 x86 IDT 的对比
  - 原理差异：x86 通过 IDT+门描述符定义每个向量入口；RISC-V 通过 `stvec` 指定统一入口，`scause` 编码具体原因；
  - 实验体现：注释中提到 IDT 的概念，但实现基于 RISC-V 的 `stvec` 入口与软件分派逻辑，两者思想相近但机制不同。

## 本实验未覆盖但在 OS 原理中很重要

- 进程/线程与调度策略（优先级、CFS、多级反馈队列）
- 系统调用与用户态/内核态切换、陷入返回的完整路径
- 虚拟内存与多级页表、缺页异常处理、页替换算法
- 同步原语（自旋锁、信号量、条件变量）与死锁避免/检测
- 文件系统与存储管理（VFS、缓冲缓存、日志/写回策略）
- 中断优先级、嵌套与中断上下文可重入性保证
- 高精度计时器（hrtimer）与动态时钟频率管理

## 构建与运行

前置条件：已安装 RISC-V 交叉工具链与 QEMU，并在环境变量可用。

在 `lab3` 目录下：

```powershell
# Windows PowerShell（命令供参考）
make clean; make qemu
```

运行后，约每 1 秒打印一次“100 ticks”，总计 10 行后自动关机。

若需调试：

```powershell
make debug         # 启动 QEMU 等待 gdb 连接
make gdb           # 以 riscv gdb 连接到 1234 端口
```

## 思考与小结

- 实验通过最小实现串起了“Trap 入口 → 上下文保存 → 原因分发 → 时钟中断处理 → 上下文恢复”的完整闭环，为后续引入系统调用、调度、异常处理奠定基础。
- `timebase` 的设置会影响 Tick 频率，真实硬件/不同模拟器的时钟频率不同，应尽量通过 `sbi_timebase()` 或校准策略获取更稳健的时基。
- 计时器中断处理应尽量简短，并考虑潜在的嵌套/屏蔽策略，避免长时间占用中断上下文导致的抖动；随着功能扩展，建议将计数/打印与关机等逻辑拆分到软中断或内核线程中。

---

附：关键文件索引示例
- `kern/trap/trap.c`：`idt_init`、`trap_dispatch`、`interrupt_handler`（时钟中断实现）。
- `kern/trap/trapentry.S`：`__alltraps`/`__trapret`、`SAVE_ALL`/`RESTORE_ALL`。
- `kern/driver/clock.c`：`clock_init`、`clock_set_next_event`、`timebase` 与 `rdtime` 使用。
- `libs/sbi.c`：`sbi_set_timer`、`sbi_shutdown` 等。
