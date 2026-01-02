# 实验报告

## 练习1: 完成读文件操作的实现

在 `kern/fs/sfs/sfs_inode.c` 中的 `sfs_io_nolock()` 函数中实现了读文件数据的代码。该函数负责从文件系统的磁盘块中读取数据到内存缓冲区。

### 设计思路

`sfs_io_nolock` 函数的设计核心是处理文件 I/O 的块对齐问题。由于文件系统以块为单位存储数据，而用户请求可能跨越多个块且不与块边界对齐，因此需要分段处理。函数通过块映射机制将文件的逻辑块号转换为物理磁盘块号，实现高效的数据读取。

关键代码分析：

1. **参数验证和初始化**：
   ```c
   off_t endpos = offset + *alenp;
   *alenp = 0;
   if (offset < 0 || offset >= SFS_MAX_FILE_SIZE || offset > endpos) {
       return -E_INVAL;
   }
   ```
   设计思路：确保偏移量和长度参数有效，避免越界访问。初始化 `*alenp` 为0，用于累计实际读取的字节数。

2. **处理读操作的文件大小限制**：
   ```c
   if (!write) {
       if (offset >= din->size) {
           return 0;
       }
       if (endpos > din->size) {
           endpos = din->size;
       }
   }
   ```
   设计思路：对于读操作，不能读取超过文件当前大小的数据。这是文件系统一致性的基本保证。

3. **分段处理非对齐 I/O**：
   - **起始非对齐部分**：
     ```c
     if (blkoff != 0) {
         size = (nblks != 0) ? (SFS_BLKSIZE - blkoff) : (endpos - offset);
         if ((ret = sfs_bmap_load_nolock(sfs, sin, blkno, &ino)) != 0) {
             goto out;
         }
         if ((ret = sfs_buf_op(sfs, buf, size, ino, blkoff)) != 0) {
             goto out;
         }
         alen += size;
         buf += size;
         blkno++;
         nblks--;
     }
     ```
     设计思路：如果起始偏移不在块边界，先处理第一个块的部分数据。使用 `sfs_bmap_load_nolock` 获取物理块号，`sfs_buf_op` 从块内指定偏移读取数据。这种分段处理确保了 I/O 的灵活性和效率。

   - **中间完整块**：
     ```c
     if (nblks != 0) {
         for (uint32_t i = 0; i < nblks; i++) {
             if ((ret = sfs_bmap_load_nolock(sfs, sin, curblkno, &ino)) != 0) {
                 goto out;
             }
             if ((ret = sfs_block_op(sfs, buf, ino, 1)) != 0) {
                 goto out;
             }
             buf += SFS_BLKSIZE;
             curblkno++;
         }
         alen += size;
         blkno += nblks;
     }
     ```
     设计思路：对于连续的完整块，使用循环批量处理。每个块调用一次 `sfs_block_op`，这是最高效的方式，因为避免了块内的偏移计算。

   - **结束非对齐部分**：
     ```c
     if ((size = endpos % SFS_BLKSIZE) != 0) {
         if ((ret = sfs_bmap_load_nolock(sfs, sin, blkno, &ino)) != 0) {
             goto out;
         }
         if ((ret = sfs_buf_op(sfs, buf, size, ino, 0)) != 0) {
             goto out;
         }
         alen += size;
     }
     ```
     设计思路：处理最后一个块的部分数据，与起始部分类似，但从块开始处读取。

4. **文件大小更新**：
   ```c
   if (offset + alen > sin->din->size) {
       sin->din->size = offset + alen;
       sin->dirty = 1;
   }
   ```
   设计思路：对于写操作，如果写入的数据超出了原文件大小，需要更新 inode 的大小信息并标记为脏，以便后续同步到磁盘。

该实现支持随机访问文件的任意部分，通过块映射机制将逻辑块号转换为物理块号，确保高效的数据读取。设计中考虑了性能优化（如批量处理完整块）和正确性保证（如边界检查）。

## 练习2: 完成基于文件系统的执行程序机制的实现

改写了 `kern/process/proc.c` 中的 `load_icode` 函数和其他相关函数，实现基于文件系统的执行程序机制。

### 设计思路

`load_icode` 函数的核心设计是将存储在文件系统中的 ELF 可执行文件加载到进程的虚拟内存空间中，并设置执行上下文。这实现了从文件系统抽象到进程执行的桥梁，使得操作系统能够执行存储为文件的程序。

关键代码分析：

1. **内存管理结构初始化**：
   ```c
   if ((mm = mm_create()) == NULL) {
       goto bad_mm;
   }
   if (setup_pgdir(mm) != 0) {
       goto bad_pgdir_cleanup_mm;
   }
   ```
   设计思路：为新进程创建独立的内存管理结构 `mm_struct`，包括页目录。这是进程隔离的基础，确保每个进程有自己的地址空间。

