
# ucore OS Lab2: 调试页表查询过程实验报告

**日期:** 2025年12月15日

## 1. 实验目标

本次实验的核心目标是深入理解 RISC-V 架构下的 Sv39 分页机制。为了实现这一目标，我们采用了一种高级调试技术：使用 GDB 调试 QEMU 虚拟机本身，以观察和跟踪 ucore 操作系统在其中执行地址翻译（页表查询）的完整过程。

具体任务包括：
- 编译一个包含调试信息的 QEMU 版本。
- 配置双 GDB 环境：一个用于调试 QEMU 进程，另一个用于调试在 QEMU 内核中运行的 ucore。
- 在 QEMU 负责地址翻译的关键函数 `get_physical_address` 中设置断点。
- 在 ucore GDB 中，精确控制 ucore 内核执行到一条会触发地址翻译的指令（如内存写操作）。
- 成功在 QEMU GDB 中捕获该次地址翻译，并分析页表遍历的过程。

## 2. 环境准备与问题排查

在正式开始调试前，我们需要准备一个特殊的 QEMU 版本。标准的 QEMU 发行版不包含用于源码级调试的符号信息。

### 2.1. 编译调试版 QEMU

1.  **下载源码**: 下载 QEMU 4.1.1 版本的源码并解压。
2.  **配置编译**: 进入源码目录，执行配置脚本。关键在于添加 `--enable-debug` 标志，它会开启调试符号的生成。
    ```bash
    ./configure --target-list=riscv64-softmmu --enable-debug
    ```
3.  **编译**: 执行 `make` 命令进行编译。
    ```bash
    make -j$(nproc)
    ```

### 2.2. 环境问题与解决方案

在配置和编译过程中，遇到了一系列典型的环境问题：

- **问题一: `ERROR: "cc" either does not exist or does not work`**
    - **原因**: 系统缺少本地 C 编译器（如 `gcc`）。`configure` 脚本需要用它来编译一些测试程序。
    - **解决方案**: 安装 `build-essential` 包，它包含了 `gcc`, `g++`, `make` 等基础构建工具。
      ```bash
      sudo apt-get update
      sudo apt-get install build-essential
      ```

- **问题二: `as: unrecognized option '--64'`**
    - **原因**: 这是一个非常隐蔽但常见的 `PATH` 环境变量问题。系统 `PATH` 变量将 RISC-V 交叉编译工具链的路径（如 `/opt/riscv/bin`）放在了系统标准路径（如 `/usr/bin`）之前。这导致 `configure` 脚本调用 `as` (汇编器) 时，执行的是 `riscv64-unknown-elf-as` 而不是本机的 x86_64 汇编器。RISC-V 的汇编器不认识 x86_64 的 `--64` 选项，从而报错。
    - **解决方案**: 在执行 `configure` 和 `make` 期间，临时修改 `PATH` 变量，将系统路径置于最前。
      ```bash
      export PATH=/usr/bin:/bin:$PATH
      ./configure --target-list=riscv64-softmmu --enable-debug
      make
      ```

- **问题三: `Makefile` 配置错误**
    - **原因**: 为了让 `make gdb` 命令使用我们新编译的调试版 QEMU，需要修改 `lab2/Makefile` 文件，将 `QEMU` 变量指向新 QEMU 的可执行文件路径。初次修改时可能出现路径错误或拼写错误。
    - **解决方案**: 确认新编译的 QEMU 的确切绝对路径（例如 `/home/user/qemu-4.1.1/riscv64-softmmu/qemu-system-riscv64`），并正确更新 `Makefile` 中的 `QEMU` 变量。
      ```makefile
      # lab2/Makefile
      # QEMU := qemu-system-riscv64 (原)
      QEMU := /path/to/your/qemu-4.1.1/riscv64-softmmu/qemu-system-riscv64 # (修改后)
      ```

## 3. 双 GDB 调试方案

这是本次实验技术上的核心。我们同时运行两个 GDB 实例：

- **终端 1 (运行 QEMU)**:
  - 启动 ucore 内核，但暂停在第一条指令处等待 GDB 连接。
  - `make debug`

- **终端 2 (QEMU GDB - Host GDB)**:
  - 使用 `sudo` 权限启动本地 GDB，并附加到正在运行的 QEMU 进程上。
  - `sudo gdb`
  - `(gdb) attach <QEMU_PID>`
  - 在此 GDB 中，我们可以对 QEMU 的源码（`target/riscv/cpu_helper.c`）设置断点。

- **终端 3 (ucore GDB - Guest GDB)**:
  - 启动 RISC-V 交叉编译 GDB，并连接到 QEMU 暴露的 GDB Stub 端口（默认为 1234）。
  - `riscv64-unknown-elf-gdb`
  - `(gdb) target remote :1234`
  - 在此 GDB 中，我们可以调试 ucore 内核的源码。

### 3.1. 解决 GDB "死锁"问题

在实践中，我们发现一个严重的问题：如果在 ucore GDB 连接之前就在 QEMU GDB 中设置了断点（如 `b get_physical_address`），QEMU 自身的初始化过程（加载 BIOS、准备虚拟设备等）就会触发这个断点，导致 QEMU 进程被冻结。此时，ucore GDB 会因为无法与冻结的 QEMU GDB Stub 通信而连接失败或超时，表现为 `Ignoring packet error, continuing...`。

为了解决这个时序问题，我们设计了 **“断点禁用/启用”** 策略：

