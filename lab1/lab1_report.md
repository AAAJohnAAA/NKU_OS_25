# Lab1 报告：RISC-V 裸机内核启动与初始调试

> 课程实验：NKU_OS_25  Lab1
> 时间：2025.10.8  作者：毋科骅2312228 程伟卿2311865 张天砾2310894

## 0. 概述
本实验目标：构建最小 RISC-V 内核镜像，在 QEMU 上启动，并利用 GDB 跟踪从 CPU 复位到进入内核入口的流程，理解：
- 固件 (OpenSBI) / 内核 各自做什么
- 链接脚本如何确定加载地址与入口符号
- 汇编入口如何建立最初的执行环境

产出：`ucore.img` 可被加载到物理地址 `0x80200000`，并在 `kern_entry -> kern_init` 中打印启动信息后进入死循环。

## 1. 重要知识点与原理映射
| 实验中的概念/对象 | 位置/符号 | 对应 OS 原理知识点 | 关系 / 差异 / 说明 |
|------------------|-----------|--------------------|--------------------|
| 复位地址 PC=0x1000 | QEMU virt 固定 | 处理器复位向量 (Reset Vector) | 真实硬件由芯片定义；本实验用模拟固定值 0x1000 |
| OpenSBI 早期初始化 | QEMU `-bios default` | 引导固件 / Bootloader / SBI 层 | 真机多阶段 (ROM -> FSBL -> SBI/Bootloader)；实验简化为单阶段固件 |
| 链接脚本 BASE_ADDRESS=0x80200000 | `tools/kernel.ld` | 内核物理加载 / 链接地址 | 通过链接脚本决定节布局，需与加载器/设备树约定一致 |
| ENTRY(kern_entry) | `kernel.ld` | 内核入口点 | 告诉链接器与调试器程序起始符号；最终跳转由固件完成 |
| 栈初始化 `la sp, bootstacktop` | `entry.S` | 执行环境建立（栈帧基础） | 早期必须先有安全栈空间；与高层线程/进程栈不同，仅是“引导栈” |
| 清 BSS: `memset(edata,0,end-edata)` | `kern_init` | 内存段初始化(BSS 零化) | C 语言环境要求的标准步骤；通常由 C 运行时或启动代码负责 |
| 跳转 `tail kern_init` | `entry.S` | 从汇编引导到 C 主初始化 | `tail` 为优化形式 (不保留返回地址)；无返回路径 |
| 死循环 `while(1);` | `kern_init` | Idle / Panic / Monitor 等待 | 实验阶段用死循环代替后续调度/事件循环 |
| 符号 `edata`, `end` | 链接产生 | 进程/内核内存段边界 | 由链接器提供，辅助运行时初始化 |
| QEMU `-device loader,file=...` | Makefile debug 目标 | 引导加载（加载器） | 真实系统可能由 Bootloader 解析 ELF；此处直接搬运二进制到内存 |
| GDB 断点 `b *0x80200000` | 调试操作 | 断点机制 / 指令替换 | 通过插入 trap 指令模拟断点；帮助定位内核第一条指令 |
| 观察点 `watch *0x80200000` | 可选调试 | 数据访问监控 / 硬件断点 | 捕捉固件将镜像写入内存的瞬间；受限于硬件断点数 |
| 清 BSS 与只读段区分 | 段布局 | 程序内存组织 (text/rodata/data/bss) | 内核与用户态程序在该层面概念一致；后续会扩展到分页/保护 |
| 交叉工具链 `riscv64-unknown-elf-*` | 工具链 | 交叉编译 / ABI | 针对裸机环境 (no glibc)；与 Linux 用户空间工具链不同 |


## 2. 练习 1：入口两条指令的作用与目的
代码来源：`kern/init/entry.S`
```asm
    .globl kern_entry
kern_entry:
    la sp, bootstacktop
    tail kern_init
```