2. **ELF 文件解析**：
   ```c
   struct elfhdr elf;
   if ((ret = load_icode_read(fd, &elf, sizeof(struct elfhdr), 0)) != 0) {
       goto bad_elf_cleanup_pgdir;
   }
   if (elf.e_magic != ELF_MAGIC) {
       ret = -E_INVAL_ELF;
       goto bad_elf_cleanup_pgdir;
   }
   ```
   设计思路：从文件描述符读取 ELF 头部，验证魔数确保是有效的 ELF 文件。这是加载器的第一步，确定文件格式。

3. **程序段映射和加载**：
   ```c
   for (; ph < ph_end; ph++) {
       if (ph->p_type != ELF_PT_LOAD) {
           continue;
       }
       // 计算权限
       vm_flags = 0, perm = PTE_U | PTE_V;
       if (ph->p_flags & ELF_PF_X) vm_flags |= VM_EXEC;
       if (ph->p_flags & ELF_PF_W) vm_flags |= VM_WRITE;
       if (ph->p_flags & ELF_PF_R) vm_flags |= VM_READ;
       
       if ((ret = mm_map(mm, ph->p_va, ph->p_memsz, vm_flags, NULL)) != 0) {
           goto bad_cleanup_mmap;
       }
       
       // 加载数据
       end = ph->p_va + ph->p_filesz;
       while (start < end) {
           if ((page = pgdir_alloc_page(mm->pgdir, la, perm)) == NULL) {
               goto bad_cleanup_mmap;
           }
           off = start - la, size = PGSIZE - off, la += PGSIZE;
           if (end < la) {
               size -= la - end;
           }
           if ((ret = load_icode_read(fd, page2kva(page) + off, size, (off_t)from)) != 0) {
               goto bad_cleanup_mmap;
           }
           start += size, from += size;
       }
       
       // 清零 BSS
       end = ph->p_va + ph->p_memsz;
       while (start < end) {
           memset(page2kva(page) + off, 0, size);
           // ...
       }
   }
   ```
   设计思路：遍历 ELF 程序头，对每个 LOAD 段进行映射和加载。首先使用 `mm_map` 在虚拟地址空间创建映射，然后分配物理页面并从文件中读取数据填充。对于 BSS 段（未初始化数据），分配页面后清零。这是加载器的核心逻辑，实现代码和数据的内存布局。

4. **用户栈设置**：
   ```c
   if ((ret = mm_map(mm, USTACKTOP - USTACKSIZE, USTACKSIZE, vm_flags, NULL)) != 0) {
       goto bad_cleanup_mmap;
   }
   assert(pgdir_alloc_page(mm->pgdir, USTACKTOP - PGSIZE, PTE_USER) != NULL);
   ```
   设计思路：为用户进程分配栈空间，从高地址向下增长。这是进程执行所必需的，栈用于函数调用和局部变量。

5. **进程上下文设置**：
   ```c
   current->mm = mm;
   current->pgdir = PADDR(mm->pgdir);
   lsatp(PADDR(mm->pgdir));
   
   struct trapframe *tf = current->tf;
   tf->gpr.sp = USTACKTOP;
   tf->epc = elf.e_entry;
   tf->status = (sstatus & ~SSTATUS_SPP) | SSTATUS_SPIE;
   ```
   设计思路：更新当前进程的内存管理信息，切换页表。设置 trapframe 的栈指针、程序计数器和状态，确保从用户模式开始执行。这是 exec 系统调用的关键，实现了进程的上下文切换。

通过 `make qemu` 运行后，可以看到 sh 用户程序的执行界面，在 sh 界面上可以执行 exit、hello 等其他用户程序，表明基于文件系统的执行机制成功实现。设计中体现了模块化（分步加载）、安全性（权限检查）和效率（按需分配页面）的原则。

## 重要的知识点

### 1. 文件系统 I/O 操作
- **实验知识点**：`sfs_io_nolock` 函数中的块映射和数据读取机制，包括直接块、间接块的处理。
- **OS原理对应**：文件系统的块分配和 I/O 调度。
- **理解**：实验中的块映射机制对应原理中的文件分配表（FAT）或 inode 间接块的概念。实验通过 `sfs_bmap_load_nolock` 实现了逻辑块到物理块的映射，体现了文件系统如何管理磁盘空间。差异在于实验是简单的单级间接块，而原理中可能有多级间接块以支持更大文件。