1.  **启动**: 按照正常流程启动 `make debug`。
2.  **附加与设断**: 在 QEMU GDB（终端 2）中，附加到 QEMU 进程，并设置断点。
    ```gdb
    (gdb) attach <PID>
    (gdb) b get_physical_address
    ```
3.  **禁用断点**: **关键步骤！** 立即禁用该断点，让 QEMU 可以自由完成其初始化。
    ```gdb
    (gdb) disable 1  # 假设断点号为 1
    (gdb) c          # 继续运行 QEMU
    ```
4.  **连接 ucore**: 在 ucore GDB（终端 3）中，现在可以顺利连接到正在运行的 QEMU。
    ```gdb
    (gdb) target remote :1234
    ```
5.  **启用断点**: 回到 QEMU GDB（终端 2），通过 `Ctrl+C` 中断它，然后重新启用之前设置的断点。
    ```gdb
    # 在终端 2 按下 Ctrl+C
    (gdb) enable 1
    (gdb) c          # 再次继续运行 QEMU
    ```
6.  **触发**: 现在，QEMU 已经准备就绪，并且断点已经激活。我们可以在 ucore GDB（终端 3）中执行代码，任何触发地址翻译的操作都会被 QEMU GDB 捕获。

## 4. 执行过程
![alt text](<image dg2.png>)
![alt text](<image dg3.png>)
1.  **启动 QEMU**:
    ```bash
    # 终端 1
    make debug
    ```
2.  **启动并配置 QEMU GDB**:
    ```bash
    # 终端 2
    pgrep -f qemu-system-riscv64  # 获取 PID
    sudo gdb
    (gdb) attach <PID>
    (gdb) b get_physical_address
    (gdb) disable 1
    (gdb) c
    ```
3.  **启动并配置 ucore GDB**:
    ```bash
    # 终端 3
    riscv64-unknown-elf-gdb obj/kernel
    (gdb) target remote :1234
    (gdb) b kern_init
    (gdb) c
    ```
    此时，ucore GDB 会停在 `kern_init` 函数入口。

4.  **重新激活 QEMU 断点**:
    ```bash
    # 终端 2
    # 按 Ctrl+C
    (gdb) enable 1
    (gdb) c
    ```
5.  **精确触发地址翻译**:
    在 ucore GDB（终端 3）中，我们找到一条内存存储指令，例如 `sd ra, 8(sp)`。这条指令需要将 `ra` 寄存器的值存入栈中，这个过程必然需要将虚拟地址 `sp+8` 翻译成物理地址。
    ```gdb
    # 终端 3
    (gdb) layout asm
    # 使用 si (step instruction) 单步执行汇编指令，直到光标指向 sd ra, 8(sp)
    (gdb) si
    ...
    (gdb) si  # 执行这条 sd 指令
    ```
6.  **捕获断点**:
    执行 `si` 的瞬间，终端 2 的 QEMU GDB 立即响应，断点被命中。

    ```gdb
    # 终端 2
    Thread 2 "qemu-system-ris" hit Breakpoint 1, get_physical_address (env=0x555557ec8c40, vaddr=4294971384, prot=2, ret_page_size=0x7ffff5b4f2f8, mmu_idx=2)
        at /home/wusir1/qemu-4.1.1/target/riscv/cpu_helper.c:939
    939     {
    ```

## 5. 结果分析

![alt text](<image dg1.png>)

![alt text](<image dg4.png>)
当 QEMU GDB 的断点命中时，我们可以检查 `get_physical_address` 函数的参数和内部变量，从而窥探页表查询的全过程。

- **`vaddr`**: `4294971384` (即 `0x100000ff8`)，这就是 ucore 尝试写入的虚拟地址 `sp+8`。
- **`prot`**: `2`，代表内存访问的类型（写操作）。
- **`mmu_idx`**: `2`，代表是 S-mode（Supervisor mode）下的地址翻译。

在 GDB 中单步执行 `get_physical_address` 函数，我们可以观察到：
1.  从 `env->satp` 寄存器中获取页表根地址（一级页表的物理地址）。
2.  根据 `vaddr` 的高 9 位（VPN[2]）计算出一级页表中的条目（PTE）地址。
3.  从内存中读取该 PTE。
4.  检查 PTE 的标志位（`V`, `R`, `W`, `X` 等）。如果无效，则触发 Page Fault。
5.  如果有效且不是叶子节点（`R`, `W`, `X` 为 0），则将 PTE 中的物理地址作为下一级页表的基地址。
6.  重复步骤 2-5，依次遍历二级页表、三级页表。
7.  最终，在三级页表中找到叶子节点 PTE，其包含的物理页号（PPN）与 `vaddr` 的页内偏移（offset）组合，形成最终的物理地址。
8.  函数返回该物理地址。

这个过程完美地复现了 RISC-V Sv39 规范中描述的三级页表查询机制。

## 6. 总结

本次实验虽然过程曲折，但收获巨大。我们不仅成功搭建了复杂的双 GDB 调试环境，还通过它直观地观察了操作系统底层最核心的机制之一——虚拟内存地址翻译。

关键的收获包括：
- 掌握了编译特定功能（调试）版本软件的方法。
- 学会了诊断和解决因环境配置（特别是 `PATH` 变量）引发的疑难编译问题。
- 创造性地运用“断点禁用/启用”技巧，解决了多 GDB 协同调试中的时序竞争问题。
- 将理论知识（Sv39 页表结构）与实践观察（GDB 调试 QEMU）相结合，加深了对内存管理的理解。

这次成功的调试经历为后续更复杂的内核调试任务（如中断、系统调用）打下了坚实的基础。