1) `la sp, bootstacktop`
- 含义：将符号 `bootstacktop` 的地址装载到栈指针寄存器 `sp`。
- 相关数据区：在同文件稍后 `.section .data` 中分配 `bootstack` (大小 `KSTACKSIZE`)，并导出 `bootstacktop`。
- 目的：建立一段安全、已知的引导期内核栈，为随后的 C 函数调用（`kern_init`）提供栈帧与局部变量/返回地址保存空间。没有正确的栈，进入 C 代码将导致潜在崩溃或数据破坏。
- 注意：这是“引导栈”，后续若实现任务调度，会为不同内核线程/进程分配独立内核栈。

2) `tail kern_init`
- 等价机制：`tail` 伪指令会被汇编成一种“无返回”跳转（例如 `j kern_init` 或优化形式），不会保存返回地址到 `ra`，形成尾调用优化。
- 目的：放弃返回路径，直接将控制权交给 C 层初始化函数。因为引导一旦进入 `kern_init`，就不会再回到 `kern_entry`（其使命完成）。
- 好处：节省一次设置/压栈返回地址的指令与空间；语义上明确：不可返回。

## 3. 练习 2：GDB 跟踪 RISC-V 启动流程
目标：跟踪从复位地址 0x1000 开始，直到内核第一条指令（`kern_entry @ 0x80200000`）执行。

### 3.1 调试准备
```bash
make clean && make          # 生成 bin/kernel ucore.img
make debug                  # QEMU (-gdb tcp::1234 -S) 挂起等待 GDB
make gdb                    # 连接 GDB 会停在 0x1000
```

### 3.2 跟踪步骤
```gdb
# 启动后 PC=0x1000 (复位向量)
(gdb) x/10i 0x1000           # 观察固件早期指令（OpenSBI）
(gdb) watch *0x80200000      # 观察内核镜像写入瞬间
(gdb) b *0x80200000          # 在内核入口物理地址断点
(gdb) c                      # 继续执行，直到固件完成加载并跳转
```
![硬件初始化和固件启动](labcode/lab1/imgs/1.1.png)
![OpenSBI 初始化与内核加载](labcode/lab1/imgs/1.2.png)
![内核启动执行](labcode/lab1/imgs/1.3.png)
![跳转到entry.S ](labcode/lab1/imgs/1.4.png)
![调用kern_init()](labcode/lab1/imgs/1.5.png)
### 3.3 观察结果摘要
| 阶段 | 观察到的地址/现象 | 说明 |
|------|------------------|------|
| 复位 | PC=0x0000000000001000 | QEMU virt 复位向量；执行固件 ROM/OpenSBI 指令 |
| 固件初始化 | 多条访问/设置 CSR/内存的指令 | 建立最小执行环境，准备加载内核 |
| 内核加载 | `watch *0x80200000` 触发  | 固件将 `ucore.img` 拷贝到 DRAM 基址 + 偏移 |
| 跳转内核 | 断点命中 0x80200000 | 开始执行 `kern_entry` 第一条指令 `la sp, bootstacktop` |
| 进入 C | 单步执行 `tail kern_init` 后 PC 到 `kern_init` | 进入 C 初始化逻辑，清 BSS，打印信息 |
| 死循环 | 停在 `while(1)` | 等待后续实验扩展 |

### 3.4 回答问题
1) RISC-V 硬件加电后最初执行的几条指令位于地址：`0x1000`（QEMU virt 的默认复位向量）。
2) 这些早期指令（固件/OpenSBI）主要功能：设置特权级初始状态、建立必要的机器态环境、解析/准备内核镜像（或在本实验场景由 QEMU loader 直接放置）、最终跳转到内核入口地址 0x80200000。
3) 验证方法：在 GDB 中观察 PC 初值；设置 `b *0x80200000`；可用 `watch *0x80200000` 捕获写入；断点命中后查看反汇编与符号匹配。





 