### 2. 进程执行和内存映射
- **实验知识点**：`load_icode` 中的 ELF 加载和虚拟内存映射。
- **OS原理对应**：进程创建和可执行文件加载。
- **理解**：实验中的 ELF 解析和段映射对应原理中的动态链接和加载器。实验简化了参数传递和动态链接，专注于静态加载。关系在于两者都涉及虚拟内存管理，但实验更侧重内核实现，而原理涵盖用户空间工具链。

### 3. 文件描述符和系统调用
- **实验知识点**：基于文件描述符的程序加载。
- **OS原理对应**：文件系统抽象和系统调用接口。
- **理解**：实验通过文件描述符抽象文件操作，对应原理中的 VFS（虚拟文件系统）。实验实现了基本的文件 I/O，而原理扩展到网络文件系统等。差异在于实验是单文件系统，而原理强调可扩展性。

## OS原理中重要但实验中没有对应上的知识点

1. **文件系统缓存和缓冲区管理**：原理中的页面缓存、缓冲区高速缓存等高级缓存机制，实验中只有基本的块读写。

2. **并发文件访问控制**：原理中的文件锁、记录锁等同步机制，实验中只有简单的 inode 锁。

3. **文件系统一致性和日志**：原理中的日志文件系统（如 ext4 的日志）、快照等，实验中缺乏崩溃恢复机制。

4. **分布式文件系统**：原理中的 NFS、Ceph 等，实验是单机文件系统。

5. **安全和权限模型**：原理中的访问控制列表（ACL）、SELinux 等，实验只有基本的用户权限。

## 扩展练习 Challenge1：基于“UNIX的PIPE机制”的设计方案

### 数据结构设计

```c
struct pipe_inode {
    struct inode *inode;          // 管道的 inode
    sem_t sem_read;               // 读信号量，用于同步
    sem_t sem_write;              // 写信号量，用于同步
    size_t size;                  // 管道中数据的字节数
    size_t max_size;              // 管道最大容量
    char *buffer;                 // 环形缓冲区
    off_t read_pos;               // 读位置
    off_t write_pos;              // 写位置
    bool eof;                     // 写端是否关闭
};

struct pipe_fs {
    struct sfs_fs *sfs;            // 底层文件系统
    list_entry_t pipe_list;        // 管道列表
};
```

### 接口设计

1. **pipe_create**：创建管道，返回读写文件描述符对。
   - 语义：分配管道 inode，初始化缓冲区和信号量，返回两个文件描述符（读端和写端）。

2. **pipe_read**：从管道读取数据。
   - 语义：阻塞直到有数据可读或写端关闭，读取指定长度的数据到用户缓冲区。

3. **pipe_write**：向管道写入数据。
   - 语义：阻塞直到有空间可写，写入数据到管道缓冲区，如果读端关闭则失败。

4. **pipe_close**：关闭管道端。
   - 语义：关闭读端或写端，如果两端都关闭则释放资源。

### 同步互斥处理

- 使用信号量 `sem_read` 和 `sem_write` 控制读写同步：写操作在缓冲区满时阻塞，读操作在缓冲区空且写端未关闭时阻塞。
- 使用互斥锁保护缓冲区操作，确保原子性。
- 读写位置使用环形缓冲区管理，避免数据覆盖和丢失。

## 扩展练习 Challenge2：基于“UNIX的软连接和硬连接机制”的设计方案

### 数据结构设计

```c
// 硬连接：共享同一个 inode
// 无需额外数据结构，直接在 inode 的 nlinks 字段计数

// 软连接（符号链接）
struct symlink_inode {
    struct sfs_inode sin;          // 基础 inode 结构
    char *target_path;             // 目标路径字符串
    size_t path_len;               // 路径长度
};

// 扩展的目录项结构
struct sfs_disk_entry_ext {
    uint32_t ino;                  // inode 号
    char name[FS_MAX_FNAME_LEN];   // 文件名
    uint16_t type;                 // 文件类型 (普通文件、目录、符号链接)
};
```

### 接口设计

1. **link_create**：创建硬连接。
   - 语义：为现有文件创建新的目录项，增加 inode 的链接计数。

2. **symlink_create**：创建软连接。
   - 语义：创建新的符号链接 inode，存储目标路径字符串。

3. **link_resolve**：解析符号链接。
   - 语义：读取符号链接的目标路径，进行路径解析，支持递归解析。

4. **unlink**：删除连接。
   - 语义：删除目录项，减少链接计数，如果计数为零则删除文件。

### 同步互斥处理

- 硬连接：使用 inode 锁保护链接计数操作，确保原子性。
- 软连接：符号链接的创建和解析需要目录锁保护，避免并发修改导致的路径不一致。
- 垃圾回收：当硬连接计数为零时，需要同步释放数据块，避免悬空引用。