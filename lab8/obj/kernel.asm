
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	00014297          	auipc	t0,0x14
ffffffffc0200004:	00028293          	mv	t0,t0
ffffffffc0200008:	00a2b023          	sd	a0,0(t0) # ffffffffc0214000 <boot_hartid>
ffffffffc020000c:	00014297          	auipc	t0,0x14
ffffffffc0200010:	ffc28293          	addi	t0,t0,-4 # ffffffffc0214008 <boot_dtb>
ffffffffc0200014:	00b2b023          	sd	a1,0(t0)
ffffffffc0200018:	c02132b7          	lui	t0,0xc0213
ffffffffc020001c:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200020:	037a                	slli	t1,t1,0x1e
ffffffffc0200022:	406282b3          	sub	t0,t0,t1
ffffffffc0200026:	00c2d293          	srli	t0,t0,0xc
ffffffffc020002a:	fff0031b          	addiw	t1,zero,-1
ffffffffc020002e:	137e                	slli	t1,t1,0x3f
ffffffffc0200030:	0062e2b3          	or	t0,t0,t1
ffffffffc0200034:	18029073          	csrw	satp,t0
ffffffffc0200038:	12000073          	sfence.vma
ffffffffc020003c:	c0213137          	lui	sp,0xc0213
ffffffffc0200040:	c02002b7          	lui	t0,0xc0200
ffffffffc0200044:	04a28293          	addi	t0,t0,74 # ffffffffc020004a <kern_init>
ffffffffc0200048:	8282                	jr	t0

ffffffffc020004a <kern_init>:
ffffffffc020004a:	00091517          	auipc	a0,0x91
ffffffffc020004e:	01650513          	addi	a0,a0,22 # ffffffffc0291060 <buf>
ffffffffc0200052:	00097617          	auipc	a2,0x97
ffffffffc0200056:	8be60613          	addi	a2,a2,-1858 # ffffffffc0296910 <end>
ffffffffc020005a:	1141                	addi	sp,sp,-16
ffffffffc020005c:	8e09                	sub	a2,a2,a0
ffffffffc020005e:	4581                	li	a1,0
ffffffffc0200060:	e406                	sd	ra,8(sp)
ffffffffc0200062:	37e0b0ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc0200066:	52c000ef          	jal	ra,ffffffffc0200592 <cons_init>
ffffffffc020006a:	0000b597          	auipc	a1,0xb
ffffffffc020006e:	3e658593          	addi	a1,a1,998 # ffffffffc020b450 <etext+0x6>
ffffffffc0200072:	0000b517          	auipc	a0,0xb
ffffffffc0200076:	3fe50513          	addi	a0,a0,1022 # ffffffffc020b470 <etext+0x26>
ffffffffc020007a:	12c000ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020007e:	1ae000ef          	jal	ra,ffffffffc020022c <print_kerninfo>
ffffffffc0200082:	62a000ef          	jal	ra,ffffffffc02006ac <dtb_init>
ffffffffc0200086:	409020ef          	jal	ra,ffffffffc0202c8e <pmm_init>
ffffffffc020008a:	3ef000ef          	jal	ra,ffffffffc0200c78 <pic_init>
ffffffffc020008e:	515000ef          	jal	ra,ffffffffc0200da2 <idt_init>
ffffffffc0200092:	635030ef          	jal	ra,ffffffffc0203ec6 <vmm_init>
ffffffffc0200096:	0dc070ef          	jal	ra,ffffffffc0207172 <sched_init>
ffffffffc020009a:	4e3060ef          	jal	ra,ffffffffc0206d7c <proc_init>
ffffffffc020009e:	1bf000ef          	jal	ra,ffffffffc0200a5c <ide_init>
ffffffffc02000a2:	066050ef          	jal	ra,ffffffffc0205108 <fs_init>
ffffffffc02000a6:	4a4000ef          	jal	ra,ffffffffc020054a <clock_init>
ffffffffc02000aa:	3c3000ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02000ae:	69b060ef          	jal	ra,ffffffffc0206f48 <cpu_idle>

ffffffffc02000b2 <readline>:
ffffffffc02000b2:	715d                	addi	sp,sp,-80
ffffffffc02000b4:	e486                	sd	ra,72(sp)
ffffffffc02000b6:	e0a6                	sd	s1,64(sp)
ffffffffc02000b8:	fc4a                	sd	s2,56(sp)
ffffffffc02000ba:	f84e                	sd	s3,48(sp)
ffffffffc02000bc:	f452                	sd	s4,40(sp)
ffffffffc02000be:	f056                	sd	s5,32(sp)
ffffffffc02000c0:	ec5a                	sd	s6,24(sp)
ffffffffc02000c2:	e85e                	sd	s7,16(sp)
ffffffffc02000c4:	c901                	beqz	a0,ffffffffc02000d4 <readline+0x22>
ffffffffc02000c6:	85aa                	mv	a1,a0
ffffffffc02000c8:	0000b517          	auipc	a0,0xb
ffffffffc02000cc:	3b050513          	addi	a0,a0,944 # ffffffffc020b478 <etext+0x2e>
ffffffffc02000d0:	0d6000ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02000d4:	4481                	li	s1,0
ffffffffc02000d6:	497d                	li	s2,31
ffffffffc02000d8:	49a1                	li	s3,8
ffffffffc02000da:	4aa9                	li	s5,10
ffffffffc02000dc:	4b35                	li	s6,13
ffffffffc02000de:	00091b97          	auipc	s7,0x91
ffffffffc02000e2:	f82b8b93          	addi	s7,s7,-126 # ffffffffc0291060 <buf>
ffffffffc02000e6:	3fe00a13          	li	s4,1022
ffffffffc02000ea:	0fa000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc02000ee:	00054a63          	bltz	a0,ffffffffc0200102 <readline+0x50>
ffffffffc02000f2:	00a95a63          	bge	s2,a0,ffffffffc0200106 <readline+0x54>
ffffffffc02000f6:	029a5263          	bge	s4,s1,ffffffffc020011a <readline+0x68>
ffffffffc02000fa:	0ea000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc02000fe:	fe055ae3          	bgez	a0,ffffffffc02000f2 <readline+0x40>
ffffffffc0200102:	4501                	li	a0,0
ffffffffc0200104:	a091                	j	ffffffffc0200148 <readline+0x96>
ffffffffc0200106:	03351463          	bne	a0,s3,ffffffffc020012e <readline+0x7c>
ffffffffc020010a:	e8a9                	bnez	s1,ffffffffc020015c <readline+0xaa>
ffffffffc020010c:	0d8000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc0200110:	fe0549e3          	bltz	a0,ffffffffc0200102 <readline+0x50>
ffffffffc0200114:	fea959e3          	bge	s2,a0,ffffffffc0200106 <readline+0x54>
ffffffffc0200118:	4481                	li	s1,0
ffffffffc020011a:	e42a                	sd	a0,8(sp)
ffffffffc020011c:	0c6000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0200120:	6522                	ld	a0,8(sp)
ffffffffc0200122:	009b87b3          	add	a5,s7,s1
ffffffffc0200126:	2485                	addiw	s1,s1,1
ffffffffc0200128:	00a78023          	sb	a0,0(a5)
ffffffffc020012c:	bf7d                	j	ffffffffc02000ea <readline+0x38>
ffffffffc020012e:	01550463          	beq	a0,s5,ffffffffc0200136 <readline+0x84>
ffffffffc0200132:	fb651ce3          	bne	a0,s6,ffffffffc02000ea <readline+0x38>
ffffffffc0200136:	0ac000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc020013a:	00091517          	auipc	a0,0x91
ffffffffc020013e:	f2650513          	addi	a0,a0,-218 # ffffffffc0291060 <buf>
ffffffffc0200142:	94aa                	add	s1,s1,a0
ffffffffc0200144:	00048023          	sb	zero,0(s1)
ffffffffc0200148:	60a6                	ld	ra,72(sp)
ffffffffc020014a:	6486                	ld	s1,64(sp)
ffffffffc020014c:	7962                	ld	s2,56(sp)
ffffffffc020014e:	79c2                	ld	s3,48(sp)
ffffffffc0200150:	7a22                	ld	s4,40(sp)
ffffffffc0200152:	7a82                	ld	s5,32(sp)
ffffffffc0200154:	6b62                	ld	s6,24(sp)
ffffffffc0200156:	6bc2                	ld	s7,16(sp)
ffffffffc0200158:	6161                	addi	sp,sp,80
ffffffffc020015a:	8082                	ret
ffffffffc020015c:	4521                	li	a0,8
ffffffffc020015e:	084000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0200162:	34fd                	addiw	s1,s1,-1
ffffffffc0200164:	b759                	j	ffffffffc02000ea <readline+0x38>

ffffffffc0200166 <cputch>:
ffffffffc0200166:	1141                	addi	sp,sp,-16
ffffffffc0200168:	e022                	sd	s0,0(sp)
ffffffffc020016a:	e406                	sd	ra,8(sp)
ffffffffc020016c:	842e                	mv	s0,a1
ffffffffc020016e:	432000ef          	jal	ra,ffffffffc02005a0 <cons_putc>
ffffffffc0200172:	401c                	lw	a5,0(s0)
ffffffffc0200174:	60a2                	ld	ra,8(sp)
ffffffffc0200176:	2785                	addiw	a5,a5,1
ffffffffc0200178:	c01c                	sw	a5,0(s0)
ffffffffc020017a:	6402                	ld	s0,0(sp)
ffffffffc020017c:	0141                	addi	sp,sp,16
ffffffffc020017e:	8082                	ret

ffffffffc0200180 <vcprintf>:
ffffffffc0200180:	1101                	addi	sp,sp,-32
ffffffffc0200182:	872e                	mv	a4,a1
ffffffffc0200184:	75dd                	lui	a1,0xffff7
ffffffffc0200186:	86aa                	mv	a3,a0
ffffffffc0200188:	0070                	addi	a2,sp,12
ffffffffc020018a:	00000517          	auipc	a0,0x0
ffffffffc020018e:	fdc50513          	addi	a0,a0,-36 # ffffffffc0200166 <cputch>
ffffffffc0200192:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0200196:	ec06                	sd	ra,24(sp)
ffffffffc0200198:	c602                	sw	zero,12(sp)
ffffffffc020019a:	5b90a0ef          	jal	ra,ffffffffc020af52 <vprintfmt>
ffffffffc020019e:	60e2                	ld	ra,24(sp)
ffffffffc02001a0:	4532                	lw	a0,12(sp)
ffffffffc02001a2:	6105                	addi	sp,sp,32
ffffffffc02001a4:	8082                	ret

ffffffffc02001a6 <cprintf>:
ffffffffc02001a6:	711d                	addi	sp,sp,-96
ffffffffc02001a8:	02810313          	addi	t1,sp,40 # ffffffffc0213028 <boot_page_table_sv39+0x28>
ffffffffc02001ac:	8e2a                	mv	t3,a0
ffffffffc02001ae:	f42e                	sd	a1,40(sp)
ffffffffc02001b0:	75dd                	lui	a1,0xffff7
ffffffffc02001b2:	f832                	sd	a2,48(sp)
ffffffffc02001b4:	fc36                	sd	a3,56(sp)
ffffffffc02001b6:	e0ba                	sd	a4,64(sp)
ffffffffc02001b8:	00000517          	auipc	a0,0x0
ffffffffc02001bc:	fae50513          	addi	a0,a0,-82 # ffffffffc0200166 <cputch>
ffffffffc02001c0:	0050                	addi	a2,sp,4
ffffffffc02001c2:	871a                	mv	a4,t1
ffffffffc02001c4:	86f2                	mv	a3,t3
ffffffffc02001c6:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc02001ca:	ec06                	sd	ra,24(sp)
ffffffffc02001cc:	e4be                	sd	a5,72(sp)
ffffffffc02001ce:	e8c2                	sd	a6,80(sp)
ffffffffc02001d0:	ecc6                	sd	a7,88(sp)
ffffffffc02001d2:	e41a                	sd	t1,8(sp)
ffffffffc02001d4:	c202                	sw	zero,4(sp)
ffffffffc02001d6:	57d0a0ef          	jal	ra,ffffffffc020af52 <vprintfmt>
ffffffffc02001da:	60e2                	ld	ra,24(sp)
ffffffffc02001dc:	4512                	lw	a0,4(sp)
ffffffffc02001de:	6125                	addi	sp,sp,96
ffffffffc02001e0:	8082                	ret

ffffffffc02001e2 <cputchar>:
ffffffffc02001e2:	ae7d                	j	ffffffffc02005a0 <cons_putc>

ffffffffc02001e4 <getchar>:
ffffffffc02001e4:	1141                	addi	sp,sp,-16
ffffffffc02001e6:	e406                	sd	ra,8(sp)
ffffffffc02001e8:	40c000ef          	jal	ra,ffffffffc02005f4 <cons_getc>
ffffffffc02001ec:	dd75                	beqz	a0,ffffffffc02001e8 <getchar+0x4>
ffffffffc02001ee:	60a2                	ld	ra,8(sp)
ffffffffc02001f0:	0141                	addi	sp,sp,16
ffffffffc02001f2:	8082                	ret

ffffffffc02001f4 <strdup>:
ffffffffc02001f4:	1101                	addi	sp,sp,-32
ffffffffc02001f6:	ec06                	sd	ra,24(sp)
ffffffffc02001f8:	e822                	sd	s0,16(sp)
ffffffffc02001fa:	e426                	sd	s1,8(sp)
ffffffffc02001fc:	e04a                	sd	s2,0(sp)
ffffffffc02001fe:	892a                	mv	s2,a0
ffffffffc0200200:	13e0b0ef          	jal	ra,ffffffffc020b33e <strlen>
ffffffffc0200204:	842a                	mv	s0,a0
ffffffffc0200206:	0505                	addi	a0,a0,1
ffffffffc0200208:	587010ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020020c:	84aa                	mv	s1,a0
ffffffffc020020e:	c901                	beqz	a0,ffffffffc020021e <strdup+0x2a>
ffffffffc0200210:	8622                	mv	a2,s0
ffffffffc0200212:	85ca                	mv	a1,s2
ffffffffc0200214:	9426                	add	s0,s0,s1
ffffffffc0200216:	21c0b0ef          	jal	ra,ffffffffc020b432 <memcpy>
ffffffffc020021a:	00040023          	sb	zero,0(s0)
ffffffffc020021e:	60e2                	ld	ra,24(sp)
ffffffffc0200220:	6442                	ld	s0,16(sp)
ffffffffc0200222:	6902                	ld	s2,0(sp)
ffffffffc0200224:	8526                	mv	a0,s1
ffffffffc0200226:	64a2                	ld	s1,8(sp)
ffffffffc0200228:	6105                	addi	sp,sp,32
ffffffffc020022a:	8082                	ret

ffffffffc020022c <print_kerninfo>:
ffffffffc020022c:	1141                	addi	sp,sp,-16
ffffffffc020022e:	0000b517          	auipc	a0,0xb
ffffffffc0200232:	25250513          	addi	a0,a0,594 # ffffffffc020b480 <etext+0x36>
ffffffffc0200236:	e406                	sd	ra,8(sp)
ffffffffc0200238:	f6fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020023c:	00000597          	auipc	a1,0x0
ffffffffc0200240:	e0e58593          	addi	a1,a1,-498 # ffffffffc020004a <kern_init>
ffffffffc0200244:	0000b517          	auipc	a0,0xb
ffffffffc0200248:	25c50513          	addi	a0,a0,604 # ffffffffc020b4a0 <etext+0x56>
ffffffffc020024c:	f5bff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200250:	0000b597          	auipc	a1,0xb
ffffffffc0200254:	1fa58593          	addi	a1,a1,506 # ffffffffc020b44a <etext>
ffffffffc0200258:	0000b517          	auipc	a0,0xb
ffffffffc020025c:	26850513          	addi	a0,a0,616 # ffffffffc020b4c0 <etext+0x76>
ffffffffc0200260:	f47ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200264:	00091597          	auipc	a1,0x91
ffffffffc0200268:	dfc58593          	addi	a1,a1,-516 # ffffffffc0291060 <buf>
ffffffffc020026c:	0000b517          	auipc	a0,0xb
ffffffffc0200270:	27450513          	addi	a0,a0,628 # ffffffffc020b4e0 <etext+0x96>
ffffffffc0200274:	f33ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200278:	00096597          	auipc	a1,0x96
ffffffffc020027c:	69858593          	addi	a1,a1,1688 # ffffffffc0296910 <end>
ffffffffc0200280:	0000b517          	auipc	a0,0xb
ffffffffc0200284:	28050513          	addi	a0,a0,640 # ffffffffc020b500 <etext+0xb6>
ffffffffc0200288:	f1fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020028c:	00097597          	auipc	a1,0x97
ffffffffc0200290:	a8358593          	addi	a1,a1,-1405 # ffffffffc0296d0f <end+0x3ff>
ffffffffc0200294:	00000797          	auipc	a5,0x0
ffffffffc0200298:	db678793          	addi	a5,a5,-586 # ffffffffc020004a <kern_init>
ffffffffc020029c:	40f587b3          	sub	a5,a1,a5
ffffffffc02002a0:	43f7d593          	srai	a1,a5,0x3f
ffffffffc02002a4:	60a2                	ld	ra,8(sp)
ffffffffc02002a6:	3ff5f593          	andi	a1,a1,1023
ffffffffc02002aa:	95be                	add	a1,a1,a5
ffffffffc02002ac:	85a9                	srai	a1,a1,0xa
ffffffffc02002ae:	0000b517          	auipc	a0,0xb
ffffffffc02002b2:	27250513          	addi	a0,a0,626 # ffffffffc020b520 <etext+0xd6>
ffffffffc02002b6:	0141                	addi	sp,sp,16
ffffffffc02002b8:	b5fd                	j	ffffffffc02001a6 <cprintf>

ffffffffc02002ba <print_stackframe>:
ffffffffc02002ba:	1141                	addi	sp,sp,-16
ffffffffc02002bc:	0000b617          	auipc	a2,0xb
ffffffffc02002c0:	29460613          	addi	a2,a2,660 # ffffffffc020b550 <etext+0x106>
ffffffffc02002c4:	04e00593          	li	a1,78
ffffffffc02002c8:	0000b517          	auipc	a0,0xb
ffffffffc02002cc:	2a050513          	addi	a0,a0,672 # ffffffffc020b568 <etext+0x11e>
ffffffffc02002d0:	e406                	sd	ra,8(sp)
ffffffffc02002d2:	1cc000ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02002d6 <mon_help>:
ffffffffc02002d6:	1141                	addi	sp,sp,-16
ffffffffc02002d8:	0000b617          	auipc	a2,0xb
ffffffffc02002dc:	2a860613          	addi	a2,a2,680 # ffffffffc020b580 <etext+0x136>
ffffffffc02002e0:	0000b597          	auipc	a1,0xb
ffffffffc02002e4:	2c058593          	addi	a1,a1,704 # ffffffffc020b5a0 <etext+0x156>
ffffffffc02002e8:	0000b517          	auipc	a0,0xb
ffffffffc02002ec:	2c050513          	addi	a0,a0,704 # ffffffffc020b5a8 <etext+0x15e>
ffffffffc02002f0:	e406                	sd	ra,8(sp)
ffffffffc02002f2:	eb5ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02002f6:	0000b617          	auipc	a2,0xb
ffffffffc02002fa:	2c260613          	addi	a2,a2,706 # ffffffffc020b5b8 <etext+0x16e>
ffffffffc02002fe:	0000b597          	auipc	a1,0xb
ffffffffc0200302:	2e258593          	addi	a1,a1,738 # ffffffffc020b5e0 <etext+0x196>
ffffffffc0200306:	0000b517          	auipc	a0,0xb
ffffffffc020030a:	2a250513          	addi	a0,a0,674 # ffffffffc020b5a8 <etext+0x15e>
ffffffffc020030e:	e99ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200312:	0000b617          	auipc	a2,0xb
ffffffffc0200316:	2de60613          	addi	a2,a2,734 # ffffffffc020b5f0 <etext+0x1a6>
ffffffffc020031a:	0000b597          	auipc	a1,0xb
ffffffffc020031e:	2f658593          	addi	a1,a1,758 # ffffffffc020b610 <etext+0x1c6>
ffffffffc0200322:	0000b517          	auipc	a0,0xb
ffffffffc0200326:	28650513          	addi	a0,a0,646 # ffffffffc020b5a8 <etext+0x15e>
ffffffffc020032a:	e7dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020032e:	60a2                	ld	ra,8(sp)
ffffffffc0200330:	4501                	li	a0,0
ffffffffc0200332:	0141                	addi	sp,sp,16
ffffffffc0200334:	8082                	ret

ffffffffc0200336 <mon_kerninfo>:
ffffffffc0200336:	1141                	addi	sp,sp,-16
ffffffffc0200338:	e406                	sd	ra,8(sp)
ffffffffc020033a:	ef3ff0ef          	jal	ra,ffffffffc020022c <print_kerninfo>
ffffffffc020033e:	60a2                	ld	ra,8(sp)
ffffffffc0200340:	4501                	li	a0,0
ffffffffc0200342:	0141                	addi	sp,sp,16
ffffffffc0200344:	8082                	ret

ffffffffc0200346 <mon_backtrace>:
ffffffffc0200346:	1141                	addi	sp,sp,-16
ffffffffc0200348:	e406                	sd	ra,8(sp)
ffffffffc020034a:	f71ff0ef          	jal	ra,ffffffffc02002ba <print_stackframe>
ffffffffc020034e:	60a2                	ld	ra,8(sp)
ffffffffc0200350:	4501                	li	a0,0
ffffffffc0200352:	0141                	addi	sp,sp,16
ffffffffc0200354:	8082                	ret

ffffffffc0200356 <kmonitor>:
ffffffffc0200356:	7115                	addi	sp,sp,-224
ffffffffc0200358:	ed5e                	sd	s7,152(sp)
ffffffffc020035a:	8baa                	mv	s7,a0
ffffffffc020035c:	0000b517          	auipc	a0,0xb
ffffffffc0200360:	2c450513          	addi	a0,a0,708 # ffffffffc020b620 <etext+0x1d6>
ffffffffc0200364:	ed86                	sd	ra,216(sp)
ffffffffc0200366:	e9a2                	sd	s0,208(sp)
ffffffffc0200368:	e5a6                	sd	s1,200(sp)
ffffffffc020036a:	e1ca                	sd	s2,192(sp)
ffffffffc020036c:	fd4e                	sd	s3,184(sp)
ffffffffc020036e:	f952                	sd	s4,176(sp)
ffffffffc0200370:	f556                	sd	s5,168(sp)
ffffffffc0200372:	f15a                	sd	s6,160(sp)
ffffffffc0200374:	e962                	sd	s8,144(sp)
ffffffffc0200376:	e566                	sd	s9,136(sp)
ffffffffc0200378:	e16a                	sd	s10,128(sp)
ffffffffc020037a:	e2dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020037e:	0000b517          	auipc	a0,0xb
ffffffffc0200382:	2ca50513          	addi	a0,a0,714 # ffffffffc020b648 <etext+0x1fe>
ffffffffc0200386:	e21ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020038a:	000b8563          	beqz	s7,ffffffffc0200394 <kmonitor+0x3e>
ffffffffc020038e:	855e                	mv	a0,s7
ffffffffc0200390:	3fb000ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc0200394:	0000bc17          	auipc	s8,0xb
ffffffffc0200398:	324c0c13          	addi	s8,s8,804 # ffffffffc020b6b8 <commands>
ffffffffc020039c:	0000b917          	auipc	s2,0xb
ffffffffc02003a0:	2d490913          	addi	s2,s2,724 # ffffffffc020b670 <etext+0x226>
ffffffffc02003a4:	0000b497          	auipc	s1,0xb
ffffffffc02003a8:	2d448493          	addi	s1,s1,724 # ffffffffc020b678 <etext+0x22e>
ffffffffc02003ac:	49bd                	li	s3,15
ffffffffc02003ae:	0000bb17          	auipc	s6,0xb
ffffffffc02003b2:	2d2b0b13          	addi	s6,s6,722 # ffffffffc020b680 <etext+0x236>
ffffffffc02003b6:	0000ba17          	auipc	s4,0xb
ffffffffc02003ba:	1eaa0a13          	addi	s4,s4,490 # ffffffffc020b5a0 <etext+0x156>
ffffffffc02003be:	4a8d                	li	s5,3
ffffffffc02003c0:	854a                	mv	a0,s2
ffffffffc02003c2:	cf1ff0ef          	jal	ra,ffffffffc02000b2 <readline>
ffffffffc02003c6:	842a                	mv	s0,a0
ffffffffc02003c8:	dd65                	beqz	a0,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc02003ca:	00054583          	lbu	a1,0(a0)
ffffffffc02003ce:	4c81                	li	s9,0
ffffffffc02003d0:	e1bd                	bnez	a1,ffffffffc0200436 <kmonitor+0xe0>
ffffffffc02003d2:	fe0c87e3          	beqz	s9,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc02003d6:	6582                	ld	a1,0(sp)
ffffffffc02003d8:	0000bd17          	auipc	s10,0xb
ffffffffc02003dc:	2e0d0d13          	addi	s10,s10,736 # ffffffffc020b6b8 <commands>
ffffffffc02003e0:	8552                	mv	a0,s4
ffffffffc02003e2:	4401                	li	s0,0
ffffffffc02003e4:	0d61                	addi	s10,s10,24
ffffffffc02003e6:	7a10a0ef          	jal	ra,ffffffffc020b386 <strcmp>
ffffffffc02003ea:	c919                	beqz	a0,ffffffffc0200400 <kmonitor+0xaa>
ffffffffc02003ec:	2405                	addiw	s0,s0,1
ffffffffc02003ee:	0b540063          	beq	s0,s5,ffffffffc020048e <kmonitor+0x138>
ffffffffc02003f2:	000d3503          	ld	a0,0(s10)
ffffffffc02003f6:	6582                	ld	a1,0(sp)
ffffffffc02003f8:	0d61                	addi	s10,s10,24
ffffffffc02003fa:	78d0a0ef          	jal	ra,ffffffffc020b386 <strcmp>
ffffffffc02003fe:	f57d                	bnez	a0,ffffffffc02003ec <kmonitor+0x96>
ffffffffc0200400:	00141793          	slli	a5,s0,0x1
ffffffffc0200404:	97a2                	add	a5,a5,s0
ffffffffc0200406:	078e                	slli	a5,a5,0x3
ffffffffc0200408:	97e2                	add	a5,a5,s8
ffffffffc020040a:	6b9c                	ld	a5,16(a5)
ffffffffc020040c:	865e                	mv	a2,s7
ffffffffc020040e:	002c                	addi	a1,sp,8
ffffffffc0200410:	fffc851b          	addiw	a0,s9,-1
ffffffffc0200414:	9782                	jalr	a5
ffffffffc0200416:	fa0555e3          	bgez	a0,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc020041a:	60ee                	ld	ra,216(sp)
ffffffffc020041c:	644e                	ld	s0,208(sp)
ffffffffc020041e:	64ae                	ld	s1,200(sp)
ffffffffc0200420:	690e                	ld	s2,192(sp)
ffffffffc0200422:	79ea                	ld	s3,184(sp)
ffffffffc0200424:	7a4a                	ld	s4,176(sp)
ffffffffc0200426:	7aaa                	ld	s5,168(sp)
ffffffffc0200428:	7b0a                	ld	s6,160(sp)
ffffffffc020042a:	6bea                	ld	s7,152(sp)
ffffffffc020042c:	6c4a                	ld	s8,144(sp)
ffffffffc020042e:	6caa                	ld	s9,136(sp)
ffffffffc0200430:	6d0a                	ld	s10,128(sp)
ffffffffc0200432:	612d                	addi	sp,sp,224
ffffffffc0200434:	8082                	ret
ffffffffc0200436:	8526                	mv	a0,s1
ffffffffc0200438:	7930a0ef          	jal	ra,ffffffffc020b3ca <strchr>
ffffffffc020043c:	c901                	beqz	a0,ffffffffc020044c <kmonitor+0xf6>
ffffffffc020043e:	00144583          	lbu	a1,1(s0)
ffffffffc0200442:	00040023          	sb	zero,0(s0)
ffffffffc0200446:	0405                	addi	s0,s0,1
ffffffffc0200448:	d5c9                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc020044a:	b7f5                	j	ffffffffc0200436 <kmonitor+0xe0>
ffffffffc020044c:	00044783          	lbu	a5,0(s0)
ffffffffc0200450:	d3c9                	beqz	a5,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200452:	033c8963          	beq	s9,s3,ffffffffc0200484 <kmonitor+0x12e>
ffffffffc0200456:	003c9793          	slli	a5,s9,0x3
ffffffffc020045a:	0118                	addi	a4,sp,128
ffffffffc020045c:	97ba                	add	a5,a5,a4
ffffffffc020045e:	f887b023          	sd	s0,-128(a5)
ffffffffc0200462:	00044583          	lbu	a1,0(s0)
ffffffffc0200466:	2c85                	addiw	s9,s9,1
ffffffffc0200468:	e591                	bnez	a1,ffffffffc0200474 <kmonitor+0x11e>
ffffffffc020046a:	b7b5                	j	ffffffffc02003d6 <kmonitor+0x80>
ffffffffc020046c:	00144583          	lbu	a1,1(s0)
ffffffffc0200470:	0405                	addi	s0,s0,1
ffffffffc0200472:	d1a5                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200474:	8526                	mv	a0,s1
ffffffffc0200476:	7550a0ef          	jal	ra,ffffffffc020b3ca <strchr>
ffffffffc020047a:	d96d                	beqz	a0,ffffffffc020046c <kmonitor+0x116>
ffffffffc020047c:	00044583          	lbu	a1,0(s0)
ffffffffc0200480:	d9a9                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200482:	bf55                	j	ffffffffc0200436 <kmonitor+0xe0>
ffffffffc0200484:	45c1                	li	a1,16
ffffffffc0200486:	855a                	mv	a0,s6
ffffffffc0200488:	d1fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020048c:	b7e9                	j	ffffffffc0200456 <kmonitor+0x100>
ffffffffc020048e:	6582                	ld	a1,0(sp)
ffffffffc0200490:	0000b517          	auipc	a0,0xb
ffffffffc0200494:	21050513          	addi	a0,a0,528 # ffffffffc020b6a0 <etext+0x256>
ffffffffc0200498:	d0fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020049c:	b715                	j	ffffffffc02003c0 <kmonitor+0x6a>

ffffffffc020049e <__panic>:
ffffffffc020049e:	00096317          	auipc	t1,0x96
ffffffffc02004a2:	3ca30313          	addi	t1,t1,970 # ffffffffc0296868 <is_panic>
ffffffffc02004a6:	00033e03          	ld	t3,0(t1)
ffffffffc02004aa:	715d                	addi	sp,sp,-80
ffffffffc02004ac:	ec06                	sd	ra,24(sp)
ffffffffc02004ae:	e822                	sd	s0,16(sp)
ffffffffc02004b0:	f436                	sd	a3,40(sp)
ffffffffc02004b2:	f83a                	sd	a4,48(sp)
ffffffffc02004b4:	fc3e                	sd	a5,56(sp)
ffffffffc02004b6:	e0c2                	sd	a6,64(sp)
ffffffffc02004b8:	e4c6                	sd	a7,72(sp)
ffffffffc02004ba:	020e1a63          	bnez	t3,ffffffffc02004ee <__panic+0x50>
ffffffffc02004be:	4785                	li	a5,1
ffffffffc02004c0:	00f33023          	sd	a5,0(t1)
ffffffffc02004c4:	8432                	mv	s0,a2
ffffffffc02004c6:	103c                	addi	a5,sp,40
ffffffffc02004c8:	862e                	mv	a2,a1
ffffffffc02004ca:	85aa                	mv	a1,a0
ffffffffc02004cc:	0000b517          	auipc	a0,0xb
ffffffffc02004d0:	23450513          	addi	a0,a0,564 # ffffffffc020b700 <commands+0x48>
ffffffffc02004d4:	e43e                	sd	a5,8(sp)
ffffffffc02004d6:	cd1ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02004da:	65a2                	ld	a1,8(sp)
ffffffffc02004dc:	8522                	mv	a0,s0
ffffffffc02004de:	ca3ff0ef          	jal	ra,ffffffffc0200180 <vcprintf>
ffffffffc02004e2:	0000c517          	auipc	a0,0xc
ffffffffc02004e6:	4fe50513          	addi	a0,a0,1278 # ffffffffc020c9e0 <default_pmm_manager+0x630>
ffffffffc02004ea:	cbdff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02004ee:	4501                	li	a0,0
ffffffffc02004f0:	4581                	li	a1,0
ffffffffc02004f2:	4601                	li	a2,0
ffffffffc02004f4:	48a1                	li	a7,8
ffffffffc02004f6:	00000073          	ecall
ffffffffc02004fa:	778000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02004fe:	4501                	li	a0,0
ffffffffc0200500:	e57ff0ef          	jal	ra,ffffffffc0200356 <kmonitor>
ffffffffc0200504:	bfed                	j	ffffffffc02004fe <__panic+0x60>

ffffffffc0200506 <__warn>:
ffffffffc0200506:	715d                	addi	sp,sp,-80
ffffffffc0200508:	832e                	mv	t1,a1
ffffffffc020050a:	e822                	sd	s0,16(sp)
ffffffffc020050c:	85aa                	mv	a1,a0
ffffffffc020050e:	8432                	mv	s0,a2
ffffffffc0200510:	fc3e                	sd	a5,56(sp)
ffffffffc0200512:	861a                	mv	a2,t1
ffffffffc0200514:	103c                	addi	a5,sp,40
ffffffffc0200516:	0000b517          	auipc	a0,0xb
ffffffffc020051a:	20a50513          	addi	a0,a0,522 # ffffffffc020b720 <commands+0x68>
ffffffffc020051e:	ec06                	sd	ra,24(sp)
ffffffffc0200520:	f436                	sd	a3,40(sp)
ffffffffc0200522:	f83a                	sd	a4,48(sp)
ffffffffc0200524:	e0c2                	sd	a6,64(sp)
ffffffffc0200526:	e4c6                	sd	a7,72(sp)
ffffffffc0200528:	e43e                	sd	a5,8(sp)
ffffffffc020052a:	c7dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020052e:	65a2                	ld	a1,8(sp)
ffffffffc0200530:	8522                	mv	a0,s0
ffffffffc0200532:	c4fff0ef          	jal	ra,ffffffffc0200180 <vcprintf>
ffffffffc0200536:	0000c517          	auipc	a0,0xc
ffffffffc020053a:	4aa50513          	addi	a0,a0,1194 # ffffffffc020c9e0 <default_pmm_manager+0x630>
ffffffffc020053e:	c69ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200542:	60e2                	ld	ra,24(sp)
ffffffffc0200544:	6442                	ld	s0,16(sp)
ffffffffc0200546:	6161                	addi	sp,sp,80
ffffffffc0200548:	8082                	ret

ffffffffc020054a <clock_init>:
ffffffffc020054a:	02000793          	li	a5,32
ffffffffc020054e:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc0200552:	c0102573          	rdtime	a0
ffffffffc0200556:	67e1                	lui	a5,0x18
ffffffffc0200558:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_bin_swap_img_size+0x109a0>
ffffffffc020055c:	953e                	add	a0,a0,a5
ffffffffc020055e:	4581                	li	a1,0
ffffffffc0200560:	4601                	li	a2,0
ffffffffc0200562:	4881                	li	a7,0
ffffffffc0200564:	00000073          	ecall
ffffffffc0200568:	0000b517          	auipc	a0,0xb
ffffffffc020056c:	1d850513          	addi	a0,a0,472 # ffffffffc020b740 <commands+0x88>
ffffffffc0200570:	00096797          	auipc	a5,0x96
ffffffffc0200574:	3007b023          	sd	zero,768(a5) # ffffffffc0296870 <ticks>
ffffffffc0200578:	b13d                	j	ffffffffc02001a6 <cprintf>

ffffffffc020057a <clock_set_next_event>:
ffffffffc020057a:	c0102573          	rdtime	a0
ffffffffc020057e:	67e1                	lui	a5,0x18
ffffffffc0200580:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_bin_swap_img_size+0x109a0>
ffffffffc0200584:	953e                	add	a0,a0,a5
ffffffffc0200586:	4581                	li	a1,0
ffffffffc0200588:	4601                	li	a2,0
ffffffffc020058a:	4881                	li	a7,0
ffffffffc020058c:	00000073          	ecall
ffffffffc0200590:	8082                	ret

ffffffffc0200592 <cons_init>:
ffffffffc0200592:	4501                	li	a0,0
ffffffffc0200594:	4581                	li	a1,0
ffffffffc0200596:	4601                	li	a2,0
ffffffffc0200598:	4889                	li	a7,2
ffffffffc020059a:	00000073          	ecall
ffffffffc020059e:	8082                	ret

ffffffffc02005a0 <cons_putc>:
ffffffffc02005a0:	1101                	addi	sp,sp,-32
ffffffffc02005a2:	ec06                	sd	ra,24(sp)
ffffffffc02005a4:	100027f3          	csrr	a5,sstatus
ffffffffc02005a8:	8b89                	andi	a5,a5,2
ffffffffc02005aa:	4701                	li	a4,0
ffffffffc02005ac:	ef95                	bnez	a5,ffffffffc02005e8 <cons_putc+0x48>
ffffffffc02005ae:	47a1                	li	a5,8
ffffffffc02005b0:	00f50b63          	beq	a0,a5,ffffffffc02005c6 <cons_putc+0x26>
ffffffffc02005b4:	4581                	li	a1,0
ffffffffc02005b6:	4601                	li	a2,0
ffffffffc02005b8:	4885                	li	a7,1
ffffffffc02005ba:	00000073          	ecall
ffffffffc02005be:	e315                	bnez	a4,ffffffffc02005e2 <cons_putc+0x42>
ffffffffc02005c0:	60e2                	ld	ra,24(sp)
ffffffffc02005c2:	6105                	addi	sp,sp,32
ffffffffc02005c4:	8082                	ret
ffffffffc02005c6:	4521                	li	a0,8
ffffffffc02005c8:	4581                	li	a1,0
ffffffffc02005ca:	4601                	li	a2,0
ffffffffc02005cc:	4885                	li	a7,1
ffffffffc02005ce:	00000073          	ecall
ffffffffc02005d2:	02000513          	li	a0,32
ffffffffc02005d6:	00000073          	ecall
ffffffffc02005da:	4521                	li	a0,8
ffffffffc02005dc:	00000073          	ecall
ffffffffc02005e0:	d365                	beqz	a4,ffffffffc02005c0 <cons_putc+0x20>
ffffffffc02005e2:	60e2                	ld	ra,24(sp)
ffffffffc02005e4:	6105                	addi	sp,sp,32
ffffffffc02005e6:	a559                	j	ffffffffc0200c6c <intr_enable>
ffffffffc02005e8:	e42a                	sd	a0,8(sp)
ffffffffc02005ea:	688000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02005ee:	6522                	ld	a0,8(sp)
ffffffffc02005f0:	4705                	li	a4,1
ffffffffc02005f2:	bf75                	j	ffffffffc02005ae <cons_putc+0xe>

ffffffffc02005f4 <cons_getc>:
ffffffffc02005f4:	1101                	addi	sp,sp,-32
ffffffffc02005f6:	ec06                	sd	ra,24(sp)
ffffffffc02005f8:	100027f3          	csrr	a5,sstatus
ffffffffc02005fc:	8b89                	andi	a5,a5,2
ffffffffc02005fe:	4801                	li	a6,0
ffffffffc0200600:	e3d5                	bnez	a5,ffffffffc02006a4 <cons_getc+0xb0>
ffffffffc0200602:	00091697          	auipc	a3,0x91
ffffffffc0200606:	e5e68693          	addi	a3,a3,-418 # ffffffffc0291460 <cons>
ffffffffc020060a:	07f00713          	li	a4,127
ffffffffc020060e:	20000313          	li	t1,512
ffffffffc0200612:	a021                	j	ffffffffc020061a <cons_getc+0x26>
ffffffffc0200614:	0ff57513          	zext.b	a0,a0
ffffffffc0200618:	ef91                	bnez	a5,ffffffffc0200634 <cons_getc+0x40>
ffffffffc020061a:	4501                	li	a0,0
ffffffffc020061c:	4581                	li	a1,0
ffffffffc020061e:	4601                	li	a2,0
ffffffffc0200620:	4889                	li	a7,2
ffffffffc0200622:	00000073          	ecall
ffffffffc0200626:	0005079b          	sext.w	a5,a0
ffffffffc020062a:	0207c763          	bltz	a5,ffffffffc0200658 <cons_getc+0x64>
ffffffffc020062e:	fee793e3          	bne	a5,a4,ffffffffc0200614 <cons_getc+0x20>
ffffffffc0200632:	4521                	li	a0,8
ffffffffc0200634:	2046a783          	lw	a5,516(a3)
ffffffffc0200638:	02079613          	slli	a2,a5,0x20
ffffffffc020063c:	9201                	srli	a2,a2,0x20
ffffffffc020063e:	2785                	addiw	a5,a5,1
ffffffffc0200640:	9636                	add	a2,a2,a3
ffffffffc0200642:	20f6a223          	sw	a5,516(a3)
ffffffffc0200646:	00a60023          	sb	a0,0(a2)
ffffffffc020064a:	fc6798e3          	bne	a5,t1,ffffffffc020061a <cons_getc+0x26>
ffffffffc020064e:	00091797          	auipc	a5,0x91
ffffffffc0200652:	0007ab23          	sw	zero,22(a5) # ffffffffc0291664 <cons+0x204>
ffffffffc0200656:	b7d1                	j	ffffffffc020061a <cons_getc+0x26>
ffffffffc0200658:	2006a783          	lw	a5,512(a3)
ffffffffc020065c:	2046a703          	lw	a4,516(a3)
ffffffffc0200660:	4501                	li	a0,0
ffffffffc0200662:	00f70f63          	beq	a4,a5,ffffffffc0200680 <cons_getc+0x8c>
ffffffffc0200666:	0017861b          	addiw	a2,a5,1
ffffffffc020066a:	1782                	slli	a5,a5,0x20
ffffffffc020066c:	9381                	srli	a5,a5,0x20
ffffffffc020066e:	97b6                	add	a5,a5,a3
ffffffffc0200670:	20c6a023          	sw	a2,512(a3)
ffffffffc0200674:	20000713          	li	a4,512
ffffffffc0200678:	0007c503          	lbu	a0,0(a5)
ffffffffc020067c:	00e60763          	beq	a2,a4,ffffffffc020068a <cons_getc+0x96>
ffffffffc0200680:	00081b63          	bnez	a6,ffffffffc0200696 <cons_getc+0xa2>
ffffffffc0200684:	60e2                	ld	ra,24(sp)
ffffffffc0200686:	6105                	addi	sp,sp,32
ffffffffc0200688:	8082                	ret
ffffffffc020068a:	00091797          	auipc	a5,0x91
ffffffffc020068e:	fc07ab23          	sw	zero,-42(a5) # ffffffffc0291660 <cons+0x200>
ffffffffc0200692:	fe0809e3          	beqz	a6,ffffffffc0200684 <cons_getc+0x90>
ffffffffc0200696:	e42a                	sd	a0,8(sp)
ffffffffc0200698:	5d4000ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020069c:	60e2                	ld	ra,24(sp)
ffffffffc020069e:	6522                	ld	a0,8(sp)
ffffffffc02006a0:	6105                	addi	sp,sp,32
ffffffffc02006a2:	8082                	ret
ffffffffc02006a4:	5ce000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02006a8:	4805                	li	a6,1
ffffffffc02006aa:	bfa1                	j	ffffffffc0200602 <cons_getc+0xe>

ffffffffc02006ac <dtb_init>:
ffffffffc02006ac:	7119                	addi	sp,sp,-128
ffffffffc02006ae:	0000b517          	auipc	a0,0xb
ffffffffc02006b2:	0b250513          	addi	a0,a0,178 # ffffffffc020b760 <commands+0xa8>
ffffffffc02006b6:	fc86                	sd	ra,120(sp)
ffffffffc02006b8:	f8a2                	sd	s0,112(sp)
ffffffffc02006ba:	e8d2                	sd	s4,80(sp)
ffffffffc02006bc:	f4a6                	sd	s1,104(sp)
ffffffffc02006be:	f0ca                	sd	s2,96(sp)
ffffffffc02006c0:	ecce                	sd	s3,88(sp)
ffffffffc02006c2:	e4d6                	sd	s5,72(sp)
ffffffffc02006c4:	e0da                	sd	s6,64(sp)
ffffffffc02006c6:	fc5e                	sd	s7,56(sp)
ffffffffc02006c8:	f862                	sd	s8,48(sp)
ffffffffc02006ca:	f466                	sd	s9,40(sp)
ffffffffc02006cc:	f06a                	sd	s10,32(sp)
ffffffffc02006ce:	ec6e                	sd	s11,24(sp)
ffffffffc02006d0:	ad7ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006d4:	00014597          	auipc	a1,0x14
ffffffffc02006d8:	92c5b583          	ld	a1,-1748(a1) # ffffffffc0214000 <boot_hartid>
ffffffffc02006dc:	0000b517          	auipc	a0,0xb
ffffffffc02006e0:	09450513          	addi	a0,a0,148 # ffffffffc020b770 <commands+0xb8>
ffffffffc02006e4:	ac3ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006e8:	00014417          	auipc	s0,0x14
ffffffffc02006ec:	92040413          	addi	s0,s0,-1760 # ffffffffc0214008 <boot_dtb>
ffffffffc02006f0:	600c                	ld	a1,0(s0)
ffffffffc02006f2:	0000b517          	auipc	a0,0xb
ffffffffc02006f6:	08e50513          	addi	a0,a0,142 # ffffffffc020b780 <commands+0xc8>
ffffffffc02006fa:	aadff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006fe:	00043a03          	ld	s4,0(s0)
ffffffffc0200702:	0000b517          	auipc	a0,0xb
ffffffffc0200706:	09650513          	addi	a0,a0,150 # ffffffffc020b798 <commands+0xe0>
ffffffffc020070a:	120a0463          	beqz	s4,ffffffffc0200832 <dtb_init+0x186>
ffffffffc020070e:	57f5                	li	a5,-3
ffffffffc0200710:	07fa                	slli	a5,a5,0x1e
ffffffffc0200712:	00fa0733          	add	a4,s4,a5
ffffffffc0200716:	431c                	lw	a5,0(a4)
ffffffffc0200718:	00ff0637          	lui	a2,0xff0
ffffffffc020071c:	6b41                	lui	s6,0x10
ffffffffc020071e:	0087d59b          	srliw	a1,a5,0x8
ffffffffc0200722:	0187969b          	slliw	a3,a5,0x18
ffffffffc0200726:	0187d51b          	srliw	a0,a5,0x18
ffffffffc020072a:	0105959b          	slliw	a1,a1,0x10
ffffffffc020072e:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200732:	8df1                	and	a1,a1,a2
ffffffffc0200734:	8ec9                	or	a3,a3,a0
ffffffffc0200736:	0087979b          	slliw	a5,a5,0x8
ffffffffc020073a:	1b7d                	addi	s6,s6,-1
ffffffffc020073c:	0167f7b3          	and	a5,a5,s6
ffffffffc0200740:	8dd5                	or	a1,a1,a3
ffffffffc0200742:	8ddd                	or	a1,a1,a5
ffffffffc0200744:	d00e07b7          	lui	a5,0xd00e0
ffffffffc0200748:	2581                	sext.w	a1,a1
ffffffffc020074a:	eed78793          	addi	a5,a5,-275 # ffffffffd00dfeed <end+0xfe495dd>
ffffffffc020074e:	10f59163          	bne	a1,a5,ffffffffc0200850 <dtb_init+0x1a4>
ffffffffc0200752:	471c                	lw	a5,8(a4)
ffffffffc0200754:	4754                	lw	a3,12(a4)
ffffffffc0200756:	4c81                	li	s9,0
ffffffffc0200758:	0087d59b          	srliw	a1,a5,0x8
ffffffffc020075c:	0086d51b          	srliw	a0,a3,0x8
ffffffffc0200760:	0186941b          	slliw	s0,a3,0x18
ffffffffc0200764:	0186d89b          	srliw	a7,a3,0x18
ffffffffc0200768:	01879a1b          	slliw	s4,a5,0x18
ffffffffc020076c:	0187d81b          	srliw	a6,a5,0x18
ffffffffc0200770:	0105151b          	slliw	a0,a0,0x10
ffffffffc0200774:	0106d69b          	srliw	a3,a3,0x10
ffffffffc0200778:	0105959b          	slliw	a1,a1,0x10
ffffffffc020077c:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200780:	8d71                	and	a0,a0,a2
ffffffffc0200782:	01146433          	or	s0,s0,a7
ffffffffc0200786:	0086969b          	slliw	a3,a3,0x8
ffffffffc020078a:	010a6a33          	or	s4,s4,a6
ffffffffc020078e:	8e6d                	and	a2,a2,a1
ffffffffc0200790:	0087979b          	slliw	a5,a5,0x8
ffffffffc0200794:	8c49                	or	s0,s0,a0
ffffffffc0200796:	0166f6b3          	and	a3,a3,s6
ffffffffc020079a:	00ca6a33          	or	s4,s4,a2
ffffffffc020079e:	0167f7b3          	and	a5,a5,s6
ffffffffc02007a2:	8c55                	or	s0,s0,a3
ffffffffc02007a4:	00fa6a33          	or	s4,s4,a5
ffffffffc02007a8:	1402                	slli	s0,s0,0x20
ffffffffc02007aa:	1a02                	slli	s4,s4,0x20
ffffffffc02007ac:	9001                	srli	s0,s0,0x20
ffffffffc02007ae:	020a5a13          	srli	s4,s4,0x20
ffffffffc02007b2:	943a                	add	s0,s0,a4
ffffffffc02007b4:	9a3a                	add	s4,s4,a4
ffffffffc02007b6:	00ff0c37          	lui	s8,0xff0
ffffffffc02007ba:	4b8d                	li	s7,3
ffffffffc02007bc:	0000b917          	auipc	s2,0xb
ffffffffc02007c0:	02c90913          	addi	s2,s2,44 # ffffffffc020b7e8 <commands+0x130>
ffffffffc02007c4:	49bd                	li	s3,15
ffffffffc02007c6:	4d91                	li	s11,4
ffffffffc02007c8:	4d05                	li	s10,1
ffffffffc02007ca:	0000b497          	auipc	s1,0xb
ffffffffc02007ce:	01648493          	addi	s1,s1,22 # ffffffffc020b7e0 <commands+0x128>
ffffffffc02007d2:	000a2703          	lw	a4,0(s4)
ffffffffc02007d6:	004a0a93          	addi	s5,s4,4
ffffffffc02007da:	0087569b          	srliw	a3,a4,0x8
ffffffffc02007de:	0187179b          	slliw	a5,a4,0x18
ffffffffc02007e2:	0187561b          	srliw	a2,a4,0x18
ffffffffc02007e6:	0106969b          	slliw	a3,a3,0x10
ffffffffc02007ea:	0107571b          	srliw	a4,a4,0x10
ffffffffc02007ee:	8fd1                	or	a5,a5,a2
ffffffffc02007f0:	0186f6b3          	and	a3,a3,s8
ffffffffc02007f4:	0087171b          	slliw	a4,a4,0x8
ffffffffc02007f8:	8fd5                	or	a5,a5,a3
ffffffffc02007fa:	00eb7733          	and	a4,s6,a4
ffffffffc02007fe:	8fd9                	or	a5,a5,a4
ffffffffc0200800:	2781                	sext.w	a5,a5
ffffffffc0200802:	09778c63          	beq	a5,s7,ffffffffc020089a <dtb_init+0x1ee>
ffffffffc0200806:	00fbea63          	bltu	s7,a5,ffffffffc020081a <dtb_init+0x16e>
ffffffffc020080a:	07a78663          	beq	a5,s10,ffffffffc0200876 <dtb_init+0x1ca>
ffffffffc020080e:	4709                	li	a4,2
ffffffffc0200810:	00e79763          	bne	a5,a4,ffffffffc020081e <dtb_init+0x172>
ffffffffc0200814:	4c81                	li	s9,0
ffffffffc0200816:	8a56                	mv	s4,s5
ffffffffc0200818:	bf6d                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc020081a:	ffb78ee3          	beq	a5,s11,ffffffffc0200816 <dtb_init+0x16a>
ffffffffc020081e:	0000b517          	auipc	a0,0xb
ffffffffc0200822:	04250513          	addi	a0,a0,66 # ffffffffc020b860 <commands+0x1a8>
ffffffffc0200826:	981ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020082a:	0000b517          	auipc	a0,0xb
ffffffffc020082e:	06e50513          	addi	a0,a0,110 # ffffffffc020b898 <commands+0x1e0>
ffffffffc0200832:	7446                	ld	s0,112(sp)
ffffffffc0200834:	70e6                	ld	ra,120(sp)
ffffffffc0200836:	74a6                	ld	s1,104(sp)
ffffffffc0200838:	7906                	ld	s2,96(sp)
ffffffffc020083a:	69e6                	ld	s3,88(sp)
ffffffffc020083c:	6a46                	ld	s4,80(sp)
ffffffffc020083e:	6aa6                	ld	s5,72(sp)
ffffffffc0200840:	6b06                	ld	s6,64(sp)
ffffffffc0200842:	7be2                	ld	s7,56(sp)
ffffffffc0200844:	7c42                	ld	s8,48(sp)
ffffffffc0200846:	7ca2                	ld	s9,40(sp)
ffffffffc0200848:	7d02                	ld	s10,32(sp)
ffffffffc020084a:	6de2                	ld	s11,24(sp)
ffffffffc020084c:	6109                	addi	sp,sp,128
ffffffffc020084e:	baa1                	j	ffffffffc02001a6 <cprintf>
ffffffffc0200850:	7446                	ld	s0,112(sp)
ffffffffc0200852:	70e6                	ld	ra,120(sp)
ffffffffc0200854:	74a6                	ld	s1,104(sp)
ffffffffc0200856:	7906                	ld	s2,96(sp)
ffffffffc0200858:	69e6                	ld	s3,88(sp)
ffffffffc020085a:	6a46                	ld	s4,80(sp)
ffffffffc020085c:	6aa6                	ld	s5,72(sp)
ffffffffc020085e:	6b06                	ld	s6,64(sp)
ffffffffc0200860:	7be2                	ld	s7,56(sp)
ffffffffc0200862:	7c42                	ld	s8,48(sp)
ffffffffc0200864:	7ca2                	ld	s9,40(sp)
ffffffffc0200866:	7d02                	ld	s10,32(sp)
ffffffffc0200868:	6de2                	ld	s11,24(sp)
ffffffffc020086a:	0000b517          	auipc	a0,0xb
ffffffffc020086e:	f4e50513          	addi	a0,a0,-178 # ffffffffc020b7b8 <commands+0x100>
ffffffffc0200872:	6109                	addi	sp,sp,128
ffffffffc0200874:	ba0d                	j	ffffffffc02001a6 <cprintf>
ffffffffc0200876:	8556                	mv	a0,s5
ffffffffc0200878:	2c70a0ef          	jal	ra,ffffffffc020b33e <strlen>
ffffffffc020087c:	8a2a                	mv	s4,a0
ffffffffc020087e:	4619                	li	a2,6
ffffffffc0200880:	85a6                	mv	a1,s1
ffffffffc0200882:	8556                	mv	a0,s5
ffffffffc0200884:	2a01                	sext.w	s4,s4
ffffffffc0200886:	31f0a0ef          	jal	ra,ffffffffc020b3a4 <strncmp>
ffffffffc020088a:	e111                	bnez	a0,ffffffffc020088e <dtb_init+0x1e2>
ffffffffc020088c:	4c85                	li	s9,1
ffffffffc020088e:	0a91                	addi	s5,s5,4
ffffffffc0200890:	9ad2                	add	s5,s5,s4
ffffffffc0200892:	ffcafa93          	andi	s5,s5,-4
ffffffffc0200896:	8a56                	mv	s4,s5
ffffffffc0200898:	bf2d                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc020089a:	004a2783          	lw	a5,4(s4)
ffffffffc020089e:	00ca0693          	addi	a3,s4,12
ffffffffc02008a2:	0087d71b          	srliw	a4,a5,0x8
ffffffffc02008a6:	01879a9b          	slliw	s5,a5,0x18
ffffffffc02008aa:	0187d61b          	srliw	a2,a5,0x18
ffffffffc02008ae:	0107171b          	slliw	a4,a4,0x10
ffffffffc02008b2:	0107d79b          	srliw	a5,a5,0x10
ffffffffc02008b6:	00caeab3          	or	s5,s5,a2
ffffffffc02008ba:	01877733          	and	a4,a4,s8
ffffffffc02008be:	0087979b          	slliw	a5,a5,0x8
ffffffffc02008c2:	00eaeab3          	or	s5,s5,a4
ffffffffc02008c6:	00fb77b3          	and	a5,s6,a5
ffffffffc02008ca:	00faeab3          	or	s5,s5,a5
ffffffffc02008ce:	2a81                	sext.w	s5,s5
ffffffffc02008d0:	000c9c63          	bnez	s9,ffffffffc02008e8 <dtb_init+0x23c>
ffffffffc02008d4:	1a82                	slli	s5,s5,0x20
ffffffffc02008d6:	00368793          	addi	a5,a3,3
ffffffffc02008da:	020ada93          	srli	s5,s5,0x20
ffffffffc02008de:	9abe                	add	s5,s5,a5
ffffffffc02008e0:	ffcafa93          	andi	s5,s5,-4
ffffffffc02008e4:	8a56                	mv	s4,s5
ffffffffc02008e6:	b5f5                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc02008e8:	008a2783          	lw	a5,8(s4)
ffffffffc02008ec:	85ca                	mv	a1,s2
ffffffffc02008ee:	e436                	sd	a3,8(sp)
ffffffffc02008f0:	0087d51b          	srliw	a0,a5,0x8
ffffffffc02008f4:	0187d61b          	srliw	a2,a5,0x18
ffffffffc02008f8:	0187971b          	slliw	a4,a5,0x18
ffffffffc02008fc:	0105151b          	slliw	a0,a0,0x10
ffffffffc0200900:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200904:	8f51                	or	a4,a4,a2
ffffffffc0200906:	01857533          	and	a0,a0,s8
ffffffffc020090a:	0087979b          	slliw	a5,a5,0x8
ffffffffc020090e:	8d59                	or	a0,a0,a4
ffffffffc0200910:	00fb77b3          	and	a5,s6,a5
ffffffffc0200914:	8d5d                	or	a0,a0,a5
ffffffffc0200916:	1502                	slli	a0,a0,0x20
ffffffffc0200918:	9101                	srli	a0,a0,0x20
ffffffffc020091a:	9522                	add	a0,a0,s0
ffffffffc020091c:	26b0a0ef          	jal	ra,ffffffffc020b386 <strcmp>
ffffffffc0200920:	66a2                	ld	a3,8(sp)
ffffffffc0200922:	f94d                	bnez	a0,ffffffffc02008d4 <dtb_init+0x228>
ffffffffc0200924:	fb59f8e3          	bgeu	s3,s5,ffffffffc02008d4 <dtb_init+0x228>
ffffffffc0200928:	00ca3783          	ld	a5,12(s4)
ffffffffc020092c:	014a3703          	ld	a4,20(s4)
ffffffffc0200930:	0000b517          	auipc	a0,0xb
ffffffffc0200934:	ec050513          	addi	a0,a0,-320 # ffffffffc020b7f0 <commands+0x138>
ffffffffc0200938:	4207d613          	srai	a2,a5,0x20
ffffffffc020093c:	0087d31b          	srliw	t1,a5,0x8
ffffffffc0200940:	42075593          	srai	a1,a4,0x20
ffffffffc0200944:	0187de1b          	srliw	t3,a5,0x18
ffffffffc0200948:	0186581b          	srliw	a6,a2,0x18
ffffffffc020094c:	0187941b          	slliw	s0,a5,0x18
ffffffffc0200950:	0107d89b          	srliw	a7,a5,0x10
ffffffffc0200954:	0187d693          	srli	a3,a5,0x18
ffffffffc0200958:	01861f1b          	slliw	t5,a2,0x18
ffffffffc020095c:	0087579b          	srliw	a5,a4,0x8
ffffffffc0200960:	0103131b          	slliw	t1,t1,0x10
ffffffffc0200964:	0106561b          	srliw	a2,a2,0x10
ffffffffc0200968:	010f6f33          	or	t5,t5,a6
ffffffffc020096c:	0187529b          	srliw	t0,a4,0x18
ffffffffc0200970:	0185df9b          	srliw	t6,a1,0x18
ffffffffc0200974:	01837333          	and	t1,t1,s8
ffffffffc0200978:	01c46433          	or	s0,s0,t3
ffffffffc020097c:	0186f6b3          	and	a3,a3,s8
ffffffffc0200980:	01859e1b          	slliw	t3,a1,0x18
ffffffffc0200984:	01871e9b          	slliw	t4,a4,0x18
ffffffffc0200988:	0107581b          	srliw	a6,a4,0x10
ffffffffc020098c:	0086161b          	slliw	a2,a2,0x8
ffffffffc0200990:	8361                	srli	a4,a4,0x18
ffffffffc0200992:	0107979b          	slliw	a5,a5,0x10
ffffffffc0200996:	0105d59b          	srliw	a1,a1,0x10
ffffffffc020099a:	01e6e6b3          	or	a3,a3,t5
ffffffffc020099e:	00cb7633          	and	a2,s6,a2
ffffffffc02009a2:	0088181b          	slliw	a6,a6,0x8
ffffffffc02009a6:	0085959b          	slliw	a1,a1,0x8
ffffffffc02009aa:	00646433          	or	s0,s0,t1
ffffffffc02009ae:	0187f7b3          	and	a5,a5,s8
ffffffffc02009b2:	01fe6333          	or	t1,t3,t6
ffffffffc02009b6:	01877c33          	and	s8,a4,s8
ffffffffc02009ba:	0088989b          	slliw	a7,a7,0x8
ffffffffc02009be:	011b78b3          	and	a7,s6,a7
ffffffffc02009c2:	005eeeb3          	or	t4,t4,t0
ffffffffc02009c6:	00c6e733          	or	a4,a3,a2
ffffffffc02009ca:	006c6c33          	or	s8,s8,t1
ffffffffc02009ce:	010b76b3          	and	a3,s6,a6
ffffffffc02009d2:	00bb7b33          	and	s6,s6,a1
ffffffffc02009d6:	01d7e7b3          	or	a5,a5,t4
ffffffffc02009da:	016c6b33          	or	s6,s8,s6
ffffffffc02009de:	01146433          	or	s0,s0,a7
ffffffffc02009e2:	8fd5                	or	a5,a5,a3
ffffffffc02009e4:	1702                	slli	a4,a4,0x20
ffffffffc02009e6:	1b02                	slli	s6,s6,0x20
ffffffffc02009e8:	1782                	slli	a5,a5,0x20
ffffffffc02009ea:	9301                	srli	a4,a4,0x20
ffffffffc02009ec:	1402                	slli	s0,s0,0x20
ffffffffc02009ee:	020b5b13          	srli	s6,s6,0x20
ffffffffc02009f2:	0167eb33          	or	s6,a5,s6
ffffffffc02009f6:	8c59                	or	s0,s0,a4
ffffffffc02009f8:	faeff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02009fc:	85a2                	mv	a1,s0
ffffffffc02009fe:	0000b517          	auipc	a0,0xb
ffffffffc0200a02:	e1250513          	addi	a0,a0,-494 # ffffffffc020b810 <commands+0x158>
ffffffffc0200a06:	fa0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a0a:	014b5613          	srli	a2,s6,0x14
ffffffffc0200a0e:	85da                	mv	a1,s6
ffffffffc0200a10:	0000b517          	auipc	a0,0xb
ffffffffc0200a14:	e1850513          	addi	a0,a0,-488 # ffffffffc020b828 <commands+0x170>
ffffffffc0200a18:	f8eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a1c:	008b05b3          	add	a1,s6,s0
ffffffffc0200a20:	15fd                	addi	a1,a1,-1
ffffffffc0200a22:	0000b517          	auipc	a0,0xb
ffffffffc0200a26:	e2650513          	addi	a0,a0,-474 # ffffffffc020b848 <commands+0x190>
ffffffffc0200a2a:	f7cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a2e:	0000b517          	auipc	a0,0xb
ffffffffc0200a32:	e6a50513          	addi	a0,a0,-406 # ffffffffc020b898 <commands+0x1e0>
ffffffffc0200a36:	00096797          	auipc	a5,0x96
ffffffffc0200a3a:	e487b123          	sd	s0,-446(a5) # ffffffffc0296878 <memory_base>
ffffffffc0200a3e:	00096797          	auipc	a5,0x96
ffffffffc0200a42:	e567b123          	sd	s6,-446(a5) # ffffffffc0296880 <memory_size>
ffffffffc0200a46:	b3f5                	j	ffffffffc0200832 <dtb_init+0x186>

ffffffffc0200a48 <get_memory_base>:
ffffffffc0200a48:	00096517          	auipc	a0,0x96
ffffffffc0200a4c:	e3053503          	ld	a0,-464(a0) # ffffffffc0296878 <memory_base>
ffffffffc0200a50:	8082                	ret

ffffffffc0200a52 <get_memory_size>:
ffffffffc0200a52:	00096517          	auipc	a0,0x96
ffffffffc0200a56:	e2e53503          	ld	a0,-466(a0) # ffffffffc0296880 <memory_size>
ffffffffc0200a5a:	8082                	ret

ffffffffc0200a5c <ide_init>:
ffffffffc0200a5c:	1141                	addi	sp,sp,-16
ffffffffc0200a5e:	00091597          	auipc	a1,0x91
ffffffffc0200a62:	c5a58593          	addi	a1,a1,-934 # ffffffffc02916b8 <ide_devices+0x50>
ffffffffc0200a66:	4505                	li	a0,1
ffffffffc0200a68:	e022                	sd	s0,0(sp)
ffffffffc0200a6a:	00091797          	auipc	a5,0x91
ffffffffc0200a6e:	be07af23          	sw	zero,-1026(a5) # ffffffffc0291668 <ide_devices>
ffffffffc0200a72:	00091797          	auipc	a5,0x91
ffffffffc0200a76:	c407a323          	sw	zero,-954(a5) # ffffffffc02916b8 <ide_devices+0x50>
ffffffffc0200a7a:	00091797          	auipc	a5,0x91
ffffffffc0200a7e:	c807a723          	sw	zero,-882(a5) # ffffffffc0291708 <ide_devices+0xa0>
ffffffffc0200a82:	00091797          	auipc	a5,0x91
ffffffffc0200a86:	cc07ab23          	sw	zero,-810(a5) # ffffffffc0291758 <ide_devices+0xf0>
ffffffffc0200a8a:	e406                	sd	ra,8(sp)
ffffffffc0200a8c:	00091417          	auipc	s0,0x91
ffffffffc0200a90:	bdc40413          	addi	s0,s0,-1060 # ffffffffc0291668 <ide_devices>
ffffffffc0200a94:	23a000ef          	jal	ra,ffffffffc0200cce <ramdisk_init>
ffffffffc0200a98:	483c                	lw	a5,80(s0)
ffffffffc0200a9a:	cf99                	beqz	a5,ffffffffc0200ab8 <ide_init+0x5c>
ffffffffc0200a9c:	00091597          	auipc	a1,0x91
ffffffffc0200aa0:	c6c58593          	addi	a1,a1,-916 # ffffffffc0291708 <ide_devices+0xa0>
ffffffffc0200aa4:	4509                	li	a0,2
ffffffffc0200aa6:	228000ef          	jal	ra,ffffffffc0200cce <ramdisk_init>
ffffffffc0200aaa:	0a042783          	lw	a5,160(s0)
ffffffffc0200aae:	c785                	beqz	a5,ffffffffc0200ad6 <ide_init+0x7a>
ffffffffc0200ab0:	60a2                	ld	ra,8(sp)
ffffffffc0200ab2:	6402                	ld	s0,0(sp)
ffffffffc0200ab4:	0141                	addi	sp,sp,16
ffffffffc0200ab6:	8082                	ret
ffffffffc0200ab8:	0000b697          	auipc	a3,0xb
ffffffffc0200abc:	df868693          	addi	a3,a3,-520 # ffffffffc020b8b0 <commands+0x1f8>
ffffffffc0200ac0:	0000b617          	auipc	a2,0xb
ffffffffc0200ac4:	e0860613          	addi	a2,a2,-504 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0200ac8:	45c5                	li	a1,17
ffffffffc0200aca:	0000b517          	auipc	a0,0xb
ffffffffc0200ace:	e1650513          	addi	a0,a0,-490 # ffffffffc020b8e0 <commands+0x228>
ffffffffc0200ad2:	9cdff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200ad6:	0000b697          	auipc	a3,0xb
ffffffffc0200ada:	e2268693          	addi	a3,a3,-478 # ffffffffc020b8f8 <commands+0x240>
ffffffffc0200ade:	0000b617          	auipc	a2,0xb
ffffffffc0200ae2:	dea60613          	addi	a2,a2,-534 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0200ae6:	45d1                	li	a1,20
ffffffffc0200ae8:	0000b517          	auipc	a0,0xb
ffffffffc0200aec:	df850513          	addi	a0,a0,-520 # ffffffffc020b8e0 <commands+0x228>
ffffffffc0200af0:	9afff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200af4 <ide_device_valid>:
ffffffffc0200af4:	478d                	li	a5,3
ffffffffc0200af6:	00a7ef63          	bltu	a5,a0,ffffffffc0200b14 <ide_device_valid+0x20>
ffffffffc0200afa:	00251793          	slli	a5,a0,0x2
ffffffffc0200afe:	953e                	add	a0,a0,a5
ffffffffc0200b00:	0512                	slli	a0,a0,0x4
ffffffffc0200b02:	00091797          	auipc	a5,0x91
ffffffffc0200b06:	b6678793          	addi	a5,a5,-1178 # ffffffffc0291668 <ide_devices>
ffffffffc0200b0a:	953e                	add	a0,a0,a5
ffffffffc0200b0c:	4108                	lw	a0,0(a0)
ffffffffc0200b0e:	00a03533          	snez	a0,a0
ffffffffc0200b12:	8082                	ret
ffffffffc0200b14:	4501                	li	a0,0
ffffffffc0200b16:	8082                	ret

ffffffffc0200b18 <ide_device_size>:
ffffffffc0200b18:	478d                	li	a5,3
ffffffffc0200b1a:	02a7e163          	bltu	a5,a0,ffffffffc0200b3c <ide_device_size+0x24>
ffffffffc0200b1e:	00251793          	slli	a5,a0,0x2
ffffffffc0200b22:	953e                	add	a0,a0,a5
ffffffffc0200b24:	0512                	slli	a0,a0,0x4
ffffffffc0200b26:	00091797          	auipc	a5,0x91
ffffffffc0200b2a:	b4278793          	addi	a5,a5,-1214 # ffffffffc0291668 <ide_devices>
ffffffffc0200b2e:	97aa                	add	a5,a5,a0
ffffffffc0200b30:	4398                	lw	a4,0(a5)
ffffffffc0200b32:	4501                	li	a0,0
ffffffffc0200b34:	c709                	beqz	a4,ffffffffc0200b3e <ide_device_size+0x26>
ffffffffc0200b36:	0087e503          	lwu	a0,8(a5)
ffffffffc0200b3a:	8082                	ret
ffffffffc0200b3c:	4501                	li	a0,0
ffffffffc0200b3e:	8082                	ret

ffffffffc0200b40 <ide_read_secs>:
ffffffffc0200b40:	1141                	addi	sp,sp,-16
ffffffffc0200b42:	e406                	sd	ra,8(sp)
ffffffffc0200b44:	08000793          	li	a5,128
ffffffffc0200b48:	04d7e763          	bltu	a5,a3,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b4c:	478d                	li	a5,3
ffffffffc0200b4e:	0005081b          	sext.w	a6,a0
ffffffffc0200b52:	04a7e263          	bltu	a5,a0,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b56:	00281793          	slli	a5,a6,0x2
ffffffffc0200b5a:	97c2                	add	a5,a5,a6
ffffffffc0200b5c:	0792                	slli	a5,a5,0x4
ffffffffc0200b5e:	00091817          	auipc	a6,0x91
ffffffffc0200b62:	b0a80813          	addi	a6,a6,-1270 # ffffffffc0291668 <ide_devices>
ffffffffc0200b66:	97c2                	add	a5,a5,a6
ffffffffc0200b68:	0007a883          	lw	a7,0(a5)
ffffffffc0200b6c:	02088563          	beqz	a7,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b70:	100008b7          	lui	a7,0x10000
ffffffffc0200b74:	0515f163          	bgeu	a1,a7,ffffffffc0200bb6 <ide_read_secs+0x76>
ffffffffc0200b78:	1582                	slli	a1,a1,0x20
ffffffffc0200b7a:	9181                	srli	a1,a1,0x20
ffffffffc0200b7c:	00d58733          	add	a4,a1,a3
ffffffffc0200b80:	02e8eb63          	bltu	a7,a4,ffffffffc0200bb6 <ide_read_secs+0x76>
ffffffffc0200b84:	00251713          	slli	a4,a0,0x2
ffffffffc0200b88:	60a2                	ld	ra,8(sp)
ffffffffc0200b8a:	63bc                	ld	a5,64(a5)
ffffffffc0200b8c:	953a                	add	a0,a0,a4
ffffffffc0200b8e:	0512                	slli	a0,a0,0x4
ffffffffc0200b90:	9542                	add	a0,a0,a6
ffffffffc0200b92:	0141                	addi	sp,sp,16
ffffffffc0200b94:	8782                	jr	a5
ffffffffc0200b96:	0000b697          	auipc	a3,0xb
ffffffffc0200b9a:	d7a68693          	addi	a3,a3,-646 # ffffffffc020b910 <commands+0x258>
ffffffffc0200b9e:	0000b617          	auipc	a2,0xb
ffffffffc0200ba2:	d2a60613          	addi	a2,a2,-726 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0200ba6:	02200593          	li	a1,34
ffffffffc0200baa:	0000b517          	auipc	a0,0xb
ffffffffc0200bae:	d3650513          	addi	a0,a0,-714 # ffffffffc020b8e0 <commands+0x228>
ffffffffc0200bb2:	8edff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200bb6:	0000b697          	auipc	a3,0xb
ffffffffc0200bba:	d8268693          	addi	a3,a3,-638 # ffffffffc020b938 <commands+0x280>
ffffffffc0200bbe:	0000b617          	auipc	a2,0xb
ffffffffc0200bc2:	d0a60613          	addi	a2,a2,-758 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0200bc6:	02300593          	li	a1,35
ffffffffc0200bca:	0000b517          	auipc	a0,0xb
ffffffffc0200bce:	d1650513          	addi	a0,a0,-746 # ffffffffc020b8e0 <commands+0x228>
ffffffffc0200bd2:	8cdff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200bd6 <ide_write_secs>:
ffffffffc0200bd6:	1141                	addi	sp,sp,-16
ffffffffc0200bd8:	e406                	sd	ra,8(sp)
ffffffffc0200bda:	08000793          	li	a5,128
ffffffffc0200bde:	04d7e763          	bltu	a5,a3,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200be2:	478d                	li	a5,3
ffffffffc0200be4:	0005081b          	sext.w	a6,a0
ffffffffc0200be8:	04a7e263          	bltu	a5,a0,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200bec:	00281793          	slli	a5,a6,0x2
ffffffffc0200bf0:	97c2                	add	a5,a5,a6
ffffffffc0200bf2:	0792                	slli	a5,a5,0x4
ffffffffc0200bf4:	00091817          	auipc	a6,0x91
ffffffffc0200bf8:	a7480813          	addi	a6,a6,-1420 # ffffffffc0291668 <ide_devices>
ffffffffc0200bfc:	97c2                	add	a5,a5,a6
ffffffffc0200bfe:	0007a883          	lw	a7,0(a5)
ffffffffc0200c02:	02088563          	beqz	a7,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200c06:	100008b7          	lui	a7,0x10000
ffffffffc0200c0a:	0515f163          	bgeu	a1,a7,ffffffffc0200c4c <ide_write_secs+0x76>
ffffffffc0200c0e:	1582                	slli	a1,a1,0x20
ffffffffc0200c10:	9181                	srli	a1,a1,0x20
ffffffffc0200c12:	00d58733          	add	a4,a1,a3
ffffffffc0200c16:	02e8eb63          	bltu	a7,a4,ffffffffc0200c4c <ide_write_secs+0x76>
ffffffffc0200c1a:	00251713          	slli	a4,a0,0x2
ffffffffc0200c1e:	60a2                	ld	ra,8(sp)
ffffffffc0200c20:	67bc                	ld	a5,72(a5)
ffffffffc0200c22:	953a                	add	a0,a0,a4
ffffffffc0200c24:	0512                	slli	a0,a0,0x4
ffffffffc0200c26:	9542                	add	a0,a0,a6
ffffffffc0200c28:	0141                	addi	sp,sp,16
ffffffffc0200c2a:	8782                	jr	a5
ffffffffc0200c2c:	0000b697          	auipc	a3,0xb
ffffffffc0200c30:	ce468693          	addi	a3,a3,-796 # ffffffffc020b910 <commands+0x258>
ffffffffc0200c34:	0000b617          	auipc	a2,0xb
ffffffffc0200c38:	c9460613          	addi	a2,a2,-876 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0200c3c:	02900593          	li	a1,41
ffffffffc0200c40:	0000b517          	auipc	a0,0xb
ffffffffc0200c44:	ca050513          	addi	a0,a0,-864 # ffffffffc020b8e0 <commands+0x228>
ffffffffc0200c48:	857ff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200c4c:	0000b697          	auipc	a3,0xb
ffffffffc0200c50:	cec68693          	addi	a3,a3,-788 # ffffffffc020b938 <commands+0x280>
ffffffffc0200c54:	0000b617          	auipc	a2,0xb
ffffffffc0200c58:	c7460613          	addi	a2,a2,-908 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0200c5c:	02a00593          	li	a1,42
ffffffffc0200c60:	0000b517          	auipc	a0,0xb
ffffffffc0200c64:	c8050513          	addi	a0,a0,-896 # ffffffffc020b8e0 <commands+0x228>
ffffffffc0200c68:	837ff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200c6c <intr_enable>:
ffffffffc0200c6c:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc0200c70:	8082                	ret

ffffffffc0200c72 <intr_disable>:
ffffffffc0200c72:	100177f3          	csrrci	a5,sstatus,2
ffffffffc0200c76:	8082                	ret

ffffffffc0200c78 <pic_init>:
ffffffffc0200c78:	8082                	ret

ffffffffc0200c7a <ramdisk_write>:
ffffffffc0200c7a:	00856703          	lwu	a4,8(a0)
ffffffffc0200c7e:	1141                	addi	sp,sp,-16
ffffffffc0200c80:	e406                	sd	ra,8(sp)
ffffffffc0200c82:	8f0d                	sub	a4,a4,a1
ffffffffc0200c84:	87ae                	mv	a5,a1
ffffffffc0200c86:	85b2                	mv	a1,a2
ffffffffc0200c88:	00e6f363          	bgeu	a3,a4,ffffffffc0200c8e <ramdisk_write+0x14>
ffffffffc0200c8c:	8736                	mv	a4,a3
ffffffffc0200c8e:	6908                	ld	a0,16(a0)
ffffffffc0200c90:	07a6                	slli	a5,a5,0x9
ffffffffc0200c92:	00971613          	slli	a2,a4,0x9
ffffffffc0200c96:	953e                	add	a0,a0,a5
ffffffffc0200c98:	79a0a0ef          	jal	ra,ffffffffc020b432 <memcpy>
ffffffffc0200c9c:	60a2                	ld	ra,8(sp)
ffffffffc0200c9e:	4501                	li	a0,0
ffffffffc0200ca0:	0141                	addi	sp,sp,16
ffffffffc0200ca2:	8082                	ret

ffffffffc0200ca4 <ramdisk_read>:
ffffffffc0200ca4:	00856783          	lwu	a5,8(a0)
ffffffffc0200ca8:	1141                	addi	sp,sp,-16
ffffffffc0200caa:	e406                	sd	ra,8(sp)
ffffffffc0200cac:	8f8d                	sub	a5,a5,a1
ffffffffc0200cae:	872a                	mv	a4,a0
ffffffffc0200cb0:	8532                	mv	a0,a2
ffffffffc0200cb2:	00f6f363          	bgeu	a3,a5,ffffffffc0200cb8 <ramdisk_read+0x14>
ffffffffc0200cb6:	87b6                	mv	a5,a3
ffffffffc0200cb8:	6b18                	ld	a4,16(a4)
ffffffffc0200cba:	05a6                	slli	a1,a1,0x9
ffffffffc0200cbc:	00979613          	slli	a2,a5,0x9
ffffffffc0200cc0:	95ba                	add	a1,a1,a4
ffffffffc0200cc2:	7700a0ef          	jal	ra,ffffffffc020b432 <memcpy>
ffffffffc0200cc6:	60a2                	ld	ra,8(sp)
ffffffffc0200cc8:	4501                	li	a0,0
ffffffffc0200cca:	0141                	addi	sp,sp,16
ffffffffc0200ccc:	8082                	ret

ffffffffc0200cce <ramdisk_init>:
ffffffffc0200cce:	1101                	addi	sp,sp,-32
ffffffffc0200cd0:	e822                	sd	s0,16(sp)
ffffffffc0200cd2:	842e                	mv	s0,a1
ffffffffc0200cd4:	e426                	sd	s1,8(sp)
ffffffffc0200cd6:	05000613          	li	a2,80
ffffffffc0200cda:	84aa                	mv	s1,a0
ffffffffc0200cdc:	4581                	li	a1,0
ffffffffc0200cde:	8522                	mv	a0,s0
ffffffffc0200ce0:	ec06                	sd	ra,24(sp)
ffffffffc0200ce2:	e04a                	sd	s2,0(sp)
ffffffffc0200ce4:	6fc0a0ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc0200ce8:	4785                	li	a5,1
ffffffffc0200cea:	06f48b63          	beq	s1,a5,ffffffffc0200d60 <ramdisk_init+0x92>
ffffffffc0200cee:	4789                	li	a5,2
ffffffffc0200cf0:	00090617          	auipc	a2,0x90
ffffffffc0200cf4:	32060613          	addi	a2,a2,800 # ffffffffc0291010 <arena>
ffffffffc0200cf8:	0001b917          	auipc	s2,0x1b
ffffffffc0200cfc:	01890913          	addi	s2,s2,24 # ffffffffc021bd10 <_binary_bin_sfs_img_start>
ffffffffc0200d00:	08f49563          	bne	s1,a5,ffffffffc0200d8a <ramdisk_init+0xbc>
ffffffffc0200d04:	06c90863          	beq	s2,a2,ffffffffc0200d74 <ramdisk_init+0xa6>
ffffffffc0200d08:	412604b3          	sub	s1,a2,s2
ffffffffc0200d0c:	86a6                	mv	a3,s1
ffffffffc0200d0e:	85ca                	mv	a1,s2
ffffffffc0200d10:	167d                	addi	a2,a2,-1
ffffffffc0200d12:	0000b517          	auipc	a0,0xb
ffffffffc0200d16:	c7e50513          	addi	a0,a0,-898 # ffffffffc020b990 <commands+0x2d8>
ffffffffc0200d1a:	c8cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200d1e:	57fd                	li	a5,-1
ffffffffc0200d20:	1782                	slli	a5,a5,0x20
ffffffffc0200d22:	0785                	addi	a5,a5,1
ffffffffc0200d24:	0094d49b          	srliw	s1,s1,0x9
ffffffffc0200d28:	e01c                	sd	a5,0(s0)
ffffffffc0200d2a:	c404                	sw	s1,8(s0)
ffffffffc0200d2c:	01243823          	sd	s2,16(s0)
ffffffffc0200d30:	02040513          	addi	a0,s0,32
ffffffffc0200d34:	0000b597          	auipc	a1,0xb
ffffffffc0200d38:	cb458593          	addi	a1,a1,-844 # ffffffffc020b9e8 <commands+0x330>
ffffffffc0200d3c:	6380a0ef          	jal	ra,ffffffffc020b374 <strcpy>
ffffffffc0200d40:	00000797          	auipc	a5,0x0
ffffffffc0200d44:	f6478793          	addi	a5,a5,-156 # ffffffffc0200ca4 <ramdisk_read>
ffffffffc0200d48:	e03c                	sd	a5,64(s0)
ffffffffc0200d4a:	00000797          	auipc	a5,0x0
ffffffffc0200d4e:	f3078793          	addi	a5,a5,-208 # ffffffffc0200c7a <ramdisk_write>
ffffffffc0200d52:	60e2                	ld	ra,24(sp)
ffffffffc0200d54:	e43c                	sd	a5,72(s0)
ffffffffc0200d56:	6442                	ld	s0,16(sp)
ffffffffc0200d58:	64a2                	ld	s1,8(sp)
ffffffffc0200d5a:	6902                	ld	s2,0(sp)
ffffffffc0200d5c:	6105                	addi	sp,sp,32
ffffffffc0200d5e:	8082                	ret
ffffffffc0200d60:	0001b617          	auipc	a2,0x1b
ffffffffc0200d64:	fb060613          	addi	a2,a2,-80 # ffffffffc021bd10 <_binary_bin_sfs_img_start>
ffffffffc0200d68:	00013917          	auipc	s2,0x13
ffffffffc0200d6c:	2a890913          	addi	s2,s2,680 # ffffffffc0214010 <_binary_bin_swap_img_start>
ffffffffc0200d70:	f8c91ce3          	bne	s2,a2,ffffffffc0200d08 <ramdisk_init+0x3a>
ffffffffc0200d74:	6442                	ld	s0,16(sp)
ffffffffc0200d76:	60e2                	ld	ra,24(sp)
ffffffffc0200d78:	64a2                	ld	s1,8(sp)
ffffffffc0200d7a:	6902                	ld	s2,0(sp)
ffffffffc0200d7c:	0000b517          	auipc	a0,0xb
ffffffffc0200d80:	bfc50513          	addi	a0,a0,-1028 # ffffffffc020b978 <commands+0x2c0>
ffffffffc0200d84:	6105                	addi	sp,sp,32
ffffffffc0200d86:	c20ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200d8a:	0000b617          	auipc	a2,0xb
ffffffffc0200d8e:	c2e60613          	addi	a2,a2,-978 # ffffffffc020b9b8 <commands+0x300>
ffffffffc0200d92:	03200593          	li	a1,50
ffffffffc0200d96:	0000b517          	auipc	a0,0xb
ffffffffc0200d9a:	c3a50513          	addi	a0,a0,-966 # ffffffffc020b9d0 <commands+0x318>
ffffffffc0200d9e:	f00ff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200da2 <idt_init>:
ffffffffc0200da2:	14005073          	csrwi	sscratch,0
ffffffffc0200da6:	00000797          	auipc	a5,0x0
ffffffffc0200daa:	43a78793          	addi	a5,a5,1082 # ffffffffc02011e0 <__alltraps>
ffffffffc0200dae:	10579073          	csrw	stvec,a5
ffffffffc0200db2:	000407b7          	lui	a5,0x40
ffffffffc0200db6:	1007a7f3          	csrrs	a5,sstatus,a5
ffffffffc0200dba:	8082                	ret

ffffffffc0200dbc <print_regs>:
ffffffffc0200dbc:	610c                	ld	a1,0(a0)
ffffffffc0200dbe:	1141                	addi	sp,sp,-16
ffffffffc0200dc0:	e022                	sd	s0,0(sp)
ffffffffc0200dc2:	842a                	mv	s0,a0
ffffffffc0200dc4:	0000b517          	auipc	a0,0xb
ffffffffc0200dc8:	c3450513          	addi	a0,a0,-972 # ffffffffc020b9f8 <commands+0x340>
ffffffffc0200dcc:	e406                	sd	ra,8(sp)
ffffffffc0200dce:	bd8ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dd2:	640c                	ld	a1,8(s0)
ffffffffc0200dd4:	0000b517          	auipc	a0,0xb
ffffffffc0200dd8:	c3c50513          	addi	a0,a0,-964 # ffffffffc020ba10 <commands+0x358>
ffffffffc0200ddc:	bcaff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200de0:	680c                	ld	a1,16(s0)
ffffffffc0200de2:	0000b517          	auipc	a0,0xb
ffffffffc0200de6:	c4650513          	addi	a0,a0,-954 # ffffffffc020ba28 <commands+0x370>
ffffffffc0200dea:	bbcff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dee:	6c0c                	ld	a1,24(s0)
ffffffffc0200df0:	0000b517          	auipc	a0,0xb
ffffffffc0200df4:	c5050513          	addi	a0,a0,-944 # ffffffffc020ba40 <commands+0x388>
ffffffffc0200df8:	baeff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dfc:	700c                	ld	a1,32(s0)
ffffffffc0200dfe:	0000b517          	auipc	a0,0xb
ffffffffc0200e02:	c5a50513          	addi	a0,a0,-934 # ffffffffc020ba58 <commands+0x3a0>
ffffffffc0200e06:	ba0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e0a:	740c                	ld	a1,40(s0)
ffffffffc0200e0c:	0000b517          	auipc	a0,0xb
ffffffffc0200e10:	c6450513          	addi	a0,a0,-924 # ffffffffc020ba70 <commands+0x3b8>
ffffffffc0200e14:	b92ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e18:	780c                	ld	a1,48(s0)
ffffffffc0200e1a:	0000b517          	auipc	a0,0xb
ffffffffc0200e1e:	c6e50513          	addi	a0,a0,-914 # ffffffffc020ba88 <commands+0x3d0>
ffffffffc0200e22:	b84ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e26:	7c0c                	ld	a1,56(s0)
ffffffffc0200e28:	0000b517          	auipc	a0,0xb
ffffffffc0200e2c:	c7850513          	addi	a0,a0,-904 # ffffffffc020baa0 <commands+0x3e8>
ffffffffc0200e30:	b76ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e34:	602c                	ld	a1,64(s0)
ffffffffc0200e36:	0000b517          	auipc	a0,0xb
ffffffffc0200e3a:	c8250513          	addi	a0,a0,-894 # ffffffffc020bab8 <commands+0x400>
ffffffffc0200e3e:	b68ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e42:	642c                	ld	a1,72(s0)
ffffffffc0200e44:	0000b517          	auipc	a0,0xb
ffffffffc0200e48:	c8c50513          	addi	a0,a0,-884 # ffffffffc020bad0 <commands+0x418>
ffffffffc0200e4c:	b5aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e50:	682c                	ld	a1,80(s0)
ffffffffc0200e52:	0000b517          	auipc	a0,0xb
ffffffffc0200e56:	c9650513          	addi	a0,a0,-874 # ffffffffc020bae8 <commands+0x430>
ffffffffc0200e5a:	b4cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e5e:	6c2c                	ld	a1,88(s0)
ffffffffc0200e60:	0000b517          	auipc	a0,0xb
ffffffffc0200e64:	ca050513          	addi	a0,a0,-864 # ffffffffc020bb00 <commands+0x448>
ffffffffc0200e68:	b3eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e6c:	702c                	ld	a1,96(s0)
ffffffffc0200e6e:	0000b517          	auipc	a0,0xb
ffffffffc0200e72:	caa50513          	addi	a0,a0,-854 # ffffffffc020bb18 <commands+0x460>
ffffffffc0200e76:	b30ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e7a:	742c                	ld	a1,104(s0)
ffffffffc0200e7c:	0000b517          	auipc	a0,0xb
ffffffffc0200e80:	cb450513          	addi	a0,a0,-844 # ffffffffc020bb30 <commands+0x478>
ffffffffc0200e84:	b22ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e88:	782c                	ld	a1,112(s0)
ffffffffc0200e8a:	0000b517          	auipc	a0,0xb
ffffffffc0200e8e:	cbe50513          	addi	a0,a0,-834 # ffffffffc020bb48 <commands+0x490>
ffffffffc0200e92:	b14ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e96:	7c2c                	ld	a1,120(s0)
ffffffffc0200e98:	0000b517          	auipc	a0,0xb
ffffffffc0200e9c:	cc850513          	addi	a0,a0,-824 # ffffffffc020bb60 <commands+0x4a8>
ffffffffc0200ea0:	b06ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ea4:	604c                	ld	a1,128(s0)
ffffffffc0200ea6:	0000b517          	auipc	a0,0xb
ffffffffc0200eaa:	cd250513          	addi	a0,a0,-814 # ffffffffc020bb78 <commands+0x4c0>
ffffffffc0200eae:	af8ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200eb2:	644c                	ld	a1,136(s0)
ffffffffc0200eb4:	0000b517          	auipc	a0,0xb
ffffffffc0200eb8:	cdc50513          	addi	a0,a0,-804 # ffffffffc020bb90 <commands+0x4d8>
ffffffffc0200ebc:	aeaff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ec0:	684c                	ld	a1,144(s0)
ffffffffc0200ec2:	0000b517          	auipc	a0,0xb
ffffffffc0200ec6:	ce650513          	addi	a0,a0,-794 # ffffffffc020bba8 <commands+0x4f0>
ffffffffc0200eca:	adcff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ece:	6c4c                	ld	a1,152(s0)
ffffffffc0200ed0:	0000b517          	auipc	a0,0xb
ffffffffc0200ed4:	cf050513          	addi	a0,a0,-784 # ffffffffc020bbc0 <commands+0x508>
ffffffffc0200ed8:	aceff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200edc:	704c                	ld	a1,160(s0)
ffffffffc0200ede:	0000b517          	auipc	a0,0xb
ffffffffc0200ee2:	cfa50513          	addi	a0,a0,-774 # ffffffffc020bbd8 <commands+0x520>
ffffffffc0200ee6:	ac0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200eea:	744c                	ld	a1,168(s0)
ffffffffc0200eec:	0000b517          	auipc	a0,0xb
ffffffffc0200ef0:	d0450513          	addi	a0,a0,-764 # ffffffffc020bbf0 <commands+0x538>
ffffffffc0200ef4:	ab2ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ef8:	784c                	ld	a1,176(s0)
ffffffffc0200efa:	0000b517          	auipc	a0,0xb
ffffffffc0200efe:	d0e50513          	addi	a0,a0,-754 # ffffffffc020bc08 <commands+0x550>
ffffffffc0200f02:	aa4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f06:	7c4c                	ld	a1,184(s0)
ffffffffc0200f08:	0000b517          	auipc	a0,0xb
ffffffffc0200f0c:	d1850513          	addi	a0,a0,-744 # ffffffffc020bc20 <commands+0x568>
ffffffffc0200f10:	a96ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f14:	606c                	ld	a1,192(s0)
ffffffffc0200f16:	0000b517          	auipc	a0,0xb
ffffffffc0200f1a:	d2250513          	addi	a0,a0,-734 # ffffffffc020bc38 <commands+0x580>
ffffffffc0200f1e:	a88ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f22:	646c                	ld	a1,200(s0)
ffffffffc0200f24:	0000b517          	auipc	a0,0xb
ffffffffc0200f28:	d2c50513          	addi	a0,a0,-724 # ffffffffc020bc50 <commands+0x598>
ffffffffc0200f2c:	a7aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f30:	686c                	ld	a1,208(s0)
ffffffffc0200f32:	0000b517          	auipc	a0,0xb
ffffffffc0200f36:	d3650513          	addi	a0,a0,-714 # ffffffffc020bc68 <commands+0x5b0>
ffffffffc0200f3a:	a6cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f3e:	6c6c                	ld	a1,216(s0)
ffffffffc0200f40:	0000b517          	auipc	a0,0xb
ffffffffc0200f44:	d4050513          	addi	a0,a0,-704 # ffffffffc020bc80 <commands+0x5c8>
ffffffffc0200f48:	a5eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f4c:	706c                	ld	a1,224(s0)
ffffffffc0200f4e:	0000b517          	auipc	a0,0xb
ffffffffc0200f52:	d4a50513          	addi	a0,a0,-694 # ffffffffc020bc98 <commands+0x5e0>
ffffffffc0200f56:	a50ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f5a:	746c                	ld	a1,232(s0)
ffffffffc0200f5c:	0000b517          	auipc	a0,0xb
ffffffffc0200f60:	d5450513          	addi	a0,a0,-684 # ffffffffc020bcb0 <commands+0x5f8>
ffffffffc0200f64:	a42ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f68:	786c                	ld	a1,240(s0)
ffffffffc0200f6a:	0000b517          	auipc	a0,0xb
ffffffffc0200f6e:	d5e50513          	addi	a0,a0,-674 # ffffffffc020bcc8 <commands+0x610>
ffffffffc0200f72:	a34ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f76:	7c6c                	ld	a1,248(s0)
ffffffffc0200f78:	6402                	ld	s0,0(sp)
ffffffffc0200f7a:	60a2                	ld	ra,8(sp)
ffffffffc0200f7c:	0000b517          	auipc	a0,0xb
ffffffffc0200f80:	d6450513          	addi	a0,a0,-668 # ffffffffc020bce0 <commands+0x628>
ffffffffc0200f84:	0141                	addi	sp,sp,16
ffffffffc0200f86:	a20ff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200f8a <print_trapframe>:
ffffffffc0200f8a:	1141                	addi	sp,sp,-16
ffffffffc0200f8c:	e022                	sd	s0,0(sp)
ffffffffc0200f8e:	85aa                	mv	a1,a0
ffffffffc0200f90:	842a                	mv	s0,a0
ffffffffc0200f92:	0000b517          	auipc	a0,0xb
ffffffffc0200f96:	d6650513          	addi	a0,a0,-666 # ffffffffc020bcf8 <commands+0x640>
ffffffffc0200f9a:	e406                	sd	ra,8(sp)
ffffffffc0200f9c:	a0aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fa0:	8522                	mv	a0,s0
ffffffffc0200fa2:	e1bff0ef          	jal	ra,ffffffffc0200dbc <print_regs>
ffffffffc0200fa6:	10043583          	ld	a1,256(s0)
ffffffffc0200faa:	0000b517          	auipc	a0,0xb
ffffffffc0200fae:	d6650513          	addi	a0,a0,-666 # ffffffffc020bd10 <commands+0x658>
ffffffffc0200fb2:	9f4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fb6:	10843583          	ld	a1,264(s0)
ffffffffc0200fba:	0000b517          	auipc	a0,0xb
ffffffffc0200fbe:	d6e50513          	addi	a0,a0,-658 # ffffffffc020bd28 <commands+0x670>
ffffffffc0200fc2:	9e4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fc6:	11043583          	ld	a1,272(s0)
ffffffffc0200fca:	0000b517          	auipc	a0,0xb
ffffffffc0200fce:	d7650513          	addi	a0,a0,-650 # ffffffffc020bd40 <commands+0x688>
ffffffffc0200fd2:	9d4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fd6:	11843583          	ld	a1,280(s0)
ffffffffc0200fda:	6402                	ld	s0,0(sp)
ffffffffc0200fdc:	60a2                	ld	ra,8(sp)
ffffffffc0200fde:	0000b517          	auipc	a0,0xb
ffffffffc0200fe2:	d7250513          	addi	a0,a0,-654 # ffffffffc020bd50 <commands+0x698>
ffffffffc0200fe6:	0141                	addi	sp,sp,16
ffffffffc0200fe8:	9beff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200fec <interrupt_handler>:
ffffffffc0200fec:	11853783          	ld	a5,280(a0)
ffffffffc0200ff0:	472d                	li	a4,11
ffffffffc0200ff2:	0786                	slli	a5,a5,0x1
ffffffffc0200ff4:	8385                	srli	a5,a5,0x1
ffffffffc0200ff6:	06f76c63          	bltu	a4,a5,ffffffffc020106e <interrupt_handler+0x82>
ffffffffc0200ffa:	0000b717          	auipc	a4,0xb
ffffffffc0200ffe:	e0e70713          	addi	a4,a4,-498 # ffffffffc020be08 <commands+0x750>
ffffffffc0201002:	078a                	slli	a5,a5,0x2
ffffffffc0201004:	97ba                	add	a5,a5,a4
ffffffffc0201006:	439c                	lw	a5,0(a5)
ffffffffc0201008:	97ba                	add	a5,a5,a4
ffffffffc020100a:	8782                	jr	a5
ffffffffc020100c:	0000b517          	auipc	a0,0xb
ffffffffc0201010:	dbc50513          	addi	a0,a0,-580 # ffffffffc020bdc8 <commands+0x710>
ffffffffc0201014:	992ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201018:	0000b517          	auipc	a0,0xb
ffffffffc020101c:	d9050513          	addi	a0,a0,-624 # ffffffffc020bda8 <commands+0x6f0>
ffffffffc0201020:	986ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201024:	0000b517          	auipc	a0,0xb
ffffffffc0201028:	d4450513          	addi	a0,a0,-700 # ffffffffc020bd68 <commands+0x6b0>
ffffffffc020102c:	97aff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201030:	0000b517          	auipc	a0,0xb
ffffffffc0201034:	d5850513          	addi	a0,a0,-680 # ffffffffc020bd88 <commands+0x6d0>
ffffffffc0201038:	96eff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020103c:	1141                	addi	sp,sp,-16
ffffffffc020103e:	e406                	sd	ra,8(sp)
ffffffffc0201040:	d3aff0ef          	jal	ra,ffffffffc020057a <clock_set_next_event>
ffffffffc0201044:	00096717          	auipc	a4,0x96
ffffffffc0201048:	82c70713          	addi	a4,a4,-2004 # ffffffffc0296870 <ticks>
ffffffffc020104c:	631c                	ld	a5,0(a4)
ffffffffc020104e:	0785                	addi	a5,a5,1
ffffffffc0201050:	e31c                	sd	a5,0(a4)
ffffffffc0201052:	430060ef          	jal	ra,ffffffffc0207482 <run_timer_list>
ffffffffc0201056:	d9eff0ef          	jal	ra,ffffffffc02005f4 <cons_getc>
ffffffffc020105a:	60a2                	ld	ra,8(sp)
ffffffffc020105c:	0141                	addi	sp,sp,16
ffffffffc020105e:	2f50706f          	j	ffffffffc0208b52 <dev_stdin_write>
ffffffffc0201062:	0000b517          	auipc	a0,0xb
ffffffffc0201066:	d8650513          	addi	a0,a0,-634 # ffffffffc020bde8 <commands+0x730>
ffffffffc020106a:	93cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020106e:	bf31                	j	ffffffffc0200f8a <print_trapframe>

ffffffffc0201070 <exception_handler>:
ffffffffc0201070:	11853783          	ld	a5,280(a0)
ffffffffc0201074:	1141                	addi	sp,sp,-16
ffffffffc0201076:	e022                	sd	s0,0(sp)
ffffffffc0201078:	e406                	sd	ra,8(sp)
ffffffffc020107a:	473d                	li	a4,15
ffffffffc020107c:	842a                	mv	s0,a0
ffffffffc020107e:	0af76b63          	bltu	a4,a5,ffffffffc0201134 <exception_handler+0xc4>
ffffffffc0201082:	0000b717          	auipc	a4,0xb
ffffffffc0201086:	f4670713          	addi	a4,a4,-186 # ffffffffc020bfc8 <commands+0x910>
ffffffffc020108a:	078a                	slli	a5,a5,0x2
ffffffffc020108c:	97ba                	add	a5,a5,a4
ffffffffc020108e:	439c                	lw	a5,0(a5)
ffffffffc0201090:	97ba                	add	a5,a5,a4
ffffffffc0201092:	8782                	jr	a5
ffffffffc0201094:	0000b517          	auipc	a0,0xb
ffffffffc0201098:	e8c50513          	addi	a0,a0,-372 # ffffffffc020bf20 <commands+0x868>
ffffffffc020109c:	90aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02010a0:	10843783          	ld	a5,264(s0)
ffffffffc02010a4:	60a2                	ld	ra,8(sp)
ffffffffc02010a6:	0791                	addi	a5,a5,4
ffffffffc02010a8:	10f43423          	sd	a5,264(s0)
ffffffffc02010ac:	6402                	ld	s0,0(sp)
ffffffffc02010ae:	0141                	addi	sp,sp,16
ffffffffc02010b0:	5e80606f          	j	ffffffffc0207698 <syscall>
ffffffffc02010b4:	0000b517          	auipc	a0,0xb
ffffffffc02010b8:	e8c50513          	addi	a0,a0,-372 # ffffffffc020bf40 <commands+0x888>
ffffffffc02010bc:	6402                	ld	s0,0(sp)
ffffffffc02010be:	60a2                	ld	ra,8(sp)
ffffffffc02010c0:	0141                	addi	sp,sp,16
ffffffffc02010c2:	8e4ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02010c6:	0000b517          	auipc	a0,0xb
ffffffffc02010ca:	e9a50513          	addi	a0,a0,-358 # ffffffffc020bf60 <commands+0x8a8>
ffffffffc02010ce:	b7fd                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010d0:	0000b517          	auipc	a0,0xb
ffffffffc02010d4:	eb050513          	addi	a0,a0,-336 # ffffffffc020bf80 <commands+0x8c8>
ffffffffc02010d8:	b7d5                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010da:	0000b517          	auipc	a0,0xb
ffffffffc02010de:	ebe50513          	addi	a0,a0,-322 # ffffffffc020bf98 <commands+0x8e0>
ffffffffc02010e2:	bfe9                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010e4:	0000b517          	auipc	a0,0xb
ffffffffc02010e8:	ecc50513          	addi	a0,a0,-308 # ffffffffc020bfb0 <commands+0x8f8>
ffffffffc02010ec:	bfc1                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010ee:	0000b517          	auipc	a0,0xb
ffffffffc02010f2:	d4a50513          	addi	a0,a0,-694 # ffffffffc020be38 <commands+0x780>
ffffffffc02010f6:	b7d9                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010f8:	0000b517          	auipc	a0,0xb
ffffffffc02010fc:	d6050513          	addi	a0,a0,-672 # ffffffffc020be58 <commands+0x7a0>
ffffffffc0201100:	bf75                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201102:	0000b517          	auipc	a0,0xb
ffffffffc0201106:	d7650513          	addi	a0,a0,-650 # ffffffffc020be78 <commands+0x7c0>
ffffffffc020110a:	bf4d                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc020110c:	0000b517          	auipc	a0,0xb
ffffffffc0201110:	d8450513          	addi	a0,a0,-636 # ffffffffc020be90 <commands+0x7d8>
ffffffffc0201114:	b765                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201116:	0000b517          	auipc	a0,0xb
ffffffffc020111a:	d8a50513          	addi	a0,a0,-630 # ffffffffc020bea0 <commands+0x7e8>
ffffffffc020111e:	bf79                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201120:	0000b517          	auipc	a0,0xb
ffffffffc0201124:	da050513          	addi	a0,a0,-608 # ffffffffc020bec0 <commands+0x808>
ffffffffc0201128:	bf51                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc020112a:	0000b517          	auipc	a0,0xb
ffffffffc020112e:	dde50513          	addi	a0,a0,-546 # ffffffffc020bf08 <commands+0x850>
ffffffffc0201132:	b769                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201134:	8522                	mv	a0,s0
ffffffffc0201136:	6402                	ld	s0,0(sp)
ffffffffc0201138:	60a2                	ld	ra,8(sp)
ffffffffc020113a:	0141                	addi	sp,sp,16
ffffffffc020113c:	b5b9                	j	ffffffffc0200f8a <print_trapframe>
ffffffffc020113e:	0000b617          	auipc	a2,0xb
ffffffffc0201142:	d9a60613          	addi	a2,a2,-614 # ffffffffc020bed8 <commands+0x820>
ffffffffc0201146:	0b100593          	li	a1,177
ffffffffc020114a:	0000b517          	auipc	a0,0xb
ffffffffc020114e:	da650513          	addi	a0,a0,-602 # ffffffffc020bef0 <commands+0x838>
ffffffffc0201152:	b4cff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201156 <trap>:
ffffffffc0201156:	1101                	addi	sp,sp,-32
ffffffffc0201158:	e822                	sd	s0,16(sp)
ffffffffc020115a:	00095417          	auipc	s0,0x95
ffffffffc020115e:	76640413          	addi	s0,s0,1894 # ffffffffc02968c0 <current>
ffffffffc0201162:	6018                	ld	a4,0(s0)
ffffffffc0201164:	ec06                	sd	ra,24(sp)
ffffffffc0201166:	e426                	sd	s1,8(sp)
ffffffffc0201168:	e04a                	sd	s2,0(sp)
ffffffffc020116a:	11853683          	ld	a3,280(a0)
ffffffffc020116e:	cf1d                	beqz	a4,ffffffffc02011ac <trap+0x56>
ffffffffc0201170:	10053483          	ld	s1,256(a0)
ffffffffc0201174:	0a073903          	ld	s2,160(a4)
ffffffffc0201178:	f348                	sd	a0,160(a4)
ffffffffc020117a:	1004f493          	andi	s1,s1,256
ffffffffc020117e:	0206c463          	bltz	a3,ffffffffc02011a6 <trap+0x50>
ffffffffc0201182:	eefff0ef          	jal	ra,ffffffffc0201070 <exception_handler>
ffffffffc0201186:	601c                	ld	a5,0(s0)
ffffffffc0201188:	0b27b023          	sd	s2,160(a5) # 400a0 <_binary_bin_swap_img_size+0x383a0>
ffffffffc020118c:	e499                	bnez	s1,ffffffffc020119a <trap+0x44>
ffffffffc020118e:	0b07a703          	lw	a4,176(a5)
ffffffffc0201192:	8b05                	andi	a4,a4,1
ffffffffc0201194:	e329                	bnez	a4,ffffffffc02011d6 <trap+0x80>
ffffffffc0201196:	6f9c                	ld	a5,24(a5)
ffffffffc0201198:	eb85                	bnez	a5,ffffffffc02011c8 <trap+0x72>
ffffffffc020119a:	60e2                	ld	ra,24(sp)
ffffffffc020119c:	6442                	ld	s0,16(sp)
ffffffffc020119e:	64a2                	ld	s1,8(sp)
ffffffffc02011a0:	6902                	ld	s2,0(sp)
ffffffffc02011a2:	6105                	addi	sp,sp,32
ffffffffc02011a4:	8082                	ret
ffffffffc02011a6:	e47ff0ef          	jal	ra,ffffffffc0200fec <interrupt_handler>
ffffffffc02011aa:	bff1                	j	ffffffffc0201186 <trap+0x30>
ffffffffc02011ac:	0006c863          	bltz	a3,ffffffffc02011bc <trap+0x66>
ffffffffc02011b0:	6442                	ld	s0,16(sp)
ffffffffc02011b2:	60e2                	ld	ra,24(sp)
ffffffffc02011b4:	64a2                	ld	s1,8(sp)
ffffffffc02011b6:	6902                	ld	s2,0(sp)
ffffffffc02011b8:	6105                	addi	sp,sp,32
ffffffffc02011ba:	bd5d                	j	ffffffffc0201070 <exception_handler>
ffffffffc02011bc:	6442                	ld	s0,16(sp)
ffffffffc02011be:	60e2                	ld	ra,24(sp)
ffffffffc02011c0:	64a2                	ld	s1,8(sp)
ffffffffc02011c2:	6902                	ld	s2,0(sp)
ffffffffc02011c4:	6105                	addi	sp,sp,32
ffffffffc02011c6:	b51d                	j	ffffffffc0200fec <interrupt_handler>
ffffffffc02011c8:	6442                	ld	s0,16(sp)
ffffffffc02011ca:	60e2                	ld	ra,24(sp)
ffffffffc02011cc:	64a2                	ld	s1,8(sp)
ffffffffc02011ce:	6902                	ld	s2,0(sp)
ffffffffc02011d0:	6105                	addi	sp,sp,32
ffffffffc02011d2:	0a40606f          	j	ffffffffc0207276 <schedule>
ffffffffc02011d6:	555d                	li	a0,-9
ffffffffc02011d8:	573040ef          	jal	ra,ffffffffc0205f4a <do_exit>
ffffffffc02011dc:	601c                	ld	a5,0(s0)
ffffffffc02011de:	bf65                	j	ffffffffc0201196 <trap+0x40>

ffffffffc02011e0 <__alltraps>:
ffffffffc02011e0:	14011173          	csrrw	sp,sscratch,sp
ffffffffc02011e4:	00011463          	bnez	sp,ffffffffc02011ec <__alltraps+0xc>
ffffffffc02011e8:	14002173          	csrr	sp,sscratch
ffffffffc02011ec:	712d                	addi	sp,sp,-288
ffffffffc02011ee:	e002                	sd	zero,0(sp)
ffffffffc02011f0:	e406                	sd	ra,8(sp)
ffffffffc02011f2:	ec0e                	sd	gp,24(sp)
ffffffffc02011f4:	f012                	sd	tp,32(sp)
ffffffffc02011f6:	f416                	sd	t0,40(sp)
ffffffffc02011f8:	f81a                	sd	t1,48(sp)
ffffffffc02011fa:	fc1e                	sd	t2,56(sp)
ffffffffc02011fc:	e0a2                	sd	s0,64(sp)
ffffffffc02011fe:	e4a6                	sd	s1,72(sp)
ffffffffc0201200:	e8aa                	sd	a0,80(sp)
ffffffffc0201202:	ecae                	sd	a1,88(sp)
ffffffffc0201204:	f0b2                	sd	a2,96(sp)
ffffffffc0201206:	f4b6                	sd	a3,104(sp)
ffffffffc0201208:	f8ba                	sd	a4,112(sp)
ffffffffc020120a:	fcbe                	sd	a5,120(sp)
ffffffffc020120c:	e142                	sd	a6,128(sp)
ffffffffc020120e:	e546                	sd	a7,136(sp)
ffffffffc0201210:	e94a                	sd	s2,144(sp)
ffffffffc0201212:	ed4e                	sd	s3,152(sp)
ffffffffc0201214:	f152                	sd	s4,160(sp)
ffffffffc0201216:	f556                	sd	s5,168(sp)
ffffffffc0201218:	f95a                	sd	s6,176(sp)
ffffffffc020121a:	fd5e                	sd	s7,184(sp)
ffffffffc020121c:	e1e2                	sd	s8,192(sp)
ffffffffc020121e:	e5e6                	sd	s9,200(sp)
ffffffffc0201220:	e9ea                	sd	s10,208(sp)
ffffffffc0201222:	edee                	sd	s11,216(sp)
ffffffffc0201224:	f1f2                	sd	t3,224(sp)
ffffffffc0201226:	f5f6                	sd	t4,232(sp)
ffffffffc0201228:	f9fa                	sd	t5,240(sp)
ffffffffc020122a:	fdfe                	sd	t6,248(sp)
ffffffffc020122c:	14001473          	csrrw	s0,sscratch,zero
ffffffffc0201230:	100024f3          	csrr	s1,sstatus
ffffffffc0201234:	14102973          	csrr	s2,sepc
ffffffffc0201238:	143029f3          	csrr	s3,stval
ffffffffc020123c:	14202a73          	csrr	s4,scause
ffffffffc0201240:	e822                	sd	s0,16(sp)
ffffffffc0201242:	e226                	sd	s1,256(sp)
ffffffffc0201244:	e64a                	sd	s2,264(sp)
ffffffffc0201246:	ea4e                	sd	s3,272(sp)
ffffffffc0201248:	ee52                	sd	s4,280(sp)
ffffffffc020124a:	850a                	mv	a0,sp
ffffffffc020124c:	f0bff0ef          	jal	ra,ffffffffc0201156 <trap>

ffffffffc0201250 <__trapret>:
ffffffffc0201250:	6492                	ld	s1,256(sp)
ffffffffc0201252:	6932                	ld	s2,264(sp)
ffffffffc0201254:	1004f413          	andi	s0,s1,256
ffffffffc0201258:	e401                	bnez	s0,ffffffffc0201260 <__trapret+0x10>
ffffffffc020125a:	1200                	addi	s0,sp,288
ffffffffc020125c:	14041073          	csrw	sscratch,s0
ffffffffc0201260:	10049073          	csrw	sstatus,s1
ffffffffc0201264:	14191073          	csrw	sepc,s2
ffffffffc0201268:	60a2                	ld	ra,8(sp)
ffffffffc020126a:	61e2                	ld	gp,24(sp)
ffffffffc020126c:	7202                	ld	tp,32(sp)
ffffffffc020126e:	72a2                	ld	t0,40(sp)
ffffffffc0201270:	7342                	ld	t1,48(sp)
ffffffffc0201272:	73e2                	ld	t2,56(sp)
ffffffffc0201274:	6406                	ld	s0,64(sp)
ffffffffc0201276:	64a6                	ld	s1,72(sp)
ffffffffc0201278:	6546                	ld	a0,80(sp)
ffffffffc020127a:	65e6                	ld	a1,88(sp)
ffffffffc020127c:	7606                	ld	a2,96(sp)
ffffffffc020127e:	76a6                	ld	a3,104(sp)
ffffffffc0201280:	7746                	ld	a4,112(sp)
ffffffffc0201282:	77e6                	ld	a5,120(sp)
ffffffffc0201284:	680a                	ld	a6,128(sp)
ffffffffc0201286:	68aa                	ld	a7,136(sp)
ffffffffc0201288:	694a                	ld	s2,144(sp)
ffffffffc020128a:	69ea                	ld	s3,152(sp)
ffffffffc020128c:	7a0a                	ld	s4,160(sp)
ffffffffc020128e:	7aaa                	ld	s5,168(sp)
ffffffffc0201290:	7b4a                	ld	s6,176(sp)
ffffffffc0201292:	7bea                	ld	s7,184(sp)
ffffffffc0201294:	6c0e                	ld	s8,192(sp)
ffffffffc0201296:	6cae                	ld	s9,200(sp)
ffffffffc0201298:	6d4e                	ld	s10,208(sp)
ffffffffc020129a:	6dee                	ld	s11,216(sp)
ffffffffc020129c:	7e0e                	ld	t3,224(sp)
ffffffffc020129e:	7eae                	ld	t4,232(sp)
ffffffffc02012a0:	7f4e                	ld	t5,240(sp)
ffffffffc02012a2:	7fee                	ld	t6,248(sp)
ffffffffc02012a4:	6142                	ld	sp,16(sp)
ffffffffc02012a6:	10200073          	sret

ffffffffc02012aa <forkrets>:
ffffffffc02012aa:	812a                	mv	sp,a0
ffffffffc02012ac:	b755                	j	ffffffffc0201250 <__trapret>

ffffffffc02012ae <default_init>:
ffffffffc02012ae:	00090797          	auipc	a5,0x90
ffffffffc02012b2:	4fa78793          	addi	a5,a5,1274 # ffffffffc02917a8 <free_area>
ffffffffc02012b6:	e79c                	sd	a5,8(a5)
ffffffffc02012b8:	e39c                	sd	a5,0(a5)
ffffffffc02012ba:	0007a823          	sw	zero,16(a5)
ffffffffc02012be:	8082                	ret

ffffffffc02012c0 <default_nr_free_pages>:
ffffffffc02012c0:	00090517          	auipc	a0,0x90
ffffffffc02012c4:	4f856503          	lwu	a0,1272(a0) # ffffffffc02917b8 <free_area+0x10>
ffffffffc02012c8:	8082                	ret

ffffffffc02012ca <default_check>:
ffffffffc02012ca:	715d                	addi	sp,sp,-80
ffffffffc02012cc:	e0a2                	sd	s0,64(sp)
ffffffffc02012ce:	00090417          	auipc	s0,0x90
ffffffffc02012d2:	4da40413          	addi	s0,s0,1242 # ffffffffc02917a8 <free_area>
ffffffffc02012d6:	641c                	ld	a5,8(s0)
ffffffffc02012d8:	e486                	sd	ra,72(sp)
ffffffffc02012da:	fc26                	sd	s1,56(sp)
ffffffffc02012dc:	f84a                	sd	s2,48(sp)
ffffffffc02012de:	f44e                	sd	s3,40(sp)
ffffffffc02012e0:	f052                	sd	s4,32(sp)
ffffffffc02012e2:	ec56                	sd	s5,24(sp)
ffffffffc02012e4:	e85a                	sd	s6,16(sp)
ffffffffc02012e6:	e45e                	sd	s7,8(sp)
ffffffffc02012e8:	e062                	sd	s8,0(sp)
ffffffffc02012ea:	2a878d63          	beq	a5,s0,ffffffffc02015a4 <default_check+0x2da>
ffffffffc02012ee:	4481                	li	s1,0
ffffffffc02012f0:	4901                	li	s2,0
ffffffffc02012f2:	ff07b703          	ld	a4,-16(a5)
ffffffffc02012f6:	8b09                	andi	a4,a4,2
ffffffffc02012f8:	2a070a63          	beqz	a4,ffffffffc02015ac <default_check+0x2e2>
ffffffffc02012fc:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201300:	679c                	ld	a5,8(a5)
ffffffffc0201302:	2905                	addiw	s2,s2,1
ffffffffc0201304:	9cb9                	addw	s1,s1,a4
ffffffffc0201306:	fe8796e3          	bne	a5,s0,ffffffffc02012f2 <default_check+0x28>
ffffffffc020130a:	89a6                	mv	s3,s1
ffffffffc020130c:	6df000ef          	jal	ra,ffffffffc02021ea <nr_free_pages>
ffffffffc0201310:	6f351e63          	bne	a0,s3,ffffffffc0201a0c <default_check+0x742>
ffffffffc0201314:	4505                	li	a0,1
ffffffffc0201316:	657000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020131a:	8aaa                	mv	s5,a0
ffffffffc020131c:	42050863          	beqz	a0,ffffffffc020174c <default_check+0x482>
ffffffffc0201320:	4505                	li	a0,1
ffffffffc0201322:	64b000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201326:	89aa                	mv	s3,a0
ffffffffc0201328:	70050263          	beqz	a0,ffffffffc0201a2c <default_check+0x762>
ffffffffc020132c:	4505                	li	a0,1
ffffffffc020132e:	63f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201332:	8a2a                	mv	s4,a0
ffffffffc0201334:	48050c63          	beqz	a0,ffffffffc02017cc <default_check+0x502>
ffffffffc0201338:	293a8a63          	beq	s5,s3,ffffffffc02015cc <default_check+0x302>
ffffffffc020133c:	28aa8863          	beq	s5,a0,ffffffffc02015cc <default_check+0x302>
ffffffffc0201340:	28a98663          	beq	s3,a0,ffffffffc02015cc <default_check+0x302>
ffffffffc0201344:	000aa783          	lw	a5,0(s5)
ffffffffc0201348:	2a079263          	bnez	a5,ffffffffc02015ec <default_check+0x322>
ffffffffc020134c:	0009a783          	lw	a5,0(s3)
ffffffffc0201350:	28079e63          	bnez	a5,ffffffffc02015ec <default_check+0x322>
ffffffffc0201354:	411c                	lw	a5,0(a0)
ffffffffc0201356:	28079b63          	bnez	a5,ffffffffc02015ec <default_check+0x322>
ffffffffc020135a:	00095797          	auipc	a5,0x95
ffffffffc020135e:	54e7b783          	ld	a5,1358(a5) # ffffffffc02968a8 <pages>
ffffffffc0201362:	40fa8733          	sub	a4,s5,a5
ffffffffc0201366:	0000e617          	auipc	a2,0xe
ffffffffc020136a:	3c263603          	ld	a2,962(a2) # ffffffffc020f728 <nbase>
ffffffffc020136e:	8719                	srai	a4,a4,0x6
ffffffffc0201370:	9732                	add	a4,a4,a2
ffffffffc0201372:	00095697          	auipc	a3,0x95
ffffffffc0201376:	52e6b683          	ld	a3,1326(a3) # ffffffffc02968a0 <npage>
ffffffffc020137a:	06b2                	slli	a3,a3,0xc
ffffffffc020137c:	0732                	slli	a4,a4,0xc
ffffffffc020137e:	28d77763          	bgeu	a4,a3,ffffffffc020160c <default_check+0x342>
ffffffffc0201382:	40f98733          	sub	a4,s3,a5
ffffffffc0201386:	8719                	srai	a4,a4,0x6
ffffffffc0201388:	9732                	add	a4,a4,a2
ffffffffc020138a:	0732                	slli	a4,a4,0xc
ffffffffc020138c:	4cd77063          	bgeu	a4,a3,ffffffffc020184c <default_check+0x582>
ffffffffc0201390:	40f507b3          	sub	a5,a0,a5
ffffffffc0201394:	8799                	srai	a5,a5,0x6
ffffffffc0201396:	97b2                	add	a5,a5,a2
ffffffffc0201398:	07b2                	slli	a5,a5,0xc
ffffffffc020139a:	30d7f963          	bgeu	a5,a3,ffffffffc02016ac <default_check+0x3e2>
ffffffffc020139e:	4505                	li	a0,1
ffffffffc02013a0:	00043c03          	ld	s8,0(s0)
ffffffffc02013a4:	00843b83          	ld	s7,8(s0)
ffffffffc02013a8:	01042b03          	lw	s6,16(s0)
ffffffffc02013ac:	e400                	sd	s0,8(s0)
ffffffffc02013ae:	e000                	sd	s0,0(s0)
ffffffffc02013b0:	00090797          	auipc	a5,0x90
ffffffffc02013b4:	4007a423          	sw	zero,1032(a5) # ffffffffc02917b8 <free_area+0x10>
ffffffffc02013b8:	5b5000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013bc:	2c051863          	bnez	a0,ffffffffc020168c <default_check+0x3c2>
ffffffffc02013c0:	4585                	li	a1,1
ffffffffc02013c2:	8556                	mv	a0,s5
ffffffffc02013c4:	5e7000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02013c8:	4585                	li	a1,1
ffffffffc02013ca:	854e                	mv	a0,s3
ffffffffc02013cc:	5df000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02013d0:	4585                	li	a1,1
ffffffffc02013d2:	8552                	mv	a0,s4
ffffffffc02013d4:	5d7000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02013d8:	4818                	lw	a4,16(s0)
ffffffffc02013da:	478d                	li	a5,3
ffffffffc02013dc:	28f71863          	bne	a4,a5,ffffffffc020166c <default_check+0x3a2>
ffffffffc02013e0:	4505                	li	a0,1
ffffffffc02013e2:	58b000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013e6:	89aa                	mv	s3,a0
ffffffffc02013e8:	26050263          	beqz	a0,ffffffffc020164c <default_check+0x382>
ffffffffc02013ec:	4505                	li	a0,1
ffffffffc02013ee:	57f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013f2:	8aaa                	mv	s5,a0
ffffffffc02013f4:	3a050c63          	beqz	a0,ffffffffc02017ac <default_check+0x4e2>
ffffffffc02013f8:	4505                	li	a0,1
ffffffffc02013fa:	573000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013fe:	8a2a                	mv	s4,a0
ffffffffc0201400:	38050663          	beqz	a0,ffffffffc020178c <default_check+0x4c2>
ffffffffc0201404:	4505                	li	a0,1
ffffffffc0201406:	567000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020140a:	36051163          	bnez	a0,ffffffffc020176c <default_check+0x4a2>
ffffffffc020140e:	4585                	li	a1,1
ffffffffc0201410:	854e                	mv	a0,s3
ffffffffc0201412:	599000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201416:	641c                	ld	a5,8(s0)
ffffffffc0201418:	20878a63          	beq	a5,s0,ffffffffc020162c <default_check+0x362>
ffffffffc020141c:	4505                	li	a0,1
ffffffffc020141e:	54f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201422:	30a99563          	bne	s3,a0,ffffffffc020172c <default_check+0x462>
ffffffffc0201426:	4505                	li	a0,1
ffffffffc0201428:	545000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020142c:	2e051063          	bnez	a0,ffffffffc020170c <default_check+0x442>
ffffffffc0201430:	481c                	lw	a5,16(s0)
ffffffffc0201432:	2a079d63          	bnez	a5,ffffffffc02016ec <default_check+0x422>
ffffffffc0201436:	854e                	mv	a0,s3
ffffffffc0201438:	4585                	li	a1,1
ffffffffc020143a:	01843023          	sd	s8,0(s0)
ffffffffc020143e:	01743423          	sd	s7,8(s0)
ffffffffc0201442:	01642823          	sw	s6,16(s0)
ffffffffc0201446:	565000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020144a:	4585                	li	a1,1
ffffffffc020144c:	8556                	mv	a0,s5
ffffffffc020144e:	55d000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201452:	4585                	li	a1,1
ffffffffc0201454:	8552                	mv	a0,s4
ffffffffc0201456:	555000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020145a:	4515                	li	a0,5
ffffffffc020145c:	511000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201460:	89aa                	mv	s3,a0
ffffffffc0201462:	26050563          	beqz	a0,ffffffffc02016cc <default_check+0x402>
ffffffffc0201466:	651c                	ld	a5,8(a0)
ffffffffc0201468:	8385                	srli	a5,a5,0x1
ffffffffc020146a:	8b85                	andi	a5,a5,1
ffffffffc020146c:	54079063          	bnez	a5,ffffffffc02019ac <default_check+0x6e2>
ffffffffc0201470:	4505                	li	a0,1
ffffffffc0201472:	00043b03          	ld	s6,0(s0)
ffffffffc0201476:	00843a83          	ld	s5,8(s0)
ffffffffc020147a:	e000                	sd	s0,0(s0)
ffffffffc020147c:	e400                	sd	s0,8(s0)
ffffffffc020147e:	4ef000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201482:	50051563          	bnez	a0,ffffffffc020198c <default_check+0x6c2>
ffffffffc0201486:	08098a13          	addi	s4,s3,128
ffffffffc020148a:	8552                	mv	a0,s4
ffffffffc020148c:	458d                	li	a1,3
ffffffffc020148e:	01042b83          	lw	s7,16(s0)
ffffffffc0201492:	00090797          	auipc	a5,0x90
ffffffffc0201496:	3207a323          	sw	zero,806(a5) # ffffffffc02917b8 <free_area+0x10>
ffffffffc020149a:	511000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020149e:	4511                	li	a0,4
ffffffffc02014a0:	4cd000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02014a4:	4c051463          	bnez	a0,ffffffffc020196c <default_check+0x6a2>
ffffffffc02014a8:	0889b783          	ld	a5,136(s3)
ffffffffc02014ac:	8385                	srli	a5,a5,0x1
ffffffffc02014ae:	8b85                	andi	a5,a5,1
ffffffffc02014b0:	48078e63          	beqz	a5,ffffffffc020194c <default_check+0x682>
ffffffffc02014b4:	0909a703          	lw	a4,144(s3)
ffffffffc02014b8:	478d                	li	a5,3
ffffffffc02014ba:	48f71963          	bne	a4,a5,ffffffffc020194c <default_check+0x682>
ffffffffc02014be:	450d                	li	a0,3
ffffffffc02014c0:	4ad000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02014c4:	8c2a                	mv	s8,a0
ffffffffc02014c6:	46050363          	beqz	a0,ffffffffc020192c <default_check+0x662>
ffffffffc02014ca:	4505                	li	a0,1
ffffffffc02014cc:	4a1000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02014d0:	42051e63          	bnez	a0,ffffffffc020190c <default_check+0x642>
ffffffffc02014d4:	418a1c63          	bne	s4,s8,ffffffffc02018ec <default_check+0x622>
ffffffffc02014d8:	4585                	li	a1,1
ffffffffc02014da:	854e                	mv	a0,s3
ffffffffc02014dc:	4cf000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02014e0:	458d                	li	a1,3
ffffffffc02014e2:	8552                	mv	a0,s4
ffffffffc02014e4:	4c7000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02014e8:	0089b783          	ld	a5,8(s3)
ffffffffc02014ec:	04098c13          	addi	s8,s3,64
ffffffffc02014f0:	8385                	srli	a5,a5,0x1
ffffffffc02014f2:	8b85                	andi	a5,a5,1
ffffffffc02014f4:	3c078c63          	beqz	a5,ffffffffc02018cc <default_check+0x602>
ffffffffc02014f8:	0109a703          	lw	a4,16(s3)
ffffffffc02014fc:	4785                	li	a5,1
ffffffffc02014fe:	3cf71763          	bne	a4,a5,ffffffffc02018cc <default_check+0x602>
ffffffffc0201502:	008a3783          	ld	a5,8(s4)
ffffffffc0201506:	8385                	srli	a5,a5,0x1
ffffffffc0201508:	8b85                	andi	a5,a5,1
ffffffffc020150a:	3a078163          	beqz	a5,ffffffffc02018ac <default_check+0x5e2>
ffffffffc020150e:	010a2703          	lw	a4,16(s4)
ffffffffc0201512:	478d                	li	a5,3
ffffffffc0201514:	38f71c63          	bne	a4,a5,ffffffffc02018ac <default_check+0x5e2>
ffffffffc0201518:	4505                	li	a0,1
ffffffffc020151a:	453000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020151e:	36a99763          	bne	s3,a0,ffffffffc020188c <default_check+0x5c2>
ffffffffc0201522:	4585                	li	a1,1
ffffffffc0201524:	487000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201528:	4509                	li	a0,2
ffffffffc020152a:	443000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020152e:	32aa1f63          	bne	s4,a0,ffffffffc020186c <default_check+0x5a2>
ffffffffc0201532:	4589                	li	a1,2
ffffffffc0201534:	477000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201538:	4585                	li	a1,1
ffffffffc020153a:	8562                	mv	a0,s8
ffffffffc020153c:	46f000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201540:	4515                	li	a0,5
ffffffffc0201542:	42b000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201546:	89aa                	mv	s3,a0
ffffffffc0201548:	48050263          	beqz	a0,ffffffffc02019cc <default_check+0x702>
ffffffffc020154c:	4505                	li	a0,1
ffffffffc020154e:	41f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201552:	2c051d63          	bnez	a0,ffffffffc020182c <default_check+0x562>
ffffffffc0201556:	481c                	lw	a5,16(s0)
ffffffffc0201558:	2a079a63          	bnez	a5,ffffffffc020180c <default_check+0x542>
ffffffffc020155c:	4595                	li	a1,5
ffffffffc020155e:	854e                	mv	a0,s3
ffffffffc0201560:	01742823          	sw	s7,16(s0)
ffffffffc0201564:	01643023          	sd	s6,0(s0)
ffffffffc0201568:	01543423          	sd	s5,8(s0)
ffffffffc020156c:	43f000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201570:	641c                	ld	a5,8(s0)
ffffffffc0201572:	00878963          	beq	a5,s0,ffffffffc0201584 <default_check+0x2ba>
ffffffffc0201576:	ff87a703          	lw	a4,-8(a5)
ffffffffc020157a:	679c                	ld	a5,8(a5)
ffffffffc020157c:	397d                	addiw	s2,s2,-1
ffffffffc020157e:	9c99                	subw	s1,s1,a4
ffffffffc0201580:	fe879be3          	bne	a5,s0,ffffffffc0201576 <default_check+0x2ac>
ffffffffc0201584:	26091463          	bnez	s2,ffffffffc02017ec <default_check+0x522>
ffffffffc0201588:	46049263          	bnez	s1,ffffffffc02019ec <default_check+0x722>
ffffffffc020158c:	60a6                	ld	ra,72(sp)
ffffffffc020158e:	6406                	ld	s0,64(sp)
ffffffffc0201590:	74e2                	ld	s1,56(sp)
ffffffffc0201592:	7942                	ld	s2,48(sp)
ffffffffc0201594:	79a2                	ld	s3,40(sp)
ffffffffc0201596:	7a02                	ld	s4,32(sp)
ffffffffc0201598:	6ae2                	ld	s5,24(sp)
ffffffffc020159a:	6b42                	ld	s6,16(sp)
ffffffffc020159c:	6ba2                	ld	s7,8(sp)
ffffffffc020159e:	6c02                	ld	s8,0(sp)
ffffffffc02015a0:	6161                	addi	sp,sp,80
ffffffffc02015a2:	8082                	ret
ffffffffc02015a4:	4981                	li	s3,0
ffffffffc02015a6:	4481                	li	s1,0
ffffffffc02015a8:	4901                	li	s2,0
ffffffffc02015aa:	b38d                	j	ffffffffc020130c <default_check+0x42>
ffffffffc02015ac:	0000b697          	auipc	a3,0xb
ffffffffc02015b0:	a5c68693          	addi	a3,a3,-1444 # ffffffffc020c008 <commands+0x950>
ffffffffc02015b4:	0000a617          	auipc	a2,0xa
ffffffffc02015b8:	31460613          	addi	a2,a2,788 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02015bc:	0ef00593          	li	a1,239
ffffffffc02015c0:	0000b517          	auipc	a0,0xb
ffffffffc02015c4:	a5850513          	addi	a0,a0,-1448 # ffffffffc020c018 <commands+0x960>
ffffffffc02015c8:	ed7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02015cc:	0000b697          	auipc	a3,0xb
ffffffffc02015d0:	ae468693          	addi	a3,a3,-1308 # ffffffffc020c0b0 <commands+0x9f8>
ffffffffc02015d4:	0000a617          	auipc	a2,0xa
ffffffffc02015d8:	2f460613          	addi	a2,a2,756 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02015dc:	0bc00593          	li	a1,188
ffffffffc02015e0:	0000b517          	auipc	a0,0xb
ffffffffc02015e4:	a3850513          	addi	a0,a0,-1480 # ffffffffc020c018 <commands+0x960>
ffffffffc02015e8:	eb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02015ec:	0000b697          	auipc	a3,0xb
ffffffffc02015f0:	aec68693          	addi	a3,a3,-1300 # ffffffffc020c0d8 <commands+0xa20>
ffffffffc02015f4:	0000a617          	auipc	a2,0xa
ffffffffc02015f8:	2d460613          	addi	a2,a2,724 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02015fc:	0bd00593          	li	a1,189
ffffffffc0201600:	0000b517          	auipc	a0,0xb
ffffffffc0201604:	a1850513          	addi	a0,a0,-1512 # ffffffffc020c018 <commands+0x960>
ffffffffc0201608:	e97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020160c:	0000b697          	auipc	a3,0xb
ffffffffc0201610:	b0c68693          	addi	a3,a3,-1268 # ffffffffc020c118 <commands+0xa60>
ffffffffc0201614:	0000a617          	auipc	a2,0xa
ffffffffc0201618:	2b460613          	addi	a2,a2,692 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020161c:	0bf00593          	li	a1,191
ffffffffc0201620:	0000b517          	auipc	a0,0xb
ffffffffc0201624:	9f850513          	addi	a0,a0,-1544 # ffffffffc020c018 <commands+0x960>
ffffffffc0201628:	e77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020162c:	0000b697          	auipc	a3,0xb
ffffffffc0201630:	b7468693          	addi	a3,a3,-1164 # ffffffffc020c1a0 <commands+0xae8>
ffffffffc0201634:	0000a617          	auipc	a2,0xa
ffffffffc0201638:	29460613          	addi	a2,a2,660 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020163c:	0d800593          	li	a1,216
ffffffffc0201640:	0000b517          	auipc	a0,0xb
ffffffffc0201644:	9d850513          	addi	a0,a0,-1576 # ffffffffc020c018 <commands+0x960>
ffffffffc0201648:	e57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020164c:	0000b697          	auipc	a3,0xb
ffffffffc0201650:	a0468693          	addi	a3,a3,-1532 # ffffffffc020c050 <commands+0x998>
ffffffffc0201654:	0000a617          	auipc	a2,0xa
ffffffffc0201658:	27460613          	addi	a2,a2,628 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020165c:	0d100593          	li	a1,209
ffffffffc0201660:	0000b517          	auipc	a0,0xb
ffffffffc0201664:	9b850513          	addi	a0,a0,-1608 # ffffffffc020c018 <commands+0x960>
ffffffffc0201668:	e37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020166c:	0000b697          	auipc	a3,0xb
ffffffffc0201670:	b2468693          	addi	a3,a3,-1244 # ffffffffc020c190 <commands+0xad8>
ffffffffc0201674:	0000a617          	auipc	a2,0xa
ffffffffc0201678:	25460613          	addi	a2,a2,596 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020167c:	0cf00593          	li	a1,207
ffffffffc0201680:	0000b517          	auipc	a0,0xb
ffffffffc0201684:	99850513          	addi	a0,a0,-1640 # ffffffffc020c018 <commands+0x960>
ffffffffc0201688:	e17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020168c:	0000b697          	auipc	a3,0xb
ffffffffc0201690:	aec68693          	addi	a3,a3,-1300 # ffffffffc020c178 <commands+0xac0>
ffffffffc0201694:	0000a617          	auipc	a2,0xa
ffffffffc0201698:	23460613          	addi	a2,a2,564 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020169c:	0ca00593          	li	a1,202
ffffffffc02016a0:	0000b517          	auipc	a0,0xb
ffffffffc02016a4:	97850513          	addi	a0,a0,-1672 # ffffffffc020c018 <commands+0x960>
ffffffffc02016a8:	df7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016ac:	0000b697          	auipc	a3,0xb
ffffffffc02016b0:	aac68693          	addi	a3,a3,-1364 # ffffffffc020c158 <commands+0xaa0>
ffffffffc02016b4:	0000a617          	auipc	a2,0xa
ffffffffc02016b8:	21460613          	addi	a2,a2,532 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02016bc:	0c100593          	li	a1,193
ffffffffc02016c0:	0000b517          	auipc	a0,0xb
ffffffffc02016c4:	95850513          	addi	a0,a0,-1704 # ffffffffc020c018 <commands+0x960>
ffffffffc02016c8:	dd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016cc:	0000b697          	auipc	a3,0xb
ffffffffc02016d0:	b1c68693          	addi	a3,a3,-1252 # ffffffffc020c1e8 <commands+0xb30>
ffffffffc02016d4:	0000a617          	auipc	a2,0xa
ffffffffc02016d8:	1f460613          	addi	a2,a2,500 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02016dc:	0f700593          	li	a1,247
ffffffffc02016e0:	0000b517          	auipc	a0,0xb
ffffffffc02016e4:	93850513          	addi	a0,a0,-1736 # ffffffffc020c018 <commands+0x960>
ffffffffc02016e8:	db7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016ec:	0000b697          	auipc	a3,0xb
ffffffffc02016f0:	aec68693          	addi	a3,a3,-1300 # ffffffffc020c1d8 <commands+0xb20>
ffffffffc02016f4:	0000a617          	auipc	a2,0xa
ffffffffc02016f8:	1d460613          	addi	a2,a2,468 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02016fc:	0de00593          	li	a1,222
ffffffffc0201700:	0000b517          	auipc	a0,0xb
ffffffffc0201704:	91850513          	addi	a0,a0,-1768 # ffffffffc020c018 <commands+0x960>
ffffffffc0201708:	d97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020170c:	0000b697          	auipc	a3,0xb
ffffffffc0201710:	a6c68693          	addi	a3,a3,-1428 # ffffffffc020c178 <commands+0xac0>
ffffffffc0201714:	0000a617          	auipc	a2,0xa
ffffffffc0201718:	1b460613          	addi	a2,a2,436 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020171c:	0dc00593          	li	a1,220
ffffffffc0201720:	0000b517          	auipc	a0,0xb
ffffffffc0201724:	8f850513          	addi	a0,a0,-1800 # ffffffffc020c018 <commands+0x960>
ffffffffc0201728:	d77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020172c:	0000b697          	auipc	a3,0xb
ffffffffc0201730:	a8c68693          	addi	a3,a3,-1396 # ffffffffc020c1b8 <commands+0xb00>
ffffffffc0201734:	0000a617          	auipc	a2,0xa
ffffffffc0201738:	19460613          	addi	a2,a2,404 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020173c:	0db00593          	li	a1,219
ffffffffc0201740:	0000b517          	auipc	a0,0xb
ffffffffc0201744:	8d850513          	addi	a0,a0,-1832 # ffffffffc020c018 <commands+0x960>
ffffffffc0201748:	d57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020174c:	0000b697          	auipc	a3,0xb
ffffffffc0201750:	90468693          	addi	a3,a3,-1788 # ffffffffc020c050 <commands+0x998>
ffffffffc0201754:	0000a617          	auipc	a2,0xa
ffffffffc0201758:	17460613          	addi	a2,a2,372 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020175c:	0b800593          	li	a1,184
ffffffffc0201760:	0000b517          	auipc	a0,0xb
ffffffffc0201764:	8b850513          	addi	a0,a0,-1864 # ffffffffc020c018 <commands+0x960>
ffffffffc0201768:	d37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020176c:	0000b697          	auipc	a3,0xb
ffffffffc0201770:	a0c68693          	addi	a3,a3,-1524 # ffffffffc020c178 <commands+0xac0>
ffffffffc0201774:	0000a617          	auipc	a2,0xa
ffffffffc0201778:	15460613          	addi	a2,a2,340 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020177c:	0d500593          	li	a1,213
ffffffffc0201780:	0000b517          	auipc	a0,0xb
ffffffffc0201784:	89850513          	addi	a0,a0,-1896 # ffffffffc020c018 <commands+0x960>
ffffffffc0201788:	d17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020178c:	0000b697          	auipc	a3,0xb
ffffffffc0201790:	90468693          	addi	a3,a3,-1788 # ffffffffc020c090 <commands+0x9d8>
ffffffffc0201794:	0000a617          	auipc	a2,0xa
ffffffffc0201798:	13460613          	addi	a2,a2,308 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020179c:	0d300593          	li	a1,211
ffffffffc02017a0:	0000b517          	auipc	a0,0xb
ffffffffc02017a4:	87850513          	addi	a0,a0,-1928 # ffffffffc020c018 <commands+0x960>
ffffffffc02017a8:	cf7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017ac:	0000b697          	auipc	a3,0xb
ffffffffc02017b0:	8c468693          	addi	a3,a3,-1852 # ffffffffc020c070 <commands+0x9b8>
ffffffffc02017b4:	0000a617          	auipc	a2,0xa
ffffffffc02017b8:	11460613          	addi	a2,a2,276 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02017bc:	0d200593          	li	a1,210
ffffffffc02017c0:	0000b517          	auipc	a0,0xb
ffffffffc02017c4:	85850513          	addi	a0,a0,-1960 # ffffffffc020c018 <commands+0x960>
ffffffffc02017c8:	cd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017cc:	0000b697          	auipc	a3,0xb
ffffffffc02017d0:	8c468693          	addi	a3,a3,-1852 # ffffffffc020c090 <commands+0x9d8>
ffffffffc02017d4:	0000a617          	auipc	a2,0xa
ffffffffc02017d8:	0f460613          	addi	a2,a2,244 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02017dc:	0ba00593          	li	a1,186
ffffffffc02017e0:	0000b517          	auipc	a0,0xb
ffffffffc02017e4:	83850513          	addi	a0,a0,-1992 # ffffffffc020c018 <commands+0x960>
ffffffffc02017e8:	cb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017ec:	0000b697          	auipc	a3,0xb
ffffffffc02017f0:	b4c68693          	addi	a3,a3,-1204 # ffffffffc020c338 <commands+0xc80>
ffffffffc02017f4:	0000a617          	auipc	a2,0xa
ffffffffc02017f8:	0d460613          	addi	a2,a2,212 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02017fc:	12400593          	li	a1,292
ffffffffc0201800:	0000b517          	auipc	a0,0xb
ffffffffc0201804:	81850513          	addi	a0,a0,-2024 # ffffffffc020c018 <commands+0x960>
ffffffffc0201808:	c97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020180c:	0000b697          	auipc	a3,0xb
ffffffffc0201810:	9cc68693          	addi	a3,a3,-1588 # ffffffffc020c1d8 <commands+0xb20>
ffffffffc0201814:	0000a617          	auipc	a2,0xa
ffffffffc0201818:	0b460613          	addi	a2,a2,180 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020181c:	11900593          	li	a1,281
ffffffffc0201820:	0000a517          	auipc	a0,0xa
ffffffffc0201824:	7f850513          	addi	a0,a0,2040 # ffffffffc020c018 <commands+0x960>
ffffffffc0201828:	c77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020182c:	0000b697          	auipc	a3,0xb
ffffffffc0201830:	94c68693          	addi	a3,a3,-1716 # ffffffffc020c178 <commands+0xac0>
ffffffffc0201834:	0000a617          	auipc	a2,0xa
ffffffffc0201838:	09460613          	addi	a2,a2,148 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020183c:	11700593          	li	a1,279
ffffffffc0201840:	0000a517          	auipc	a0,0xa
ffffffffc0201844:	7d850513          	addi	a0,a0,2008 # ffffffffc020c018 <commands+0x960>
ffffffffc0201848:	c57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020184c:	0000b697          	auipc	a3,0xb
ffffffffc0201850:	8ec68693          	addi	a3,a3,-1812 # ffffffffc020c138 <commands+0xa80>
ffffffffc0201854:	0000a617          	auipc	a2,0xa
ffffffffc0201858:	07460613          	addi	a2,a2,116 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020185c:	0c000593          	li	a1,192
ffffffffc0201860:	0000a517          	auipc	a0,0xa
ffffffffc0201864:	7b850513          	addi	a0,a0,1976 # ffffffffc020c018 <commands+0x960>
ffffffffc0201868:	c37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020186c:	0000b697          	auipc	a3,0xb
ffffffffc0201870:	a8c68693          	addi	a3,a3,-1396 # ffffffffc020c2f8 <commands+0xc40>
ffffffffc0201874:	0000a617          	auipc	a2,0xa
ffffffffc0201878:	05460613          	addi	a2,a2,84 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020187c:	11100593          	li	a1,273
ffffffffc0201880:	0000a517          	auipc	a0,0xa
ffffffffc0201884:	79850513          	addi	a0,a0,1944 # ffffffffc020c018 <commands+0x960>
ffffffffc0201888:	c17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020188c:	0000b697          	auipc	a3,0xb
ffffffffc0201890:	a4c68693          	addi	a3,a3,-1460 # ffffffffc020c2d8 <commands+0xc20>
ffffffffc0201894:	0000a617          	auipc	a2,0xa
ffffffffc0201898:	03460613          	addi	a2,a2,52 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020189c:	10f00593          	li	a1,271
ffffffffc02018a0:	0000a517          	auipc	a0,0xa
ffffffffc02018a4:	77850513          	addi	a0,a0,1912 # ffffffffc020c018 <commands+0x960>
ffffffffc02018a8:	bf7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018ac:	0000b697          	auipc	a3,0xb
ffffffffc02018b0:	a0468693          	addi	a3,a3,-1532 # ffffffffc020c2b0 <commands+0xbf8>
ffffffffc02018b4:	0000a617          	auipc	a2,0xa
ffffffffc02018b8:	01460613          	addi	a2,a2,20 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02018bc:	10d00593          	li	a1,269
ffffffffc02018c0:	0000a517          	auipc	a0,0xa
ffffffffc02018c4:	75850513          	addi	a0,a0,1880 # ffffffffc020c018 <commands+0x960>
ffffffffc02018c8:	bd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018cc:	0000b697          	auipc	a3,0xb
ffffffffc02018d0:	9bc68693          	addi	a3,a3,-1604 # ffffffffc020c288 <commands+0xbd0>
ffffffffc02018d4:	0000a617          	auipc	a2,0xa
ffffffffc02018d8:	ff460613          	addi	a2,a2,-12 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02018dc:	10c00593          	li	a1,268
ffffffffc02018e0:	0000a517          	auipc	a0,0xa
ffffffffc02018e4:	73850513          	addi	a0,a0,1848 # ffffffffc020c018 <commands+0x960>
ffffffffc02018e8:	bb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018ec:	0000b697          	auipc	a3,0xb
ffffffffc02018f0:	98c68693          	addi	a3,a3,-1652 # ffffffffc020c278 <commands+0xbc0>
ffffffffc02018f4:	0000a617          	auipc	a2,0xa
ffffffffc02018f8:	fd460613          	addi	a2,a2,-44 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02018fc:	10700593          	li	a1,263
ffffffffc0201900:	0000a517          	auipc	a0,0xa
ffffffffc0201904:	71850513          	addi	a0,a0,1816 # ffffffffc020c018 <commands+0x960>
ffffffffc0201908:	b97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020190c:	0000b697          	auipc	a3,0xb
ffffffffc0201910:	86c68693          	addi	a3,a3,-1940 # ffffffffc020c178 <commands+0xac0>
ffffffffc0201914:	0000a617          	auipc	a2,0xa
ffffffffc0201918:	fb460613          	addi	a2,a2,-76 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020191c:	10600593          	li	a1,262
ffffffffc0201920:	0000a517          	auipc	a0,0xa
ffffffffc0201924:	6f850513          	addi	a0,a0,1784 # ffffffffc020c018 <commands+0x960>
ffffffffc0201928:	b77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020192c:	0000b697          	auipc	a3,0xb
ffffffffc0201930:	92c68693          	addi	a3,a3,-1748 # ffffffffc020c258 <commands+0xba0>
ffffffffc0201934:	0000a617          	auipc	a2,0xa
ffffffffc0201938:	f9460613          	addi	a2,a2,-108 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020193c:	10500593          	li	a1,261
ffffffffc0201940:	0000a517          	auipc	a0,0xa
ffffffffc0201944:	6d850513          	addi	a0,a0,1752 # ffffffffc020c018 <commands+0x960>
ffffffffc0201948:	b57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020194c:	0000b697          	auipc	a3,0xb
ffffffffc0201950:	8dc68693          	addi	a3,a3,-1828 # ffffffffc020c228 <commands+0xb70>
ffffffffc0201954:	0000a617          	auipc	a2,0xa
ffffffffc0201958:	f7460613          	addi	a2,a2,-140 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020195c:	10400593          	li	a1,260
ffffffffc0201960:	0000a517          	auipc	a0,0xa
ffffffffc0201964:	6b850513          	addi	a0,a0,1720 # ffffffffc020c018 <commands+0x960>
ffffffffc0201968:	b37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020196c:	0000b697          	auipc	a3,0xb
ffffffffc0201970:	8a468693          	addi	a3,a3,-1884 # ffffffffc020c210 <commands+0xb58>
ffffffffc0201974:	0000a617          	auipc	a2,0xa
ffffffffc0201978:	f5460613          	addi	a2,a2,-172 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020197c:	10300593          	li	a1,259
ffffffffc0201980:	0000a517          	auipc	a0,0xa
ffffffffc0201984:	69850513          	addi	a0,a0,1688 # ffffffffc020c018 <commands+0x960>
ffffffffc0201988:	b17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020198c:	0000a697          	auipc	a3,0xa
ffffffffc0201990:	7ec68693          	addi	a3,a3,2028 # ffffffffc020c178 <commands+0xac0>
ffffffffc0201994:	0000a617          	auipc	a2,0xa
ffffffffc0201998:	f3460613          	addi	a2,a2,-204 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020199c:	0fd00593          	li	a1,253
ffffffffc02019a0:	0000a517          	auipc	a0,0xa
ffffffffc02019a4:	67850513          	addi	a0,a0,1656 # ffffffffc020c018 <commands+0x960>
ffffffffc02019a8:	af7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019ac:	0000b697          	auipc	a3,0xb
ffffffffc02019b0:	84c68693          	addi	a3,a3,-1972 # ffffffffc020c1f8 <commands+0xb40>
ffffffffc02019b4:	0000a617          	auipc	a2,0xa
ffffffffc02019b8:	f1460613          	addi	a2,a2,-236 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02019bc:	0f800593          	li	a1,248
ffffffffc02019c0:	0000a517          	auipc	a0,0xa
ffffffffc02019c4:	65850513          	addi	a0,a0,1624 # ffffffffc020c018 <commands+0x960>
ffffffffc02019c8:	ad7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019cc:	0000b697          	auipc	a3,0xb
ffffffffc02019d0:	94c68693          	addi	a3,a3,-1716 # ffffffffc020c318 <commands+0xc60>
ffffffffc02019d4:	0000a617          	auipc	a2,0xa
ffffffffc02019d8:	ef460613          	addi	a2,a2,-268 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02019dc:	11600593          	li	a1,278
ffffffffc02019e0:	0000a517          	auipc	a0,0xa
ffffffffc02019e4:	63850513          	addi	a0,a0,1592 # ffffffffc020c018 <commands+0x960>
ffffffffc02019e8:	ab7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019ec:	0000b697          	auipc	a3,0xb
ffffffffc02019f0:	95c68693          	addi	a3,a3,-1700 # ffffffffc020c348 <commands+0xc90>
ffffffffc02019f4:	0000a617          	auipc	a2,0xa
ffffffffc02019f8:	ed460613          	addi	a2,a2,-300 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02019fc:	12500593          	li	a1,293
ffffffffc0201a00:	0000a517          	auipc	a0,0xa
ffffffffc0201a04:	61850513          	addi	a0,a0,1560 # ffffffffc020c018 <commands+0x960>
ffffffffc0201a08:	a97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a0c:	0000a697          	auipc	a3,0xa
ffffffffc0201a10:	62468693          	addi	a3,a3,1572 # ffffffffc020c030 <commands+0x978>
ffffffffc0201a14:	0000a617          	auipc	a2,0xa
ffffffffc0201a18:	eb460613          	addi	a2,a2,-332 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0201a1c:	0f200593          	li	a1,242
ffffffffc0201a20:	0000a517          	auipc	a0,0xa
ffffffffc0201a24:	5f850513          	addi	a0,a0,1528 # ffffffffc020c018 <commands+0x960>
ffffffffc0201a28:	a77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a2c:	0000a697          	auipc	a3,0xa
ffffffffc0201a30:	64468693          	addi	a3,a3,1604 # ffffffffc020c070 <commands+0x9b8>
ffffffffc0201a34:	0000a617          	auipc	a2,0xa
ffffffffc0201a38:	e9460613          	addi	a2,a2,-364 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0201a3c:	0b900593          	li	a1,185
ffffffffc0201a40:	0000a517          	auipc	a0,0xa
ffffffffc0201a44:	5d850513          	addi	a0,a0,1496 # ffffffffc020c018 <commands+0x960>
ffffffffc0201a48:	a57fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201a4c <default_free_pages>:
ffffffffc0201a4c:	1141                	addi	sp,sp,-16
ffffffffc0201a4e:	e406                	sd	ra,8(sp)
ffffffffc0201a50:	14058463          	beqz	a1,ffffffffc0201b98 <default_free_pages+0x14c>
ffffffffc0201a54:	00659693          	slli	a3,a1,0x6
ffffffffc0201a58:	96aa                	add	a3,a3,a0
ffffffffc0201a5a:	87aa                	mv	a5,a0
ffffffffc0201a5c:	02d50263          	beq	a0,a3,ffffffffc0201a80 <default_free_pages+0x34>
ffffffffc0201a60:	6798                	ld	a4,8(a5)
ffffffffc0201a62:	8b05                	andi	a4,a4,1
ffffffffc0201a64:	10071a63          	bnez	a4,ffffffffc0201b78 <default_free_pages+0x12c>
ffffffffc0201a68:	6798                	ld	a4,8(a5)
ffffffffc0201a6a:	8b09                	andi	a4,a4,2
ffffffffc0201a6c:	10071663          	bnez	a4,ffffffffc0201b78 <default_free_pages+0x12c>
ffffffffc0201a70:	0007b423          	sd	zero,8(a5)
ffffffffc0201a74:	0007a023          	sw	zero,0(a5)
ffffffffc0201a78:	04078793          	addi	a5,a5,64
ffffffffc0201a7c:	fed792e3          	bne	a5,a3,ffffffffc0201a60 <default_free_pages+0x14>
ffffffffc0201a80:	2581                	sext.w	a1,a1
ffffffffc0201a82:	c90c                	sw	a1,16(a0)
ffffffffc0201a84:	00850893          	addi	a7,a0,8
ffffffffc0201a88:	4789                	li	a5,2
ffffffffc0201a8a:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc0201a8e:	00090697          	auipc	a3,0x90
ffffffffc0201a92:	d1a68693          	addi	a3,a3,-742 # ffffffffc02917a8 <free_area>
ffffffffc0201a96:	4a98                	lw	a4,16(a3)
ffffffffc0201a98:	669c                	ld	a5,8(a3)
ffffffffc0201a9a:	01850613          	addi	a2,a0,24
ffffffffc0201a9e:	9db9                	addw	a1,a1,a4
ffffffffc0201aa0:	ca8c                	sw	a1,16(a3)
ffffffffc0201aa2:	0ad78463          	beq	a5,a3,ffffffffc0201b4a <default_free_pages+0xfe>
ffffffffc0201aa6:	fe878713          	addi	a4,a5,-24
ffffffffc0201aaa:	0006b803          	ld	a6,0(a3)
ffffffffc0201aae:	4581                	li	a1,0
ffffffffc0201ab0:	00e56a63          	bltu	a0,a4,ffffffffc0201ac4 <default_free_pages+0x78>
ffffffffc0201ab4:	6798                	ld	a4,8(a5)
ffffffffc0201ab6:	04d70c63          	beq	a4,a3,ffffffffc0201b0e <default_free_pages+0xc2>
ffffffffc0201aba:	87ba                	mv	a5,a4
ffffffffc0201abc:	fe878713          	addi	a4,a5,-24
ffffffffc0201ac0:	fee57ae3          	bgeu	a0,a4,ffffffffc0201ab4 <default_free_pages+0x68>
ffffffffc0201ac4:	c199                	beqz	a1,ffffffffc0201aca <default_free_pages+0x7e>
ffffffffc0201ac6:	0106b023          	sd	a6,0(a3)
ffffffffc0201aca:	6398                	ld	a4,0(a5)
ffffffffc0201acc:	e390                	sd	a2,0(a5)
ffffffffc0201ace:	e710                	sd	a2,8(a4)
ffffffffc0201ad0:	f11c                	sd	a5,32(a0)
ffffffffc0201ad2:	ed18                	sd	a4,24(a0)
ffffffffc0201ad4:	00d70d63          	beq	a4,a3,ffffffffc0201aee <default_free_pages+0xa2>
ffffffffc0201ad8:	ff872583          	lw	a1,-8(a4)
ffffffffc0201adc:	fe870613          	addi	a2,a4,-24
ffffffffc0201ae0:	02059813          	slli	a6,a1,0x20
ffffffffc0201ae4:	01a85793          	srli	a5,a6,0x1a
ffffffffc0201ae8:	97b2                	add	a5,a5,a2
ffffffffc0201aea:	02f50c63          	beq	a0,a5,ffffffffc0201b22 <default_free_pages+0xd6>
ffffffffc0201aee:	711c                	ld	a5,32(a0)
ffffffffc0201af0:	00d78c63          	beq	a5,a3,ffffffffc0201b08 <default_free_pages+0xbc>
ffffffffc0201af4:	4910                	lw	a2,16(a0)
ffffffffc0201af6:	fe878693          	addi	a3,a5,-24
ffffffffc0201afa:	02061593          	slli	a1,a2,0x20
ffffffffc0201afe:	01a5d713          	srli	a4,a1,0x1a
ffffffffc0201b02:	972a                	add	a4,a4,a0
ffffffffc0201b04:	04e68a63          	beq	a3,a4,ffffffffc0201b58 <default_free_pages+0x10c>
ffffffffc0201b08:	60a2                	ld	ra,8(sp)
ffffffffc0201b0a:	0141                	addi	sp,sp,16
ffffffffc0201b0c:	8082                	ret
ffffffffc0201b0e:	e790                	sd	a2,8(a5)
ffffffffc0201b10:	f114                	sd	a3,32(a0)
ffffffffc0201b12:	6798                	ld	a4,8(a5)
ffffffffc0201b14:	ed1c                	sd	a5,24(a0)
ffffffffc0201b16:	02d70763          	beq	a4,a3,ffffffffc0201b44 <default_free_pages+0xf8>
ffffffffc0201b1a:	8832                	mv	a6,a2
ffffffffc0201b1c:	4585                	li	a1,1
ffffffffc0201b1e:	87ba                	mv	a5,a4
ffffffffc0201b20:	bf71                	j	ffffffffc0201abc <default_free_pages+0x70>
ffffffffc0201b22:	491c                	lw	a5,16(a0)
ffffffffc0201b24:	9dbd                	addw	a1,a1,a5
ffffffffc0201b26:	feb72c23          	sw	a1,-8(a4)
ffffffffc0201b2a:	57f5                	li	a5,-3
ffffffffc0201b2c:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc0201b30:	01853803          	ld	a6,24(a0)
ffffffffc0201b34:	710c                	ld	a1,32(a0)
ffffffffc0201b36:	8532                	mv	a0,a2
ffffffffc0201b38:	00b83423          	sd	a1,8(a6)
ffffffffc0201b3c:	671c                	ld	a5,8(a4)
ffffffffc0201b3e:	0105b023          	sd	a6,0(a1)
ffffffffc0201b42:	b77d                	j	ffffffffc0201af0 <default_free_pages+0xa4>
ffffffffc0201b44:	e290                	sd	a2,0(a3)
ffffffffc0201b46:	873e                	mv	a4,a5
ffffffffc0201b48:	bf41                	j	ffffffffc0201ad8 <default_free_pages+0x8c>
ffffffffc0201b4a:	60a2                	ld	ra,8(sp)
ffffffffc0201b4c:	e390                	sd	a2,0(a5)
ffffffffc0201b4e:	e790                	sd	a2,8(a5)
ffffffffc0201b50:	f11c                	sd	a5,32(a0)
ffffffffc0201b52:	ed1c                	sd	a5,24(a0)
ffffffffc0201b54:	0141                	addi	sp,sp,16
ffffffffc0201b56:	8082                	ret
ffffffffc0201b58:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201b5c:	ff078693          	addi	a3,a5,-16
ffffffffc0201b60:	9e39                	addw	a2,a2,a4
ffffffffc0201b62:	c910                	sw	a2,16(a0)
ffffffffc0201b64:	5775                	li	a4,-3
ffffffffc0201b66:	60e6b02f          	amoand.d	zero,a4,(a3)
ffffffffc0201b6a:	6398                	ld	a4,0(a5)
ffffffffc0201b6c:	679c                	ld	a5,8(a5)
ffffffffc0201b6e:	60a2                	ld	ra,8(sp)
ffffffffc0201b70:	e71c                	sd	a5,8(a4)
ffffffffc0201b72:	e398                	sd	a4,0(a5)
ffffffffc0201b74:	0141                	addi	sp,sp,16
ffffffffc0201b76:	8082                	ret
ffffffffc0201b78:	0000a697          	auipc	a3,0xa
ffffffffc0201b7c:	7e868693          	addi	a3,a3,2024 # ffffffffc020c360 <commands+0xca8>
ffffffffc0201b80:	0000a617          	auipc	a2,0xa
ffffffffc0201b84:	d4860613          	addi	a2,a2,-696 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0201b88:	08200593          	li	a1,130
ffffffffc0201b8c:	0000a517          	auipc	a0,0xa
ffffffffc0201b90:	48c50513          	addi	a0,a0,1164 # ffffffffc020c018 <commands+0x960>
ffffffffc0201b94:	90bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201b98:	0000a697          	auipc	a3,0xa
ffffffffc0201b9c:	7c068693          	addi	a3,a3,1984 # ffffffffc020c358 <commands+0xca0>
ffffffffc0201ba0:	0000a617          	auipc	a2,0xa
ffffffffc0201ba4:	d2860613          	addi	a2,a2,-728 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0201ba8:	07f00593          	li	a1,127
ffffffffc0201bac:	0000a517          	auipc	a0,0xa
ffffffffc0201bb0:	46c50513          	addi	a0,a0,1132 # ffffffffc020c018 <commands+0x960>
ffffffffc0201bb4:	8ebfe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201bb8 <default_alloc_pages>:
ffffffffc0201bb8:	c941                	beqz	a0,ffffffffc0201c48 <default_alloc_pages+0x90>
ffffffffc0201bba:	00090597          	auipc	a1,0x90
ffffffffc0201bbe:	bee58593          	addi	a1,a1,-1042 # ffffffffc02917a8 <free_area>
ffffffffc0201bc2:	0105a803          	lw	a6,16(a1)
ffffffffc0201bc6:	872a                	mv	a4,a0
ffffffffc0201bc8:	02081793          	slli	a5,a6,0x20
ffffffffc0201bcc:	9381                	srli	a5,a5,0x20
ffffffffc0201bce:	00a7ee63          	bltu	a5,a0,ffffffffc0201bea <default_alloc_pages+0x32>
ffffffffc0201bd2:	87ae                	mv	a5,a1
ffffffffc0201bd4:	a801                	j	ffffffffc0201be4 <default_alloc_pages+0x2c>
ffffffffc0201bd6:	ff87a683          	lw	a3,-8(a5)
ffffffffc0201bda:	02069613          	slli	a2,a3,0x20
ffffffffc0201bde:	9201                	srli	a2,a2,0x20
ffffffffc0201be0:	00e67763          	bgeu	a2,a4,ffffffffc0201bee <default_alloc_pages+0x36>
ffffffffc0201be4:	679c                	ld	a5,8(a5)
ffffffffc0201be6:	feb798e3          	bne	a5,a1,ffffffffc0201bd6 <default_alloc_pages+0x1e>
ffffffffc0201bea:	4501                	li	a0,0
ffffffffc0201bec:	8082                	ret
ffffffffc0201bee:	0007b883          	ld	a7,0(a5)
ffffffffc0201bf2:	0087b303          	ld	t1,8(a5)
ffffffffc0201bf6:	fe878513          	addi	a0,a5,-24
ffffffffc0201bfa:	00070e1b          	sext.w	t3,a4
ffffffffc0201bfe:	0068b423          	sd	t1,8(a7) # 10000008 <_binary_bin_sfs_img_size+0xff8ad08>
ffffffffc0201c02:	01133023          	sd	a7,0(t1)
ffffffffc0201c06:	02c77863          	bgeu	a4,a2,ffffffffc0201c36 <default_alloc_pages+0x7e>
ffffffffc0201c0a:	071a                	slli	a4,a4,0x6
ffffffffc0201c0c:	972a                	add	a4,a4,a0
ffffffffc0201c0e:	41c686bb          	subw	a3,a3,t3
ffffffffc0201c12:	cb14                	sw	a3,16(a4)
ffffffffc0201c14:	00870613          	addi	a2,a4,8
ffffffffc0201c18:	4689                	li	a3,2
ffffffffc0201c1a:	40d6302f          	amoor.d	zero,a3,(a2)
ffffffffc0201c1e:	0088b683          	ld	a3,8(a7)
ffffffffc0201c22:	01870613          	addi	a2,a4,24
ffffffffc0201c26:	0105a803          	lw	a6,16(a1)
ffffffffc0201c2a:	e290                	sd	a2,0(a3)
ffffffffc0201c2c:	00c8b423          	sd	a2,8(a7)
ffffffffc0201c30:	f314                	sd	a3,32(a4)
ffffffffc0201c32:	01173c23          	sd	a7,24(a4)
ffffffffc0201c36:	41c8083b          	subw	a6,a6,t3
ffffffffc0201c3a:	0105a823          	sw	a6,16(a1)
ffffffffc0201c3e:	5775                	li	a4,-3
ffffffffc0201c40:	17c1                	addi	a5,a5,-16
ffffffffc0201c42:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc0201c46:	8082                	ret
ffffffffc0201c48:	1141                	addi	sp,sp,-16
ffffffffc0201c4a:	0000a697          	auipc	a3,0xa
ffffffffc0201c4e:	70e68693          	addi	a3,a3,1806 # ffffffffc020c358 <commands+0xca0>
ffffffffc0201c52:	0000a617          	auipc	a2,0xa
ffffffffc0201c56:	c7660613          	addi	a2,a2,-906 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0201c5a:	06100593          	li	a1,97
ffffffffc0201c5e:	0000a517          	auipc	a0,0xa
ffffffffc0201c62:	3ba50513          	addi	a0,a0,954 # ffffffffc020c018 <commands+0x960>
ffffffffc0201c66:	e406                	sd	ra,8(sp)
ffffffffc0201c68:	837fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201c6c <default_init_memmap>:
ffffffffc0201c6c:	1141                	addi	sp,sp,-16
ffffffffc0201c6e:	e406                	sd	ra,8(sp)
ffffffffc0201c70:	c5f1                	beqz	a1,ffffffffc0201d3c <default_init_memmap+0xd0>
ffffffffc0201c72:	00659693          	slli	a3,a1,0x6
ffffffffc0201c76:	96aa                	add	a3,a3,a0
ffffffffc0201c78:	87aa                	mv	a5,a0
ffffffffc0201c7a:	00d50f63          	beq	a0,a3,ffffffffc0201c98 <default_init_memmap+0x2c>
ffffffffc0201c7e:	6798                	ld	a4,8(a5)
ffffffffc0201c80:	8b05                	andi	a4,a4,1
ffffffffc0201c82:	cf49                	beqz	a4,ffffffffc0201d1c <default_init_memmap+0xb0>
ffffffffc0201c84:	0007a823          	sw	zero,16(a5)
ffffffffc0201c88:	0007b423          	sd	zero,8(a5)
ffffffffc0201c8c:	0007a023          	sw	zero,0(a5)
ffffffffc0201c90:	04078793          	addi	a5,a5,64
ffffffffc0201c94:	fed795e3          	bne	a5,a3,ffffffffc0201c7e <default_init_memmap+0x12>
ffffffffc0201c98:	2581                	sext.w	a1,a1
ffffffffc0201c9a:	c90c                	sw	a1,16(a0)
ffffffffc0201c9c:	4789                	li	a5,2
ffffffffc0201c9e:	00850713          	addi	a4,a0,8
ffffffffc0201ca2:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc0201ca6:	00090697          	auipc	a3,0x90
ffffffffc0201caa:	b0268693          	addi	a3,a3,-1278 # ffffffffc02917a8 <free_area>
ffffffffc0201cae:	4a98                	lw	a4,16(a3)
ffffffffc0201cb0:	669c                	ld	a5,8(a3)
ffffffffc0201cb2:	01850613          	addi	a2,a0,24
ffffffffc0201cb6:	9db9                	addw	a1,a1,a4
ffffffffc0201cb8:	ca8c                	sw	a1,16(a3)
ffffffffc0201cba:	04d78a63          	beq	a5,a3,ffffffffc0201d0e <default_init_memmap+0xa2>
ffffffffc0201cbe:	fe878713          	addi	a4,a5,-24
ffffffffc0201cc2:	0006b803          	ld	a6,0(a3)
ffffffffc0201cc6:	4581                	li	a1,0
ffffffffc0201cc8:	00e56a63          	bltu	a0,a4,ffffffffc0201cdc <default_init_memmap+0x70>
ffffffffc0201ccc:	6798                	ld	a4,8(a5)
ffffffffc0201cce:	02d70263          	beq	a4,a3,ffffffffc0201cf2 <default_init_memmap+0x86>
ffffffffc0201cd2:	87ba                	mv	a5,a4
ffffffffc0201cd4:	fe878713          	addi	a4,a5,-24
ffffffffc0201cd8:	fee57ae3          	bgeu	a0,a4,ffffffffc0201ccc <default_init_memmap+0x60>
ffffffffc0201cdc:	c199                	beqz	a1,ffffffffc0201ce2 <default_init_memmap+0x76>
ffffffffc0201cde:	0106b023          	sd	a6,0(a3)
ffffffffc0201ce2:	6398                	ld	a4,0(a5)
ffffffffc0201ce4:	60a2                	ld	ra,8(sp)
ffffffffc0201ce6:	e390                	sd	a2,0(a5)
ffffffffc0201ce8:	e710                	sd	a2,8(a4)
ffffffffc0201cea:	f11c                	sd	a5,32(a0)
ffffffffc0201cec:	ed18                	sd	a4,24(a0)
ffffffffc0201cee:	0141                	addi	sp,sp,16
ffffffffc0201cf0:	8082                	ret
ffffffffc0201cf2:	e790                	sd	a2,8(a5)
ffffffffc0201cf4:	f114                	sd	a3,32(a0)
ffffffffc0201cf6:	6798                	ld	a4,8(a5)
ffffffffc0201cf8:	ed1c                	sd	a5,24(a0)
ffffffffc0201cfa:	00d70663          	beq	a4,a3,ffffffffc0201d06 <default_init_memmap+0x9a>
ffffffffc0201cfe:	8832                	mv	a6,a2
ffffffffc0201d00:	4585                	li	a1,1
ffffffffc0201d02:	87ba                	mv	a5,a4
ffffffffc0201d04:	bfc1                	j	ffffffffc0201cd4 <default_init_memmap+0x68>
ffffffffc0201d06:	60a2                	ld	ra,8(sp)
ffffffffc0201d08:	e290                	sd	a2,0(a3)
ffffffffc0201d0a:	0141                	addi	sp,sp,16
ffffffffc0201d0c:	8082                	ret
ffffffffc0201d0e:	60a2                	ld	ra,8(sp)
ffffffffc0201d10:	e390                	sd	a2,0(a5)
ffffffffc0201d12:	e790                	sd	a2,8(a5)
ffffffffc0201d14:	f11c                	sd	a5,32(a0)
ffffffffc0201d16:	ed1c                	sd	a5,24(a0)
ffffffffc0201d18:	0141                	addi	sp,sp,16
ffffffffc0201d1a:	8082                	ret
ffffffffc0201d1c:	0000a697          	auipc	a3,0xa
ffffffffc0201d20:	66c68693          	addi	a3,a3,1644 # ffffffffc020c388 <commands+0xcd0>
ffffffffc0201d24:	0000a617          	auipc	a2,0xa
ffffffffc0201d28:	ba460613          	addi	a2,a2,-1116 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0201d2c:	04800593          	li	a1,72
ffffffffc0201d30:	0000a517          	auipc	a0,0xa
ffffffffc0201d34:	2e850513          	addi	a0,a0,744 # ffffffffc020c018 <commands+0x960>
ffffffffc0201d38:	f66fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201d3c:	0000a697          	auipc	a3,0xa
ffffffffc0201d40:	61c68693          	addi	a3,a3,1564 # ffffffffc020c358 <commands+0xca0>
ffffffffc0201d44:	0000a617          	auipc	a2,0xa
ffffffffc0201d48:	b8460613          	addi	a2,a2,-1148 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0201d4c:	04500593          	li	a1,69
ffffffffc0201d50:	0000a517          	auipc	a0,0xa
ffffffffc0201d54:	2c850513          	addi	a0,a0,712 # ffffffffc020c018 <commands+0x960>
ffffffffc0201d58:	f46fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201d5c <slob_free>:
ffffffffc0201d5c:	c94d                	beqz	a0,ffffffffc0201e0e <slob_free+0xb2>
ffffffffc0201d5e:	1141                	addi	sp,sp,-16
ffffffffc0201d60:	e022                	sd	s0,0(sp)
ffffffffc0201d62:	e406                	sd	ra,8(sp)
ffffffffc0201d64:	842a                	mv	s0,a0
ffffffffc0201d66:	e9c1                	bnez	a1,ffffffffc0201df6 <slob_free+0x9a>
ffffffffc0201d68:	100027f3          	csrr	a5,sstatus
ffffffffc0201d6c:	8b89                	andi	a5,a5,2
ffffffffc0201d6e:	4501                	li	a0,0
ffffffffc0201d70:	ebd9                	bnez	a5,ffffffffc0201e06 <slob_free+0xaa>
ffffffffc0201d72:	0008f617          	auipc	a2,0x8f
ffffffffc0201d76:	2de60613          	addi	a2,a2,734 # ffffffffc0291050 <slobfree>
ffffffffc0201d7a:	621c                	ld	a5,0(a2)
ffffffffc0201d7c:	873e                	mv	a4,a5
ffffffffc0201d7e:	679c                	ld	a5,8(a5)
ffffffffc0201d80:	02877a63          	bgeu	a4,s0,ffffffffc0201db4 <slob_free+0x58>
ffffffffc0201d84:	00f46463          	bltu	s0,a5,ffffffffc0201d8c <slob_free+0x30>
ffffffffc0201d88:	fef76ae3          	bltu	a4,a5,ffffffffc0201d7c <slob_free+0x20>
ffffffffc0201d8c:	400c                	lw	a1,0(s0)
ffffffffc0201d8e:	00459693          	slli	a3,a1,0x4
ffffffffc0201d92:	96a2                	add	a3,a3,s0
ffffffffc0201d94:	02d78a63          	beq	a5,a3,ffffffffc0201dc8 <slob_free+0x6c>
ffffffffc0201d98:	4314                	lw	a3,0(a4)
ffffffffc0201d9a:	e41c                	sd	a5,8(s0)
ffffffffc0201d9c:	00469793          	slli	a5,a3,0x4
ffffffffc0201da0:	97ba                	add	a5,a5,a4
ffffffffc0201da2:	02f40e63          	beq	s0,a5,ffffffffc0201dde <slob_free+0x82>
ffffffffc0201da6:	e700                	sd	s0,8(a4)
ffffffffc0201da8:	e218                	sd	a4,0(a2)
ffffffffc0201daa:	e129                	bnez	a0,ffffffffc0201dec <slob_free+0x90>
ffffffffc0201dac:	60a2                	ld	ra,8(sp)
ffffffffc0201dae:	6402                	ld	s0,0(sp)
ffffffffc0201db0:	0141                	addi	sp,sp,16
ffffffffc0201db2:	8082                	ret
ffffffffc0201db4:	fcf764e3          	bltu	a4,a5,ffffffffc0201d7c <slob_free+0x20>
ffffffffc0201db8:	fcf472e3          	bgeu	s0,a5,ffffffffc0201d7c <slob_free+0x20>
ffffffffc0201dbc:	400c                	lw	a1,0(s0)
ffffffffc0201dbe:	00459693          	slli	a3,a1,0x4
ffffffffc0201dc2:	96a2                	add	a3,a3,s0
ffffffffc0201dc4:	fcd79ae3          	bne	a5,a3,ffffffffc0201d98 <slob_free+0x3c>
ffffffffc0201dc8:	4394                	lw	a3,0(a5)
ffffffffc0201dca:	679c                	ld	a5,8(a5)
ffffffffc0201dcc:	9db5                	addw	a1,a1,a3
ffffffffc0201dce:	c00c                	sw	a1,0(s0)
ffffffffc0201dd0:	4314                	lw	a3,0(a4)
ffffffffc0201dd2:	e41c                	sd	a5,8(s0)
ffffffffc0201dd4:	00469793          	slli	a5,a3,0x4
ffffffffc0201dd8:	97ba                	add	a5,a5,a4
ffffffffc0201dda:	fcf416e3          	bne	s0,a5,ffffffffc0201da6 <slob_free+0x4a>
ffffffffc0201dde:	401c                	lw	a5,0(s0)
ffffffffc0201de0:	640c                	ld	a1,8(s0)
ffffffffc0201de2:	e218                	sd	a4,0(a2)
ffffffffc0201de4:	9ebd                	addw	a3,a3,a5
ffffffffc0201de6:	c314                	sw	a3,0(a4)
ffffffffc0201de8:	e70c                	sd	a1,8(a4)
ffffffffc0201dea:	d169                	beqz	a0,ffffffffc0201dac <slob_free+0x50>
ffffffffc0201dec:	6402                	ld	s0,0(sp)
ffffffffc0201dee:	60a2                	ld	ra,8(sp)
ffffffffc0201df0:	0141                	addi	sp,sp,16
ffffffffc0201df2:	e7bfe06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0201df6:	25bd                	addiw	a1,a1,15
ffffffffc0201df8:	8191                	srli	a1,a1,0x4
ffffffffc0201dfa:	c10c                	sw	a1,0(a0)
ffffffffc0201dfc:	100027f3          	csrr	a5,sstatus
ffffffffc0201e00:	8b89                	andi	a5,a5,2
ffffffffc0201e02:	4501                	li	a0,0
ffffffffc0201e04:	d7bd                	beqz	a5,ffffffffc0201d72 <slob_free+0x16>
ffffffffc0201e06:	e6dfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201e0a:	4505                	li	a0,1
ffffffffc0201e0c:	b79d                	j	ffffffffc0201d72 <slob_free+0x16>
ffffffffc0201e0e:	8082                	ret

ffffffffc0201e10 <__slob_get_free_pages.constprop.0>:
ffffffffc0201e10:	4785                	li	a5,1
ffffffffc0201e12:	1141                	addi	sp,sp,-16
ffffffffc0201e14:	00a7953b          	sllw	a0,a5,a0
ffffffffc0201e18:	e406                	sd	ra,8(sp)
ffffffffc0201e1a:	352000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201e1e:	c91d                	beqz	a0,ffffffffc0201e54 <__slob_get_free_pages.constprop.0+0x44>
ffffffffc0201e20:	00095697          	auipc	a3,0x95
ffffffffc0201e24:	a886b683          	ld	a3,-1400(a3) # ffffffffc02968a8 <pages>
ffffffffc0201e28:	8d15                	sub	a0,a0,a3
ffffffffc0201e2a:	8519                	srai	a0,a0,0x6
ffffffffc0201e2c:	0000e697          	auipc	a3,0xe
ffffffffc0201e30:	8fc6b683          	ld	a3,-1796(a3) # ffffffffc020f728 <nbase>
ffffffffc0201e34:	9536                	add	a0,a0,a3
ffffffffc0201e36:	00c51793          	slli	a5,a0,0xc
ffffffffc0201e3a:	83b1                	srli	a5,a5,0xc
ffffffffc0201e3c:	00095717          	auipc	a4,0x95
ffffffffc0201e40:	a6473703          	ld	a4,-1436(a4) # ffffffffc02968a0 <npage>
ffffffffc0201e44:	0532                	slli	a0,a0,0xc
ffffffffc0201e46:	00e7fa63          	bgeu	a5,a4,ffffffffc0201e5a <__slob_get_free_pages.constprop.0+0x4a>
ffffffffc0201e4a:	00095697          	auipc	a3,0x95
ffffffffc0201e4e:	a6e6b683          	ld	a3,-1426(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0201e52:	9536                	add	a0,a0,a3
ffffffffc0201e54:	60a2                	ld	ra,8(sp)
ffffffffc0201e56:	0141                	addi	sp,sp,16
ffffffffc0201e58:	8082                	ret
ffffffffc0201e5a:	86aa                	mv	a3,a0
ffffffffc0201e5c:	0000a617          	auipc	a2,0xa
ffffffffc0201e60:	58c60613          	addi	a2,a2,1420 # ffffffffc020c3e8 <default_pmm_manager+0x38>
ffffffffc0201e64:	07100593          	li	a1,113
ffffffffc0201e68:	0000a517          	auipc	a0,0xa
ffffffffc0201e6c:	5a850513          	addi	a0,a0,1448 # ffffffffc020c410 <default_pmm_manager+0x60>
ffffffffc0201e70:	e2efe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201e74 <slob_alloc.constprop.0>:
ffffffffc0201e74:	1101                	addi	sp,sp,-32
ffffffffc0201e76:	ec06                	sd	ra,24(sp)
ffffffffc0201e78:	e822                	sd	s0,16(sp)
ffffffffc0201e7a:	e426                	sd	s1,8(sp)
ffffffffc0201e7c:	e04a                	sd	s2,0(sp)
ffffffffc0201e7e:	01050713          	addi	a4,a0,16
ffffffffc0201e82:	6785                	lui	a5,0x1
ffffffffc0201e84:	0cf77363          	bgeu	a4,a5,ffffffffc0201f4a <slob_alloc.constprop.0+0xd6>
ffffffffc0201e88:	00f50493          	addi	s1,a0,15
ffffffffc0201e8c:	8091                	srli	s1,s1,0x4
ffffffffc0201e8e:	2481                	sext.w	s1,s1
ffffffffc0201e90:	10002673          	csrr	a2,sstatus
ffffffffc0201e94:	8a09                	andi	a2,a2,2
ffffffffc0201e96:	e25d                	bnez	a2,ffffffffc0201f3c <slob_alloc.constprop.0+0xc8>
ffffffffc0201e98:	0008f917          	auipc	s2,0x8f
ffffffffc0201e9c:	1b890913          	addi	s2,s2,440 # ffffffffc0291050 <slobfree>
ffffffffc0201ea0:	00093683          	ld	a3,0(s2)
ffffffffc0201ea4:	669c                	ld	a5,8(a3)
ffffffffc0201ea6:	4398                	lw	a4,0(a5)
ffffffffc0201ea8:	08975e63          	bge	a4,s1,ffffffffc0201f44 <slob_alloc.constprop.0+0xd0>
ffffffffc0201eac:	00f68b63          	beq	a3,a5,ffffffffc0201ec2 <slob_alloc.constprop.0+0x4e>
ffffffffc0201eb0:	6780                	ld	s0,8(a5)
ffffffffc0201eb2:	4018                	lw	a4,0(s0)
ffffffffc0201eb4:	02975a63          	bge	a4,s1,ffffffffc0201ee8 <slob_alloc.constprop.0+0x74>
ffffffffc0201eb8:	00093683          	ld	a3,0(s2)
ffffffffc0201ebc:	87a2                	mv	a5,s0
ffffffffc0201ebe:	fef699e3          	bne	a3,a5,ffffffffc0201eb0 <slob_alloc.constprop.0+0x3c>
ffffffffc0201ec2:	ee31                	bnez	a2,ffffffffc0201f1e <slob_alloc.constprop.0+0xaa>
ffffffffc0201ec4:	4501                	li	a0,0
ffffffffc0201ec6:	f4bff0ef          	jal	ra,ffffffffc0201e10 <__slob_get_free_pages.constprop.0>
ffffffffc0201eca:	842a                	mv	s0,a0
ffffffffc0201ecc:	cd05                	beqz	a0,ffffffffc0201f04 <slob_alloc.constprop.0+0x90>
ffffffffc0201ece:	6585                	lui	a1,0x1
ffffffffc0201ed0:	e8dff0ef          	jal	ra,ffffffffc0201d5c <slob_free>
ffffffffc0201ed4:	10002673          	csrr	a2,sstatus
ffffffffc0201ed8:	8a09                	andi	a2,a2,2
ffffffffc0201eda:	ee05                	bnez	a2,ffffffffc0201f12 <slob_alloc.constprop.0+0x9e>
ffffffffc0201edc:	00093783          	ld	a5,0(s2)
ffffffffc0201ee0:	6780                	ld	s0,8(a5)
ffffffffc0201ee2:	4018                	lw	a4,0(s0)
ffffffffc0201ee4:	fc974ae3          	blt	a4,s1,ffffffffc0201eb8 <slob_alloc.constprop.0+0x44>
ffffffffc0201ee8:	04e48763          	beq	s1,a4,ffffffffc0201f36 <slob_alloc.constprop.0+0xc2>
ffffffffc0201eec:	00449693          	slli	a3,s1,0x4
ffffffffc0201ef0:	96a2                	add	a3,a3,s0
ffffffffc0201ef2:	e794                	sd	a3,8(a5)
ffffffffc0201ef4:	640c                	ld	a1,8(s0)
ffffffffc0201ef6:	9f05                	subw	a4,a4,s1
ffffffffc0201ef8:	c298                	sw	a4,0(a3)
ffffffffc0201efa:	e68c                	sd	a1,8(a3)
ffffffffc0201efc:	c004                	sw	s1,0(s0)
ffffffffc0201efe:	00f93023          	sd	a5,0(s2)
ffffffffc0201f02:	e20d                	bnez	a2,ffffffffc0201f24 <slob_alloc.constprop.0+0xb0>
ffffffffc0201f04:	60e2                	ld	ra,24(sp)
ffffffffc0201f06:	8522                	mv	a0,s0
ffffffffc0201f08:	6442                	ld	s0,16(sp)
ffffffffc0201f0a:	64a2                	ld	s1,8(sp)
ffffffffc0201f0c:	6902                	ld	s2,0(sp)
ffffffffc0201f0e:	6105                	addi	sp,sp,32
ffffffffc0201f10:	8082                	ret
ffffffffc0201f12:	d61fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201f16:	00093783          	ld	a5,0(s2)
ffffffffc0201f1a:	4605                	li	a2,1
ffffffffc0201f1c:	b7d1                	j	ffffffffc0201ee0 <slob_alloc.constprop.0+0x6c>
ffffffffc0201f1e:	d4ffe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0201f22:	b74d                	j	ffffffffc0201ec4 <slob_alloc.constprop.0+0x50>
ffffffffc0201f24:	d49fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0201f28:	60e2                	ld	ra,24(sp)
ffffffffc0201f2a:	8522                	mv	a0,s0
ffffffffc0201f2c:	6442                	ld	s0,16(sp)
ffffffffc0201f2e:	64a2                	ld	s1,8(sp)
ffffffffc0201f30:	6902                	ld	s2,0(sp)
ffffffffc0201f32:	6105                	addi	sp,sp,32
ffffffffc0201f34:	8082                	ret
ffffffffc0201f36:	6418                	ld	a4,8(s0)
ffffffffc0201f38:	e798                	sd	a4,8(a5)
ffffffffc0201f3a:	b7d1                	j	ffffffffc0201efe <slob_alloc.constprop.0+0x8a>
ffffffffc0201f3c:	d37fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201f40:	4605                	li	a2,1
ffffffffc0201f42:	bf99                	j	ffffffffc0201e98 <slob_alloc.constprop.0+0x24>
ffffffffc0201f44:	843e                	mv	s0,a5
ffffffffc0201f46:	87b6                	mv	a5,a3
ffffffffc0201f48:	b745                	j	ffffffffc0201ee8 <slob_alloc.constprop.0+0x74>
ffffffffc0201f4a:	0000a697          	auipc	a3,0xa
ffffffffc0201f4e:	4d668693          	addi	a3,a3,1238 # ffffffffc020c420 <default_pmm_manager+0x70>
ffffffffc0201f52:	0000a617          	auipc	a2,0xa
ffffffffc0201f56:	97660613          	addi	a2,a2,-1674 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0201f5a:	06300593          	li	a1,99
ffffffffc0201f5e:	0000a517          	auipc	a0,0xa
ffffffffc0201f62:	4e250513          	addi	a0,a0,1250 # ffffffffc020c440 <default_pmm_manager+0x90>
ffffffffc0201f66:	d38fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201f6a <kmalloc_init>:
ffffffffc0201f6a:	1141                	addi	sp,sp,-16
ffffffffc0201f6c:	0000a517          	auipc	a0,0xa
ffffffffc0201f70:	4ec50513          	addi	a0,a0,1260 # ffffffffc020c458 <default_pmm_manager+0xa8>
ffffffffc0201f74:	e406                	sd	ra,8(sp)
ffffffffc0201f76:	a30fe0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0201f7a:	60a2                	ld	ra,8(sp)
ffffffffc0201f7c:	0000a517          	auipc	a0,0xa
ffffffffc0201f80:	4f450513          	addi	a0,a0,1268 # ffffffffc020c470 <default_pmm_manager+0xc0>
ffffffffc0201f84:	0141                	addi	sp,sp,16
ffffffffc0201f86:	a20fe06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0201f8a <kallocated>:
ffffffffc0201f8a:	4501                	li	a0,0
ffffffffc0201f8c:	8082                	ret

ffffffffc0201f8e <kmalloc>:
ffffffffc0201f8e:	1101                	addi	sp,sp,-32
ffffffffc0201f90:	e04a                	sd	s2,0(sp)
ffffffffc0201f92:	6905                	lui	s2,0x1
ffffffffc0201f94:	e822                	sd	s0,16(sp)
ffffffffc0201f96:	ec06                	sd	ra,24(sp)
ffffffffc0201f98:	e426                	sd	s1,8(sp)
ffffffffc0201f9a:	fef90793          	addi	a5,s2,-17 # fef <_binary_bin_swap_img_size-0x6d11>
ffffffffc0201f9e:	842a                	mv	s0,a0
ffffffffc0201fa0:	04a7f963          	bgeu	a5,a0,ffffffffc0201ff2 <kmalloc+0x64>
ffffffffc0201fa4:	4561                	li	a0,24
ffffffffc0201fa6:	ecfff0ef          	jal	ra,ffffffffc0201e74 <slob_alloc.constprop.0>
ffffffffc0201faa:	84aa                	mv	s1,a0
ffffffffc0201fac:	c929                	beqz	a0,ffffffffc0201ffe <kmalloc+0x70>
ffffffffc0201fae:	0004079b          	sext.w	a5,s0
ffffffffc0201fb2:	4501                	li	a0,0
ffffffffc0201fb4:	00f95763          	bge	s2,a5,ffffffffc0201fc2 <kmalloc+0x34>
ffffffffc0201fb8:	6705                	lui	a4,0x1
ffffffffc0201fba:	8785                	srai	a5,a5,0x1
ffffffffc0201fbc:	2505                	addiw	a0,a0,1
ffffffffc0201fbe:	fef74ee3          	blt	a4,a5,ffffffffc0201fba <kmalloc+0x2c>
ffffffffc0201fc2:	c088                	sw	a0,0(s1)
ffffffffc0201fc4:	e4dff0ef          	jal	ra,ffffffffc0201e10 <__slob_get_free_pages.constprop.0>
ffffffffc0201fc8:	e488                	sd	a0,8(s1)
ffffffffc0201fca:	842a                	mv	s0,a0
ffffffffc0201fcc:	c525                	beqz	a0,ffffffffc0202034 <kmalloc+0xa6>
ffffffffc0201fce:	100027f3          	csrr	a5,sstatus
ffffffffc0201fd2:	8b89                	andi	a5,a5,2
ffffffffc0201fd4:	ef8d                	bnez	a5,ffffffffc020200e <kmalloc+0x80>
ffffffffc0201fd6:	00095797          	auipc	a5,0x95
ffffffffc0201fda:	8b278793          	addi	a5,a5,-1870 # ffffffffc0296888 <bigblocks>
ffffffffc0201fde:	6398                	ld	a4,0(a5)
ffffffffc0201fe0:	e384                	sd	s1,0(a5)
ffffffffc0201fe2:	e898                	sd	a4,16(s1)
ffffffffc0201fe4:	60e2                	ld	ra,24(sp)
ffffffffc0201fe6:	8522                	mv	a0,s0
ffffffffc0201fe8:	6442                	ld	s0,16(sp)
ffffffffc0201fea:	64a2                	ld	s1,8(sp)
ffffffffc0201fec:	6902                	ld	s2,0(sp)
ffffffffc0201fee:	6105                	addi	sp,sp,32
ffffffffc0201ff0:	8082                	ret
ffffffffc0201ff2:	0541                	addi	a0,a0,16
ffffffffc0201ff4:	e81ff0ef          	jal	ra,ffffffffc0201e74 <slob_alloc.constprop.0>
ffffffffc0201ff8:	01050413          	addi	s0,a0,16
ffffffffc0201ffc:	f565                	bnez	a0,ffffffffc0201fe4 <kmalloc+0x56>
ffffffffc0201ffe:	4401                	li	s0,0
ffffffffc0202000:	60e2                	ld	ra,24(sp)
ffffffffc0202002:	8522                	mv	a0,s0
ffffffffc0202004:	6442                	ld	s0,16(sp)
ffffffffc0202006:	64a2                	ld	s1,8(sp)
ffffffffc0202008:	6902                	ld	s2,0(sp)
ffffffffc020200a:	6105                	addi	sp,sp,32
ffffffffc020200c:	8082                	ret
ffffffffc020200e:	c65fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202012:	00095797          	auipc	a5,0x95
ffffffffc0202016:	87678793          	addi	a5,a5,-1930 # ffffffffc0296888 <bigblocks>
ffffffffc020201a:	6398                	ld	a4,0(a5)
ffffffffc020201c:	e384                	sd	s1,0(a5)
ffffffffc020201e:	e898                	sd	a4,16(s1)
ffffffffc0202020:	c4dfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202024:	6480                	ld	s0,8(s1)
ffffffffc0202026:	60e2                	ld	ra,24(sp)
ffffffffc0202028:	64a2                	ld	s1,8(sp)
ffffffffc020202a:	8522                	mv	a0,s0
ffffffffc020202c:	6442                	ld	s0,16(sp)
ffffffffc020202e:	6902                	ld	s2,0(sp)
ffffffffc0202030:	6105                	addi	sp,sp,32
ffffffffc0202032:	8082                	ret
ffffffffc0202034:	45e1                	li	a1,24
ffffffffc0202036:	8526                	mv	a0,s1
ffffffffc0202038:	d25ff0ef          	jal	ra,ffffffffc0201d5c <slob_free>
ffffffffc020203c:	b765                	j	ffffffffc0201fe4 <kmalloc+0x56>

ffffffffc020203e <kfree>:
ffffffffc020203e:	c169                	beqz	a0,ffffffffc0202100 <kfree+0xc2>
ffffffffc0202040:	1101                	addi	sp,sp,-32
ffffffffc0202042:	e822                	sd	s0,16(sp)
ffffffffc0202044:	ec06                	sd	ra,24(sp)
ffffffffc0202046:	e426                	sd	s1,8(sp)
ffffffffc0202048:	03451793          	slli	a5,a0,0x34
ffffffffc020204c:	842a                	mv	s0,a0
ffffffffc020204e:	e3d9                	bnez	a5,ffffffffc02020d4 <kfree+0x96>
ffffffffc0202050:	100027f3          	csrr	a5,sstatus
ffffffffc0202054:	8b89                	andi	a5,a5,2
ffffffffc0202056:	e7d9                	bnez	a5,ffffffffc02020e4 <kfree+0xa6>
ffffffffc0202058:	00095797          	auipc	a5,0x95
ffffffffc020205c:	8307b783          	ld	a5,-2000(a5) # ffffffffc0296888 <bigblocks>
ffffffffc0202060:	4601                	li	a2,0
ffffffffc0202062:	cbad                	beqz	a5,ffffffffc02020d4 <kfree+0x96>
ffffffffc0202064:	00095697          	auipc	a3,0x95
ffffffffc0202068:	82468693          	addi	a3,a3,-2012 # ffffffffc0296888 <bigblocks>
ffffffffc020206c:	a021                	j	ffffffffc0202074 <kfree+0x36>
ffffffffc020206e:	01048693          	addi	a3,s1,16
ffffffffc0202072:	c3a5                	beqz	a5,ffffffffc02020d2 <kfree+0x94>
ffffffffc0202074:	6798                	ld	a4,8(a5)
ffffffffc0202076:	84be                	mv	s1,a5
ffffffffc0202078:	6b9c                	ld	a5,16(a5)
ffffffffc020207a:	fe871ae3          	bne	a4,s0,ffffffffc020206e <kfree+0x30>
ffffffffc020207e:	e29c                	sd	a5,0(a3)
ffffffffc0202080:	ee2d                	bnez	a2,ffffffffc02020fa <kfree+0xbc>
ffffffffc0202082:	c02007b7          	lui	a5,0xc0200
ffffffffc0202086:	4098                	lw	a4,0(s1)
ffffffffc0202088:	08f46963          	bltu	s0,a5,ffffffffc020211a <kfree+0xdc>
ffffffffc020208c:	00095697          	auipc	a3,0x95
ffffffffc0202090:	82c6b683          	ld	a3,-2004(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0202094:	8c15                	sub	s0,s0,a3
ffffffffc0202096:	8031                	srli	s0,s0,0xc
ffffffffc0202098:	00095797          	auipc	a5,0x95
ffffffffc020209c:	8087b783          	ld	a5,-2040(a5) # ffffffffc02968a0 <npage>
ffffffffc02020a0:	06f47163          	bgeu	s0,a5,ffffffffc0202102 <kfree+0xc4>
ffffffffc02020a4:	0000d517          	auipc	a0,0xd
ffffffffc02020a8:	68453503          	ld	a0,1668(a0) # ffffffffc020f728 <nbase>
ffffffffc02020ac:	8c09                	sub	s0,s0,a0
ffffffffc02020ae:	041a                	slli	s0,s0,0x6
ffffffffc02020b0:	00094517          	auipc	a0,0x94
ffffffffc02020b4:	7f853503          	ld	a0,2040(a0) # ffffffffc02968a8 <pages>
ffffffffc02020b8:	4585                	li	a1,1
ffffffffc02020ba:	9522                	add	a0,a0,s0
ffffffffc02020bc:	00e595bb          	sllw	a1,a1,a4
ffffffffc02020c0:	0ea000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02020c4:	6442                	ld	s0,16(sp)
ffffffffc02020c6:	60e2                	ld	ra,24(sp)
ffffffffc02020c8:	8526                	mv	a0,s1
ffffffffc02020ca:	64a2                	ld	s1,8(sp)
ffffffffc02020cc:	45e1                	li	a1,24
ffffffffc02020ce:	6105                	addi	sp,sp,32
ffffffffc02020d0:	b171                	j	ffffffffc0201d5c <slob_free>
ffffffffc02020d2:	e20d                	bnez	a2,ffffffffc02020f4 <kfree+0xb6>
ffffffffc02020d4:	ff040513          	addi	a0,s0,-16
ffffffffc02020d8:	6442                	ld	s0,16(sp)
ffffffffc02020da:	60e2                	ld	ra,24(sp)
ffffffffc02020dc:	64a2                	ld	s1,8(sp)
ffffffffc02020de:	4581                	li	a1,0
ffffffffc02020e0:	6105                	addi	sp,sp,32
ffffffffc02020e2:	b9ad                	j	ffffffffc0201d5c <slob_free>
ffffffffc02020e4:	b8ffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02020e8:	00094797          	auipc	a5,0x94
ffffffffc02020ec:	7a07b783          	ld	a5,1952(a5) # ffffffffc0296888 <bigblocks>
ffffffffc02020f0:	4605                	li	a2,1
ffffffffc02020f2:	fbad                	bnez	a5,ffffffffc0202064 <kfree+0x26>
ffffffffc02020f4:	b79fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02020f8:	bff1                	j	ffffffffc02020d4 <kfree+0x96>
ffffffffc02020fa:	b73fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02020fe:	b751                	j	ffffffffc0202082 <kfree+0x44>
ffffffffc0202100:	8082                	ret
ffffffffc0202102:	0000a617          	auipc	a2,0xa
ffffffffc0202106:	3b660613          	addi	a2,a2,950 # ffffffffc020c4b8 <default_pmm_manager+0x108>
ffffffffc020210a:	06900593          	li	a1,105
ffffffffc020210e:	0000a517          	auipc	a0,0xa
ffffffffc0202112:	30250513          	addi	a0,a0,770 # ffffffffc020c410 <default_pmm_manager+0x60>
ffffffffc0202116:	b88fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020211a:	86a2                	mv	a3,s0
ffffffffc020211c:	0000a617          	auipc	a2,0xa
ffffffffc0202120:	37460613          	addi	a2,a2,884 # ffffffffc020c490 <default_pmm_manager+0xe0>
ffffffffc0202124:	07700593          	li	a1,119
ffffffffc0202128:	0000a517          	auipc	a0,0xa
ffffffffc020212c:	2e850513          	addi	a0,a0,744 # ffffffffc020c410 <default_pmm_manager+0x60>
ffffffffc0202130:	b6efe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202134 <pa2page.part.0>:
ffffffffc0202134:	1141                	addi	sp,sp,-16
ffffffffc0202136:	0000a617          	auipc	a2,0xa
ffffffffc020213a:	38260613          	addi	a2,a2,898 # ffffffffc020c4b8 <default_pmm_manager+0x108>
ffffffffc020213e:	06900593          	li	a1,105
ffffffffc0202142:	0000a517          	auipc	a0,0xa
ffffffffc0202146:	2ce50513          	addi	a0,a0,718 # ffffffffc020c410 <default_pmm_manager+0x60>
ffffffffc020214a:	e406                	sd	ra,8(sp)
ffffffffc020214c:	b52fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202150 <pte2page.part.0>:
ffffffffc0202150:	1141                	addi	sp,sp,-16
ffffffffc0202152:	0000a617          	auipc	a2,0xa
ffffffffc0202156:	38660613          	addi	a2,a2,902 # ffffffffc020c4d8 <default_pmm_manager+0x128>
ffffffffc020215a:	07f00593          	li	a1,127
ffffffffc020215e:	0000a517          	auipc	a0,0xa
ffffffffc0202162:	2b250513          	addi	a0,a0,690 # ffffffffc020c410 <default_pmm_manager+0x60>
ffffffffc0202166:	e406                	sd	ra,8(sp)
ffffffffc0202168:	b36fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020216c <alloc_pages>:
ffffffffc020216c:	100027f3          	csrr	a5,sstatus
ffffffffc0202170:	8b89                	andi	a5,a5,2
ffffffffc0202172:	e799                	bnez	a5,ffffffffc0202180 <alloc_pages+0x14>
ffffffffc0202174:	00094797          	auipc	a5,0x94
ffffffffc0202178:	73c7b783          	ld	a5,1852(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020217c:	6f9c                	ld	a5,24(a5)
ffffffffc020217e:	8782                	jr	a5
ffffffffc0202180:	1141                	addi	sp,sp,-16
ffffffffc0202182:	e406                	sd	ra,8(sp)
ffffffffc0202184:	e022                	sd	s0,0(sp)
ffffffffc0202186:	842a                	mv	s0,a0
ffffffffc0202188:	aebfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020218c:	00094797          	auipc	a5,0x94
ffffffffc0202190:	7247b783          	ld	a5,1828(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202194:	6f9c                	ld	a5,24(a5)
ffffffffc0202196:	8522                	mv	a0,s0
ffffffffc0202198:	9782                	jalr	a5
ffffffffc020219a:	842a                	mv	s0,a0
ffffffffc020219c:	ad1fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02021a0:	60a2                	ld	ra,8(sp)
ffffffffc02021a2:	8522                	mv	a0,s0
ffffffffc02021a4:	6402                	ld	s0,0(sp)
ffffffffc02021a6:	0141                	addi	sp,sp,16
ffffffffc02021a8:	8082                	ret

ffffffffc02021aa <free_pages>:
ffffffffc02021aa:	100027f3          	csrr	a5,sstatus
ffffffffc02021ae:	8b89                	andi	a5,a5,2
ffffffffc02021b0:	e799                	bnez	a5,ffffffffc02021be <free_pages+0x14>
ffffffffc02021b2:	00094797          	auipc	a5,0x94
ffffffffc02021b6:	6fe7b783          	ld	a5,1790(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02021ba:	739c                	ld	a5,32(a5)
ffffffffc02021bc:	8782                	jr	a5
ffffffffc02021be:	1101                	addi	sp,sp,-32
ffffffffc02021c0:	ec06                	sd	ra,24(sp)
ffffffffc02021c2:	e822                	sd	s0,16(sp)
ffffffffc02021c4:	e426                	sd	s1,8(sp)
ffffffffc02021c6:	842a                	mv	s0,a0
ffffffffc02021c8:	84ae                	mv	s1,a1
ffffffffc02021ca:	aa9fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02021ce:	00094797          	auipc	a5,0x94
ffffffffc02021d2:	6e27b783          	ld	a5,1762(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02021d6:	739c                	ld	a5,32(a5)
ffffffffc02021d8:	85a6                	mv	a1,s1
ffffffffc02021da:	8522                	mv	a0,s0
ffffffffc02021dc:	9782                	jalr	a5
ffffffffc02021de:	6442                	ld	s0,16(sp)
ffffffffc02021e0:	60e2                	ld	ra,24(sp)
ffffffffc02021e2:	64a2                	ld	s1,8(sp)
ffffffffc02021e4:	6105                	addi	sp,sp,32
ffffffffc02021e6:	a87fe06f          	j	ffffffffc0200c6c <intr_enable>

ffffffffc02021ea <nr_free_pages>:
ffffffffc02021ea:	100027f3          	csrr	a5,sstatus
ffffffffc02021ee:	8b89                	andi	a5,a5,2
ffffffffc02021f0:	e799                	bnez	a5,ffffffffc02021fe <nr_free_pages+0x14>
ffffffffc02021f2:	00094797          	auipc	a5,0x94
ffffffffc02021f6:	6be7b783          	ld	a5,1726(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02021fa:	779c                	ld	a5,40(a5)
ffffffffc02021fc:	8782                	jr	a5
ffffffffc02021fe:	1141                	addi	sp,sp,-16
ffffffffc0202200:	e406                	sd	ra,8(sp)
ffffffffc0202202:	e022                	sd	s0,0(sp)
ffffffffc0202204:	a6ffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202208:	00094797          	auipc	a5,0x94
ffffffffc020220c:	6a87b783          	ld	a5,1704(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202210:	779c                	ld	a5,40(a5)
ffffffffc0202212:	9782                	jalr	a5
ffffffffc0202214:	842a                	mv	s0,a0
ffffffffc0202216:	a57fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020221a:	60a2                	ld	ra,8(sp)
ffffffffc020221c:	8522                	mv	a0,s0
ffffffffc020221e:	6402                	ld	s0,0(sp)
ffffffffc0202220:	0141                	addi	sp,sp,16
ffffffffc0202222:	8082                	ret

ffffffffc0202224 <get_pte>:
ffffffffc0202224:	01e5d793          	srli	a5,a1,0x1e
ffffffffc0202228:	1ff7f793          	andi	a5,a5,511
ffffffffc020222c:	7139                	addi	sp,sp,-64
ffffffffc020222e:	078e                	slli	a5,a5,0x3
ffffffffc0202230:	f426                	sd	s1,40(sp)
ffffffffc0202232:	00f504b3          	add	s1,a0,a5
ffffffffc0202236:	6094                	ld	a3,0(s1)
ffffffffc0202238:	f04a                	sd	s2,32(sp)
ffffffffc020223a:	ec4e                	sd	s3,24(sp)
ffffffffc020223c:	e852                	sd	s4,16(sp)
ffffffffc020223e:	fc06                	sd	ra,56(sp)
ffffffffc0202240:	f822                	sd	s0,48(sp)
ffffffffc0202242:	e456                	sd	s5,8(sp)
ffffffffc0202244:	e05a                	sd	s6,0(sp)
ffffffffc0202246:	0016f793          	andi	a5,a3,1
ffffffffc020224a:	892e                	mv	s2,a1
ffffffffc020224c:	8a32                	mv	s4,a2
ffffffffc020224e:	00094997          	auipc	s3,0x94
ffffffffc0202252:	65298993          	addi	s3,s3,1618 # ffffffffc02968a0 <npage>
ffffffffc0202256:	efbd                	bnez	a5,ffffffffc02022d4 <get_pte+0xb0>
ffffffffc0202258:	14060c63          	beqz	a2,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc020225c:	100027f3          	csrr	a5,sstatus
ffffffffc0202260:	8b89                	andi	a5,a5,2
ffffffffc0202262:	14079963          	bnez	a5,ffffffffc02023b4 <get_pte+0x190>
ffffffffc0202266:	00094797          	auipc	a5,0x94
ffffffffc020226a:	64a7b783          	ld	a5,1610(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020226e:	6f9c                	ld	a5,24(a5)
ffffffffc0202270:	4505                	li	a0,1
ffffffffc0202272:	9782                	jalr	a5
ffffffffc0202274:	842a                	mv	s0,a0
ffffffffc0202276:	12040d63          	beqz	s0,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc020227a:	00094b17          	auipc	s6,0x94
ffffffffc020227e:	62eb0b13          	addi	s6,s6,1582 # ffffffffc02968a8 <pages>
ffffffffc0202282:	000b3503          	ld	a0,0(s6)
ffffffffc0202286:	00080ab7          	lui	s5,0x80
ffffffffc020228a:	00094997          	auipc	s3,0x94
ffffffffc020228e:	61698993          	addi	s3,s3,1558 # ffffffffc02968a0 <npage>
ffffffffc0202292:	40a40533          	sub	a0,s0,a0
ffffffffc0202296:	8519                	srai	a0,a0,0x6
ffffffffc0202298:	9556                	add	a0,a0,s5
ffffffffc020229a:	0009b703          	ld	a4,0(s3)
ffffffffc020229e:	00c51793          	slli	a5,a0,0xc
ffffffffc02022a2:	4685                	li	a3,1
ffffffffc02022a4:	c014                	sw	a3,0(s0)
ffffffffc02022a6:	83b1                	srli	a5,a5,0xc
ffffffffc02022a8:	0532                	slli	a0,a0,0xc
ffffffffc02022aa:	16e7f763          	bgeu	a5,a4,ffffffffc0202418 <get_pte+0x1f4>
ffffffffc02022ae:	00094797          	auipc	a5,0x94
ffffffffc02022b2:	60a7b783          	ld	a5,1546(a5) # ffffffffc02968b8 <va_pa_offset>
ffffffffc02022b6:	6605                	lui	a2,0x1
ffffffffc02022b8:	4581                	li	a1,0
ffffffffc02022ba:	953e                	add	a0,a0,a5
ffffffffc02022bc:	124090ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc02022c0:	000b3683          	ld	a3,0(s6)
ffffffffc02022c4:	40d406b3          	sub	a3,s0,a3
ffffffffc02022c8:	8699                	srai	a3,a3,0x6
ffffffffc02022ca:	96d6                	add	a3,a3,s5
ffffffffc02022cc:	06aa                	slli	a3,a3,0xa
ffffffffc02022ce:	0116e693          	ori	a3,a3,17
ffffffffc02022d2:	e094                	sd	a3,0(s1)
ffffffffc02022d4:	77fd                	lui	a5,0xfffff
ffffffffc02022d6:	068a                	slli	a3,a3,0x2
ffffffffc02022d8:	0009b703          	ld	a4,0(s3)
ffffffffc02022dc:	8efd                	and	a3,a3,a5
ffffffffc02022de:	00c6d793          	srli	a5,a3,0xc
ffffffffc02022e2:	10e7ff63          	bgeu	a5,a4,ffffffffc0202400 <get_pte+0x1dc>
ffffffffc02022e6:	00094a97          	auipc	s5,0x94
ffffffffc02022ea:	5d2a8a93          	addi	s5,s5,1490 # ffffffffc02968b8 <va_pa_offset>
ffffffffc02022ee:	000ab403          	ld	s0,0(s5)
ffffffffc02022f2:	01595793          	srli	a5,s2,0x15
ffffffffc02022f6:	1ff7f793          	andi	a5,a5,511
ffffffffc02022fa:	96a2                	add	a3,a3,s0
ffffffffc02022fc:	00379413          	slli	s0,a5,0x3
ffffffffc0202300:	9436                	add	s0,s0,a3
ffffffffc0202302:	6014                	ld	a3,0(s0)
ffffffffc0202304:	0016f793          	andi	a5,a3,1
ffffffffc0202308:	ebad                	bnez	a5,ffffffffc020237a <get_pte+0x156>
ffffffffc020230a:	0a0a0363          	beqz	s4,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc020230e:	100027f3          	csrr	a5,sstatus
ffffffffc0202312:	8b89                	andi	a5,a5,2
ffffffffc0202314:	efcd                	bnez	a5,ffffffffc02023ce <get_pte+0x1aa>
ffffffffc0202316:	00094797          	auipc	a5,0x94
ffffffffc020231a:	59a7b783          	ld	a5,1434(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020231e:	6f9c                	ld	a5,24(a5)
ffffffffc0202320:	4505                	li	a0,1
ffffffffc0202322:	9782                	jalr	a5
ffffffffc0202324:	84aa                	mv	s1,a0
ffffffffc0202326:	c4c9                	beqz	s1,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc0202328:	00094b17          	auipc	s6,0x94
ffffffffc020232c:	580b0b13          	addi	s6,s6,1408 # ffffffffc02968a8 <pages>
ffffffffc0202330:	000b3503          	ld	a0,0(s6)
ffffffffc0202334:	00080a37          	lui	s4,0x80
ffffffffc0202338:	0009b703          	ld	a4,0(s3)
ffffffffc020233c:	40a48533          	sub	a0,s1,a0
ffffffffc0202340:	8519                	srai	a0,a0,0x6
ffffffffc0202342:	9552                	add	a0,a0,s4
ffffffffc0202344:	00c51793          	slli	a5,a0,0xc
ffffffffc0202348:	4685                	li	a3,1
ffffffffc020234a:	c094                	sw	a3,0(s1)
ffffffffc020234c:	83b1                	srli	a5,a5,0xc
ffffffffc020234e:	0532                	slli	a0,a0,0xc
ffffffffc0202350:	0ee7f163          	bgeu	a5,a4,ffffffffc0202432 <get_pte+0x20e>
ffffffffc0202354:	000ab783          	ld	a5,0(s5)
ffffffffc0202358:	6605                	lui	a2,0x1
ffffffffc020235a:	4581                	li	a1,0
ffffffffc020235c:	953e                	add	a0,a0,a5
ffffffffc020235e:	082090ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc0202362:	000b3683          	ld	a3,0(s6)
ffffffffc0202366:	40d486b3          	sub	a3,s1,a3
ffffffffc020236a:	8699                	srai	a3,a3,0x6
ffffffffc020236c:	96d2                	add	a3,a3,s4
ffffffffc020236e:	06aa                	slli	a3,a3,0xa
ffffffffc0202370:	0116e693          	ori	a3,a3,17
ffffffffc0202374:	e014                	sd	a3,0(s0)
ffffffffc0202376:	0009b703          	ld	a4,0(s3)
ffffffffc020237a:	068a                	slli	a3,a3,0x2
ffffffffc020237c:	757d                	lui	a0,0xfffff
ffffffffc020237e:	8ee9                	and	a3,a3,a0
ffffffffc0202380:	00c6d793          	srli	a5,a3,0xc
ffffffffc0202384:	06e7f263          	bgeu	a5,a4,ffffffffc02023e8 <get_pte+0x1c4>
ffffffffc0202388:	000ab503          	ld	a0,0(s5)
ffffffffc020238c:	00c95913          	srli	s2,s2,0xc
ffffffffc0202390:	1ff97913          	andi	s2,s2,511
ffffffffc0202394:	96aa                	add	a3,a3,a0
ffffffffc0202396:	00391513          	slli	a0,s2,0x3
ffffffffc020239a:	9536                	add	a0,a0,a3
ffffffffc020239c:	70e2                	ld	ra,56(sp)
ffffffffc020239e:	7442                	ld	s0,48(sp)
ffffffffc02023a0:	74a2                	ld	s1,40(sp)
ffffffffc02023a2:	7902                	ld	s2,32(sp)
ffffffffc02023a4:	69e2                	ld	s3,24(sp)
ffffffffc02023a6:	6a42                	ld	s4,16(sp)
ffffffffc02023a8:	6aa2                	ld	s5,8(sp)
ffffffffc02023aa:	6b02                	ld	s6,0(sp)
ffffffffc02023ac:	6121                	addi	sp,sp,64
ffffffffc02023ae:	8082                	ret
ffffffffc02023b0:	4501                	li	a0,0
ffffffffc02023b2:	b7ed                	j	ffffffffc020239c <get_pte+0x178>
ffffffffc02023b4:	8bffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02023b8:	00094797          	auipc	a5,0x94
ffffffffc02023bc:	4f87b783          	ld	a5,1272(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02023c0:	6f9c                	ld	a5,24(a5)
ffffffffc02023c2:	4505                	li	a0,1
ffffffffc02023c4:	9782                	jalr	a5
ffffffffc02023c6:	842a                	mv	s0,a0
ffffffffc02023c8:	8a5fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02023cc:	b56d                	j	ffffffffc0202276 <get_pte+0x52>
ffffffffc02023ce:	8a5fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02023d2:	00094797          	auipc	a5,0x94
ffffffffc02023d6:	4de7b783          	ld	a5,1246(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02023da:	6f9c                	ld	a5,24(a5)
ffffffffc02023dc:	4505                	li	a0,1
ffffffffc02023de:	9782                	jalr	a5
ffffffffc02023e0:	84aa                	mv	s1,a0
ffffffffc02023e2:	88bfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02023e6:	b781                	j	ffffffffc0202326 <get_pte+0x102>
ffffffffc02023e8:	0000a617          	auipc	a2,0xa
ffffffffc02023ec:	00060613          	mv	a2,a2
ffffffffc02023f0:	13200593          	li	a1,306
ffffffffc02023f4:	0000a517          	auipc	a0,0xa
ffffffffc02023f8:	10c50513          	addi	a0,a0,268 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02023fc:	8a2fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202400:	0000a617          	auipc	a2,0xa
ffffffffc0202404:	fe860613          	addi	a2,a2,-24 # ffffffffc020c3e8 <default_pmm_manager+0x38>
ffffffffc0202408:	12500593          	li	a1,293
ffffffffc020240c:	0000a517          	auipc	a0,0xa
ffffffffc0202410:	0f450513          	addi	a0,a0,244 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0202414:	88afe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202418:	86aa                	mv	a3,a0
ffffffffc020241a:	0000a617          	auipc	a2,0xa
ffffffffc020241e:	fce60613          	addi	a2,a2,-50 # ffffffffc020c3e8 <default_pmm_manager+0x38>
ffffffffc0202422:	12100593          	li	a1,289
ffffffffc0202426:	0000a517          	auipc	a0,0xa
ffffffffc020242a:	0da50513          	addi	a0,a0,218 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020242e:	870fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202432:	86aa                	mv	a3,a0
ffffffffc0202434:	0000a617          	auipc	a2,0xa
ffffffffc0202438:	fb460613          	addi	a2,a2,-76 # ffffffffc020c3e8 <default_pmm_manager+0x38>
ffffffffc020243c:	12f00593          	li	a1,303
ffffffffc0202440:	0000a517          	auipc	a0,0xa
ffffffffc0202444:	0c050513          	addi	a0,a0,192 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0202448:	856fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020244c <boot_map_segment>:
ffffffffc020244c:	6785                	lui	a5,0x1
ffffffffc020244e:	7139                	addi	sp,sp,-64
ffffffffc0202450:	00d5c833          	xor	a6,a1,a3
ffffffffc0202454:	17fd                	addi	a5,a5,-1
ffffffffc0202456:	fc06                	sd	ra,56(sp)
ffffffffc0202458:	f822                	sd	s0,48(sp)
ffffffffc020245a:	f426                	sd	s1,40(sp)
ffffffffc020245c:	f04a                	sd	s2,32(sp)
ffffffffc020245e:	ec4e                	sd	s3,24(sp)
ffffffffc0202460:	e852                	sd	s4,16(sp)
ffffffffc0202462:	e456                	sd	s5,8(sp)
ffffffffc0202464:	00f87833          	and	a6,a6,a5
ffffffffc0202468:	08081563          	bnez	a6,ffffffffc02024f2 <boot_map_segment+0xa6>
ffffffffc020246c:	00f5f4b3          	and	s1,a1,a5
ffffffffc0202470:	963e                	add	a2,a2,a5
ffffffffc0202472:	94b2                	add	s1,s1,a2
ffffffffc0202474:	797d                	lui	s2,0xfffff
ffffffffc0202476:	80b1                	srli	s1,s1,0xc
ffffffffc0202478:	0125f5b3          	and	a1,a1,s2
ffffffffc020247c:	0126f6b3          	and	a3,a3,s2
ffffffffc0202480:	c0a1                	beqz	s1,ffffffffc02024c0 <boot_map_segment+0x74>
ffffffffc0202482:	00176713          	ori	a4,a4,1
ffffffffc0202486:	04b2                	slli	s1,s1,0xc
ffffffffc0202488:	02071993          	slli	s3,a4,0x20
ffffffffc020248c:	8a2a                	mv	s4,a0
ffffffffc020248e:	842e                	mv	s0,a1
ffffffffc0202490:	94ae                	add	s1,s1,a1
ffffffffc0202492:	40b68933          	sub	s2,a3,a1
ffffffffc0202496:	0209d993          	srli	s3,s3,0x20
ffffffffc020249a:	6a85                	lui	s5,0x1
ffffffffc020249c:	4605                	li	a2,1
ffffffffc020249e:	85a2                	mv	a1,s0
ffffffffc02024a0:	8552                	mv	a0,s4
ffffffffc02024a2:	d83ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02024a6:	008907b3          	add	a5,s2,s0
ffffffffc02024aa:	c505                	beqz	a0,ffffffffc02024d2 <boot_map_segment+0x86>
ffffffffc02024ac:	83b1                	srli	a5,a5,0xc
ffffffffc02024ae:	07aa                	slli	a5,a5,0xa
ffffffffc02024b0:	0137e7b3          	or	a5,a5,s3
ffffffffc02024b4:	0017e793          	ori	a5,a5,1
ffffffffc02024b8:	e11c                	sd	a5,0(a0)
ffffffffc02024ba:	9456                	add	s0,s0,s5
ffffffffc02024bc:	fe8490e3          	bne	s1,s0,ffffffffc020249c <boot_map_segment+0x50>
ffffffffc02024c0:	70e2                	ld	ra,56(sp)
ffffffffc02024c2:	7442                	ld	s0,48(sp)
ffffffffc02024c4:	74a2                	ld	s1,40(sp)
ffffffffc02024c6:	7902                	ld	s2,32(sp)
ffffffffc02024c8:	69e2                	ld	s3,24(sp)
ffffffffc02024ca:	6a42                	ld	s4,16(sp)
ffffffffc02024cc:	6aa2                	ld	s5,8(sp)
ffffffffc02024ce:	6121                	addi	sp,sp,64
ffffffffc02024d0:	8082                	ret
ffffffffc02024d2:	0000a697          	auipc	a3,0xa
ffffffffc02024d6:	05668693          	addi	a3,a3,86 # ffffffffc020c528 <default_pmm_manager+0x178>
ffffffffc02024da:	00009617          	auipc	a2,0x9
ffffffffc02024de:	3ee60613          	addi	a2,a2,1006 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02024e2:	09c00593          	li	a1,156
ffffffffc02024e6:	0000a517          	auipc	a0,0xa
ffffffffc02024ea:	01a50513          	addi	a0,a0,26 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02024ee:	fb1fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02024f2:	0000a697          	auipc	a3,0xa
ffffffffc02024f6:	01e68693          	addi	a3,a3,30 # ffffffffc020c510 <default_pmm_manager+0x160>
ffffffffc02024fa:	00009617          	auipc	a2,0x9
ffffffffc02024fe:	3ce60613          	addi	a2,a2,974 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0202502:	09500593          	li	a1,149
ffffffffc0202506:	0000a517          	auipc	a0,0xa
ffffffffc020250a:	ffa50513          	addi	a0,a0,-6 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020250e:	f91fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202512 <get_page>:
ffffffffc0202512:	1141                	addi	sp,sp,-16
ffffffffc0202514:	e022                	sd	s0,0(sp)
ffffffffc0202516:	8432                	mv	s0,a2
ffffffffc0202518:	4601                	li	a2,0
ffffffffc020251a:	e406                	sd	ra,8(sp)
ffffffffc020251c:	d09ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202520:	c011                	beqz	s0,ffffffffc0202524 <get_page+0x12>
ffffffffc0202522:	e008                	sd	a0,0(s0)
ffffffffc0202524:	c511                	beqz	a0,ffffffffc0202530 <get_page+0x1e>
ffffffffc0202526:	611c                	ld	a5,0(a0)
ffffffffc0202528:	4501                	li	a0,0
ffffffffc020252a:	0017f713          	andi	a4,a5,1
ffffffffc020252e:	e709                	bnez	a4,ffffffffc0202538 <get_page+0x26>
ffffffffc0202530:	60a2                	ld	ra,8(sp)
ffffffffc0202532:	6402                	ld	s0,0(sp)
ffffffffc0202534:	0141                	addi	sp,sp,16
ffffffffc0202536:	8082                	ret
ffffffffc0202538:	078a                	slli	a5,a5,0x2
ffffffffc020253a:	83b1                	srli	a5,a5,0xc
ffffffffc020253c:	00094717          	auipc	a4,0x94
ffffffffc0202540:	36473703          	ld	a4,868(a4) # ffffffffc02968a0 <npage>
ffffffffc0202544:	00e7ff63          	bgeu	a5,a4,ffffffffc0202562 <get_page+0x50>
ffffffffc0202548:	60a2                	ld	ra,8(sp)
ffffffffc020254a:	6402                	ld	s0,0(sp)
ffffffffc020254c:	fff80537          	lui	a0,0xfff80
ffffffffc0202550:	97aa                	add	a5,a5,a0
ffffffffc0202552:	079a                	slli	a5,a5,0x6
ffffffffc0202554:	00094517          	auipc	a0,0x94
ffffffffc0202558:	35453503          	ld	a0,852(a0) # ffffffffc02968a8 <pages>
ffffffffc020255c:	953e                	add	a0,a0,a5
ffffffffc020255e:	0141                	addi	sp,sp,16
ffffffffc0202560:	8082                	ret
ffffffffc0202562:	bd3ff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc0202566 <unmap_range>:
ffffffffc0202566:	7159                	addi	sp,sp,-112
ffffffffc0202568:	00c5e7b3          	or	a5,a1,a2
ffffffffc020256c:	f486                	sd	ra,104(sp)
ffffffffc020256e:	f0a2                	sd	s0,96(sp)
ffffffffc0202570:	eca6                	sd	s1,88(sp)
ffffffffc0202572:	e8ca                	sd	s2,80(sp)
ffffffffc0202574:	e4ce                	sd	s3,72(sp)
ffffffffc0202576:	e0d2                	sd	s4,64(sp)
ffffffffc0202578:	fc56                	sd	s5,56(sp)
ffffffffc020257a:	f85a                	sd	s6,48(sp)
ffffffffc020257c:	f45e                	sd	s7,40(sp)
ffffffffc020257e:	f062                	sd	s8,32(sp)
ffffffffc0202580:	ec66                	sd	s9,24(sp)
ffffffffc0202582:	e86a                	sd	s10,16(sp)
ffffffffc0202584:	17d2                	slli	a5,a5,0x34
ffffffffc0202586:	e3ed                	bnez	a5,ffffffffc0202668 <unmap_range+0x102>
ffffffffc0202588:	002007b7          	lui	a5,0x200
ffffffffc020258c:	842e                	mv	s0,a1
ffffffffc020258e:	0ef5ed63          	bltu	a1,a5,ffffffffc0202688 <unmap_range+0x122>
ffffffffc0202592:	8932                	mv	s2,a2
ffffffffc0202594:	0ec5fa63          	bgeu	a1,a2,ffffffffc0202688 <unmap_range+0x122>
ffffffffc0202598:	4785                	li	a5,1
ffffffffc020259a:	07fe                	slli	a5,a5,0x1f
ffffffffc020259c:	0ec7e663          	bltu	a5,a2,ffffffffc0202688 <unmap_range+0x122>
ffffffffc02025a0:	89aa                	mv	s3,a0
ffffffffc02025a2:	6a05                	lui	s4,0x1
ffffffffc02025a4:	00094c97          	auipc	s9,0x94
ffffffffc02025a8:	2fcc8c93          	addi	s9,s9,764 # ffffffffc02968a0 <npage>
ffffffffc02025ac:	00094c17          	auipc	s8,0x94
ffffffffc02025b0:	2fcc0c13          	addi	s8,s8,764 # ffffffffc02968a8 <pages>
ffffffffc02025b4:	fff80bb7          	lui	s7,0xfff80
ffffffffc02025b8:	00094d17          	auipc	s10,0x94
ffffffffc02025bc:	2f8d0d13          	addi	s10,s10,760 # ffffffffc02968b0 <pmm_manager>
ffffffffc02025c0:	00200b37          	lui	s6,0x200
ffffffffc02025c4:	ffe00ab7          	lui	s5,0xffe00
ffffffffc02025c8:	4601                	li	a2,0
ffffffffc02025ca:	85a2                	mv	a1,s0
ffffffffc02025cc:	854e                	mv	a0,s3
ffffffffc02025ce:	c57ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02025d2:	84aa                	mv	s1,a0
ffffffffc02025d4:	cd29                	beqz	a0,ffffffffc020262e <unmap_range+0xc8>
ffffffffc02025d6:	611c                	ld	a5,0(a0)
ffffffffc02025d8:	e395                	bnez	a5,ffffffffc02025fc <unmap_range+0x96>
ffffffffc02025da:	9452                	add	s0,s0,s4
ffffffffc02025dc:	ff2466e3          	bltu	s0,s2,ffffffffc02025c8 <unmap_range+0x62>
ffffffffc02025e0:	70a6                	ld	ra,104(sp)
ffffffffc02025e2:	7406                	ld	s0,96(sp)
ffffffffc02025e4:	64e6                	ld	s1,88(sp)
ffffffffc02025e6:	6946                	ld	s2,80(sp)
ffffffffc02025e8:	69a6                	ld	s3,72(sp)
ffffffffc02025ea:	6a06                	ld	s4,64(sp)
ffffffffc02025ec:	7ae2                	ld	s5,56(sp)
ffffffffc02025ee:	7b42                	ld	s6,48(sp)
ffffffffc02025f0:	7ba2                	ld	s7,40(sp)
ffffffffc02025f2:	7c02                	ld	s8,32(sp)
ffffffffc02025f4:	6ce2                	ld	s9,24(sp)
ffffffffc02025f6:	6d42                	ld	s10,16(sp)
ffffffffc02025f8:	6165                	addi	sp,sp,112
ffffffffc02025fa:	8082                	ret
ffffffffc02025fc:	0017f713          	andi	a4,a5,1
ffffffffc0202600:	df69                	beqz	a4,ffffffffc02025da <unmap_range+0x74>
ffffffffc0202602:	000cb703          	ld	a4,0(s9)
ffffffffc0202606:	078a                	slli	a5,a5,0x2
ffffffffc0202608:	83b1                	srli	a5,a5,0xc
ffffffffc020260a:	08e7ff63          	bgeu	a5,a4,ffffffffc02026a8 <unmap_range+0x142>
ffffffffc020260e:	000c3503          	ld	a0,0(s8)
ffffffffc0202612:	97de                	add	a5,a5,s7
ffffffffc0202614:	079a                	slli	a5,a5,0x6
ffffffffc0202616:	953e                	add	a0,a0,a5
ffffffffc0202618:	411c                	lw	a5,0(a0)
ffffffffc020261a:	fff7871b          	addiw	a4,a5,-1
ffffffffc020261e:	c118                	sw	a4,0(a0)
ffffffffc0202620:	cf11                	beqz	a4,ffffffffc020263c <unmap_range+0xd6>
ffffffffc0202622:	0004b023          	sd	zero,0(s1)
ffffffffc0202626:	12040073          	sfence.vma	s0
ffffffffc020262a:	9452                	add	s0,s0,s4
ffffffffc020262c:	bf45                	j	ffffffffc02025dc <unmap_range+0x76>
ffffffffc020262e:	945a                	add	s0,s0,s6
ffffffffc0202630:	01547433          	and	s0,s0,s5
ffffffffc0202634:	d455                	beqz	s0,ffffffffc02025e0 <unmap_range+0x7a>
ffffffffc0202636:	f92469e3          	bltu	s0,s2,ffffffffc02025c8 <unmap_range+0x62>
ffffffffc020263a:	b75d                	j	ffffffffc02025e0 <unmap_range+0x7a>
ffffffffc020263c:	100027f3          	csrr	a5,sstatus
ffffffffc0202640:	8b89                	andi	a5,a5,2
ffffffffc0202642:	e799                	bnez	a5,ffffffffc0202650 <unmap_range+0xea>
ffffffffc0202644:	000d3783          	ld	a5,0(s10)
ffffffffc0202648:	4585                	li	a1,1
ffffffffc020264a:	739c                	ld	a5,32(a5)
ffffffffc020264c:	9782                	jalr	a5
ffffffffc020264e:	bfd1                	j	ffffffffc0202622 <unmap_range+0xbc>
ffffffffc0202650:	e42a                	sd	a0,8(sp)
ffffffffc0202652:	e20fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202656:	000d3783          	ld	a5,0(s10)
ffffffffc020265a:	6522                	ld	a0,8(sp)
ffffffffc020265c:	4585                	li	a1,1
ffffffffc020265e:	739c                	ld	a5,32(a5)
ffffffffc0202660:	9782                	jalr	a5
ffffffffc0202662:	e0afe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202666:	bf75                	j	ffffffffc0202622 <unmap_range+0xbc>
ffffffffc0202668:	0000a697          	auipc	a3,0xa
ffffffffc020266c:	ed068693          	addi	a3,a3,-304 # ffffffffc020c538 <default_pmm_manager+0x188>
ffffffffc0202670:	00009617          	auipc	a2,0x9
ffffffffc0202674:	25860613          	addi	a2,a2,600 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0202678:	15a00593          	li	a1,346
ffffffffc020267c:	0000a517          	auipc	a0,0xa
ffffffffc0202680:	e8450513          	addi	a0,a0,-380 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0202684:	e1bfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202688:	0000a697          	auipc	a3,0xa
ffffffffc020268c:	ee068693          	addi	a3,a3,-288 # ffffffffc020c568 <default_pmm_manager+0x1b8>
ffffffffc0202690:	00009617          	auipc	a2,0x9
ffffffffc0202694:	23860613          	addi	a2,a2,568 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0202698:	15b00593          	li	a1,347
ffffffffc020269c:	0000a517          	auipc	a0,0xa
ffffffffc02026a0:	e6450513          	addi	a0,a0,-412 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02026a4:	dfbfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02026a8:	a8dff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc02026ac <exit_range>:
ffffffffc02026ac:	7119                	addi	sp,sp,-128
ffffffffc02026ae:	00c5e7b3          	or	a5,a1,a2
ffffffffc02026b2:	fc86                	sd	ra,120(sp)
ffffffffc02026b4:	f8a2                	sd	s0,112(sp)
ffffffffc02026b6:	f4a6                	sd	s1,104(sp)
ffffffffc02026b8:	f0ca                	sd	s2,96(sp)
ffffffffc02026ba:	ecce                	sd	s3,88(sp)
ffffffffc02026bc:	e8d2                	sd	s4,80(sp)
ffffffffc02026be:	e4d6                	sd	s5,72(sp)
ffffffffc02026c0:	e0da                	sd	s6,64(sp)
ffffffffc02026c2:	fc5e                	sd	s7,56(sp)
ffffffffc02026c4:	f862                	sd	s8,48(sp)
ffffffffc02026c6:	f466                	sd	s9,40(sp)
ffffffffc02026c8:	f06a                	sd	s10,32(sp)
ffffffffc02026ca:	ec6e                	sd	s11,24(sp)
ffffffffc02026cc:	17d2                	slli	a5,a5,0x34
ffffffffc02026ce:	20079a63          	bnez	a5,ffffffffc02028e2 <exit_range+0x236>
ffffffffc02026d2:	002007b7          	lui	a5,0x200
ffffffffc02026d6:	24f5e463          	bltu	a1,a5,ffffffffc020291e <exit_range+0x272>
ffffffffc02026da:	8ab2                	mv	s5,a2
ffffffffc02026dc:	24c5f163          	bgeu	a1,a2,ffffffffc020291e <exit_range+0x272>
ffffffffc02026e0:	4785                	li	a5,1
ffffffffc02026e2:	07fe                	slli	a5,a5,0x1f
ffffffffc02026e4:	22c7ed63          	bltu	a5,a2,ffffffffc020291e <exit_range+0x272>
ffffffffc02026e8:	c00009b7          	lui	s3,0xc0000
ffffffffc02026ec:	0135f9b3          	and	s3,a1,s3
ffffffffc02026f0:	ffe00937          	lui	s2,0xffe00
ffffffffc02026f4:	400007b7          	lui	a5,0x40000
ffffffffc02026f8:	5cfd                	li	s9,-1
ffffffffc02026fa:	8c2a                	mv	s8,a0
ffffffffc02026fc:	0125f933          	and	s2,a1,s2
ffffffffc0202700:	99be                	add	s3,s3,a5
ffffffffc0202702:	00094d17          	auipc	s10,0x94
ffffffffc0202706:	19ed0d13          	addi	s10,s10,414 # ffffffffc02968a0 <npage>
ffffffffc020270a:	00ccdc93          	srli	s9,s9,0xc
ffffffffc020270e:	00094717          	auipc	a4,0x94
ffffffffc0202712:	19a70713          	addi	a4,a4,410 # ffffffffc02968a8 <pages>
ffffffffc0202716:	00094d97          	auipc	s11,0x94
ffffffffc020271a:	19ad8d93          	addi	s11,s11,410 # ffffffffc02968b0 <pmm_manager>
ffffffffc020271e:	c0000437          	lui	s0,0xc0000
ffffffffc0202722:	944e                	add	s0,s0,s3
ffffffffc0202724:	8079                	srli	s0,s0,0x1e
ffffffffc0202726:	1ff47413          	andi	s0,s0,511
ffffffffc020272a:	040e                	slli	s0,s0,0x3
ffffffffc020272c:	9462                	add	s0,s0,s8
ffffffffc020272e:	00043a03          	ld	s4,0(s0) # ffffffffc0000000 <_binary_bin_sfs_img_size+0xffffffffbff8ad00>
ffffffffc0202732:	001a7793          	andi	a5,s4,1
ffffffffc0202736:	eb99                	bnez	a5,ffffffffc020274c <exit_range+0xa0>
ffffffffc0202738:	12098463          	beqz	s3,ffffffffc0202860 <exit_range+0x1b4>
ffffffffc020273c:	400007b7          	lui	a5,0x40000
ffffffffc0202740:	97ce                	add	a5,a5,s3
ffffffffc0202742:	894e                	mv	s2,s3
ffffffffc0202744:	1159fe63          	bgeu	s3,s5,ffffffffc0202860 <exit_range+0x1b4>
ffffffffc0202748:	89be                	mv	s3,a5
ffffffffc020274a:	bfd1                	j	ffffffffc020271e <exit_range+0x72>
ffffffffc020274c:	000d3783          	ld	a5,0(s10)
ffffffffc0202750:	0a0a                	slli	s4,s4,0x2
ffffffffc0202752:	00ca5a13          	srli	s4,s4,0xc
ffffffffc0202756:	1cfa7263          	bgeu	s4,a5,ffffffffc020291a <exit_range+0x26e>
ffffffffc020275a:	fff80637          	lui	a2,0xfff80
ffffffffc020275e:	9652                	add	a2,a2,s4
ffffffffc0202760:	000806b7          	lui	a3,0x80
ffffffffc0202764:	96b2                	add	a3,a3,a2
ffffffffc0202766:	0196f5b3          	and	a1,a3,s9
ffffffffc020276a:	061a                	slli	a2,a2,0x6
ffffffffc020276c:	06b2                	slli	a3,a3,0xc
ffffffffc020276e:	18f5fa63          	bgeu	a1,a5,ffffffffc0202902 <exit_range+0x256>
ffffffffc0202772:	00094817          	auipc	a6,0x94
ffffffffc0202776:	14680813          	addi	a6,a6,326 # ffffffffc02968b8 <va_pa_offset>
ffffffffc020277a:	00083b03          	ld	s6,0(a6)
ffffffffc020277e:	4b85                	li	s7,1
ffffffffc0202780:	fff80e37          	lui	t3,0xfff80
ffffffffc0202784:	9b36                	add	s6,s6,a3
ffffffffc0202786:	00080337          	lui	t1,0x80
ffffffffc020278a:	6885                	lui	a7,0x1
ffffffffc020278c:	a819                	j	ffffffffc02027a2 <exit_range+0xf6>
ffffffffc020278e:	4b81                	li	s7,0
ffffffffc0202790:	002007b7          	lui	a5,0x200
ffffffffc0202794:	993e                	add	s2,s2,a5
ffffffffc0202796:	08090c63          	beqz	s2,ffffffffc020282e <exit_range+0x182>
ffffffffc020279a:	09397a63          	bgeu	s2,s3,ffffffffc020282e <exit_range+0x182>
ffffffffc020279e:	0f597063          	bgeu	s2,s5,ffffffffc020287e <exit_range+0x1d2>
ffffffffc02027a2:	01595493          	srli	s1,s2,0x15
ffffffffc02027a6:	1ff4f493          	andi	s1,s1,511
ffffffffc02027aa:	048e                	slli	s1,s1,0x3
ffffffffc02027ac:	94da                	add	s1,s1,s6
ffffffffc02027ae:	609c                	ld	a5,0(s1)
ffffffffc02027b0:	0017f693          	andi	a3,a5,1
ffffffffc02027b4:	dee9                	beqz	a3,ffffffffc020278e <exit_range+0xe2>
ffffffffc02027b6:	000d3583          	ld	a1,0(s10)
ffffffffc02027ba:	078a                	slli	a5,a5,0x2
ffffffffc02027bc:	83b1                	srli	a5,a5,0xc
ffffffffc02027be:	14b7fe63          	bgeu	a5,a1,ffffffffc020291a <exit_range+0x26e>
ffffffffc02027c2:	97f2                	add	a5,a5,t3
ffffffffc02027c4:	006786b3          	add	a3,a5,t1
ffffffffc02027c8:	0196feb3          	and	t4,a3,s9
ffffffffc02027cc:	00679513          	slli	a0,a5,0x6
ffffffffc02027d0:	06b2                	slli	a3,a3,0xc
ffffffffc02027d2:	12bef863          	bgeu	t4,a1,ffffffffc0202902 <exit_range+0x256>
ffffffffc02027d6:	00083783          	ld	a5,0(a6)
ffffffffc02027da:	96be                	add	a3,a3,a5
ffffffffc02027dc:	011685b3          	add	a1,a3,a7
ffffffffc02027e0:	629c                	ld	a5,0(a3)
ffffffffc02027e2:	8b85                	andi	a5,a5,1
ffffffffc02027e4:	f7d5                	bnez	a5,ffffffffc0202790 <exit_range+0xe4>
ffffffffc02027e6:	06a1                	addi	a3,a3,8
ffffffffc02027e8:	fed59ce3          	bne	a1,a3,ffffffffc02027e0 <exit_range+0x134>
ffffffffc02027ec:	631c                	ld	a5,0(a4)
ffffffffc02027ee:	953e                	add	a0,a0,a5
ffffffffc02027f0:	100027f3          	csrr	a5,sstatus
ffffffffc02027f4:	8b89                	andi	a5,a5,2
ffffffffc02027f6:	e7d9                	bnez	a5,ffffffffc0202884 <exit_range+0x1d8>
ffffffffc02027f8:	000db783          	ld	a5,0(s11)
ffffffffc02027fc:	4585                	li	a1,1
ffffffffc02027fe:	e032                	sd	a2,0(sp)
ffffffffc0202800:	739c                	ld	a5,32(a5)
ffffffffc0202802:	9782                	jalr	a5
ffffffffc0202804:	6602                	ld	a2,0(sp)
ffffffffc0202806:	00094817          	auipc	a6,0x94
ffffffffc020280a:	0b280813          	addi	a6,a6,178 # ffffffffc02968b8 <va_pa_offset>
ffffffffc020280e:	fff80e37          	lui	t3,0xfff80
ffffffffc0202812:	00080337          	lui	t1,0x80
ffffffffc0202816:	6885                	lui	a7,0x1
ffffffffc0202818:	00094717          	auipc	a4,0x94
ffffffffc020281c:	09070713          	addi	a4,a4,144 # ffffffffc02968a8 <pages>
ffffffffc0202820:	0004b023          	sd	zero,0(s1)
ffffffffc0202824:	002007b7          	lui	a5,0x200
ffffffffc0202828:	993e                	add	s2,s2,a5
ffffffffc020282a:	f60918e3          	bnez	s2,ffffffffc020279a <exit_range+0xee>
ffffffffc020282e:	f00b85e3          	beqz	s7,ffffffffc0202738 <exit_range+0x8c>
ffffffffc0202832:	000d3783          	ld	a5,0(s10)
ffffffffc0202836:	0efa7263          	bgeu	s4,a5,ffffffffc020291a <exit_range+0x26e>
ffffffffc020283a:	6308                	ld	a0,0(a4)
ffffffffc020283c:	9532                	add	a0,a0,a2
ffffffffc020283e:	100027f3          	csrr	a5,sstatus
ffffffffc0202842:	8b89                	andi	a5,a5,2
ffffffffc0202844:	efad                	bnez	a5,ffffffffc02028be <exit_range+0x212>
ffffffffc0202846:	000db783          	ld	a5,0(s11)
ffffffffc020284a:	4585                	li	a1,1
ffffffffc020284c:	739c                	ld	a5,32(a5)
ffffffffc020284e:	9782                	jalr	a5
ffffffffc0202850:	00094717          	auipc	a4,0x94
ffffffffc0202854:	05870713          	addi	a4,a4,88 # ffffffffc02968a8 <pages>
ffffffffc0202858:	00043023          	sd	zero,0(s0)
ffffffffc020285c:	ee0990e3          	bnez	s3,ffffffffc020273c <exit_range+0x90>
ffffffffc0202860:	70e6                	ld	ra,120(sp)
ffffffffc0202862:	7446                	ld	s0,112(sp)
ffffffffc0202864:	74a6                	ld	s1,104(sp)
ffffffffc0202866:	7906                	ld	s2,96(sp)
ffffffffc0202868:	69e6                	ld	s3,88(sp)
ffffffffc020286a:	6a46                	ld	s4,80(sp)
ffffffffc020286c:	6aa6                	ld	s5,72(sp)
ffffffffc020286e:	6b06                	ld	s6,64(sp)
ffffffffc0202870:	7be2                	ld	s7,56(sp)
ffffffffc0202872:	7c42                	ld	s8,48(sp)
ffffffffc0202874:	7ca2                	ld	s9,40(sp)
ffffffffc0202876:	7d02                	ld	s10,32(sp)
ffffffffc0202878:	6de2                	ld	s11,24(sp)
ffffffffc020287a:	6109                	addi	sp,sp,128
ffffffffc020287c:	8082                	ret
ffffffffc020287e:	ea0b8fe3          	beqz	s7,ffffffffc020273c <exit_range+0x90>
ffffffffc0202882:	bf45                	j	ffffffffc0202832 <exit_range+0x186>
ffffffffc0202884:	e032                	sd	a2,0(sp)
ffffffffc0202886:	e42a                	sd	a0,8(sp)
ffffffffc0202888:	beafe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020288c:	000db783          	ld	a5,0(s11)
ffffffffc0202890:	6522                	ld	a0,8(sp)
ffffffffc0202892:	4585                	li	a1,1
ffffffffc0202894:	739c                	ld	a5,32(a5)
ffffffffc0202896:	9782                	jalr	a5
ffffffffc0202898:	bd4fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020289c:	6602                	ld	a2,0(sp)
ffffffffc020289e:	00094717          	auipc	a4,0x94
ffffffffc02028a2:	00a70713          	addi	a4,a4,10 # ffffffffc02968a8 <pages>
ffffffffc02028a6:	6885                	lui	a7,0x1
ffffffffc02028a8:	00080337          	lui	t1,0x80
ffffffffc02028ac:	fff80e37          	lui	t3,0xfff80
ffffffffc02028b0:	00094817          	auipc	a6,0x94
ffffffffc02028b4:	00880813          	addi	a6,a6,8 # ffffffffc02968b8 <va_pa_offset>
ffffffffc02028b8:	0004b023          	sd	zero,0(s1)
ffffffffc02028bc:	b7a5                	j	ffffffffc0202824 <exit_range+0x178>
ffffffffc02028be:	e02a                	sd	a0,0(sp)
ffffffffc02028c0:	bb2fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02028c4:	000db783          	ld	a5,0(s11)
ffffffffc02028c8:	6502                	ld	a0,0(sp)
ffffffffc02028ca:	4585                	li	a1,1
ffffffffc02028cc:	739c                	ld	a5,32(a5)
ffffffffc02028ce:	9782                	jalr	a5
ffffffffc02028d0:	b9cfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02028d4:	00094717          	auipc	a4,0x94
ffffffffc02028d8:	fd470713          	addi	a4,a4,-44 # ffffffffc02968a8 <pages>
ffffffffc02028dc:	00043023          	sd	zero,0(s0)
ffffffffc02028e0:	bfb5                	j	ffffffffc020285c <exit_range+0x1b0>
ffffffffc02028e2:	0000a697          	auipc	a3,0xa
ffffffffc02028e6:	c5668693          	addi	a3,a3,-938 # ffffffffc020c538 <default_pmm_manager+0x188>
ffffffffc02028ea:	00009617          	auipc	a2,0x9
ffffffffc02028ee:	fde60613          	addi	a2,a2,-34 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02028f2:	16f00593          	li	a1,367
ffffffffc02028f6:	0000a517          	auipc	a0,0xa
ffffffffc02028fa:	c0a50513          	addi	a0,a0,-1014 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02028fe:	ba1fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202902:	0000a617          	auipc	a2,0xa
ffffffffc0202906:	ae660613          	addi	a2,a2,-1306 # ffffffffc020c3e8 <default_pmm_manager+0x38>
ffffffffc020290a:	07100593          	li	a1,113
ffffffffc020290e:	0000a517          	auipc	a0,0xa
ffffffffc0202912:	b0250513          	addi	a0,a0,-1278 # ffffffffc020c410 <default_pmm_manager+0x60>
ffffffffc0202916:	b89fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020291a:	81bff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>
ffffffffc020291e:	0000a697          	auipc	a3,0xa
ffffffffc0202922:	c4a68693          	addi	a3,a3,-950 # ffffffffc020c568 <default_pmm_manager+0x1b8>
ffffffffc0202926:	00009617          	auipc	a2,0x9
ffffffffc020292a:	fa260613          	addi	a2,a2,-94 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020292e:	17000593          	li	a1,368
ffffffffc0202932:	0000a517          	auipc	a0,0xa
ffffffffc0202936:	bce50513          	addi	a0,a0,-1074 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020293a:	b65fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020293e <copy_range>:
ffffffffc020293e:	7119                	addi	sp,sp,-128
ffffffffc0202940:	00d667b3          	or	a5,a2,a3
ffffffffc0202944:	fc86                	sd	ra,120(sp)
ffffffffc0202946:	f8a2                	sd	s0,112(sp)
ffffffffc0202948:	f4a6                	sd	s1,104(sp)
ffffffffc020294a:	f0ca                	sd	s2,96(sp)
ffffffffc020294c:	ecce                	sd	s3,88(sp)
ffffffffc020294e:	e8d2                	sd	s4,80(sp)
ffffffffc0202950:	e4d6                	sd	s5,72(sp)
ffffffffc0202952:	e0da                	sd	s6,64(sp)
ffffffffc0202954:	fc5e                	sd	s7,56(sp)
ffffffffc0202956:	f862                	sd	s8,48(sp)
ffffffffc0202958:	f466                	sd	s9,40(sp)
ffffffffc020295a:	f06a                	sd	s10,32(sp)
ffffffffc020295c:	ec6e                	sd	s11,24(sp)
ffffffffc020295e:	17d2                	slli	a5,a5,0x34
ffffffffc0202960:	16079e63          	bnez	a5,ffffffffc0202adc <copy_range+0x19e>
ffffffffc0202964:	002007b7          	lui	a5,0x200
ffffffffc0202968:	8db2                	mv	s11,a2
ffffffffc020296a:	12f66d63          	bltu	a2,a5,ffffffffc0202aa4 <copy_range+0x166>
ffffffffc020296e:	84b6                	mv	s1,a3
ffffffffc0202970:	12d67a63          	bgeu	a2,a3,ffffffffc0202aa4 <copy_range+0x166>
ffffffffc0202974:	4785                	li	a5,1
ffffffffc0202976:	07fe                	slli	a5,a5,0x1f
ffffffffc0202978:	12d7e663          	bltu	a5,a3,ffffffffc0202aa4 <copy_range+0x166>
ffffffffc020297c:	8a2a                	mv	s4,a0
ffffffffc020297e:	892e                	mv	s2,a1
ffffffffc0202980:	6985                	lui	s3,0x1
ffffffffc0202982:	00094c17          	auipc	s8,0x94
ffffffffc0202986:	f1ec0c13          	addi	s8,s8,-226 # ffffffffc02968a0 <npage>
ffffffffc020298a:	00094b97          	auipc	s7,0x94
ffffffffc020298e:	f1eb8b93          	addi	s7,s7,-226 # ffffffffc02968a8 <pages>
ffffffffc0202992:	fff80b37          	lui	s6,0xfff80
ffffffffc0202996:	00094a97          	auipc	s5,0x94
ffffffffc020299a:	f1aa8a93          	addi	s5,s5,-230 # ffffffffc02968b0 <pmm_manager>
ffffffffc020299e:	00200d37          	lui	s10,0x200
ffffffffc02029a2:	ffe00cb7          	lui	s9,0xffe00
ffffffffc02029a6:	4601                	li	a2,0
ffffffffc02029a8:	85ee                	mv	a1,s11
ffffffffc02029aa:	854a                	mv	a0,s2
ffffffffc02029ac:	879ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02029b0:	842a                	mv	s0,a0
ffffffffc02029b2:	c559                	beqz	a0,ffffffffc0202a40 <copy_range+0x102>
ffffffffc02029b4:	611c                	ld	a5,0(a0)
ffffffffc02029b6:	8b85                	andi	a5,a5,1
ffffffffc02029b8:	e785                	bnez	a5,ffffffffc02029e0 <copy_range+0xa2>
ffffffffc02029ba:	9dce                	add	s11,s11,s3
ffffffffc02029bc:	fe9de5e3          	bltu	s11,s1,ffffffffc02029a6 <copy_range+0x68>
ffffffffc02029c0:	4501                	li	a0,0
ffffffffc02029c2:	70e6                	ld	ra,120(sp)
ffffffffc02029c4:	7446                	ld	s0,112(sp)
ffffffffc02029c6:	74a6                	ld	s1,104(sp)
ffffffffc02029c8:	7906                	ld	s2,96(sp)
ffffffffc02029ca:	69e6                	ld	s3,88(sp)
ffffffffc02029cc:	6a46                	ld	s4,80(sp)
ffffffffc02029ce:	6aa6                	ld	s5,72(sp)
ffffffffc02029d0:	6b06                	ld	s6,64(sp)
ffffffffc02029d2:	7be2                	ld	s7,56(sp)
ffffffffc02029d4:	7c42                	ld	s8,48(sp)
ffffffffc02029d6:	7ca2                	ld	s9,40(sp)
ffffffffc02029d8:	7d02                	ld	s10,32(sp)
ffffffffc02029da:	6de2                	ld	s11,24(sp)
ffffffffc02029dc:	6109                	addi	sp,sp,128
ffffffffc02029de:	8082                	ret
ffffffffc02029e0:	4605                	li	a2,1
ffffffffc02029e2:	85ee                	mv	a1,s11
ffffffffc02029e4:	8552                	mv	a0,s4
ffffffffc02029e6:	83fff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02029ea:	cd3d                	beqz	a0,ffffffffc0202a68 <copy_range+0x12a>
ffffffffc02029ec:	601c                	ld	a5,0(s0)
ffffffffc02029ee:	0017f713          	andi	a4,a5,1
ffffffffc02029f2:	cb69                	beqz	a4,ffffffffc0202ac4 <copy_range+0x186>
ffffffffc02029f4:	000c3703          	ld	a4,0(s8)
ffffffffc02029f8:	078a                	slli	a5,a5,0x2
ffffffffc02029fa:	83b1                	srli	a5,a5,0xc
ffffffffc02029fc:	08e7f863          	bgeu	a5,a4,ffffffffc0202a8c <copy_range+0x14e>
ffffffffc0202a00:	000bb403          	ld	s0,0(s7)
ffffffffc0202a04:	97da                	add	a5,a5,s6
ffffffffc0202a06:	079a                	slli	a5,a5,0x6
ffffffffc0202a08:	943e                	add	s0,s0,a5
ffffffffc0202a0a:	100027f3          	csrr	a5,sstatus
ffffffffc0202a0e:	8b89                	andi	a5,a5,2
ffffffffc0202a10:	e3a1                	bnez	a5,ffffffffc0202a50 <copy_range+0x112>
ffffffffc0202a12:	000ab783          	ld	a5,0(s5)
ffffffffc0202a16:	4505                	li	a0,1
ffffffffc0202a18:	6f9c                	ld	a5,24(a5)
ffffffffc0202a1a:	9782                	jalr	a5
ffffffffc0202a1c:	c821                	beqz	s0,ffffffffc0202a6c <copy_range+0x12e>
ffffffffc0202a1e:	fd51                	bnez	a0,ffffffffc02029ba <copy_range+0x7c>
ffffffffc0202a20:	0000a697          	auipc	a3,0xa
ffffffffc0202a24:	b7068693          	addi	a3,a3,-1168 # ffffffffc020c590 <default_pmm_manager+0x1e0>
ffffffffc0202a28:	00009617          	auipc	a2,0x9
ffffffffc0202a2c:	ea060613          	addi	a2,a2,-352 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0202a30:	1cf00593          	li	a1,463
ffffffffc0202a34:	0000a517          	auipc	a0,0xa
ffffffffc0202a38:	acc50513          	addi	a0,a0,-1332 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0202a3c:	a63fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202a40:	9dea                	add	s11,s11,s10
ffffffffc0202a42:	019dfdb3          	and	s11,s11,s9
ffffffffc0202a46:	f60d8de3          	beqz	s11,ffffffffc02029c0 <copy_range+0x82>
ffffffffc0202a4a:	f49deee3          	bltu	s11,s1,ffffffffc02029a6 <copy_range+0x68>
ffffffffc0202a4e:	bf8d                	j	ffffffffc02029c0 <copy_range+0x82>
ffffffffc0202a50:	a22fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202a54:	000ab783          	ld	a5,0(s5)
ffffffffc0202a58:	4505                	li	a0,1
ffffffffc0202a5a:	6f9c                	ld	a5,24(a5)
ffffffffc0202a5c:	9782                	jalr	a5
ffffffffc0202a5e:	e42a                	sd	a0,8(sp)
ffffffffc0202a60:	a0cfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202a64:	6522                	ld	a0,8(sp)
ffffffffc0202a66:	bf5d                	j	ffffffffc0202a1c <copy_range+0xde>
ffffffffc0202a68:	5571                	li	a0,-4
ffffffffc0202a6a:	bfa1                	j	ffffffffc02029c2 <copy_range+0x84>
ffffffffc0202a6c:	0000a697          	auipc	a3,0xa
ffffffffc0202a70:	b1468693          	addi	a3,a3,-1260 # ffffffffc020c580 <default_pmm_manager+0x1d0>
ffffffffc0202a74:	00009617          	auipc	a2,0x9
ffffffffc0202a78:	e5460613          	addi	a2,a2,-428 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0202a7c:	1ce00593          	li	a1,462
ffffffffc0202a80:	0000a517          	auipc	a0,0xa
ffffffffc0202a84:	a8050513          	addi	a0,a0,-1408 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0202a88:	a17fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202a8c:	0000a617          	auipc	a2,0xa
ffffffffc0202a90:	a2c60613          	addi	a2,a2,-1492 # ffffffffc020c4b8 <default_pmm_manager+0x108>
ffffffffc0202a94:	06900593          	li	a1,105
ffffffffc0202a98:	0000a517          	auipc	a0,0xa
ffffffffc0202a9c:	97850513          	addi	a0,a0,-1672 # ffffffffc020c410 <default_pmm_manager+0x60>
ffffffffc0202aa0:	9fffd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202aa4:	0000a697          	auipc	a3,0xa
ffffffffc0202aa8:	ac468693          	addi	a3,a3,-1340 # ffffffffc020c568 <default_pmm_manager+0x1b8>
ffffffffc0202aac:	00009617          	auipc	a2,0x9
ffffffffc0202ab0:	e1c60613          	addi	a2,a2,-484 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0202ab4:	1b600593          	li	a1,438
ffffffffc0202ab8:	0000a517          	auipc	a0,0xa
ffffffffc0202abc:	a4850513          	addi	a0,a0,-1464 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0202ac0:	9dffd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202ac4:	0000a617          	auipc	a2,0xa
ffffffffc0202ac8:	a1460613          	addi	a2,a2,-1516 # ffffffffc020c4d8 <default_pmm_manager+0x128>
ffffffffc0202acc:	07f00593          	li	a1,127
ffffffffc0202ad0:	0000a517          	auipc	a0,0xa
ffffffffc0202ad4:	94050513          	addi	a0,a0,-1728 # ffffffffc020c410 <default_pmm_manager+0x60>
ffffffffc0202ad8:	9c7fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202adc:	0000a697          	auipc	a3,0xa
ffffffffc0202ae0:	a5c68693          	addi	a3,a3,-1444 # ffffffffc020c538 <default_pmm_manager+0x188>
ffffffffc0202ae4:	00009617          	auipc	a2,0x9
ffffffffc0202ae8:	de460613          	addi	a2,a2,-540 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0202aec:	1b500593          	li	a1,437
ffffffffc0202af0:	0000a517          	auipc	a0,0xa
ffffffffc0202af4:	a1050513          	addi	a0,a0,-1520 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0202af8:	9a7fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202afc <page_remove>:
ffffffffc0202afc:	7179                	addi	sp,sp,-48
ffffffffc0202afe:	4601                	li	a2,0
ffffffffc0202b00:	ec26                	sd	s1,24(sp)
ffffffffc0202b02:	f406                	sd	ra,40(sp)
ffffffffc0202b04:	f022                	sd	s0,32(sp)
ffffffffc0202b06:	84ae                	mv	s1,a1
ffffffffc0202b08:	f1cff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202b0c:	c511                	beqz	a0,ffffffffc0202b18 <page_remove+0x1c>
ffffffffc0202b0e:	611c                	ld	a5,0(a0)
ffffffffc0202b10:	842a                	mv	s0,a0
ffffffffc0202b12:	0017f713          	andi	a4,a5,1
ffffffffc0202b16:	e711                	bnez	a4,ffffffffc0202b22 <page_remove+0x26>
ffffffffc0202b18:	70a2                	ld	ra,40(sp)
ffffffffc0202b1a:	7402                	ld	s0,32(sp)
ffffffffc0202b1c:	64e2                	ld	s1,24(sp)
ffffffffc0202b1e:	6145                	addi	sp,sp,48
ffffffffc0202b20:	8082                	ret
ffffffffc0202b22:	078a                	slli	a5,a5,0x2
ffffffffc0202b24:	83b1                	srli	a5,a5,0xc
ffffffffc0202b26:	00094717          	auipc	a4,0x94
ffffffffc0202b2a:	d7a73703          	ld	a4,-646(a4) # ffffffffc02968a0 <npage>
ffffffffc0202b2e:	06e7f363          	bgeu	a5,a4,ffffffffc0202b94 <page_remove+0x98>
ffffffffc0202b32:	fff80537          	lui	a0,0xfff80
ffffffffc0202b36:	97aa                	add	a5,a5,a0
ffffffffc0202b38:	079a                	slli	a5,a5,0x6
ffffffffc0202b3a:	00094517          	auipc	a0,0x94
ffffffffc0202b3e:	d6e53503          	ld	a0,-658(a0) # ffffffffc02968a8 <pages>
ffffffffc0202b42:	953e                	add	a0,a0,a5
ffffffffc0202b44:	411c                	lw	a5,0(a0)
ffffffffc0202b46:	fff7871b          	addiw	a4,a5,-1
ffffffffc0202b4a:	c118                	sw	a4,0(a0)
ffffffffc0202b4c:	cb11                	beqz	a4,ffffffffc0202b60 <page_remove+0x64>
ffffffffc0202b4e:	00043023          	sd	zero,0(s0)
ffffffffc0202b52:	12048073          	sfence.vma	s1
ffffffffc0202b56:	70a2                	ld	ra,40(sp)
ffffffffc0202b58:	7402                	ld	s0,32(sp)
ffffffffc0202b5a:	64e2                	ld	s1,24(sp)
ffffffffc0202b5c:	6145                	addi	sp,sp,48
ffffffffc0202b5e:	8082                	ret
ffffffffc0202b60:	100027f3          	csrr	a5,sstatus
ffffffffc0202b64:	8b89                	andi	a5,a5,2
ffffffffc0202b66:	eb89                	bnez	a5,ffffffffc0202b78 <page_remove+0x7c>
ffffffffc0202b68:	00094797          	auipc	a5,0x94
ffffffffc0202b6c:	d487b783          	ld	a5,-696(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202b70:	739c                	ld	a5,32(a5)
ffffffffc0202b72:	4585                	li	a1,1
ffffffffc0202b74:	9782                	jalr	a5
ffffffffc0202b76:	bfe1                	j	ffffffffc0202b4e <page_remove+0x52>
ffffffffc0202b78:	e42a                	sd	a0,8(sp)
ffffffffc0202b7a:	8f8fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202b7e:	00094797          	auipc	a5,0x94
ffffffffc0202b82:	d327b783          	ld	a5,-718(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202b86:	739c                	ld	a5,32(a5)
ffffffffc0202b88:	6522                	ld	a0,8(sp)
ffffffffc0202b8a:	4585                	li	a1,1
ffffffffc0202b8c:	9782                	jalr	a5
ffffffffc0202b8e:	8defe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202b92:	bf75                	j	ffffffffc0202b4e <page_remove+0x52>
ffffffffc0202b94:	da0ff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc0202b98 <page_insert>:
ffffffffc0202b98:	7139                	addi	sp,sp,-64
ffffffffc0202b9a:	e852                	sd	s4,16(sp)
ffffffffc0202b9c:	8a32                	mv	s4,a2
ffffffffc0202b9e:	f822                	sd	s0,48(sp)
ffffffffc0202ba0:	4605                	li	a2,1
ffffffffc0202ba2:	842e                	mv	s0,a1
ffffffffc0202ba4:	85d2                	mv	a1,s4
ffffffffc0202ba6:	f426                	sd	s1,40(sp)
ffffffffc0202ba8:	fc06                	sd	ra,56(sp)
ffffffffc0202baa:	f04a                	sd	s2,32(sp)
ffffffffc0202bac:	ec4e                	sd	s3,24(sp)
ffffffffc0202bae:	e456                	sd	s5,8(sp)
ffffffffc0202bb0:	84b6                	mv	s1,a3
ffffffffc0202bb2:	e72ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202bb6:	c961                	beqz	a0,ffffffffc0202c86 <page_insert+0xee>
ffffffffc0202bb8:	4014                	lw	a3,0(s0)
ffffffffc0202bba:	611c                	ld	a5,0(a0)
ffffffffc0202bbc:	89aa                	mv	s3,a0
ffffffffc0202bbe:	0016871b          	addiw	a4,a3,1
ffffffffc0202bc2:	c018                	sw	a4,0(s0)
ffffffffc0202bc4:	0017f713          	andi	a4,a5,1
ffffffffc0202bc8:	ef05                	bnez	a4,ffffffffc0202c00 <page_insert+0x68>
ffffffffc0202bca:	00094717          	auipc	a4,0x94
ffffffffc0202bce:	cde73703          	ld	a4,-802(a4) # ffffffffc02968a8 <pages>
ffffffffc0202bd2:	8c19                	sub	s0,s0,a4
ffffffffc0202bd4:	000807b7          	lui	a5,0x80
ffffffffc0202bd8:	8419                	srai	s0,s0,0x6
ffffffffc0202bda:	943e                	add	s0,s0,a5
ffffffffc0202bdc:	042a                	slli	s0,s0,0xa
ffffffffc0202bde:	8cc1                	or	s1,s1,s0
ffffffffc0202be0:	0014e493          	ori	s1,s1,1
ffffffffc0202be4:	0099b023          	sd	s1,0(s3) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0202be8:	120a0073          	sfence.vma	s4
ffffffffc0202bec:	4501                	li	a0,0
ffffffffc0202bee:	70e2                	ld	ra,56(sp)
ffffffffc0202bf0:	7442                	ld	s0,48(sp)
ffffffffc0202bf2:	74a2                	ld	s1,40(sp)
ffffffffc0202bf4:	7902                	ld	s2,32(sp)
ffffffffc0202bf6:	69e2                	ld	s3,24(sp)
ffffffffc0202bf8:	6a42                	ld	s4,16(sp)
ffffffffc0202bfa:	6aa2                	ld	s5,8(sp)
ffffffffc0202bfc:	6121                	addi	sp,sp,64
ffffffffc0202bfe:	8082                	ret
ffffffffc0202c00:	078a                	slli	a5,a5,0x2
ffffffffc0202c02:	83b1                	srli	a5,a5,0xc
ffffffffc0202c04:	00094717          	auipc	a4,0x94
ffffffffc0202c08:	c9c73703          	ld	a4,-868(a4) # ffffffffc02968a0 <npage>
ffffffffc0202c0c:	06e7ff63          	bgeu	a5,a4,ffffffffc0202c8a <page_insert+0xf2>
ffffffffc0202c10:	00094a97          	auipc	s5,0x94
ffffffffc0202c14:	c98a8a93          	addi	s5,s5,-872 # ffffffffc02968a8 <pages>
ffffffffc0202c18:	000ab703          	ld	a4,0(s5)
ffffffffc0202c1c:	fff80937          	lui	s2,0xfff80
ffffffffc0202c20:	993e                	add	s2,s2,a5
ffffffffc0202c22:	091a                	slli	s2,s2,0x6
ffffffffc0202c24:	993a                	add	s2,s2,a4
ffffffffc0202c26:	01240c63          	beq	s0,s2,ffffffffc0202c3e <page_insert+0xa6>
ffffffffc0202c2a:	00092783          	lw	a5,0(s2) # fffffffffff80000 <end+0x3fce96f0>
ffffffffc0202c2e:	fff7869b          	addiw	a3,a5,-1
ffffffffc0202c32:	00d92023          	sw	a3,0(s2)
ffffffffc0202c36:	c691                	beqz	a3,ffffffffc0202c42 <page_insert+0xaa>
ffffffffc0202c38:	120a0073          	sfence.vma	s4
ffffffffc0202c3c:	bf59                	j	ffffffffc0202bd2 <page_insert+0x3a>
ffffffffc0202c3e:	c014                	sw	a3,0(s0)
ffffffffc0202c40:	bf49                	j	ffffffffc0202bd2 <page_insert+0x3a>
ffffffffc0202c42:	100027f3          	csrr	a5,sstatus
ffffffffc0202c46:	8b89                	andi	a5,a5,2
ffffffffc0202c48:	ef91                	bnez	a5,ffffffffc0202c64 <page_insert+0xcc>
ffffffffc0202c4a:	00094797          	auipc	a5,0x94
ffffffffc0202c4e:	c667b783          	ld	a5,-922(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202c52:	739c                	ld	a5,32(a5)
ffffffffc0202c54:	4585                	li	a1,1
ffffffffc0202c56:	854a                	mv	a0,s2
ffffffffc0202c58:	9782                	jalr	a5
ffffffffc0202c5a:	000ab703          	ld	a4,0(s5)
ffffffffc0202c5e:	120a0073          	sfence.vma	s4
ffffffffc0202c62:	bf85                	j	ffffffffc0202bd2 <page_insert+0x3a>
ffffffffc0202c64:	80efe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202c68:	00094797          	auipc	a5,0x94
ffffffffc0202c6c:	c487b783          	ld	a5,-952(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202c70:	739c                	ld	a5,32(a5)
ffffffffc0202c72:	4585                	li	a1,1
ffffffffc0202c74:	854a                	mv	a0,s2
ffffffffc0202c76:	9782                	jalr	a5
ffffffffc0202c78:	ff5fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202c7c:	000ab703          	ld	a4,0(s5)
ffffffffc0202c80:	120a0073          	sfence.vma	s4
ffffffffc0202c84:	b7b9                	j	ffffffffc0202bd2 <page_insert+0x3a>
ffffffffc0202c86:	5571                	li	a0,-4
ffffffffc0202c88:	b79d                	j	ffffffffc0202bee <page_insert+0x56>
ffffffffc0202c8a:	caaff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc0202c8e <pmm_init>:
ffffffffc0202c8e:	00009797          	auipc	a5,0x9
ffffffffc0202c92:	72278793          	addi	a5,a5,1826 # ffffffffc020c3b0 <default_pmm_manager>
ffffffffc0202c96:	638c                	ld	a1,0(a5)
ffffffffc0202c98:	7159                	addi	sp,sp,-112
ffffffffc0202c9a:	f85a                	sd	s6,48(sp)
ffffffffc0202c9c:	0000a517          	auipc	a0,0xa
ffffffffc0202ca0:	90450513          	addi	a0,a0,-1788 # ffffffffc020c5a0 <default_pmm_manager+0x1f0>
ffffffffc0202ca4:	00094b17          	auipc	s6,0x94
ffffffffc0202ca8:	c0cb0b13          	addi	s6,s6,-1012 # ffffffffc02968b0 <pmm_manager>
ffffffffc0202cac:	f486                	sd	ra,104(sp)
ffffffffc0202cae:	e8ca                	sd	s2,80(sp)
ffffffffc0202cb0:	e4ce                	sd	s3,72(sp)
ffffffffc0202cb2:	f0a2                	sd	s0,96(sp)
ffffffffc0202cb4:	eca6                	sd	s1,88(sp)
ffffffffc0202cb6:	e0d2                	sd	s4,64(sp)
ffffffffc0202cb8:	fc56                	sd	s5,56(sp)
ffffffffc0202cba:	f45e                	sd	s7,40(sp)
ffffffffc0202cbc:	f062                	sd	s8,32(sp)
ffffffffc0202cbe:	ec66                	sd	s9,24(sp)
ffffffffc0202cc0:	00fb3023          	sd	a5,0(s6)
ffffffffc0202cc4:	ce2fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202cc8:	000b3783          	ld	a5,0(s6)
ffffffffc0202ccc:	00094997          	auipc	s3,0x94
ffffffffc0202cd0:	bec98993          	addi	s3,s3,-1044 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0202cd4:	679c                	ld	a5,8(a5)
ffffffffc0202cd6:	9782                	jalr	a5
ffffffffc0202cd8:	57f5                	li	a5,-3
ffffffffc0202cda:	07fa                	slli	a5,a5,0x1e
ffffffffc0202cdc:	00f9b023          	sd	a5,0(s3)
ffffffffc0202ce0:	d69fd0ef          	jal	ra,ffffffffc0200a48 <get_memory_base>
ffffffffc0202ce4:	892a                	mv	s2,a0
ffffffffc0202ce6:	d6dfd0ef          	jal	ra,ffffffffc0200a52 <get_memory_size>
ffffffffc0202cea:	280502e3          	beqz	a0,ffffffffc020376e <pmm_init+0xae0>
ffffffffc0202cee:	84aa                	mv	s1,a0
ffffffffc0202cf0:	0000a517          	auipc	a0,0xa
ffffffffc0202cf4:	8e850513          	addi	a0,a0,-1816 # ffffffffc020c5d8 <default_pmm_manager+0x228>
ffffffffc0202cf8:	caefd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202cfc:	00990433          	add	s0,s2,s1
ffffffffc0202d00:	fff40693          	addi	a3,s0,-1
ffffffffc0202d04:	864a                	mv	a2,s2
ffffffffc0202d06:	85a6                	mv	a1,s1
ffffffffc0202d08:	0000a517          	auipc	a0,0xa
ffffffffc0202d0c:	8e850513          	addi	a0,a0,-1816 # ffffffffc020c5f0 <default_pmm_manager+0x240>
ffffffffc0202d10:	c96fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202d14:	c8000737          	lui	a4,0xc8000
ffffffffc0202d18:	87a2                	mv	a5,s0
ffffffffc0202d1a:	5e876e63          	bltu	a4,s0,ffffffffc0203316 <pmm_init+0x688>
ffffffffc0202d1e:	757d                	lui	a0,0xfffff
ffffffffc0202d20:	00095617          	auipc	a2,0x95
ffffffffc0202d24:	bef60613          	addi	a2,a2,-1041 # ffffffffc029790f <end+0xfff>
ffffffffc0202d28:	8e69                	and	a2,a2,a0
ffffffffc0202d2a:	00094497          	auipc	s1,0x94
ffffffffc0202d2e:	b7648493          	addi	s1,s1,-1162 # ffffffffc02968a0 <npage>
ffffffffc0202d32:	00c7d513          	srli	a0,a5,0xc
ffffffffc0202d36:	00094b97          	auipc	s7,0x94
ffffffffc0202d3a:	b72b8b93          	addi	s7,s7,-1166 # ffffffffc02968a8 <pages>
ffffffffc0202d3e:	e088                	sd	a0,0(s1)
ffffffffc0202d40:	00cbb023          	sd	a2,0(s7)
ffffffffc0202d44:	000807b7          	lui	a5,0x80
ffffffffc0202d48:	86b2                	mv	a3,a2
ffffffffc0202d4a:	02f50863          	beq	a0,a5,ffffffffc0202d7a <pmm_init+0xec>
ffffffffc0202d4e:	4781                	li	a5,0
ffffffffc0202d50:	4585                	li	a1,1
ffffffffc0202d52:	fff806b7          	lui	a3,0xfff80
ffffffffc0202d56:	00679513          	slli	a0,a5,0x6
ffffffffc0202d5a:	9532                	add	a0,a0,a2
ffffffffc0202d5c:	00850713          	addi	a4,a0,8 # fffffffffffff008 <end+0x3fd686f8>
ffffffffc0202d60:	40b7302f          	amoor.d	zero,a1,(a4)
ffffffffc0202d64:	6088                	ld	a0,0(s1)
ffffffffc0202d66:	0785                	addi	a5,a5,1
ffffffffc0202d68:	000bb603          	ld	a2,0(s7)
ffffffffc0202d6c:	00d50733          	add	a4,a0,a3
ffffffffc0202d70:	fee7e3e3          	bltu	a5,a4,ffffffffc0202d56 <pmm_init+0xc8>
ffffffffc0202d74:	071a                	slli	a4,a4,0x6
ffffffffc0202d76:	00e606b3          	add	a3,a2,a4
ffffffffc0202d7a:	c02007b7          	lui	a5,0xc0200
ffffffffc0202d7e:	3af6eae3          	bltu	a3,a5,ffffffffc0203932 <pmm_init+0xca4>
ffffffffc0202d82:	0009b583          	ld	a1,0(s3)
ffffffffc0202d86:	77fd                	lui	a5,0xfffff
ffffffffc0202d88:	8c7d                	and	s0,s0,a5
ffffffffc0202d8a:	8e8d                	sub	a3,a3,a1
ffffffffc0202d8c:	5e86e363          	bltu	a3,s0,ffffffffc0203372 <pmm_init+0x6e4>
ffffffffc0202d90:	0000a517          	auipc	a0,0xa
ffffffffc0202d94:	88850513          	addi	a0,a0,-1912 # ffffffffc020c618 <default_pmm_manager+0x268>
ffffffffc0202d98:	c0efd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202d9c:	000b3783          	ld	a5,0(s6)
ffffffffc0202da0:	7b9c                	ld	a5,48(a5)
ffffffffc0202da2:	9782                	jalr	a5
ffffffffc0202da4:	0000a517          	auipc	a0,0xa
ffffffffc0202da8:	88c50513          	addi	a0,a0,-1908 # ffffffffc020c630 <default_pmm_manager+0x280>
ffffffffc0202dac:	bfafd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202db0:	100027f3          	csrr	a5,sstatus
ffffffffc0202db4:	8b89                	andi	a5,a5,2
ffffffffc0202db6:	5a079363          	bnez	a5,ffffffffc020335c <pmm_init+0x6ce>
ffffffffc0202dba:	000b3783          	ld	a5,0(s6)
ffffffffc0202dbe:	4505                	li	a0,1
ffffffffc0202dc0:	6f9c                	ld	a5,24(a5)
ffffffffc0202dc2:	9782                	jalr	a5
ffffffffc0202dc4:	842a                	mv	s0,a0
ffffffffc0202dc6:	180408e3          	beqz	s0,ffffffffc0203756 <pmm_init+0xac8>
ffffffffc0202dca:	000bb683          	ld	a3,0(s7)
ffffffffc0202dce:	5a7d                	li	s4,-1
ffffffffc0202dd0:	6098                	ld	a4,0(s1)
ffffffffc0202dd2:	40d406b3          	sub	a3,s0,a3
ffffffffc0202dd6:	8699                	srai	a3,a3,0x6
ffffffffc0202dd8:	00080437          	lui	s0,0x80
ffffffffc0202ddc:	96a2                	add	a3,a3,s0
ffffffffc0202dde:	00ca5793          	srli	a5,s4,0xc
ffffffffc0202de2:	8ff5                	and	a5,a5,a3
ffffffffc0202de4:	06b2                	slli	a3,a3,0xc
ffffffffc0202de6:	30e7fde3          	bgeu	a5,a4,ffffffffc0203900 <pmm_init+0xc72>
ffffffffc0202dea:	0009b403          	ld	s0,0(s3)
ffffffffc0202dee:	6605                	lui	a2,0x1
ffffffffc0202df0:	4581                	li	a1,0
ffffffffc0202df2:	9436                	add	s0,s0,a3
ffffffffc0202df4:	8522                	mv	a0,s0
ffffffffc0202df6:	5ea080ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc0202dfa:	0009b683          	ld	a3,0(s3)
ffffffffc0202dfe:	77fd                	lui	a5,0xfffff
ffffffffc0202e00:	00009917          	auipc	s2,0x9
ffffffffc0202e04:	64990913          	addi	s2,s2,1609 # ffffffffc020c449 <default_pmm_manager+0x99>
ffffffffc0202e08:	00f97933          	and	s2,s2,a5
ffffffffc0202e0c:	c0200ab7          	lui	s5,0xc0200
ffffffffc0202e10:	3fe00637          	lui	a2,0x3fe00
ffffffffc0202e14:	964a                	add	a2,a2,s2
ffffffffc0202e16:	4729                	li	a4,10
ffffffffc0202e18:	40da86b3          	sub	a3,s5,a3
ffffffffc0202e1c:	c02005b7          	lui	a1,0xc0200
ffffffffc0202e20:	8522                	mv	a0,s0
ffffffffc0202e22:	e2aff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc0202e26:	c8000637          	lui	a2,0xc8000
ffffffffc0202e2a:	41260633          	sub	a2,a2,s2
ffffffffc0202e2e:	3f596ce3          	bltu	s2,s5,ffffffffc0203a26 <pmm_init+0xd98>
ffffffffc0202e32:	0009b683          	ld	a3,0(s3)
ffffffffc0202e36:	85ca                	mv	a1,s2
ffffffffc0202e38:	4719                	li	a4,6
ffffffffc0202e3a:	40d906b3          	sub	a3,s2,a3
ffffffffc0202e3e:	8522                	mv	a0,s0
ffffffffc0202e40:	00094917          	auipc	s2,0x94
ffffffffc0202e44:	a5890913          	addi	s2,s2,-1448 # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0202e48:	e04ff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc0202e4c:	00893023          	sd	s0,0(s2)
ffffffffc0202e50:	2d5464e3          	bltu	s0,s5,ffffffffc0203918 <pmm_init+0xc8a>
ffffffffc0202e54:	0009b783          	ld	a5,0(s3)
ffffffffc0202e58:	1a7e                	slli	s4,s4,0x3f
ffffffffc0202e5a:	8c1d                	sub	s0,s0,a5
ffffffffc0202e5c:	00c45793          	srli	a5,s0,0xc
ffffffffc0202e60:	00094717          	auipc	a4,0x94
ffffffffc0202e64:	a2873823          	sd	s0,-1488(a4) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc0202e68:	0147ea33          	or	s4,a5,s4
ffffffffc0202e6c:	180a1073          	csrw	satp,s4
ffffffffc0202e70:	12000073          	sfence.vma
ffffffffc0202e74:	00009517          	auipc	a0,0x9
ffffffffc0202e78:	7fc50513          	addi	a0,a0,2044 # ffffffffc020c670 <default_pmm_manager+0x2c0>
ffffffffc0202e7c:	b2afd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202e80:	0000e717          	auipc	a4,0xe
ffffffffc0202e84:	18070713          	addi	a4,a4,384 # ffffffffc0211000 <bootstack>
ffffffffc0202e88:	0000e797          	auipc	a5,0xe
ffffffffc0202e8c:	17878793          	addi	a5,a5,376 # ffffffffc0211000 <bootstack>
ffffffffc0202e90:	5cf70d63          	beq	a4,a5,ffffffffc020346a <pmm_init+0x7dc>
ffffffffc0202e94:	100027f3          	csrr	a5,sstatus
ffffffffc0202e98:	8b89                	andi	a5,a5,2
ffffffffc0202e9a:	4a079763          	bnez	a5,ffffffffc0203348 <pmm_init+0x6ba>
ffffffffc0202e9e:	000b3783          	ld	a5,0(s6)
ffffffffc0202ea2:	779c                	ld	a5,40(a5)
ffffffffc0202ea4:	9782                	jalr	a5
ffffffffc0202ea6:	842a                	mv	s0,a0
ffffffffc0202ea8:	6098                	ld	a4,0(s1)
ffffffffc0202eaa:	c80007b7          	lui	a5,0xc8000
ffffffffc0202eae:	83b1                	srli	a5,a5,0xc
ffffffffc0202eb0:	08e7e3e3          	bltu	a5,a4,ffffffffc0203736 <pmm_init+0xaa8>
ffffffffc0202eb4:	00093503          	ld	a0,0(s2)
ffffffffc0202eb8:	04050fe3          	beqz	a0,ffffffffc0203716 <pmm_init+0xa88>
ffffffffc0202ebc:	03451793          	slli	a5,a0,0x34
ffffffffc0202ec0:	04079be3          	bnez	a5,ffffffffc0203716 <pmm_init+0xa88>
ffffffffc0202ec4:	4601                	li	a2,0
ffffffffc0202ec6:	4581                	li	a1,0
ffffffffc0202ec8:	e4aff0ef          	jal	ra,ffffffffc0202512 <get_page>
ffffffffc0202ecc:	2e0511e3          	bnez	a0,ffffffffc02039ae <pmm_init+0xd20>
ffffffffc0202ed0:	100027f3          	csrr	a5,sstatus
ffffffffc0202ed4:	8b89                	andi	a5,a5,2
ffffffffc0202ed6:	44079e63          	bnez	a5,ffffffffc0203332 <pmm_init+0x6a4>
ffffffffc0202eda:	000b3783          	ld	a5,0(s6)
ffffffffc0202ede:	4505                	li	a0,1
ffffffffc0202ee0:	6f9c                	ld	a5,24(a5)
ffffffffc0202ee2:	9782                	jalr	a5
ffffffffc0202ee4:	8a2a                	mv	s4,a0
ffffffffc0202ee6:	00093503          	ld	a0,0(s2)
ffffffffc0202eea:	4681                	li	a3,0
ffffffffc0202eec:	4601                	li	a2,0
ffffffffc0202eee:	85d2                	mv	a1,s4
ffffffffc0202ef0:	ca9ff0ef          	jal	ra,ffffffffc0202b98 <page_insert>
ffffffffc0202ef4:	26051be3          	bnez	a0,ffffffffc020396a <pmm_init+0xcdc>
ffffffffc0202ef8:	00093503          	ld	a0,0(s2)
ffffffffc0202efc:	4601                	li	a2,0
ffffffffc0202efe:	4581                	li	a1,0
ffffffffc0202f00:	b24ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202f04:	280505e3          	beqz	a0,ffffffffc020398e <pmm_init+0xd00>
ffffffffc0202f08:	611c                	ld	a5,0(a0)
ffffffffc0202f0a:	0017f713          	andi	a4,a5,1
ffffffffc0202f0e:	26070ee3          	beqz	a4,ffffffffc020398a <pmm_init+0xcfc>
ffffffffc0202f12:	6098                	ld	a4,0(s1)
ffffffffc0202f14:	078a                	slli	a5,a5,0x2
ffffffffc0202f16:	83b1                	srli	a5,a5,0xc
ffffffffc0202f18:	62e7f363          	bgeu	a5,a4,ffffffffc020353e <pmm_init+0x8b0>
ffffffffc0202f1c:	000bb683          	ld	a3,0(s7)
ffffffffc0202f20:	fff80637          	lui	a2,0xfff80
ffffffffc0202f24:	97b2                	add	a5,a5,a2
ffffffffc0202f26:	079a                	slli	a5,a5,0x6
ffffffffc0202f28:	97b6                	add	a5,a5,a3
ffffffffc0202f2a:	2afa12e3          	bne	s4,a5,ffffffffc02039ce <pmm_init+0xd40>
ffffffffc0202f2e:	000a2683          	lw	a3,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0202f32:	4785                	li	a5,1
ffffffffc0202f34:	2cf699e3          	bne	a3,a5,ffffffffc0203a06 <pmm_init+0xd78>
ffffffffc0202f38:	00093503          	ld	a0,0(s2)
ffffffffc0202f3c:	77fd                	lui	a5,0xfffff
ffffffffc0202f3e:	6114                	ld	a3,0(a0)
ffffffffc0202f40:	068a                	slli	a3,a3,0x2
ffffffffc0202f42:	8efd                	and	a3,a3,a5
ffffffffc0202f44:	00c6d613          	srli	a2,a3,0xc
ffffffffc0202f48:	2ae673e3          	bgeu	a2,a4,ffffffffc02039ee <pmm_init+0xd60>
ffffffffc0202f4c:	0009bc03          	ld	s8,0(s3)
ffffffffc0202f50:	96e2                	add	a3,a3,s8
ffffffffc0202f52:	0006ba83          	ld	s5,0(a3) # fffffffffff80000 <end+0x3fce96f0>
ffffffffc0202f56:	0a8a                	slli	s5,s5,0x2
ffffffffc0202f58:	00fafab3          	and	s5,s5,a5
ffffffffc0202f5c:	00cad793          	srli	a5,s5,0xc
ffffffffc0202f60:	06e7f3e3          	bgeu	a5,a4,ffffffffc02037c6 <pmm_init+0xb38>
ffffffffc0202f64:	4601                	li	a2,0
ffffffffc0202f66:	6585                	lui	a1,0x1
ffffffffc0202f68:	9ae2                	add	s5,s5,s8
ffffffffc0202f6a:	abaff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202f6e:	0aa1                	addi	s5,s5,8
ffffffffc0202f70:	03551be3          	bne	a0,s5,ffffffffc02037a6 <pmm_init+0xb18>
ffffffffc0202f74:	100027f3          	csrr	a5,sstatus
ffffffffc0202f78:	8b89                	andi	a5,a5,2
ffffffffc0202f7a:	3a079163          	bnez	a5,ffffffffc020331c <pmm_init+0x68e>
ffffffffc0202f7e:	000b3783          	ld	a5,0(s6)
ffffffffc0202f82:	4505                	li	a0,1
ffffffffc0202f84:	6f9c                	ld	a5,24(a5)
ffffffffc0202f86:	9782                	jalr	a5
ffffffffc0202f88:	8c2a                	mv	s8,a0
ffffffffc0202f8a:	00093503          	ld	a0,0(s2)
ffffffffc0202f8e:	46d1                	li	a3,20
ffffffffc0202f90:	6605                	lui	a2,0x1
ffffffffc0202f92:	85e2                	mv	a1,s8
ffffffffc0202f94:	c05ff0ef          	jal	ra,ffffffffc0202b98 <page_insert>
ffffffffc0202f98:	1a0519e3          	bnez	a0,ffffffffc020394a <pmm_init+0xcbc>
ffffffffc0202f9c:	00093503          	ld	a0,0(s2)
ffffffffc0202fa0:	4601                	li	a2,0
ffffffffc0202fa2:	6585                	lui	a1,0x1
ffffffffc0202fa4:	a80ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202fa8:	10050ce3          	beqz	a0,ffffffffc02038c0 <pmm_init+0xc32>
ffffffffc0202fac:	611c                	ld	a5,0(a0)
ffffffffc0202fae:	0107f713          	andi	a4,a5,16
ffffffffc0202fb2:	0e0707e3          	beqz	a4,ffffffffc02038a0 <pmm_init+0xc12>
ffffffffc0202fb6:	8b91                	andi	a5,a5,4
ffffffffc0202fb8:	0c0784e3          	beqz	a5,ffffffffc0203880 <pmm_init+0xbf2>
ffffffffc0202fbc:	00093503          	ld	a0,0(s2)
ffffffffc0202fc0:	611c                	ld	a5,0(a0)
ffffffffc0202fc2:	8bc1                	andi	a5,a5,16
ffffffffc0202fc4:	08078ee3          	beqz	a5,ffffffffc0203860 <pmm_init+0xbd2>
ffffffffc0202fc8:	000c2703          	lw	a4,0(s8)
ffffffffc0202fcc:	4785                	li	a5,1
ffffffffc0202fce:	06f719e3          	bne	a4,a5,ffffffffc0203840 <pmm_init+0xbb2>
ffffffffc0202fd2:	4681                	li	a3,0
ffffffffc0202fd4:	6605                	lui	a2,0x1
ffffffffc0202fd6:	85d2                	mv	a1,s4
ffffffffc0202fd8:	bc1ff0ef          	jal	ra,ffffffffc0202b98 <page_insert>
ffffffffc0202fdc:	040512e3          	bnez	a0,ffffffffc0203820 <pmm_init+0xb92>
ffffffffc0202fe0:	000a2703          	lw	a4,0(s4)
ffffffffc0202fe4:	4789                	li	a5,2
ffffffffc0202fe6:	00f71de3          	bne	a4,a5,ffffffffc0203800 <pmm_init+0xb72>
ffffffffc0202fea:	000c2783          	lw	a5,0(s8)
ffffffffc0202fee:	7e079963          	bnez	a5,ffffffffc02037e0 <pmm_init+0xb52>
ffffffffc0202ff2:	00093503          	ld	a0,0(s2)
ffffffffc0202ff6:	4601                	li	a2,0
ffffffffc0202ff8:	6585                	lui	a1,0x1
ffffffffc0202ffa:	a2aff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202ffe:	54050263          	beqz	a0,ffffffffc0203542 <pmm_init+0x8b4>
ffffffffc0203002:	6118                	ld	a4,0(a0)
ffffffffc0203004:	00177793          	andi	a5,a4,1
ffffffffc0203008:	180781e3          	beqz	a5,ffffffffc020398a <pmm_init+0xcfc>
ffffffffc020300c:	6094                	ld	a3,0(s1)
ffffffffc020300e:	00271793          	slli	a5,a4,0x2
ffffffffc0203012:	83b1                	srli	a5,a5,0xc
ffffffffc0203014:	52d7f563          	bgeu	a5,a3,ffffffffc020353e <pmm_init+0x8b0>
ffffffffc0203018:	000bb683          	ld	a3,0(s7)
ffffffffc020301c:	fff80ab7          	lui	s5,0xfff80
ffffffffc0203020:	97d6                	add	a5,a5,s5
ffffffffc0203022:	079a                	slli	a5,a5,0x6
ffffffffc0203024:	97b6                	add	a5,a5,a3
ffffffffc0203026:	58fa1e63          	bne	s4,a5,ffffffffc02035c2 <pmm_init+0x934>
ffffffffc020302a:	8b41                	andi	a4,a4,16
ffffffffc020302c:	56071b63          	bnez	a4,ffffffffc02035a2 <pmm_init+0x914>
ffffffffc0203030:	00093503          	ld	a0,0(s2)
ffffffffc0203034:	4581                	li	a1,0
ffffffffc0203036:	ac7ff0ef          	jal	ra,ffffffffc0202afc <page_remove>
ffffffffc020303a:	000a2c83          	lw	s9,0(s4)
ffffffffc020303e:	4785                	li	a5,1
ffffffffc0203040:	5cfc9163          	bne	s9,a5,ffffffffc0203602 <pmm_init+0x974>
ffffffffc0203044:	000c2783          	lw	a5,0(s8)
ffffffffc0203048:	58079d63          	bnez	a5,ffffffffc02035e2 <pmm_init+0x954>
ffffffffc020304c:	00093503          	ld	a0,0(s2)
ffffffffc0203050:	6585                	lui	a1,0x1
ffffffffc0203052:	aabff0ef          	jal	ra,ffffffffc0202afc <page_remove>
ffffffffc0203056:	000a2783          	lw	a5,0(s4)
ffffffffc020305a:	200793e3          	bnez	a5,ffffffffc0203a60 <pmm_init+0xdd2>
ffffffffc020305e:	000c2783          	lw	a5,0(s8)
ffffffffc0203062:	1c079fe3          	bnez	a5,ffffffffc0203a40 <pmm_init+0xdb2>
ffffffffc0203066:	00093a03          	ld	s4,0(s2)
ffffffffc020306a:	608c                	ld	a1,0(s1)
ffffffffc020306c:	000a3683          	ld	a3,0(s4)
ffffffffc0203070:	068a                	slli	a3,a3,0x2
ffffffffc0203072:	82b1                	srli	a3,a3,0xc
ffffffffc0203074:	4cb6f563          	bgeu	a3,a1,ffffffffc020353e <pmm_init+0x8b0>
ffffffffc0203078:	000bb503          	ld	a0,0(s7)
ffffffffc020307c:	96d6                	add	a3,a3,s5
ffffffffc020307e:	069a                	slli	a3,a3,0x6
ffffffffc0203080:	00d507b3          	add	a5,a0,a3
ffffffffc0203084:	439c                	lw	a5,0(a5)
ffffffffc0203086:	4f979e63          	bne	a5,s9,ffffffffc0203582 <pmm_init+0x8f4>
ffffffffc020308a:	8699                	srai	a3,a3,0x6
ffffffffc020308c:	00080637          	lui	a2,0x80
ffffffffc0203090:	96b2                	add	a3,a3,a2
ffffffffc0203092:	00c69713          	slli	a4,a3,0xc
ffffffffc0203096:	8331                	srli	a4,a4,0xc
ffffffffc0203098:	06b2                	slli	a3,a3,0xc
ffffffffc020309a:	06b773e3          	bgeu	a4,a1,ffffffffc0203900 <pmm_init+0xc72>
ffffffffc020309e:	0009b703          	ld	a4,0(s3)
ffffffffc02030a2:	96ba                	add	a3,a3,a4
ffffffffc02030a4:	629c                	ld	a5,0(a3)
ffffffffc02030a6:	078a                	slli	a5,a5,0x2
ffffffffc02030a8:	83b1                	srli	a5,a5,0xc
ffffffffc02030aa:	48b7fa63          	bgeu	a5,a1,ffffffffc020353e <pmm_init+0x8b0>
ffffffffc02030ae:	8f91                	sub	a5,a5,a2
ffffffffc02030b0:	079a                	slli	a5,a5,0x6
ffffffffc02030b2:	953e                	add	a0,a0,a5
ffffffffc02030b4:	100027f3          	csrr	a5,sstatus
ffffffffc02030b8:	8b89                	andi	a5,a5,2
ffffffffc02030ba:	32079463          	bnez	a5,ffffffffc02033e2 <pmm_init+0x754>
ffffffffc02030be:	000b3783          	ld	a5,0(s6)
ffffffffc02030c2:	4585                	li	a1,1
ffffffffc02030c4:	739c                	ld	a5,32(a5)
ffffffffc02030c6:	9782                	jalr	a5
ffffffffc02030c8:	000a3783          	ld	a5,0(s4)
ffffffffc02030cc:	6098                	ld	a4,0(s1)
ffffffffc02030ce:	078a                	slli	a5,a5,0x2
ffffffffc02030d0:	83b1                	srli	a5,a5,0xc
ffffffffc02030d2:	46e7f663          	bgeu	a5,a4,ffffffffc020353e <pmm_init+0x8b0>
ffffffffc02030d6:	000bb503          	ld	a0,0(s7)
ffffffffc02030da:	fff80737          	lui	a4,0xfff80
ffffffffc02030de:	97ba                	add	a5,a5,a4
ffffffffc02030e0:	079a                	slli	a5,a5,0x6
ffffffffc02030e2:	953e                	add	a0,a0,a5
ffffffffc02030e4:	100027f3          	csrr	a5,sstatus
ffffffffc02030e8:	8b89                	andi	a5,a5,2
ffffffffc02030ea:	2e079063          	bnez	a5,ffffffffc02033ca <pmm_init+0x73c>
ffffffffc02030ee:	000b3783          	ld	a5,0(s6)
ffffffffc02030f2:	4585                	li	a1,1
ffffffffc02030f4:	739c                	ld	a5,32(a5)
ffffffffc02030f6:	9782                	jalr	a5
ffffffffc02030f8:	00093783          	ld	a5,0(s2)
ffffffffc02030fc:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0x3fd686f0>
ffffffffc0203100:	12000073          	sfence.vma
ffffffffc0203104:	100027f3          	csrr	a5,sstatus
ffffffffc0203108:	8b89                	andi	a5,a5,2
ffffffffc020310a:	2a079663          	bnez	a5,ffffffffc02033b6 <pmm_init+0x728>
ffffffffc020310e:	000b3783          	ld	a5,0(s6)
ffffffffc0203112:	779c                	ld	a5,40(a5)
ffffffffc0203114:	9782                	jalr	a5
ffffffffc0203116:	8a2a                	mv	s4,a0
ffffffffc0203118:	7d441463          	bne	s0,s4,ffffffffc02038e0 <pmm_init+0xc52>
ffffffffc020311c:	0000a517          	auipc	a0,0xa
ffffffffc0203120:	8ac50513          	addi	a0,a0,-1876 # ffffffffc020c9c8 <default_pmm_manager+0x618>
ffffffffc0203124:	882fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0203128:	100027f3          	csrr	a5,sstatus
ffffffffc020312c:	8b89                	andi	a5,a5,2
ffffffffc020312e:	26079a63          	bnez	a5,ffffffffc02033a2 <pmm_init+0x714>
ffffffffc0203132:	000b3783          	ld	a5,0(s6)
ffffffffc0203136:	779c                	ld	a5,40(a5)
ffffffffc0203138:	9782                	jalr	a5
ffffffffc020313a:	8c2a                	mv	s8,a0
ffffffffc020313c:	6098                	ld	a4,0(s1)
ffffffffc020313e:	c0200437          	lui	s0,0xc0200
ffffffffc0203142:	7afd                	lui	s5,0xfffff
ffffffffc0203144:	00c71793          	slli	a5,a4,0xc
ffffffffc0203148:	6a05                	lui	s4,0x1
ffffffffc020314a:	02f47c63          	bgeu	s0,a5,ffffffffc0203182 <pmm_init+0x4f4>
ffffffffc020314e:	00c45793          	srli	a5,s0,0xc
ffffffffc0203152:	00093503          	ld	a0,0(s2)
ffffffffc0203156:	3ae7f763          	bgeu	a5,a4,ffffffffc0203504 <pmm_init+0x876>
ffffffffc020315a:	0009b583          	ld	a1,0(s3)
ffffffffc020315e:	4601                	li	a2,0
ffffffffc0203160:	95a2                	add	a1,a1,s0
ffffffffc0203162:	8c2ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0203166:	36050f63          	beqz	a0,ffffffffc02034e4 <pmm_init+0x856>
ffffffffc020316a:	611c                	ld	a5,0(a0)
ffffffffc020316c:	078a                	slli	a5,a5,0x2
ffffffffc020316e:	0157f7b3          	and	a5,a5,s5
ffffffffc0203172:	3a879663          	bne	a5,s0,ffffffffc020351e <pmm_init+0x890>
ffffffffc0203176:	6098                	ld	a4,0(s1)
ffffffffc0203178:	9452                	add	s0,s0,s4
ffffffffc020317a:	00c71793          	slli	a5,a4,0xc
ffffffffc020317e:	fcf468e3          	bltu	s0,a5,ffffffffc020314e <pmm_init+0x4c0>
ffffffffc0203182:	00093783          	ld	a5,0(s2)
ffffffffc0203186:	639c                	ld	a5,0(a5)
ffffffffc0203188:	48079d63          	bnez	a5,ffffffffc0203622 <pmm_init+0x994>
ffffffffc020318c:	100027f3          	csrr	a5,sstatus
ffffffffc0203190:	8b89                	andi	a5,a5,2
ffffffffc0203192:	26079463          	bnez	a5,ffffffffc02033fa <pmm_init+0x76c>
ffffffffc0203196:	000b3783          	ld	a5,0(s6)
ffffffffc020319a:	4505                	li	a0,1
ffffffffc020319c:	6f9c                	ld	a5,24(a5)
ffffffffc020319e:	9782                	jalr	a5
ffffffffc02031a0:	8a2a                	mv	s4,a0
ffffffffc02031a2:	00093503          	ld	a0,0(s2)
ffffffffc02031a6:	4699                	li	a3,6
ffffffffc02031a8:	10000613          	li	a2,256
ffffffffc02031ac:	85d2                	mv	a1,s4
ffffffffc02031ae:	9ebff0ef          	jal	ra,ffffffffc0202b98 <page_insert>
ffffffffc02031b2:	4a051863          	bnez	a0,ffffffffc0203662 <pmm_init+0x9d4>
ffffffffc02031b6:	000a2703          	lw	a4,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc02031ba:	4785                	li	a5,1
ffffffffc02031bc:	48f71363          	bne	a4,a5,ffffffffc0203642 <pmm_init+0x9b4>
ffffffffc02031c0:	00093503          	ld	a0,0(s2)
ffffffffc02031c4:	6405                	lui	s0,0x1
ffffffffc02031c6:	4699                	li	a3,6
ffffffffc02031c8:	10040613          	addi	a2,s0,256 # 1100 <_binary_bin_swap_img_size-0x6c00>
ffffffffc02031cc:	85d2                	mv	a1,s4
ffffffffc02031ce:	9cbff0ef          	jal	ra,ffffffffc0202b98 <page_insert>
ffffffffc02031d2:	38051863          	bnez	a0,ffffffffc0203562 <pmm_init+0x8d4>
ffffffffc02031d6:	000a2703          	lw	a4,0(s4)
ffffffffc02031da:	4789                	li	a5,2
ffffffffc02031dc:	4ef71363          	bne	a4,a5,ffffffffc02036c2 <pmm_init+0xa34>
ffffffffc02031e0:	0000a597          	auipc	a1,0xa
ffffffffc02031e4:	93058593          	addi	a1,a1,-1744 # ffffffffc020cb10 <default_pmm_manager+0x760>
ffffffffc02031e8:	10000513          	li	a0,256
ffffffffc02031ec:	188080ef          	jal	ra,ffffffffc020b374 <strcpy>
ffffffffc02031f0:	10040593          	addi	a1,s0,256
ffffffffc02031f4:	10000513          	li	a0,256
ffffffffc02031f8:	18e080ef          	jal	ra,ffffffffc020b386 <strcmp>
ffffffffc02031fc:	4a051363          	bnez	a0,ffffffffc02036a2 <pmm_init+0xa14>
ffffffffc0203200:	000bb683          	ld	a3,0(s7)
ffffffffc0203204:	00080737          	lui	a4,0x80
ffffffffc0203208:	547d                	li	s0,-1
ffffffffc020320a:	40da06b3          	sub	a3,s4,a3
ffffffffc020320e:	8699                	srai	a3,a3,0x6
ffffffffc0203210:	609c                	ld	a5,0(s1)
ffffffffc0203212:	96ba                	add	a3,a3,a4
ffffffffc0203214:	8031                	srli	s0,s0,0xc
ffffffffc0203216:	0086f733          	and	a4,a3,s0
ffffffffc020321a:	06b2                	slli	a3,a3,0xc
ffffffffc020321c:	6ef77263          	bgeu	a4,a5,ffffffffc0203900 <pmm_init+0xc72>
ffffffffc0203220:	0009b783          	ld	a5,0(s3)
ffffffffc0203224:	10000513          	li	a0,256
ffffffffc0203228:	96be                	add	a3,a3,a5
ffffffffc020322a:	10068023          	sb	zero,256(a3)
ffffffffc020322e:	110080ef          	jal	ra,ffffffffc020b33e <strlen>
ffffffffc0203232:	44051863          	bnez	a0,ffffffffc0203682 <pmm_init+0x9f4>
ffffffffc0203236:	00093a83          	ld	s5,0(s2)
ffffffffc020323a:	609c                	ld	a5,0(s1)
ffffffffc020323c:	000ab683          	ld	a3,0(s5) # fffffffffffff000 <end+0x3fd686f0>
ffffffffc0203240:	068a                	slli	a3,a3,0x2
ffffffffc0203242:	82b1                	srli	a3,a3,0xc
ffffffffc0203244:	2ef6fd63          	bgeu	a3,a5,ffffffffc020353e <pmm_init+0x8b0>
ffffffffc0203248:	8c75                	and	s0,s0,a3
ffffffffc020324a:	06b2                	slli	a3,a3,0xc
ffffffffc020324c:	6af47a63          	bgeu	s0,a5,ffffffffc0203900 <pmm_init+0xc72>
ffffffffc0203250:	0009b403          	ld	s0,0(s3)
ffffffffc0203254:	9436                	add	s0,s0,a3
ffffffffc0203256:	100027f3          	csrr	a5,sstatus
ffffffffc020325a:	8b89                	andi	a5,a5,2
ffffffffc020325c:	1e079c63          	bnez	a5,ffffffffc0203454 <pmm_init+0x7c6>
ffffffffc0203260:	000b3783          	ld	a5,0(s6)
ffffffffc0203264:	4585                	li	a1,1
ffffffffc0203266:	8552                	mv	a0,s4
ffffffffc0203268:	739c                	ld	a5,32(a5)
ffffffffc020326a:	9782                	jalr	a5
ffffffffc020326c:	601c                	ld	a5,0(s0)
ffffffffc020326e:	6098                	ld	a4,0(s1)
ffffffffc0203270:	078a                	slli	a5,a5,0x2
ffffffffc0203272:	83b1                	srli	a5,a5,0xc
ffffffffc0203274:	2ce7f563          	bgeu	a5,a4,ffffffffc020353e <pmm_init+0x8b0>
ffffffffc0203278:	000bb503          	ld	a0,0(s7)
ffffffffc020327c:	fff80737          	lui	a4,0xfff80
ffffffffc0203280:	97ba                	add	a5,a5,a4
ffffffffc0203282:	079a                	slli	a5,a5,0x6
ffffffffc0203284:	953e                	add	a0,a0,a5
ffffffffc0203286:	100027f3          	csrr	a5,sstatus
ffffffffc020328a:	8b89                	andi	a5,a5,2
ffffffffc020328c:	1a079863          	bnez	a5,ffffffffc020343c <pmm_init+0x7ae>
ffffffffc0203290:	000b3783          	ld	a5,0(s6)
ffffffffc0203294:	4585                	li	a1,1
ffffffffc0203296:	739c                	ld	a5,32(a5)
ffffffffc0203298:	9782                	jalr	a5
ffffffffc020329a:	000ab783          	ld	a5,0(s5)
ffffffffc020329e:	6098                	ld	a4,0(s1)
ffffffffc02032a0:	078a                	slli	a5,a5,0x2
ffffffffc02032a2:	83b1                	srli	a5,a5,0xc
ffffffffc02032a4:	28e7fd63          	bgeu	a5,a4,ffffffffc020353e <pmm_init+0x8b0>
ffffffffc02032a8:	000bb503          	ld	a0,0(s7)
ffffffffc02032ac:	fff80737          	lui	a4,0xfff80
ffffffffc02032b0:	97ba                	add	a5,a5,a4
ffffffffc02032b2:	079a                	slli	a5,a5,0x6
ffffffffc02032b4:	953e                	add	a0,a0,a5
ffffffffc02032b6:	100027f3          	csrr	a5,sstatus
ffffffffc02032ba:	8b89                	andi	a5,a5,2
ffffffffc02032bc:	16079463          	bnez	a5,ffffffffc0203424 <pmm_init+0x796>
ffffffffc02032c0:	000b3783          	ld	a5,0(s6)
ffffffffc02032c4:	4585                	li	a1,1
ffffffffc02032c6:	739c                	ld	a5,32(a5)
ffffffffc02032c8:	9782                	jalr	a5
ffffffffc02032ca:	00093783          	ld	a5,0(s2)
ffffffffc02032ce:	0007b023          	sd	zero,0(a5)
ffffffffc02032d2:	12000073          	sfence.vma
ffffffffc02032d6:	100027f3          	csrr	a5,sstatus
ffffffffc02032da:	8b89                	andi	a5,a5,2
ffffffffc02032dc:	12079a63          	bnez	a5,ffffffffc0203410 <pmm_init+0x782>
ffffffffc02032e0:	000b3783          	ld	a5,0(s6)
ffffffffc02032e4:	779c                	ld	a5,40(a5)
ffffffffc02032e6:	9782                	jalr	a5
ffffffffc02032e8:	842a                	mv	s0,a0
ffffffffc02032ea:	488c1e63          	bne	s8,s0,ffffffffc0203786 <pmm_init+0xaf8>
ffffffffc02032ee:	0000a517          	auipc	a0,0xa
ffffffffc02032f2:	89a50513          	addi	a0,a0,-1894 # ffffffffc020cb88 <default_pmm_manager+0x7d8>
ffffffffc02032f6:	eb1fc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02032fa:	7406                	ld	s0,96(sp)
ffffffffc02032fc:	70a6                	ld	ra,104(sp)
ffffffffc02032fe:	64e6                	ld	s1,88(sp)
ffffffffc0203300:	6946                	ld	s2,80(sp)
ffffffffc0203302:	69a6                	ld	s3,72(sp)
ffffffffc0203304:	6a06                	ld	s4,64(sp)
ffffffffc0203306:	7ae2                	ld	s5,56(sp)
ffffffffc0203308:	7b42                	ld	s6,48(sp)
ffffffffc020330a:	7ba2                	ld	s7,40(sp)
ffffffffc020330c:	7c02                	ld	s8,32(sp)
ffffffffc020330e:	6ce2                	ld	s9,24(sp)
ffffffffc0203310:	6165                	addi	sp,sp,112
ffffffffc0203312:	c59fe06f          	j	ffffffffc0201f6a <kmalloc_init>
ffffffffc0203316:	c80007b7          	lui	a5,0xc8000
ffffffffc020331a:	b411                	j	ffffffffc0202d1e <pmm_init+0x90>
ffffffffc020331c:	957fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203320:	000b3783          	ld	a5,0(s6)
ffffffffc0203324:	4505                	li	a0,1
ffffffffc0203326:	6f9c                	ld	a5,24(a5)
ffffffffc0203328:	9782                	jalr	a5
ffffffffc020332a:	8c2a                	mv	s8,a0
ffffffffc020332c:	941fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203330:	b9a9                	j	ffffffffc0202f8a <pmm_init+0x2fc>
ffffffffc0203332:	941fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203336:	000b3783          	ld	a5,0(s6)
ffffffffc020333a:	4505                	li	a0,1
ffffffffc020333c:	6f9c                	ld	a5,24(a5)
ffffffffc020333e:	9782                	jalr	a5
ffffffffc0203340:	8a2a                	mv	s4,a0
ffffffffc0203342:	92bfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203346:	b645                	j	ffffffffc0202ee6 <pmm_init+0x258>
ffffffffc0203348:	92bfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020334c:	000b3783          	ld	a5,0(s6)
ffffffffc0203350:	779c                	ld	a5,40(a5)
ffffffffc0203352:	9782                	jalr	a5
ffffffffc0203354:	842a                	mv	s0,a0
ffffffffc0203356:	917fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020335a:	b6b9                	j	ffffffffc0202ea8 <pmm_init+0x21a>
ffffffffc020335c:	917fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203360:	000b3783          	ld	a5,0(s6)
ffffffffc0203364:	4505                	li	a0,1
ffffffffc0203366:	6f9c                	ld	a5,24(a5)
ffffffffc0203368:	9782                	jalr	a5
ffffffffc020336a:	842a                	mv	s0,a0
ffffffffc020336c:	901fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203370:	bc99                	j	ffffffffc0202dc6 <pmm_init+0x138>
ffffffffc0203372:	6705                	lui	a4,0x1
ffffffffc0203374:	177d                	addi	a4,a4,-1
ffffffffc0203376:	96ba                	add	a3,a3,a4
ffffffffc0203378:	8ff5                	and	a5,a5,a3
ffffffffc020337a:	00c7d713          	srli	a4,a5,0xc
ffffffffc020337e:	1ca77063          	bgeu	a4,a0,ffffffffc020353e <pmm_init+0x8b0>
ffffffffc0203382:	000b3683          	ld	a3,0(s6)
ffffffffc0203386:	fff80537          	lui	a0,0xfff80
ffffffffc020338a:	972a                	add	a4,a4,a0
ffffffffc020338c:	6a94                	ld	a3,16(a3)
ffffffffc020338e:	8c1d                	sub	s0,s0,a5
ffffffffc0203390:	00671513          	slli	a0,a4,0x6
ffffffffc0203394:	00c45593          	srli	a1,s0,0xc
ffffffffc0203398:	9532                	add	a0,a0,a2
ffffffffc020339a:	9682                	jalr	a3
ffffffffc020339c:	0009b583          	ld	a1,0(s3)
ffffffffc02033a0:	bac5                	j	ffffffffc0202d90 <pmm_init+0x102>
ffffffffc02033a2:	8d1fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02033a6:	000b3783          	ld	a5,0(s6)
ffffffffc02033aa:	779c                	ld	a5,40(a5)
ffffffffc02033ac:	9782                	jalr	a5
ffffffffc02033ae:	8c2a                	mv	s8,a0
ffffffffc02033b0:	8bdfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02033b4:	b361                	j	ffffffffc020313c <pmm_init+0x4ae>
ffffffffc02033b6:	8bdfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02033ba:	000b3783          	ld	a5,0(s6)
ffffffffc02033be:	779c                	ld	a5,40(a5)
ffffffffc02033c0:	9782                	jalr	a5
ffffffffc02033c2:	8a2a                	mv	s4,a0
ffffffffc02033c4:	8a9fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02033c8:	bb81                	j	ffffffffc0203118 <pmm_init+0x48a>
ffffffffc02033ca:	e42a                	sd	a0,8(sp)
ffffffffc02033cc:	8a7fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02033d0:	000b3783          	ld	a5,0(s6)
ffffffffc02033d4:	6522                	ld	a0,8(sp)
ffffffffc02033d6:	4585                	li	a1,1
ffffffffc02033d8:	739c                	ld	a5,32(a5)
ffffffffc02033da:	9782                	jalr	a5
ffffffffc02033dc:	891fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02033e0:	bb21                	j	ffffffffc02030f8 <pmm_init+0x46a>
ffffffffc02033e2:	e42a                	sd	a0,8(sp)
ffffffffc02033e4:	88ffd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02033e8:	000b3783          	ld	a5,0(s6)
ffffffffc02033ec:	6522                	ld	a0,8(sp)
ffffffffc02033ee:	4585                	li	a1,1
ffffffffc02033f0:	739c                	ld	a5,32(a5)
ffffffffc02033f2:	9782                	jalr	a5
ffffffffc02033f4:	879fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02033f8:	b9c1                	j	ffffffffc02030c8 <pmm_init+0x43a>
ffffffffc02033fa:	879fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02033fe:	000b3783          	ld	a5,0(s6)
ffffffffc0203402:	4505                	li	a0,1
ffffffffc0203404:	6f9c                	ld	a5,24(a5)
ffffffffc0203406:	9782                	jalr	a5
ffffffffc0203408:	8a2a                	mv	s4,a0
ffffffffc020340a:	863fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020340e:	bb51                	j	ffffffffc02031a2 <pmm_init+0x514>
ffffffffc0203410:	863fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203414:	000b3783          	ld	a5,0(s6)
ffffffffc0203418:	779c                	ld	a5,40(a5)
ffffffffc020341a:	9782                	jalr	a5
ffffffffc020341c:	842a                	mv	s0,a0
ffffffffc020341e:	84ffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203422:	b5e1                	j	ffffffffc02032ea <pmm_init+0x65c>
ffffffffc0203424:	e42a                	sd	a0,8(sp)
ffffffffc0203426:	84dfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020342a:	000b3783          	ld	a5,0(s6)
ffffffffc020342e:	6522                	ld	a0,8(sp)
ffffffffc0203430:	4585                	li	a1,1
ffffffffc0203432:	739c                	ld	a5,32(a5)
ffffffffc0203434:	9782                	jalr	a5
ffffffffc0203436:	837fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020343a:	bd41                	j	ffffffffc02032ca <pmm_init+0x63c>
ffffffffc020343c:	e42a                	sd	a0,8(sp)
ffffffffc020343e:	835fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203442:	000b3783          	ld	a5,0(s6)
ffffffffc0203446:	6522                	ld	a0,8(sp)
ffffffffc0203448:	4585                	li	a1,1
ffffffffc020344a:	739c                	ld	a5,32(a5)
ffffffffc020344c:	9782                	jalr	a5
ffffffffc020344e:	81ffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203452:	b5a1                	j	ffffffffc020329a <pmm_init+0x60c>
ffffffffc0203454:	81ffd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203458:	000b3783          	ld	a5,0(s6)
ffffffffc020345c:	4585                	li	a1,1
ffffffffc020345e:	8552                	mv	a0,s4
ffffffffc0203460:	739c                	ld	a5,32(a5)
ffffffffc0203462:	9782                	jalr	a5
ffffffffc0203464:	809fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203468:	b511                	j	ffffffffc020326c <pmm_init+0x5de>
ffffffffc020346a:	00010417          	auipc	s0,0x10
ffffffffc020346e:	b9640413          	addi	s0,s0,-1130 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc0203472:	00010797          	auipc	a5,0x10
ffffffffc0203476:	b8e78793          	addi	a5,a5,-1138 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc020347a:	a0f41de3          	bne	s0,a5,ffffffffc0202e94 <pmm_init+0x206>
ffffffffc020347e:	4581                	li	a1,0
ffffffffc0203480:	6605                	lui	a2,0x1
ffffffffc0203482:	8522                	mv	a0,s0
ffffffffc0203484:	75d070ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc0203488:	0000d597          	auipc	a1,0xd
ffffffffc020348c:	b7858593          	addi	a1,a1,-1160 # ffffffffc0210000 <bootstackguard>
ffffffffc0203490:	0000e797          	auipc	a5,0xe
ffffffffc0203494:	b60787a3          	sb	zero,-1169(a5) # ffffffffc0210fff <bootstackguard+0xfff>
ffffffffc0203498:	0000d797          	auipc	a5,0xd
ffffffffc020349c:	b6078423          	sb	zero,-1176(a5) # ffffffffc0210000 <bootstackguard>
ffffffffc02034a0:	00093503          	ld	a0,0(s2)
ffffffffc02034a4:	2555ec63          	bltu	a1,s5,ffffffffc02036fc <pmm_init+0xa6e>
ffffffffc02034a8:	0009b683          	ld	a3,0(s3)
ffffffffc02034ac:	4701                	li	a4,0
ffffffffc02034ae:	6605                	lui	a2,0x1
ffffffffc02034b0:	40d586b3          	sub	a3,a1,a3
ffffffffc02034b4:	f99fe0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc02034b8:	00093503          	ld	a0,0(s2)
ffffffffc02034bc:	23546363          	bltu	s0,s5,ffffffffc02036e2 <pmm_init+0xa54>
ffffffffc02034c0:	0009b683          	ld	a3,0(s3)
ffffffffc02034c4:	4701                	li	a4,0
ffffffffc02034c6:	6605                	lui	a2,0x1
ffffffffc02034c8:	40d406b3          	sub	a3,s0,a3
ffffffffc02034cc:	85a2                	mv	a1,s0
ffffffffc02034ce:	f7ffe0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc02034d2:	12000073          	sfence.vma
ffffffffc02034d6:	00009517          	auipc	a0,0x9
ffffffffc02034da:	1c250513          	addi	a0,a0,450 # ffffffffc020c698 <default_pmm_manager+0x2e8>
ffffffffc02034de:	cc9fc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02034e2:	ba4d                	j	ffffffffc0202e94 <pmm_init+0x206>
ffffffffc02034e4:	00009697          	auipc	a3,0x9
ffffffffc02034e8:	50468693          	addi	a3,a3,1284 # ffffffffc020c9e8 <default_pmm_manager+0x638>
ffffffffc02034ec:	00008617          	auipc	a2,0x8
ffffffffc02034f0:	3dc60613          	addi	a2,a2,988 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02034f4:	28500593          	li	a1,645
ffffffffc02034f8:	00009517          	auipc	a0,0x9
ffffffffc02034fc:	00850513          	addi	a0,a0,8 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0203500:	f9ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203504:	86a2                	mv	a3,s0
ffffffffc0203506:	00009617          	auipc	a2,0x9
ffffffffc020350a:	ee260613          	addi	a2,a2,-286 # ffffffffc020c3e8 <default_pmm_manager+0x38>
ffffffffc020350e:	28500593          	li	a1,645
ffffffffc0203512:	00009517          	auipc	a0,0x9
ffffffffc0203516:	fee50513          	addi	a0,a0,-18 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020351a:	f85fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020351e:	00009697          	auipc	a3,0x9
ffffffffc0203522:	50a68693          	addi	a3,a3,1290 # ffffffffc020ca28 <default_pmm_manager+0x678>
ffffffffc0203526:	00008617          	auipc	a2,0x8
ffffffffc020352a:	3a260613          	addi	a2,a2,930 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020352e:	28600593          	li	a1,646
ffffffffc0203532:	00009517          	auipc	a0,0x9
ffffffffc0203536:	fce50513          	addi	a0,a0,-50 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020353a:	f65fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020353e:	bf7fe0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>
ffffffffc0203542:	00009697          	auipc	a3,0x9
ffffffffc0203546:	30e68693          	addi	a3,a3,782 # ffffffffc020c850 <default_pmm_manager+0x4a0>
ffffffffc020354a:	00008617          	auipc	a2,0x8
ffffffffc020354e:	37e60613          	addi	a2,a2,894 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203552:	26200593          	li	a1,610
ffffffffc0203556:	00009517          	auipc	a0,0x9
ffffffffc020355a:	faa50513          	addi	a0,a0,-86 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020355e:	f41fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203562:	00009697          	auipc	a3,0x9
ffffffffc0203566:	54e68693          	addi	a3,a3,1358 # ffffffffc020cab0 <default_pmm_manager+0x700>
ffffffffc020356a:	00008617          	auipc	a2,0x8
ffffffffc020356e:	35e60613          	addi	a2,a2,862 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203572:	28f00593          	li	a1,655
ffffffffc0203576:	00009517          	auipc	a0,0x9
ffffffffc020357a:	f8a50513          	addi	a0,a0,-118 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020357e:	f21fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203582:	00009697          	auipc	a3,0x9
ffffffffc0203586:	3ee68693          	addi	a3,a3,1006 # ffffffffc020c970 <default_pmm_manager+0x5c0>
ffffffffc020358a:	00008617          	auipc	a2,0x8
ffffffffc020358e:	33e60613          	addi	a2,a2,830 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203592:	26e00593          	li	a1,622
ffffffffc0203596:	00009517          	auipc	a0,0x9
ffffffffc020359a:	f6a50513          	addi	a0,a0,-150 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020359e:	f01fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035a2:	00009697          	auipc	a3,0x9
ffffffffc02035a6:	39e68693          	addi	a3,a3,926 # ffffffffc020c940 <default_pmm_manager+0x590>
ffffffffc02035aa:	00008617          	auipc	a2,0x8
ffffffffc02035ae:	31e60613          	addi	a2,a2,798 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02035b2:	26400593          	li	a1,612
ffffffffc02035b6:	00009517          	auipc	a0,0x9
ffffffffc02035ba:	f4a50513          	addi	a0,a0,-182 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02035be:	ee1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035c2:	00009697          	auipc	a3,0x9
ffffffffc02035c6:	1ee68693          	addi	a3,a3,494 # ffffffffc020c7b0 <default_pmm_manager+0x400>
ffffffffc02035ca:	00008617          	auipc	a2,0x8
ffffffffc02035ce:	2fe60613          	addi	a2,a2,766 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02035d2:	26300593          	li	a1,611
ffffffffc02035d6:	00009517          	auipc	a0,0x9
ffffffffc02035da:	f2a50513          	addi	a0,a0,-214 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02035de:	ec1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035e2:	00009697          	auipc	a3,0x9
ffffffffc02035e6:	34668693          	addi	a3,a3,838 # ffffffffc020c928 <default_pmm_manager+0x578>
ffffffffc02035ea:	00008617          	auipc	a2,0x8
ffffffffc02035ee:	2de60613          	addi	a2,a2,734 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02035f2:	26800593          	li	a1,616
ffffffffc02035f6:	00009517          	auipc	a0,0x9
ffffffffc02035fa:	f0a50513          	addi	a0,a0,-246 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02035fe:	ea1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203602:	00009697          	auipc	a3,0x9
ffffffffc0203606:	1c668693          	addi	a3,a3,454 # ffffffffc020c7c8 <default_pmm_manager+0x418>
ffffffffc020360a:	00008617          	auipc	a2,0x8
ffffffffc020360e:	2be60613          	addi	a2,a2,702 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203612:	26700593          	li	a1,615
ffffffffc0203616:	00009517          	auipc	a0,0x9
ffffffffc020361a:	eea50513          	addi	a0,a0,-278 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020361e:	e81fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203622:	00009697          	auipc	a3,0x9
ffffffffc0203626:	41e68693          	addi	a3,a3,1054 # ffffffffc020ca40 <default_pmm_manager+0x690>
ffffffffc020362a:	00008617          	auipc	a2,0x8
ffffffffc020362e:	29e60613          	addi	a2,a2,670 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203632:	28900593          	li	a1,649
ffffffffc0203636:	00009517          	auipc	a0,0x9
ffffffffc020363a:	eca50513          	addi	a0,a0,-310 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020363e:	e61fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203642:	00009697          	auipc	a3,0x9
ffffffffc0203646:	45668693          	addi	a3,a3,1110 # ffffffffc020ca98 <default_pmm_manager+0x6e8>
ffffffffc020364a:	00008617          	auipc	a2,0x8
ffffffffc020364e:	27e60613          	addi	a2,a2,638 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203652:	28e00593          	li	a1,654
ffffffffc0203656:	00009517          	auipc	a0,0x9
ffffffffc020365a:	eaa50513          	addi	a0,a0,-342 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020365e:	e41fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203662:	00009697          	auipc	a3,0x9
ffffffffc0203666:	3f668693          	addi	a3,a3,1014 # ffffffffc020ca58 <default_pmm_manager+0x6a8>
ffffffffc020366a:	00008617          	auipc	a2,0x8
ffffffffc020366e:	25e60613          	addi	a2,a2,606 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203672:	28d00593          	li	a1,653
ffffffffc0203676:	00009517          	auipc	a0,0x9
ffffffffc020367a:	e8a50513          	addi	a0,a0,-374 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020367e:	e21fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203682:	00009697          	auipc	a3,0x9
ffffffffc0203686:	4de68693          	addi	a3,a3,1246 # ffffffffc020cb60 <default_pmm_manager+0x7b0>
ffffffffc020368a:	00008617          	auipc	a2,0x8
ffffffffc020368e:	23e60613          	addi	a2,a2,574 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203692:	29700593          	li	a1,663
ffffffffc0203696:	00009517          	auipc	a0,0x9
ffffffffc020369a:	e6a50513          	addi	a0,a0,-406 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020369e:	e01fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036a2:	00009697          	auipc	a3,0x9
ffffffffc02036a6:	48668693          	addi	a3,a3,1158 # ffffffffc020cb28 <default_pmm_manager+0x778>
ffffffffc02036aa:	00008617          	auipc	a2,0x8
ffffffffc02036ae:	21e60613          	addi	a2,a2,542 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02036b2:	29400593          	li	a1,660
ffffffffc02036b6:	00009517          	auipc	a0,0x9
ffffffffc02036ba:	e4a50513          	addi	a0,a0,-438 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02036be:	de1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036c2:	00009697          	auipc	a3,0x9
ffffffffc02036c6:	43668693          	addi	a3,a3,1078 # ffffffffc020caf8 <default_pmm_manager+0x748>
ffffffffc02036ca:	00008617          	auipc	a2,0x8
ffffffffc02036ce:	1fe60613          	addi	a2,a2,510 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02036d2:	29000593          	li	a1,656
ffffffffc02036d6:	00009517          	auipc	a0,0x9
ffffffffc02036da:	e2a50513          	addi	a0,a0,-470 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02036de:	dc1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036e2:	86a2                	mv	a3,s0
ffffffffc02036e4:	00009617          	auipc	a2,0x9
ffffffffc02036e8:	dac60613          	addi	a2,a2,-596 # ffffffffc020c490 <default_pmm_manager+0xe0>
ffffffffc02036ec:	0dc00593          	li	a1,220
ffffffffc02036f0:	00009517          	auipc	a0,0x9
ffffffffc02036f4:	e1050513          	addi	a0,a0,-496 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02036f8:	da7fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036fc:	86ae                	mv	a3,a1
ffffffffc02036fe:	00009617          	auipc	a2,0x9
ffffffffc0203702:	d9260613          	addi	a2,a2,-622 # ffffffffc020c490 <default_pmm_manager+0xe0>
ffffffffc0203706:	0db00593          	li	a1,219
ffffffffc020370a:	00009517          	auipc	a0,0x9
ffffffffc020370e:	df650513          	addi	a0,a0,-522 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0203712:	d8dfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203716:	00009697          	auipc	a3,0x9
ffffffffc020371a:	fca68693          	addi	a3,a3,-54 # ffffffffc020c6e0 <default_pmm_manager+0x330>
ffffffffc020371e:	00008617          	auipc	a2,0x8
ffffffffc0203722:	1aa60613          	addi	a2,a2,426 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203726:	24700593          	li	a1,583
ffffffffc020372a:	00009517          	auipc	a0,0x9
ffffffffc020372e:	dd650513          	addi	a0,a0,-554 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0203732:	d6dfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203736:	00009697          	auipc	a3,0x9
ffffffffc020373a:	f8a68693          	addi	a3,a3,-118 # ffffffffc020c6c0 <default_pmm_manager+0x310>
ffffffffc020373e:	00008617          	auipc	a2,0x8
ffffffffc0203742:	18a60613          	addi	a2,a2,394 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203746:	24600593          	li	a1,582
ffffffffc020374a:	00009517          	auipc	a0,0x9
ffffffffc020374e:	db650513          	addi	a0,a0,-586 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0203752:	d4dfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203756:	00009617          	auipc	a2,0x9
ffffffffc020375a:	efa60613          	addi	a2,a2,-262 # ffffffffc020c650 <default_pmm_manager+0x2a0>
ffffffffc020375e:	0aa00593          	li	a1,170
ffffffffc0203762:	00009517          	auipc	a0,0x9
ffffffffc0203766:	d9e50513          	addi	a0,a0,-610 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020376a:	d35fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020376e:	00009617          	auipc	a2,0x9
ffffffffc0203772:	e4a60613          	addi	a2,a2,-438 # ffffffffc020c5b8 <default_pmm_manager+0x208>
ffffffffc0203776:	06500593          	li	a1,101
ffffffffc020377a:	00009517          	auipc	a0,0x9
ffffffffc020377e:	d8650513          	addi	a0,a0,-634 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0203782:	d1dfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203786:	00009697          	auipc	a3,0x9
ffffffffc020378a:	21a68693          	addi	a3,a3,538 # ffffffffc020c9a0 <default_pmm_manager+0x5f0>
ffffffffc020378e:	00008617          	auipc	a2,0x8
ffffffffc0203792:	13a60613          	addi	a2,a2,314 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203796:	2a000593          	li	a1,672
ffffffffc020379a:	00009517          	auipc	a0,0x9
ffffffffc020379e:	d6650513          	addi	a0,a0,-666 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02037a2:	cfdfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037a6:	00009697          	auipc	a3,0x9
ffffffffc02037aa:	03a68693          	addi	a3,a3,58 # ffffffffc020c7e0 <default_pmm_manager+0x430>
ffffffffc02037ae:	00008617          	auipc	a2,0x8
ffffffffc02037b2:	11a60613          	addi	a2,a2,282 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02037b6:	25500593          	li	a1,597
ffffffffc02037ba:	00009517          	auipc	a0,0x9
ffffffffc02037be:	d4650513          	addi	a0,a0,-698 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02037c2:	cddfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037c6:	86d6                	mv	a3,s5
ffffffffc02037c8:	00009617          	auipc	a2,0x9
ffffffffc02037cc:	c2060613          	addi	a2,a2,-992 # ffffffffc020c3e8 <default_pmm_manager+0x38>
ffffffffc02037d0:	25400593          	li	a1,596
ffffffffc02037d4:	00009517          	auipc	a0,0x9
ffffffffc02037d8:	d2c50513          	addi	a0,a0,-724 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02037dc:	cc3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037e0:	00009697          	auipc	a3,0x9
ffffffffc02037e4:	14868693          	addi	a3,a3,328 # ffffffffc020c928 <default_pmm_manager+0x578>
ffffffffc02037e8:	00008617          	auipc	a2,0x8
ffffffffc02037ec:	0e060613          	addi	a2,a2,224 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02037f0:	26100593          	li	a1,609
ffffffffc02037f4:	00009517          	auipc	a0,0x9
ffffffffc02037f8:	d0c50513          	addi	a0,a0,-756 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02037fc:	ca3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203800:	00009697          	auipc	a3,0x9
ffffffffc0203804:	11068693          	addi	a3,a3,272 # ffffffffc020c910 <default_pmm_manager+0x560>
ffffffffc0203808:	00008617          	auipc	a2,0x8
ffffffffc020380c:	0c060613          	addi	a2,a2,192 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203810:	26000593          	li	a1,608
ffffffffc0203814:	00009517          	auipc	a0,0x9
ffffffffc0203818:	cec50513          	addi	a0,a0,-788 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020381c:	c83fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203820:	00009697          	auipc	a3,0x9
ffffffffc0203824:	0c068693          	addi	a3,a3,192 # ffffffffc020c8e0 <default_pmm_manager+0x530>
ffffffffc0203828:	00008617          	auipc	a2,0x8
ffffffffc020382c:	0a060613          	addi	a2,a2,160 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203830:	25f00593          	li	a1,607
ffffffffc0203834:	00009517          	auipc	a0,0x9
ffffffffc0203838:	ccc50513          	addi	a0,a0,-820 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020383c:	c63fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203840:	00009697          	auipc	a3,0x9
ffffffffc0203844:	08868693          	addi	a3,a3,136 # ffffffffc020c8c8 <default_pmm_manager+0x518>
ffffffffc0203848:	00008617          	auipc	a2,0x8
ffffffffc020384c:	08060613          	addi	a2,a2,128 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203850:	25d00593          	li	a1,605
ffffffffc0203854:	00009517          	auipc	a0,0x9
ffffffffc0203858:	cac50513          	addi	a0,a0,-852 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020385c:	c43fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203860:	00009697          	auipc	a3,0x9
ffffffffc0203864:	04868693          	addi	a3,a3,72 # ffffffffc020c8a8 <default_pmm_manager+0x4f8>
ffffffffc0203868:	00008617          	auipc	a2,0x8
ffffffffc020386c:	06060613          	addi	a2,a2,96 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203870:	25c00593          	li	a1,604
ffffffffc0203874:	00009517          	auipc	a0,0x9
ffffffffc0203878:	c8c50513          	addi	a0,a0,-884 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020387c:	c23fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203880:	00009697          	auipc	a3,0x9
ffffffffc0203884:	01868693          	addi	a3,a3,24 # ffffffffc020c898 <default_pmm_manager+0x4e8>
ffffffffc0203888:	00008617          	auipc	a2,0x8
ffffffffc020388c:	04060613          	addi	a2,a2,64 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203890:	25b00593          	li	a1,603
ffffffffc0203894:	00009517          	auipc	a0,0x9
ffffffffc0203898:	c6c50513          	addi	a0,a0,-916 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020389c:	c03fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02038a0:	00009697          	auipc	a3,0x9
ffffffffc02038a4:	fe868693          	addi	a3,a3,-24 # ffffffffc020c888 <default_pmm_manager+0x4d8>
ffffffffc02038a8:	00008617          	auipc	a2,0x8
ffffffffc02038ac:	02060613          	addi	a2,a2,32 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02038b0:	25a00593          	li	a1,602
ffffffffc02038b4:	00009517          	auipc	a0,0x9
ffffffffc02038b8:	c4c50513          	addi	a0,a0,-948 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02038bc:	be3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02038c0:	00009697          	auipc	a3,0x9
ffffffffc02038c4:	f9068693          	addi	a3,a3,-112 # ffffffffc020c850 <default_pmm_manager+0x4a0>
ffffffffc02038c8:	00008617          	auipc	a2,0x8
ffffffffc02038cc:	00060613          	mv	a2,a2
ffffffffc02038d0:	25900593          	li	a1,601
ffffffffc02038d4:	00009517          	auipc	a0,0x9
ffffffffc02038d8:	c2c50513          	addi	a0,a0,-980 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02038dc:	bc3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02038e0:	00009697          	auipc	a3,0x9
ffffffffc02038e4:	0c068693          	addi	a3,a3,192 # ffffffffc020c9a0 <default_pmm_manager+0x5f0>
ffffffffc02038e8:	00008617          	auipc	a2,0x8
ffffffffc02038ec:	fe060613          	addi	a2,a2,-32 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02038f0:	27600593          	li	a1,630
ffffffffc02038f4:	00009517          	auipc	a0,0x9
ffffffffc02038f8:	c0c50513          	addi	a0,a0,-1012 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02038fc:	ba3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203900:	00009617          	auipc	a2,0x9
ffffffffc0203904:	ae860613          	addi	a2,a2,-1304 # ffffffffc020c3e8 <default_pmm_manager+0x38>
ffffffffc0203908:	07100593          	li	a1,113
ffffffffc020390c:	00009517          	auipc	a0,0x9
ffffffffc0203910:	b0450513          	addi	a0,a0,-1276 # ffffffffc020c410 <default_pmm_manager+0x60>
ffffffffc0203914:	b8bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203918:	86a2                	mv	a3,s0
ffffffffc020391a:	00009617          	auipc	a2,0x9
ffffffffc020391e:	b7660613          	addi	a2,a2,-1162 # ffffffffc020c490 <default_pmm_manager+0xe0>
ffffffffc0203922:	0ca00593          	li	a1,202
ffffffffc0203926:	00009517          	auipc	a0,0x9
ffffffffc020392a:	bda50513          	addi	a0,a0,-1062 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc020392e:	b71fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203932:	00009617          	auipc	a2,0x9
ffffffffc0203936:	b5e60613          	addi	a2,a2,-1186 # ffffffffc020c490 <default_pmm_manager+0xe0>
ffffffffc020393a:	08100593          	li	a1,129
ffffffffc020393e:	00009517          	auipc	a0,0x9
ffffffffc0203942:	bc250513          	addi	a0,a0,-1086 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0203946:	b59fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020394a:	00009697          	auipc	a3,0x9
ffffffffc020394e:	ec668693          	addi	a3,a3,-314 # ffffffffc020c810 <default_pmm_manager+0x460>
ffffffffc0203952:	00008617          	auipc	a2,0x8
ffffffffc0203956:	f7660613          	addi	a2,a2,-138 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020395a:	25800593          	li	a1,600
ffffffffc020395e:	00009517          	auipc	a0,0x9
ffffffffc0203962:	ba250513          	addi	a0,a0,-1118 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0203966:	b39fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020396a:	00009697          	auipc	a3,0x9
ffffffffc020396e:	de668693          	addi	a3,a3,-538 # ffffffffc020c750 <default_pmm_manager+0x3a0>
ffffffffc0203972:	00008617          	auipc	a2,0x8
ffffffffc0203976:	f5660613          	addi	a2,a2,-170 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020397a:	24c00593          	li	a1,588
ffffffffc020397e:	00009517          	auipc	a0,0x9
ffffffffc0203982:	b8250513          	addi	a0,a0,-1150 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0203986:	b19fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020398a:	fc6fe0ef          	jal	ra,ffffffffc0202150 <pte2page.part.0>
ffffffffc020398e:	00009697          	auipc	a3,0x9
ffffffffc0203992:	df268693          	addi	a3,a3,-526 # ffffffffc020c780 <default_pmm_manager+0x3d0>
ffffffffc0203996:	00008617          	auipc	a2,0x8
ffffffffc020399a:	f3260613          	addi	a2,a2,-206 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020399e:	24f00593          	li	a1,591
ffffffffc02039a2:	00009517          	auipc	a0,0x9
ffffffffc02039a6:	b5e50513          	addi	a0,a0,-1186 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02039aa:	af5fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02039ae:	00009697          	auipc	a3,0x9
ffffffffc02039b2:	d7268693          	addi	a3,a3,-654 # ffffffffc020c720 <default_pmm_manager+0x370>
ffffffffc02039b6:	00008617          	auipc	a2,0x8
ffffffffc02039ba:	f1260613          	addi	a2,a2,-238 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02039be:	24800593          	li	a1,584
ffffffffc02039c2:	00009517          	auipc	a0,0x9
ffffffffc02039c6:	b3e50513          	addi	a0,a0,-1218 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02039ca:	ad5fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02039ce:	00009697          	auipc	a3,0x9
ffffffffc02039d2:	de268693          	addi	a3,a3,-542 # ffffffffc020c7b0 <default_pmm_manager+0x400>
ffffffffc02039d6:	00008617          	auipc	a2,0x8
ffffffffc02039da:	ef260613          	addi	a2,a2,-270 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02039de:	25000593          	li	a1,592
ffffffffc02039e2:	00009517          	auipc	a0,0x9
ffffffffc02039e6:	b1e50513          	addi	a0,a0,-1250 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc02039ea:	ab5fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02039ee:	00009617          	auipc	a2,0x9
ffffffffc02039f2:	9fa60613          	addi	a2,a2,-1542 # ffffffffc020c3e8 <default_pmm_manager+0x38>
ffffffffc02039f6:	25300593          	li	a1,595
ffffffffc02039fa:	00009517          	auipc	a0,0x9
ffffffffc02039fe:	b0650513          	addi	a0,a0,-1274 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0203a02:	a9dfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a06:	00009697          	auipc	a3,0x9
ffffffffc0203a0a:	dc268693          	addi	a3,a3,-574 # ffffffffc020c7c8 <default_pmm_manager+0x418>
ffffffffc0203a0e:	00008617          	auipc	a2,0x8
ffffffffc0203a12:	eba60613          	addi	a2,a2,-326 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203a16:	25100593          	li	a1,593
ffffffffc0203a1a:	00009517          	auipc	a0,0x9
ffffffffc0203a1e:	ae650513          	addi	a0,a0,-1306 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0203a22:	a7dfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a26:	86ca                	mv	a3,s2
ffffffffc0203a28:	00009617          	auipc	a2,0x9
ffffffffc0203a2c:	a6860613          	addi	a2,a2,-1432 # ffffffffc020c490 <default_pmm_manager+0xe0>
ffffffffc0203a30:	0c600593          	li	a1,198
ffffffffc0203a34:	00009517          	auipc	a0,0x9
ffffffffc0203a38:	acc50513          	addi	a0,a0,-1332 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0203a3c:	a63fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a40:	00009697          	auipc	a3,0x9
ffffffffc0203a44:	ee868693          	addi	a3,a3,-280 # ffffffffc020c928 <default_pmm_manager+0x578>
ffffffffc0203a48:	00008617          	auipc	a2,0x8
ffffffffc0203a4c:	e8060613          	addi	a2,a2,-384 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203a50:	26c00593          	li	a1,620
ffffffffc0203a54:	00009517          	auipc	a0,0x9
ffffffffc0203a58:	aac50513          	addi	a0,a0,-1364 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0203a5c:	a43fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a60:	00009697          	auipc	a3,0x9
ffffffffc0203a64:	ef868693          	addi	a3,a3,-264 # ffffffffc020c958 <default_pmm_manager+0x5a8>
ffffffffc0203a68:	00008617          	auipc	a2,0x8
ffffffffc0203a6c:	e6060613          	addi	a2,a2,-416 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203a70:	26b00593          	li	a1,619
ffffffffc0203a74:	00009517          	auipc	a0,0x9
ffffffffc0203a78:	a8c50513          	addi	a0,a0,-1396 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0203a7c:	a23fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203a80 <pgdir_alloc_page>:
ffffffffc0203a80:	7179                	addi	sp,sp,-48
ffffffffc0203a82:	ec26                	sd	s1,24(sp)
ffffffffc0203a84:	e84a                	sd	s2,16(sp)
ffffffffc0203a86:	e052                	sd	s4,0(sp)
ffffffffc0203a88:	f406                	sd	ra,40(sp)
ffffffffc0203a8a:	f022                	sd	s0,32(sp)
ffffffffc0203a8c:	e44e                	sd	s3,8(sp)
ffffffffc0203a8e:	8a2a                	mv	s4,a0
ffffffffc0203a90:	84ae                	mv	s1,a1
ffffffffc0203a92:	8932                	mv	s2,a2
ffffffffc0203a94:	100027f3          	csrr	a5,sstatus
ffffffffc0203a98:	8b89                	andi	a5,a5,2
ffffffffc0203a9a:	00093997          	auipc	s3,0x93
ffffffffc0203a9e:	e1698993          	addi	s3,s3,-490 # ffffffffc02968b0 <pmm_manager>
ffffffffc0203aa2:	ef8d                	bnez	a5,ffffffffc0203adc <pgdir_alloc_page+0x5c>
ffffffffc0203aa4:	0009b783          	ld	a5,0(s3)
ffffffffc0203aa8:	4505                	li	a0,1
ffffffffc0203aaa:	6f9c                	ld	a5,24(a5)
ffffffffc0203aac:	9782                	jalr	a5
ffffffffc0203aae:	842a                	mv	s0,a0
ffffffffc0203ab0:	cc09                	beqz	s0,ffffffffc0203aca <pgdir_alloc_page+0x4a>
ffffffffc0203ab2:	86ca                	mv	a3,s2
ffffffffc0203ab4:	8626                	mv	a2,s1
ffffffffc0203ab6:	85a2                	mv	a1,s0
ffffffffc0203ab8:	8552                	mv	a0,s4
ffffffffc0203aba:	8deff0ef          	jal	ra,ffffffffc0202b98 <page_insert>
ffffffffc0203abe:	e915                	bnez	a0,ffffffffc0203af2 <pgdir_alloc_page+0x72>
ffffffffc0203ac0:	4018                	lw	a4,0(s0)
ffffffffc0203ac2:	fc04                	sd	s1,56(s0)
ffffffffc0203ac4:	4785                	li	a5,1
ffffffffc0203ac6:	04f71e63          	bne	a4,a5,ffffffffc0203b22 <pgdir_alloc_page+0xa2>
ffffffffc0203aca:	70a2                	ld	ra,40(sp)
ffffffffc0203acc:	8522                	mv	a0,s0
ffffffffc0203ace:	7402                	ld	s0,32(sp)
ffffffffc0203ad0:	64e2                	ld	s1,24(sp)
ffffffffc0203ad2:	6942                	ld	s2,16(sp)
ffffffffc0203ad4:	69a2                	ld	s3,8(sp)
ffffffffc0203ad6:	6a02                	ld	s4,0(sp)
ffffffffc0203ad8:	6145                	addi	sp,sp,48
ffffffffc0203ada:	8082                	ret
ffffffffc0203adc:	996fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203ae0:	0009b783          	ld	a5,0(s3)
ffffffffc0203ae4:	4505                	li	a0,1
ffffffffc0203ae6:	6f9c                	ld	a5,24(a5)
ffffffffc0203ae8:	9782                	jalr	a5
ffffffffc0203aea:	842a                	mv	s0,a0
ffffffffc0203aec:	980fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203af0:	b7c1                	j	ffffffffc0203ab0 <pgdir_alloc_page+0x30>
ffffffffc0203af2:	100027f3          	csrr	a5,sstatus
ffffffffc0203af6:	8b89                	andi	a5,a5,2
ffffffffc0203af8:	eb89                	bnez	a5,ffffffffc0203b0a <pgdir_alloc_page+0x8a>
ffffffffc0203afa:	0009b783          	ld	a5,0(s3)
ffffffffc0203afe:	8522                	mv	a0,s0
ffffffffc0203b00:	4585                	li	a1,1
ffffffffc0203b02:	739c                	ld	a5,32(a5)
ffffffffc0203b04:	4401                	li	s0,0
ffffffffc0203b06:	9782                	jalr	a5
ffffffffc0203b08:	b7c9                	j	ffffffffc0203aca <pgdir_alloc_page+0x4a>
ffffffffc0203b0a:	968fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203b0e:	0009b783          	ld	a5,0(s3)
ffffffffc0203b12:	8522                	mv	a0,s0
ffffffffc0203b14:	4585                	li	a1,1
ffffffffc0203b16:	739c                	ld	a5,32(a5)
ffffffffc0203b18:	4401                	li	s0,0
ffffffffc0203b1a:	9782                	jalr	a5
ffffffffc0203b1c:	950fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203b20:	b76d                	j	ffffffffc0203aca <pgdir_alloc_page+0x4a>
ffffffffc0203b22:	00009697          	auipc	a3,0x9
ffffffffc0203b26:	08668693          	addi	a3,a3,134 # ffffffffc020cba8 <default_pmm_manager+0x7f8>
ffffffffc0203b2a:	00008617          	auipc	a2,0x8
ffffffffc0203b2e:	d9e60613          	addi	a2,a2,-610 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203b32:	22d00593          	li	a1,557
ffffffffc0203b36:	00009517          	auipc	a0,0x9
ffffffffc0203b3a:	9ca50513          	addi	a0,a0,-1590 # ffffffffc020c500 <default_pmm_manager+0x150>
ffffffffc0203b3e:	961fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203b42 <check_vma_overlap.part.0>:
ffffffffc0203b42:	1141                	addi	sp,sp,-16
ffffffffc0203b44:	00009697          	auipc	a3,0x9
ffffffffc0203b48:	07c68693          	addi	a3,a3,124 # ffffffffc020cbc0 <default_pmm_manager+0x810>
ffffffffc0203b4c:	00008617          	auipc	a2,0x8
ffffffffc0203b50:	d7c60613          	addi	a2,a2,-644 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203b54:	07400593          	li	a1,116
ffffffffc0203b58:	00009517          	auipc	a0,0x9
ffffffffc0203b5c:	08850513          	addi	a0,a0,136 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc0203b60:	e406                	sd	ra,8(sp)
ffffffffc0203b62:	93dfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203b66 <mm_create>:
ffffffffc0203b66:	1141                	addi	sp,sp,-16
ffffffffc0203b68:	05800513          	li	a0,88
ffffffffc0203b6c:	e022                	sd	s0,0(sp)
ffffffffc0203b6e:	e406                	sd	ra,8(sp)
ffffffffc0203b70:	c1efe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203b74:	842a                	mv	s0,a0
ffffffffc0203b76:	c115                	beqz	a0,ffffffffc0203b9a <mm_create+0x34>
ffffffffc0203b78:	e408                	sd	a0,8(s0)
ffffffffc0203b7a:	e008                	sd	a0,0(s0)
ffffffffc0203b7c:	00053823          	sd	zero,16(a0)
ffffffffc0203b80:	00053c23          	sd	zero,24(a0)
ffffffffc0203b84:	02052023          	sw	zero,32(a0)
ffffffffc0203b88:	02053423          	sd	zero,40(a0)
ffffffffc0203b8c:	02052823          	sw	zero,48(a0)
ffffffffc0203b90:	4585                	li	a1,1
ffffffffc0203b92:	03850513          	addi	a0,a0,56
ffffffffc0203b96:	123000ef          	jal	ra,ffffffffc02044b8 <sem_init>
ffffffffc0203b9a:	60a2                	ld	ra,8(sp)
ffffffffc0203b9c:	8522                	mv	a0,s0
ffffffffc0203b9e:	6402                	ld	s0,0(sp)
ffffffffc0203ba0:	0141                	addi	sp,sp,16
ffffffffc0203ba2:	8082                	ret

ffffffffc0203ba4 <find_vma>:
ffffffffc0203ba4:	86aa                	mv	a3,a0
ffffffffc0203ba6:	c505                	beqz	a0,ffffffffc0203bce <find_vma+0x2a>
ffffffffc0203ba8:	6908                	ld	a0,16(a0)
ffffffffc0203baa:	c501                	beqz	a0,ffffffffc0203bb2 <find_vma+0xe>
ffffffffc0203bac:	651c                	ld	a5,8(a0)
ffffffffc0203bae:	02f5f263          	bgeu	a1,a5,ffffffffc0203bd2 <find_vma+0x2e>
ffffffffc0203bb2:	669c                	ld	a5,8(a3)
ffffffffc0203bb4:	00f68d63          	beq	a3,a5,ffffffffc0203bce <find_vma+0x2a>
ffffffffc0203bb8:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203bbc:	00e5e663          	bltu	a1,a4,ffffffffc0203bc8 <find_vma+0x24>
ffffffffc0203bc0:	ff07b703          	ld	a4,-16(a5)
ffffffffc0203bc4:	00e5ec63          	bltu	a1,a4,ffffffffc0203bdc <find_vma+0x38>
ffffffffc0203bc8:	679c                	ld	a5,8(a5)
ffffffffc0203bca:	fef697e3          	bne	a3,a5,ffffffffc0203bb8 <find_vma+0x14>
ffffffffc0203bce:	4501                	li	a0,0
ffffffffc0203bd0:	8082                	ret
ffffffffc0203bd2:	691c                	ld	a5,16(a0)
ffffffffc0203bd4:	fcf5ffe3          	bgeu	a1,a5,ffffffffc0203bb2 <find_vma+0xe>
ffffffffc0203bd8:	ea88                	sd	a0,16(a3)
ffffffffc0203bda:	8082                	ret
ffffffffc0203bdc:	fe078513          	addi	a0,a5,-32
ffffffffc0203be0:	ea88                	sd	a0,16(a3)
ffffffffc0203be2:	8082                	ret

ffffffffc0203be4 <insert_vma_struct>:
ffffffffc0203be4:	6590                	ld	a2,8(a1)
ffffffffc0203be6:	0105b803          	ld	a6,16(a1)
ffffffffc0203bea:	1141                	addi	sp,sp,-16
ffffffffc0203bec:	e406                	sd	ra,8(sp)
ffffffffc0203bee:	87aa                	mv	a5,a0
ffffffffc0203bf0:	01066763          	bltu	a2,a6,ffffffffc0203bfe <insert_vma_struct+0x1a>
ffffffffc0203bf4:	a085                	j	ffffffffc0203c54 <insert_vma_struct+0x70>
ffffffffc0203bf6:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203bfa:	04e66863          	bltu	a2,a4,ffffffffc0203c4a <insert_vma_struct+0x66>
ffffffffc0203bfe:	86be                	mv	a3,a5
ffffffffc0203c00:	679c                	ld	a5,8(a5)
ffffffffc0203c02:	fef51ae3          	bne	a0,a5,ffffffffc0203bf6 <insert_vma_struct+0x12>
ffffffffc0203c06:	02a68463          	beq	a3,a0,ffffffffc0203c2e <insert_vma_struct+0x4a>
ffffffffc0203c0a:	ff06b703          	ld	a4,-16(a3)
ffffffffc0203c0e:	fe86b883          	ld	a7,-24(a3)
ffffffffc0203c12:	08e8f163          	bgeu	a7,a4,ffffffffc0203c94 <insert_vma_struct+0xb0>
ffffffffc0203c16:	04e66f63          	bltu	a2,a4,ffffffffc0203c74 <insert_vma_struct+0x90>
ffffffffc0203c1a:	00f50a63          	beq	a0,a5,ffffffffc0203c2e <insert_vma_struct+0x4a>
ffffffffc0203c1e:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203c22:	05076963          	bltu	a4,a6,ffffffffc0203c74 <insert_vma_struct+0x90>
ffffffffc0203c26:	ff07b603          	ld	a2,-16(a5)
ffffffffc0203c2a:	02c77363          	bgeu	a4,a2,ffffffffc0203c50 <insert_vma_struct+0x6c>
ffffffffc0203c2e:	5118                	lw	a4,32(a0)
ffffffffc0203c30:	e188                	sd	a0,0(a1)
ffffffffc0203c32:	02058613          	addi	a2,a1,32
ffffffffc0203c36:	e390                	sd	a2,0(a5)
ffffffffc0203c38:	e690                	sd	a2,8(a3)
ffffffffc0203c3a:	60a2                	ld	ra,8(sp)
ffffffffc0203c3c:	f59c                	sd	a5,40(a1)
ffffffffc0203c3e:	f194                	sd	a3,32(a1)
ffffffffc0203c40:	0017079b          	addiw	a5,a4,1
ffffffffc0203c44:	d11c                	sw	a5,32(a0)
ffffffffc0203c46:	0141                	addi	sp,sp,16
ffffffffc0203c48:	8082                	ret
ffffffffc0203c4a:	fca690e3          	bne	a3,a0,ffffffffc0203c0a <insert_vma_struct+0x26>
ffffffffc0203c4e:	bfd1                	j	ffffffffc0203c22 <insert_vma_struct+0x3e>
ffffffffc0203c50:	ef3ff0ef          	jal	ra,ffffffffc0203b42 <check_vma_overlap.part.0>
ffffffffc0203c54:	00009697          	auipc	a3,0x9
ffffffffc0203c58:	f9c68693          	addi	a3,a3,-100 # ffffffffc020cbf0 <default_pmm_manager+0x840>
ffffffffc0203c5c:	00008617          	auipc	a2,0x8
ffffffffc0203c60:	c6c60613          	addi	a2,a2,-916 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203c64:	07a00593          	li	a1,122
ffffffffc0203c68:	00009517          	auipc	a0,0x9
ffffffffc0203c6c:	f7850513          	addi	a0,a0,-136 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc0203c70:	82ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203c74:	00009697          	auipc	a3,0x9
ffffffffc0203c78:	fbc68693          	addi	a3,a3,-68 # ffffffffc020cc30 <default_pmm_manager+0x880>
ffffffffc0203c7c:	00008617          	auipc	a2,0x8
ffffffffc0203c80:	c4c60613          	addi	a2,a2,-948 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203c84:	07300593          	li	a1,115
ffffffffc0203c88:	00009517          	auipc	a0,0x9
ffffffffc0203c8c:	f5850513          	addi	a0,a0,-168 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc0203c90:	80ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203c94:	00009697          	auipc	a3,0x9
ffffffffc0203c98:	f7c68693          	addi	a3,a3,-132 # ffffffffc020cc10 <default_pmm_manager+0x860>
ffffffffc0203c9c:	00008617          	auipc	a2,0x8
ffffffffc0203ca0:	c2c60613          	addi	a2,a2,-980 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203ca4:	07200593          	li	a1,114
ffffffffc0203ca8:	00009517          	auipc	a0,0x9
ffffffffc0203cac:	f3850513          	addi	a0,a0,-200 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc0203cb0:	feefc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203cb4 <mm_destroy>:
ffffffffc0203cb4:	591c                	lw	a5,48(a0)
ffffffffc0203cb6:	1141                	addi	sp,sp,-16
ffffffffc0203cb8:	e406                	sd	ra,8(sp)
ffffffffc0203cba:	e022                	sd	s0,0(sp)
ffffffffc0203cbc:	e78d                	bnez	a5,ffffffffc0203ce6 <mm_destroy+0x32>
ffffffffc0203cbe:	842a                	mv	s0,a0
ffffffffc0203cc0:	6508                	ld	a0,8(a0)
ffffffffc0203cc2:	00a40c63          	beq	s0,a0,ffffffffc0203cda <mm_destroy+0x26>
ffffffffc0203cc6:	6118                	ld	a4,0(a0)
ffffffffc0203cc8:	651c                	ld	a5,8(a0)
ffffffffc0203cca:	1501                	addi	a0,a0,-32
ffffffffc0203ccc:	e71c                	sd	a5,8(a4)
ffffffffc0203cce:	e398                	sd	a4,0(a5)
ffffffffc0203cd0:	b6efe0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0203cd4:	6408                	ld	a0,8(s0)
ffffffffc0203cd6:	fea418e3          	bne	s0,a0,ffffffffc0203cc6 <mm_destroy+0x12>
ffffffffc0203cda:	8522                	mv	a0,s0
ffffffffc0203cdc:	6402                	ld	s0,0(sp)
ffffffffc0203cde:	60a2                	ld	ra,8(sp)
ffffffffc0203ce0:	0141                	addi	sp,sp,16
ffffffffc0203ce2:	b5cfe06f          	j	ffffffffc020203e <kfree>
ffffffffc0203ce6:	00009697          	auipc	a3,0x9
ffffffffc0203cea:	f6a68693          	addi	a3,a3,-150 # ffffffffc020cc50 <default_pmm_manager+0x8a0>
ffffffffc0203cee:	00008617          	auipc	a2,0x8
ffffffffc0203cf2:	bda60613          	addi	a2,a2,-1062 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203cf6:	09e00593          	li	a1,158
ffffffffc0203cfa:	00009517          	auipc	a0,0x9
ffffffffc0203cfe:	ee650513          	addi	a0,a0,-282 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc0203d02:	f9cfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203d06 <mm_map>:
ffffffffc0203d06:	7139                	addi	sp,sp,-64
ffffffffc0203d08:	f822                	sd	s0,48(sp)
ffffffffc0203d0a:	6405                	lui	s0,0x1
ffffffffc0203d0c:	147d                	addi	s0,s0,-1
ffffffffc0203d0e:	77fd                	lui	a5,0xfffff
ffffffffc0203d10:	9622                	add	a2,a2,s0
ffffffffc0203d12:	962e                	add	a2,a2,a1
ffffffffc0203d14:	f426                	sd	s1,40(sp)
ffffffffc0203d16:	fc06                	sd	ra,56(sp)
ffffffffc0203d18:	00f5f4b3          	and	s1,a1,a5
ffffffffc0203d1c:	f04a                	sd	s2,32(sp)
ffffffffc0203d1e:	ec4e                	sd	s3,24(sp)
ffffffffc0203d20:	e852                	sd	s4,16(sp)
ffffffffc0203d22:	e456                	sd	s5,8(sp)
ffffffffc0203d24:	002005b7          	lui	a1,0x200
ffffffffc0203d28:	00f67433          	and	s0,a2,a5
ffffffffc0203d2c:	06b4e363          	bltu	s1,a1,ffffffffc0203d92 <mm_map+0x8c>
ffffffffc0203d30:	0684f163          	bgeu	s1,s0,ffffffffc0203d92 <mm_map+0x8c>
ffffffffc0203d34:	4785                	li	a5,1
ffffffffc0203d36:	07fe                	slli	a5,a5,0x1f
ffffffffc0203d38:	0487ed63          	bltu	a5,s0,ffffffffc0203d92 <mm_map+0x8c>
ffffffffc0203d3c:	89aa                	mv	s3,a0
ffffffffc0203d3e:	cd21                	beqz	a0,ffffffffc0203d96 <mm_map+0x90>
ffffffffc0203d40:	85a6                	mv	a1,s1
ffffffffc0203d42:	8ab6                	mv	s5,a3
ffffffffc0203d44:	8a3a                	mv	s4,a4
ffffffffc0203d46:	e5fff0ef          	jal	ra,ffffffffc0203ba4 <find_vma>
ffffffffc0203d4a:	c501                	beqz	a0,ffffffffc0203d52 <mm_map+0x4c>
ffffffffc0203d4c:	651c                	ld	a5,8(a0)
ffffffffc0203d4e:	0487e263          	bltu	a5,s0,ffffffffc0203d92 <mm_map+0x8c>
ffffffffc0203d52:	03000513          	li	a0,48
ffffffffc0203d56:	a38fe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203d5a:	892a                	mv	s2,a0
ffffffffc0203d5c:	5571                	li	a0,-4
ffffffffc0203d5e:	02090163          	beqz	s2,ffffffffc0203d80 <mm_map+0x7a>
ffffffffc0203d62:	854e                	mv	a0,s3
ffffffffc0203d64:	00993423          	sd	s1,8(s2)
ffffffffc0203d68:	00893823          	sd	s0,16(s2)
ffffffffc0203d6c:	01592c23          	sw	s5,24(s2)
ffffffffc0203d70:	85ca                	mv	a1,s2
ffffffffc0203d72:	e73ff0ef          	jal	ra,ffffffffc0203be4 <insert_vma_struct>
ffffffffc0203d76:	4501                	li	a0,0
ffffffffc0203d78:	000a0463          	beqz	s4,ffffffffc0203d80 <mm_map+0x7a>
ffffffffc0203d7c:	012a3023          	sd	s2,0(s4)
ffffffffc0203d80:	70e2                	ld	ra,56(sp)
ffffffffc0203d82:	7442                	ld	s0,48(sp)
ffffffffc0203d84:	74a2                	ld	s1,40(sp)
ffffffffc0203d86:	7902                	ld	s2,32(sp)
ffffffffc0203d88:	69e2                	ld	s3,24(sp)
ffffffffc0203d8a:	6a42                	ld	s4,16(sp)
ffffffffc0203d8c:	6aa2                	ld	s5,8(sp)
ffffffffc0203d8e:	6121                	addi	sp,sp,64
ffffffffc0203d90:	8082                	ret
ffffffffc0203d92:	5575                	li	a0,-3
ffffffffc0203d94:	b7f5                	j	ffffffffc0203d80 <mm_map+0x7a>
ffffffffc0203d96:	00009697          	auipc	a3,0x9
ffffffffc0203d9a:	ed268693          	addi	a3,a3,-302 # ffffffffc020cc68 <default_pmm_manager+0x8b8>
ffffffffc0203d9e:	00008617          	auipc	a2,0x8
ffffffffc0203da2:	b2a60613          	addi	a2,a2,-1238 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203da6:	0b300593          	li	a1,179
ffffffffc0203daa:	00009517          	auipc	a0,0x9
ffffffffc0203dae:	e3650513          	addi	a0,a0,-458 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc0203db2:	eecfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203db6 <dup_mmap>:
ffffffffc0203db6:	7139                	addi	sp,sp,-64
ffffffffc0203db8:	fc06                	sd	ra,56(sp)
ffffffffc0203dba:	f822                	sd	s0,48(sp)
ffffffffc0203dbc:	f426                	sd	s1,40(sp)
ffffffffc0203dbe:	f04a                	sd	s2,32(sp)
ffffffffc0203dc0:	ec4e                	sd	s3,24(sp)
ffffffffc0203dc2:	e852                	sd	s4,16(sp)
ffffffffc0203dc4:	e456                	sd	s5,8(sp)
ffffffffc0203dc6:	c52d                	beqz	a0,ffffffffc0203e30 <dup_mmap+0x7a>
ffffffffc0203dc8:	892a                	mv	s2,a0
ffffffffc0203dca:	84ae                	mv	s1,a1
ffffffffc0203dcc:	842e                	mv	s0,a1
ffffffffc0203dce:	e595                	bnez	a1,ffffffffc0203dfa <dup_mmap+0x44>
ffffffffc0203dd0:	a085                	j	ffffffffc0203e30 <dup_mmap+0x7a>
ffffffffc0203dd2:	854a                	mv	a0,s2
ffffffffc0203dd4:	0155b423          	sd	s5,8(a1) # 200008 <_binary_bin_sfs_img_size+0x18ad08>
ffffffffc0203dd8:	0145b823          	sd	s4,16(a1)
ffffffffc0203ddc:	0135ac23          	sw	s3,24(a1)
ffffffffc0203de0:	e05ff0ef          	jal	ra,ffffffffc0203be4 <insert_vma_struct>
ffffffffc0203de4:	ff043683          	ld	a3,-16(s0) # ff0 <_binary_bin_swap_img_size-0x6d10>
ffffffffc0203de8:	fe843603          	ld	a2,-24(s0)
ffffffffc0203dec:	6c8c                	ld	a1,24(s1)
ffffffffc0203dee:	01893503          	ld	a0,24(s2)
ffffffffc0203df2:	4701                	li	a4,0
ffffffffc0203df4:	b4bfe0ef          	jal	ra,ffffffffc020293e <copy_range>
ffffffffc0203df8:	e105                	bnez	a0,ffffffffc0203e18 <dup_mmap+0x62>
ffffffffc0203dfa:	6000                	ld	s0,0(s0)
ffffffffc0203dfc:	02848863          	beq	s1,s0,ffffffffc0203e2c <dup_mmap+0x76>
ffffffffc0203e00:	03000513          	li	a0,48
ffffffffc0203e04:	fe843a83          	ld	s5,-24(s0)
ffffffffc0203e08:	ff043a03          	ld	s4,-16(s0)
ffffffffc0203e0c:	ff842983          	lw	s3,-8(s0)
ffffffffc0203e10:	97efe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203e14:	85aa                	mv	a1,a0
ffffffffc0203e16:	fd55                	bnez	a0,ffffffffc0203dd2 <dup_mmap+0x1c>
ffffffffc0203e18:	5571                	li	a0,-4
ffffffffc0203e1a:	70e2                	ld	ra,56(sp)
ffffffffc0203e1c:	7442                	ld	s0,48(sp)
ffffffffc0203e1e:	74a2                	ld	s1,40(sp)
ffffffffc0203e20:	7902                	ld	s2,32(sp)
ffffffffc0203e22:	69e2                	ld	s3,24(sp)
ffffffffc0203e24:	6a42                	ld	s4,16(sp)
ffffffffc0203e26:	6aa2                	ld	s5,8(sp)
ffffffffc0203e28:	6121                	addi	sp,sp,64
ffffffffc0203e2a:	8082                	ret
ffffffffc0203e2c:	4501                	li	a0,0
ffffffffc0203e2e:	b7f5                	j	ffffffffc0203e1a <dup_mmap+0x64>
ffffffffc0203e30:	00009697          	auipc	a3,0x9
ffffffffc0203e34:	e4868693          	addi	a3,a3,-440 # ffffffffc020cc78 <default_pmm_manager+0x8c8>
ffffffffc0203e38:	00008617          	auipc	a2,0x8
ffffffffc0203e3c:	a9060613          	addi	a2,a2,-1392 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203e40:	0cf00593          	li	a1,207
ffffffffc0203e44:	00009517          	auipc	a0,0x9
ffffffffc0203e48:	d9c50513          	addi	a0,a0,-612 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc0203e4c:	e52fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203e50 <exit_mmap>:
ffffffffc0203e50:	1101                	addi	sp,sp,-32
ffffffffc0203e52:	ec06                	sd	ra,24(sp)
ffffffffc0203e54:	e822                	sd	s0,16(sp)
ffffffffc0203e56:	e426                	sd	s1,8(sp)
ffffffffc0203e58:	e04a                	sd	s2,0(sp)
ffffffffc0203e5a:	c531                	beqz	a0,ffffffffc0203ea6 <exit_mmap+0x56>
ffffffffc0203e5c:	591c                	lw	a5,48(a0)
ffffffffc0203e5e:	84aa                	mv	s1,a0
ffffffffc0203e60:	e3b9                	bnez	a5,ffffffffc0203ea6 <exit_mmap+0x56>
ffffffffc0203e62:	6500                	ld	s0,8(a0)
ffffffffc0203e64:	01853903          	ld	s2,24(a0)
ffffffffc0203e68:	02850663          	beq	a0,s0,ffffffffc0203e94 <exit_mmap+0x44>
ffffffffc0203e6c:	ff043603          	ld	a2,-16(s0)
ffffffffc0203e70:	fe843583          	ld	a1,-24(s0)
ffffffffc0203e74:	854a                	mv	a0,s2
ffffffffc0203e76:	ef0fe0ef          	jal	ra,ffffffffc0202566 <unmap_range>
ffffffffc0203e7a:	6400                	ld	s0,8(s0)
ffffffffc0203e7c:	fe8498e3          	bne	s1,s0,ffffffffc0203e6c <exit_mmap+0x1c>
ffffffffc0203e80:	6400                	ld	s0,8(s0)
ffffffffc0203e82:	00848c63          	beq	s1,s0,ffffffffc0203e9a <exit_mmap+0x4a>
ffffffffc0203e86:	ff043603          	ld	a2,-16(s0)
ffffffffc0203e8a:	fe843583          	ld	a1,-24(s0)
ffffffffc0203e8e:	854a                	mv	a0,s2
ffffffffc0203e90:	81dfe0ef          	jal	ra,ffffffffc02026ac <exit_range>
ffffffffc0203e94:	6400                	ld	s0,8(s0)
ffffffffc0203e96:	fe8498e3          	bne	s1,s0,ffffffffc0203e86 <exit_mmap+0x36>
ffffffffc0203e9a:	60e2                	ld	ra,24(sp)
ffffffffc0203e9c:	6442                	ld	s0,16(sp)
ffffffffc0203e9e:	64a2                	ld	s1,8(sp)
ffffffffc0203ea0:	6902                	ld	s2,0(sp)
ffffffffc0203ea2:	6105                	addi	sp,sp,32
ffffffffc0203ea4:	8082                	ret
ffffffffc0203ea6:	00009697          	auipc	a3,0x9
ffffffffc0203eaa:	df268693          	addi	a3,a3,-526 # ffffffffc020cc98 <default_pmm_manager+0x8e8>
ffffffffc0203eae:	00008617          	auipc	a2,0x8
ffffffffc0203eb2:	a1a60613          	addi	a2,a2,-1510 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203eb6:	0e800593          	li	a1,232
ffffffffc0203eba:	00009517          	auipc	a0,0x9
ffffffffc0203ebe:	d2650513          	addi	a0,a0,-730 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc0203ec2:	ddcfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203ec6 <vmm_init>:
ffffffffc0203ec6:	7139                	addi	sp,sp,-64
ffffffffc0203ec8:	05800513          	li	a0,88
ffffffffc0203ecc:	fc06                	sd	ra,56(sp)
ffffffffc0203ece:	f822                	sd	s0,48(sp)
ffffffffc0203ed0:	f426                	sd	s1,40(sp)
ffffffffc0203ed2:	f04a                	sd	s2,32(sp)
ffffffffc0203ed4:	ec4e                	sd	s3,24(sp)
ffffffffc0203ed6:	e852                	sd	s4,16(sp)
ffffffffc0203ed8:	e456                	sd	s5,8(sp)
ffffffffc0203eda:	8b4fe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203ede:	2e050963          	beqz	a0,ffffffffc02041d0 <vmm_init+0x30a>
ffffffffc0203ee2:	e508                	sd	a0,8(a0)
ffffffffc0203ee4:	e108                	sd	a0,0(a0)
ffffffffc0203ee6:	00053823          	sd	zero,16(a0)
ffffffffc0203eea:	00053c23          	sd	zero,24(a0)
ffffffffc0203eee:	02052023          	sw	zero,32(a0)
ffffffffc0203ef2:	02053423          	sd	zero,40(a0)
ffffffffc0203ef6:	02052823          	sw	zero,48(a0)
ffffffffc0203efa:	84aa                	mv	s1,a0
ffffffffc0203efc:	4585                	li	a1,1
ffffffffc0203efe:	03850513          	addi	a0,a0,56
ffffffffc0203f02:	5b6000ef          	jal	ra,ffffffffc02044b8 <sem_init>
ffffffffc0203f06:	03200413          	li	s0,50
ffffffffc0203f0a:	a811                	j	ffffffffc0203f1e <vmm_init+0x58>
ffffffffc0203f0c:	e500                	sd	s0,8(a0)
ffffffffc0203f0e:	e91c                	sd	a5,16(a0)
ffffffffc0203f10:	00052c23          	sw	zero,24(a0)
ffffffffc0203f14:	146d                	addi	s0,s0,-5
ffffffffc0203f16:	8526                	mv	a0,s1
ffffffffc0203f18:	ccdff0ef          	jal	ra,ffffffffc0203be4 <insert_vma_struct>
ffffffffc0203f1c:	c80d                	beqz	s0,ffffffffc0203f4e <vmm_init+0x88>
ffffffffc0203f1e:	03000513          	li	a0,48
ffffffffc0203f22:	86cfe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203f26:	85aa                	mv	a1,a0
ffffffffc0203f28:	00240793          	addi	a5,s0,2
ffffffffc0203f2c:	f165                	bnez	a0,ffffffffc0203f0c <vmm_init+0x46>
ffffffffc0203f2e:	00009697          	auipc	a3,0x9
ffffffffc0203f32:	f0268693          	addi	a3,a3,-254 # ffffffffc020ce30 <default_pmm_manager+0xa80>
ffffffffc0203f36:	00008617          	auipc	a2,0x8
ffffffffc0203f3a:	99260613          	addi	a2,a2,-1646 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203f3e:	12c00593          	li	a1,300
ffffffffc0203f42:	00009517          	auipc	a0,0x9
ffffffffc0203f46:	c9e50513          	addi	a0,a0,-866 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc0203f4a:	d54fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203f4e:	03700413          	li	s0,55
ffffffffc0203f52:	1f900913          	li	s2,505
ffffffffc0203f56:	a819                	j	ffffffffc0203f6c <vmm_init+0xa6>
ffffffffc0203f58:	e500                	sd	s0,8(a0)
ffffffffc0203f5a:	e91c                	sd	a5,16(a0)
ffffffffc0203f5c:	00052c23          	sw	zero,24(a0)
ffffffffc0203f60:	0415                	addi	s0,s0,5
ffffffffc0203f62:	8526                	mv	a0,s1
ffffffffc0203f64:	c81ff0ef          	jal	ra,ffffffffc0203be4 <insert_vma_struct>
ffffffffc0203f68:	03240a63          	beq	s0,s2,ffffffffc0203f9c <vmm_init+0xd6>
ffffffffc0203f6c:	03000513          	li	a0,48
ffffffffc0203f70:	81efe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203f74:	85aa                	mv	a1,a0
ffffffffc0203f76:	00240793          	addi	a5,s0,2
ffffffffc0203f7a:	fd79                	bnez	a0,ffffffffc0203f58 <vmm_init+0x92>
ffffffffc0203f7c:	00009697          	auipc	a3,0x9
ffffffffc0203f80:	eb468693          	addi	a3,a3,-332 # ffffffffc020ce30 <default_pmm_manager+0xa80>
ffffffffc0203f84:	00008617          	auipc	a2,0x8
ffffffffc0203f88:	94460613          	addi	a2,a2,-1724 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0203f8c:	13300593          	li	a1,307
ffffffffc0203f90:	00009517          	auipc	a0,0x9
ffffffffc0203f94:	c5050513          	addi	a0,a0,-944 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc0203f98:	d06fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203f9c:	649c                	ld	a5,8(s1)
ffffffffc0203f9e:	471d                	li	a4,7
ffffffffc0203fa0:	1fb00593          	li	a1,507
ffffffffc0203fa4:	16f48663          	beq	s1,a5,ffffffffc0204110 <vmm_init+0x24a>
ffffffffc0203fa8:	fe87b603          	ld	a2,-24(a5) # ffffffffffffefe8 <end+0x3fd686d8>
ffffffffc0203fac:	ffe70693          	addi	a3,a4,-2 # ffe <_binary_bin_swap_img_size-0x6d02>
ffffffffc0203fb0:	10d61063          	bne	a2,a3,ffffffffc02040b0 <vmm_init+0x1ea>
ffffffffc0203fb4:	ff07b683          	ld	a3,-16(a5)
ffffffffc0203fb8:	0ed71c63          	bne	a4,a3,ffffffffc02040b0 <vmm_init+0x1ea>
ffffffffc0203fbc:	0715                	addi	a4,a4,5
ffffffffc0203fbe:	679c                	ld	a5,8(a5)
ffffffffc0203fc0:	feb712e3          	bne	a4,a1,ffffffffc0203fa4 <vmm_init+0xde>
ffffffffc0203fc4:	4a1d                	li	s4,7
ffffffffc0203fc6:	4415                	li	s0,5
ffffffffc0203fc8:	1f900a93          	li	s5,505
ffffffffc0203fcc:	85a2                	mv	a1,s0
ffffffffc0203fce:	8526                	mv	a0,s1
ffffffffc0203fd0:	bd5ff0ef          	jal	ra,ffffffffc0203ba4 <find_vma>
ffffffffc0203fd4:	892a                	mv	s2,a0
ffffffffc0203fd6:	16050d63          	beqz	a0,ffffffffc0204150 <vmm_init+0x28a>
ffffffffc0203fda:	00140593          	addi	a1,s0,1
ffffffffc0203fde:	8526                	mv	a0,s1
ffffffffc0203fe0:	bc5ff0ef          	jal	ra,ffffffffc0203ba4 <find_vma>
ffffffffc0203fe4:	89aa                	mv	s3,a0
ffffffffc0203fe6:	14050563          	beqz	a0,ffffffffc0204130 <vmm_init+0x26a>
ffffffffc0203fea:	85d2                	mv	a1,s4
ffffffffc0203fec:	8526                	mv	a0,s1
ffffffffc0203fee:	bb7ff0ef          	jal	ra,ffffffffc0203ba4 <find_vma>
ffffffffc0203ff2:	16051f63          	bnez	a0,ffffffffc0204170 <vmm_init+0x2aa>
ffffffffc0203ff6:	00340593          	addi	a1,s0,3
ffffffffc0203ffa:	8526                	mv	a0,s1
ffffffffc0203ffc:	ba9ff0ef          	jal	ra,ffffffffc0203ba4 <find_vma>
ffffffffc0204000:	1a051863          	bnez	a0,ffffffffc02041b0 <vmm_init+0x2ea>
ffffffffc0204004:	00440593          	addi	a1,s0,4
ffffffffc0204008:	8526                	mv	a0,s1
ffffffffc020400a:	b9bff0ef          	jal	ra,ffffffffc0203ba4 <find_vma>
ffffffffc020400e:	18051163          	bnez	a0,ffffffffc0204190 <vmm_init+0x2ca>
ffffffffc0204012:	00893783          	ld	a5,8(s2)
ffffffffc0204016:	0a879d63          	bne	a5,s0,ffffffffc02040d0 <vmm_init+0x20a>
ffffffffc020401a:	01093783          	ld	a5,16(s2)
ffffffffc020401e:	0b479963          	bne	a5,s4,ffffffffc02040d0 <vmm_init+0x20a>
ffffffffc0204022:	0089b783          	ld	a5,8(s3)
ffffffffc0204026:	0c879563          	bne	a5,s0,ffffffffc02040f0 <vmm_init+0x22a>
ffffffffc020402a:	0109b783          	ld	a5,16(s3)
ffffffffc020402e:	0d479163          	bne	a5,s4,ffffffffc02040f0 <vmm_init+0x22a>
ffffffffc0204032:	0415                	addi	s0,s0,5
ffffffffc0204034:	0a15                	addi	s4,s4,5
ffffffffc0204036:	f9541be3          	bne	s0,s5,ffffffffc0203fcc <vmm_init+0x106>
ffffffffc020403a:	4411                	li	s0,4
ffffffffc020403c:	597d                	li	s2,-1
ffffffffc020403e:	85a2                	mv	a1,s0
ffffffffc0204040:	8526                	mv	a0,s1
ffffffffc0204042:	b63ff0ef          	jal	ra,ffffffffc0203ba4 <find_vma>
ffffffffc0204046:	0004059b          	sext.w	a1,s0
ffffffffc020404a:	c90d                	beqz	a0,ffffffffc020407c <vmm_init+0x1b6>
ffffffffc020404c:	6914                	ld	a3,16(a0)
ffffffffc020404e:	6510                	ld	a2,8(a0)
ffffffffc0204050:	00009517          	auipc	a0,0x9
ffffffffc0204054:	d6850513          	addi	a0,a0,-664 # ffffffffc020cdb8 <default_pmm_manager+0xa08>
ffffffffc0204058:	94efc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020405c:	00009697          	auipc	a3,0x9
ffffffffc0204060:	d8468693          	addi	a3,a3,-636 # ffffffffc020cde0 <default_pmm_manager+0xa30>
ffffffffc0204064:	00008617          	auipc	a2,0x8
ffffffffc0204068:	86460613          	addi	a2,a2,-1948 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020406c:	15900593          	li	a1,345
ffffffffc0204070:	00009517          	auipc	a0,0x9
ffffffffc0204074:	b7050513          	addi	a0,a0,-1168 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc0204078:	c26fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020407c:	147d                	addi	s0,s0,-1
ffffffffc020407e:	fd2410e3          	bne	s0,s2,ffffffffc020403e <vmm_init+0x178>
ffffffffc0204082:	8526                	mv	a0,s1
ffffffffc0204084:	c31ff0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc0204088:	00009517          	auipc	a0,0x9
ffffffffc020408c:	d7050513          	addi	a0,a0,-656 # ffffffffc020cdf8 <default_pmm_manager+0xa48>
ffffffffc0204090:	916fc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0204094:	7442                	ld	s0,48(sp)
ffffffffc0204096:	70e2                	ld	ra,56(sp)
ffffffffc0204098:	74a2                	ld	s1,40(sp)
ffffffffc020409a:	7902                	ld	s2,32(sp)
ffffffffc020409c:	69e2                	ld	s3,24(sp)
ffffffffc020409e:	6a42                	ld	s4,16(sp)
ffffffffc02040a0:	6aa2                	ld	s5,8(sp)
ffffffffc02040a2:	00009517          	auipc	a0,0x9
ffffffffc02040a6:	d7650513          	addi	a0,a0,-650 # ffffffffc020ce18 <default_pmm_manager+0xa68>
ffffffffc02040aa:	6121                	addi	sp,sp,64
ffffffffc02040ac:	8fafc06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02040b0:	00009697          	auipc	a3,0x9
ffffffffc02040b4:	c2068693          	addi	a3,a3,-992 # ffffffffc020ccd0 <default_pmm_manager+0x920>
ffffffffc02040b8:	00008617          	auipc	a2,0x8
ffffffffc02040bc:	81060613          	addi	a2,a2,-2032 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02040c0:	13d00593          	li	a1,317
ffffffffc02040c4:	00009517          	auipc	a0,0x9
ffffffffc02040c8:	b1c50513          	addi	a0,a0,-1252 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc02040cc:	bd2fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02040d0:	00009697          	auipc	a3,0x9
ffffffffc02040d4:	c8868693          	addi	a3,a3,-888 # ffffffffc020cd58 <default_pmm_manager+0x9a8>
ffffffffc02040d8:	00007617          	auipc	a2,0x7
ffffffffc02040dc:	7f060613          	addi	a2,a2,2032 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02040e0:	14e00593          	li	a1,334
ffffffffc02040e4:	00009517          	auipc	a0,0x9
ffffffffc02040e8:	afc50513          	addi	a0,a0,-1284 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc02040ec:	bb2fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02040f0:	00009697          	auipc	a3,0x9
ffffffffc02040f4:	c9868693          	addi	a3,a3,-872 # ffffffffc020cd88 <default_pmm_manager+0x9d8>
ffffffffc02040f8:	00007617          	auipc	a2,0x7
ffffffffc02040fc:	7d060613          	addi	a2,a2,2000 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0204100:	14f00593          	li	a1,335
ffffffffc0204104:	00009517          	auipc	a0,0x9
ffffffffc0204108:	adc50513          	addi	a0,a0,-1316 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc020410c:	b92fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204110:	00009697          	auipc	a3,0x9
ffffffffc0204114:	ba868693          	addi	a3,a3,-1112 # ffffffffc020ccb8 <default_pmm_manager+0x908>
ffffffffc0204118:	00007617          	auipc	a2,0x7
ffffffffc020411c:	7b060613          	addi	a2,a2,1968 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0204120:	13b00593          	li	a1,315
ffffffffc0204124:	00009517          	auipc	a0,0x9
ffffffffc0204128:	abc50513          	addi	a0,a0,-1348 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc020412c:	b72fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204130:	00009697          	auipc	a3,0x9
ffffffffc0204134:	be868693          	addi	a3,a3,-1048 # ffffffffc020cd18 <default_pmm_manager+0x968>
ffffffffc0204138:	00007617          	auipc	a2,0x7
ffffffffc020413c:	79060613          	addi	a2,a2,1936 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0204140:	14600593          	li	a1,326
ffffffffc0204144:	00009517          	auipc	a0,0x9
ffffffffc0204148:	a9c50513          	addi	a0,a0,-1380 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc020414c:	b52fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204150:	00009697          	auipc	a3,0x9
ffffffffc0204154:	bb868693          	addi	a3,a3,-1096 # ffffffffc020cd08 <default_pmm_manager+0x958>
ffffffffc0204158:	00007617          	auipc	a2,0x7
ffffffffc020415c:	77060613          	addi	a2,a2,1904 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0204160:	14400593          	li	a1,324
ffffffffc0204164:	00009517          	auipc	a0,0x9
ffffffffc0204168:	a7c50513          	addi	a0,a0,-1412 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc020416c:	b32fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204170:	00009697          	auipc	a3,0x9
ffffffffc0204174:	bb868693          	addi	a3,a3,-1096 # ffffffffc020cd28 <default_pmm_manager+0x978>
ffffffffc0204178:	00007617          	auipc	a2,0x7
ffffffffc020417c:	75060613          	addi	a2,a2,1872 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0204180:	14800593          	li	a1,328
ffffffffc0204184:	00009517          	auipc	a0,0x9
ffffffffc0204188:	a5c50513          	addi	a0,a0,-1444 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc020418c:	b12fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204190:	00009697          	auipc	a3,0x9
ffffffffc0204194:	bb868693          	addi	a3,a3,-1096 # ffffffffc020cd48 <default_pmm_manager+0x998>
ffffffffc0204198:	00007617          	auipc	a2,0x7
ffffffffc020419c:	73060613          	addi	a2,a2,1840 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02041a0:	14c00593          	li	a1,332
ffffffffc02041a4:	00009517          	auipc	a0,0x9
ffffffffc02041a8:	a3c50513          	addi	a0,a0,-1476 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc02041ac:	af2fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041b0:	00009697          	auipc	a3,0x9
ffffffffc02041b4:	b8868693          	addi	a3,a3,-1144 # ffffffffc020cd38 <default_pmm_manager+0x988>
ffffffffc02041b8:	00007617          	auipc	a2,0x7
ffffffffc02041bc:	71060613          	addi	a2,a2,1808 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02041c0:	14a00593          	li	a1,330
ffffffffc02041c4:	00009517          	auipc	a0,0x9
ffffffffc02041c8:	a1c50513          	addi	a0,a0,-1508 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc02041cc:	ad2fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041d0:	00009697          	auipc	a3,0x9
ffffffffc02041d4:	a9868693          	addi	a3,a3,-1384 # ffffffffc020cc68 <default_pmm_manager+0x8b8>
ffffffffc02041d8:	00007617          	auipc	a2,0x7
ffffffffc02041dc:	6f060613          	addi	a2,a2,1776 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02041e0:	12400593          	li	a1,292
ffffffffc02041e4:	00009517          	auipc	a0,0x9
ffffffffc02041e8:	9fc50513          	addi	a0,a0,-1540 # ffffffffc020cbe0 <default_pmm_manager+0x830>
ffffffffc02041ec:	ab2fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02041f0 <user_mem_check>:
ffffffffc02041f0:	7179                	addi	sp,sp,-48
ffffffffc02041f2:	f022                	sd	s0,32(sp)
ffffffffc02041f4:	f406                	sd	ra,40(sp)
ffffffffc02041f6:	ec26                	sd	s1,24(sp)
ffffffffc02041f8:	e84a                	sd	s2,16(sp)
ffffffffc02041fa:	e44e                	sd	s3,8(sp)
ffffffffc02041fc:	e052                	sd	s4,0(sp)
ffffffffc02041fe:	842e                	mv	s0,a1
ffffffffc0204200:	c135                	beqz	a0,ffffffffc0204264 <user_mem_check+0x74>
ffffffffc0204202:	002007b7          	lui	a5,0x200
ffffffffc0204206:	04f5e663          	bltu	a1,a5,ffffffffc0204252 <user_mem_check+0x62>
ffffffffc020420a:	00c584b3          	add	s1,a1,a2
ffffffffc020420e:	0495f263          	bgeu	a1,s1,ffffffffc0204252 <user_mem_check+0x62>
ffffffffc0204212:	4785                	li	a5,1
ffffffffc0204214:	07fe                	slli	a5,a5,0x1f
ffffffffc0204216:	0297ee63          	bltu	a5,s1,ffffffffc0204252 <user_mem_check+0x62>
ffffffffc020421a:	892a                	mv	s2,a0
ffffffffc020421c:	89b6                	mv	s3,a3
ffffffffc020421e:	6a05                	lui	s4,0x1
ffffffffc0204220:	a821                	j	ffffffffc0204238 <user_mem_check+0x48>
ffffffffc0204222:	0027f693          	andi	a3,a5,2
ffffffffc0204226:	9752                	add	a4,a4,s4
ffffffffc0204228:	8ba1                	andi	a5,a5,8
ffffffffc020422a:	c685                	beqz	a3,ffffffffc0204252 <user_mem_check+0x62>
ffffffffc020422c:	c399                	beqz	a5,ffffffffc0204232 <user_mem_check+0x42>
ffffffffc020422e:	02e46263          	bltu	s0,a4,ffffffffc0204252 <user_mem_check+0x62>
ffffffffc0204232:	6900                	ld	s0,16(a0)
ffffffffc0204234:	04947663          	bgeu	s0,s1,ffffffffc0204280 <user_mem_check+0x90>
ffffffffc0204238:	85a2                	mv	a1,s0
ffffffffc020423a:	854a                	mv	a0,s2
ffffffffc020423c:	969ff0ef          	jal	ra,ffffffffc0203ba4 <find_vma>
ffffffffc0204240:	c909                	beqz	a0,ffffffffc0204252 <user_mem_check+0x62>
ffffffffc0204242:	6518                	ld	a4,8(a0)
ffffffffc0204244:	00e46763          	bltu	s0,a4,ffffffffc0204252 <user_mem_check+0x62>
ffffffffc0204248:	4d1c                	lw	a5,24(a0)
ffffffffc020424a:	fc099ce3          	bnez	s3,ffffffffc0204222 <user_mem_check+0x32>
ffffffffc020424e:	8b85                	andi	a5,a5,1
ffffffffc0204250:	f3ed                	bnez	a5,ffffffffc0204232 <user_mem_check+0x42>
ffffffffc0204252:	4501                	li	a0,0
ffffffffc0204254:	70a2                	ld	ra,40(sp)
ffffffffc0204256:	7402                	ld	s0,32(sp)
ffffffffc0204258:	64e2                	ld	s1,24(sp)
ffffffffc020425a:	6942                	ld	s2,16(sp)
ffffffffc020425c:	69a2                	ld	s3,8(sp)
ffffffffc020425e:	6a02                	ld	s4,0(sp)
ffffffffc0204260:	6145                	addi	sp,sp,48
ffffffffc0204262:	8082                	ret
ffffffffc0204264:	c02007b7          	lui	a5,0xc0200
ffffffffc0204268:	4501                	li	a0,0
ffffffffc020426a:	fef5e5e3          	bltu	a1,a5,ffffffffc0204254 <user_mem_check+0x64>
ffffffffc020426e:	962e                	add	a2,a2,a1
ffffffffc0204270:	fec5f2e3          	bgeu	a1,a2,ffffffffc0204254 <user_mem_check+0x64>
ffffffffc0204274:	c8000537          	lui	a0,0xc8000
ffffffffc0204278:	0505                	addi	a0,a0,1
ffffffffc020427a:	00a63533          	sltu	a0,a2,a0
ffffffffc020427e:	bfd9                	j	ffffffffc0204254 <user_mem_check+0x64>
ffffffffc0204280:	4505                	li	a0,1
ffffffffc0204282:	bfc9                	j	ffffffffc0204254 <user_mem_check+0x64>

ffffffffc0204284 <copy_from_user>:
ffffffffc0204284:	1101                	addi	sp,sp,-32
ffffffffc0204286:	e822                	sd	s0,16(sp)
ffffffffc0204288:	e426                	sd	s1,8(sp)
ffffffffc020428a:	8432                	mv	s0,a2
ffffffffc020428c:	84b6                	mv	s1,a3
ffffffffc020428e:	e04a                	sd	s2,0(sp)
ffffffffc0204290:	86ba                	mv	a3,a4
ffffffffc0204292:	892e                	mv	s2,a1
ffffffffc0204294:	8626                	mv	a2,s1
ffffffffc0204296:	85a2                	mv	a1,s0
ffffffffc0204298:	ec06                	sd	ra,24(sp)
ffffffffc020429a:	f57ff0ef          	jal	ra,ffffffffc02041f0 <user_mem_check>
ffffffffc020429e:	c519                	beqz	a0,ffffffffc02042ac <copy_from_user+0x28>
ffffffffc02042a0:	8626                	mv	a2,s1
ffffffffc02042a2:	85a2                	mv	a1,s0
ffffffffc02042a4:	854a                	mv	a0,s2
ffffffffc02042a6:	18c070ef          	jal	ra,ffffffffc020b432 <memcpy>
ffffffffc02042aa:	4505                	li	a0,1
ffffffffc02042ac:	60e2                	ld	ra,24(sp)
ffffffffc02042ae:	6442                	ld	s0,16(sp)
ffffffffc02042b0:	64a2                	ld	s1,8(sp)
ffffffffc02042b2:	6902                	ld	s2,0(sp)
ffffffffc02042b4:	6105                	addi	sp,sp,32
ffffffffc02042b6:	8082                	ret

ffffffffc02042b8 <copy_to_user>:
ffffffffc02042b8:	1101                	addi	sp,sp,-32
ffffffffc02042ba:	e822                	sd	s0,16(sp)
ffffffffc02042bc:	8436                	mv	s0,a3
ffffffffc02042be:	e04a                	sd	s2,0(sp)
ffffffffc02042c0:	4685                	li	a3,1
ffffffffc02042c2:	8932                	mv	s2,a2
ffffffffc02042c4:	8622                	mv	a2,s0
ffffffffc02042c6:	e426                	sd	s1,8(sp)
ffffffffc02042c8:	ec06                	sd	ra,24(sp)
ffffffffc02042ca:	84ae                	mv	s1,a1
ffffffffc02042cc:	f25ff0ef          	jal	ra,ffffffffc02041f0 <user_mem_check>
ffffffffc02042d0:	c519                	beqz	a0,ffffffffc02042de <copy_to_user+0x26>
ffffffffc02042d2:	8622                	mv	a2,s0
ffffffffc02042d4:	85ca                	mv	a1,s2
ffffffffc02042d6:	8526                	mv	a0,s1
ffffffffc02042d8:	15a070ef          	jal	ra,ffffffffc020b432 <memcpy>
ffffffffc02042dc:	4505                	li	a0,1
ffffffffc02042de:	60e2                	ld	ra,24(sp)
ffffffffc02042e0:	6442                	ld	s0,16(sp)
ffffffffc02042e2:	64a2                	ld	s1,8(sp)
ffffffffc02042e4:	6902                	ld	s2,0(sp)
ffffffffc02042e6:	6105                	addi	sp,sp,32
ffffffffc02042e8:	8082                	ret

ffffffffc02042ea <copy_string>:
ffffffffc02042ea:	7139                	addi	sp,sp,-64
ffffffffc02042ec:	ec4e                	sd	s3,24(sp)
ffffffffc02042ee:	6985                	lui	s3,0x1
ffffffffc02042f0:	99b2                	add	s3,s3,a2
ffffffffc02042f2:	77fd                	lui	a5,0xfffff
ffffffffc02042f4:	00f9f9b3          	and	s3,s3,a5
ffffffffc02042f8:	f426                	sd	s1,40(sp)
ffffffffc02042fa:	f04a                	sd	s2,32(sp)
ffffffffc02042fc:	e852                	sd	s4,16(sp)
ffffffffc02042fe:	e456                	sd	s5,8(sp)
ffffffffc0204300:	fc06                	sd	ra,56(sp)
ffffffffc0204302:	f822                	sd	s0,48(sp)
ffffffffc0204304:	84b2                	mv	s1,a2
ffffffffc0204306:	8aaa                	mv	s5,a0
ffffffffc0204308:	8a2e                	mv	s4,a1
ffffffffc020430a:	8936                	mv	s2,a3
ffffffffc020430c:	40c989b3          	sub	s3,s3,a2
ffffffffc0204310:	a015                	j	ffffffffc0204334 <copy_string+0x4a>
ffffffffc0204312:	046070ef          	jal	ra,ffffffffc020b358 <strnlen>
ffffffffc0204316:	87aa                	mv	a5,a0
ffffffffc0204318:	85a6                	mv	a1,s1
ffffffffc020431a:	8552                	mv	a0,s4
ffffffffc020431c:	8622                	mv	a2,s0
ffffffffc020431e:	0487e363          	bltu	a5,s0,ffffffffc0204364 <copy_string+0x7a>
ffffffffc0204322:	0329f763          	bgeu	s3,s2,ffffffffc0204350 <copy_string+0x66>
ffffffffc0204326:	10c070ef          	jal	ra,ffffffffc020b432 <memcpy>
ffffffffc020432a:	9a22                	add	s4,s4,s0
ffffffffc020432c:	94a2                	add	s1,s1,s0
ffffffffc020432e:	40890933          	sub	s2,s2,s0
ffffffffc0204332:	6985                	lui	s3,0x1
ffffffffc0204334:	4681                	li	a3,0
ffffffffc0204336:	85a6                	mv	a1,s1
ffffffffc0204338:	8556                	mv	a0,s5
ffffffffc020433a:	844a                	mv	s0,s2
ffffffffc020433c:	0129f363          	bgeu	s3,s2,ffffffffc0204342 <copy_string+0x58>
ffffffffc0204340:	844e                	mv	s0,s3
ffffffffc0204342:	8622                	mv	a2,s0
ffffffffc0204344:	eadff0ef          	jal	ra,ffffffffc02041f0 <user_mem_check>
ffffffffc0204348:	87aa                	mv	a5,a0
ffffffffc020434a:	85a2                	mv	a1,s0
ffffffffc020434c:	8526                	mv	a0,s1
ffffffffc020434e:	f3f1                	bnez	a5,ffffffffc0204312 <copy_string+0x28>
ffffffffc0204350:	4501                	li	a0,0
ffffffffc0204352:	70e2                	ld	ra,56(sp)
ffffffffc0204354:	7442                	ld	s0,48(sp)
ffffffffc0204356:	74a2                	ld	s1,40(sp)
ffffffffc0204358:	7902                	ld	s2,32(sp)
ffffffffc020435a:	69e2                	ld	s3,24(sp)
ffffffffc020435c:	6a42                	ld	s4,16(sp)
ffffffffc020435e:	6aa2                	ld	s5,8(sp)
ffffffffc0204360:	6121                	addi	sp,sp,64
ffffffffc0204362:	8082                	ret
ffffffffc0204364:	00178613          	addi	a2,a5,1 # fffffffffffff001 <end+0x3fd686f1>
ffffffffc0204368:	0ca070ef          	jal	ra,ffffffffc020b432 <memcpy>
ffffffffc020436c:	4505                	li	a0,1
ffffffffc020436e:	b7d5                	j	ffffffffc0204352 <copy_string+0x68>

ffffffffc0204370 <__down.constprop.0>:
ffffffffc0204370:	715d                	addi	sp,sp,-80
ffffffffc0204372:	e0a2                	sd	s0,64(sp)
ffffffffc0204374:	e486                	sd	ra,72(sp)
ffffffffc0204376:	fc26                	sd	s1,56(sp)
ffffffffc0204378:	842a                	mv	s0,a0
ffffffffc020437a:	100027f3          	csrr	a5,sstatus
ffffffffc020437e:	8b89                	andi	a5,a5,2
ffffffffc0204380:	ebb1                	bnez	a5,ffffffffc02043d4 <__down.constprop.0+0x64>
ffffffffc0204382:	411c                	lw	a5,0(a0)
ffffffffc0204384:	00f05a63          	blez	a5,ffffffffc0204398 <__down.constprop.0+0x28>
ffffffffc0204388:	37fd                	addiw	a5,a5,-1
ffffffffc020438a:	c11c                	sw	a5,0(a0)
ffffffffc020438c:	4501                	li	a0,0
ffffffffc020438e:	60a6                	ld	ra,72(sp)
ffffffffc0204390:	6406                	ld	s0,64(sp)
ffffffffc0204392:	74e2                	ld	s1,56(sp)
ffffffffc0204394:	6161                	addi	sp,sp,80
ffffffffc0204396:	8082                	ret
ffffffffc0204398:	00850413          	addi	s0,a0,8 # ffffffffc8000008 <end+0x7d696f8>
ffffffffc020439c:	0024                	addi	s1,sp,8
ffffffffc020439e:	10000613          	li	a2,256
ffffffffc02043a2:	85a6                	mv	a1,s1
ffffffffc02043a4:	8522                	mv	a0,s0
ffffffffc02043a6:	2d8000ef          	jal	ra,ffffffffc020467e <wait_current_set>
ffffffffc02043aa:	6cd020ef          	jal	ra,ffffffffc0207276 <schedule>
ffffffffc02043ae:	100027f3          	csrr	a5,sstatus
ffffffffc02043b2:	8b89                	andi	a5,a5,2
ffffffffc02043b4:	efb9                	bnez	a5,ffffffffc0204412 <__down.constprop.0+0xa2>
ffffffffc02043b6:	8526                	mv	a0,s1
ffffffffc02043b8:	19c000ef          	jal	ra,ffffffffc0204554 <wait_in_queue>
ffffffffc02043bc:	e531                	bnez	a0,ffffffffc0204408 <__down.constprop.0+0x98>
ffffffffc02043be:	4542                	lw	a0,16(sp)
ffffffffc02043c0:	10000793          	li	a5,256
ffffffffc02043c4:	fcf515e3          	bne	a0,a5,ffffffffc020438e <__down.constprop.0+0x1e>
ffffffffc02043c8:	60a6                	ld	ra,72(sp)
ffffffffc02043ca:	6406                	ld	s0,64(sp)
ffffffffc02043cc:	74e2                	ld	s1,56(sp)
ffffffffc02043ce:	4501                	li	a0,0
ffffffffc02043d0:	6161                	addi	sp,sp,80
ffffffffc02043d2:	8082                	ret
ffffffffc02043d4:	89ffc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02043d8:	401c                	lw	a5,0(s0)
ffffffffc02043da:	00f05c63          	blez	a5,ffffffffc02043f2 <__down.constprop.0+0x82>
ffffffffc02043de:	37fd                	addiw	a5,a5,-1
ffffffffc02043e0:	c01c                	sw	a5,0(s0)
ffffffffc02043e2:	88bfc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02043e6:	60a6                	ld	ra,72(sp)
ffffffffc02043e8:	6406                	ld	s0,64(sp)
ffffffffc02043ea:	74e2                	ld	s1,56(sp)
ffffffffc02043ec:	4501                	li	a0,0
ffffffffc02043ee:	6161                	addi	sp,sp,80
ffffffffc02043f0:	8082                	ret
ffffffffc02043f2:	0421                	addi	s0,s0,8
ffffffffc02043f4:	0024                	addi	s1,sp,8
ffffffffc02043f6:	10000613          	li	a2,256
ffffffffc02043fa:	85a6                	mv	a1,s1
ffffffffc02043fc:	8522                	mv	a0,s0
ffffffffc02043fe:	280000ef          	jal	ra,ffffffffc020467e <wait_current_set>
ffffffffc0204402:	86bfc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0204406:	b755                	j	ffffffffc02043aa <__down.constprop.0+0x3a>
ffffffffc0204408:	85a6                	mv	a1,s1
ffffffffc020440a:	8522                	mv	a0,s0
ffffffffc020440c:	0ee000ef          	jal	ra,ffffffffc02044fa <wait_queue_del>
ffffffffc0204410:	b77d                	j	ffffffffc02043be <__down.constprop.0+0x4e>
ffffffffc0204412:	861fc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0204416:	8526                	mv	a0,s1
ffffffffc0204418:	13c000ef          	jal	ra,ffffffffc0204554 <wait_in_queue>
ffffffffc020441c:	e501                	bnez	a0,ffffffffc0204424 <__down.constprop.0+0xb4>
ffffffffc020441e:	84ffc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0204422:	bf71                	j	ffffffffc02043be <__down.constprop.0+0x4e>
ffffffffc0204424:	85a6                	mv	a1,s1
ffffffffc0204426:	8522                	mv	a0,s0
ffffffffc0204428:	0d2000ef          	jal	ra,ffffffffc02044fa <wait_queue_del>
ffffffffc020442c:	bfcd                	j	ffffffffc020441e <__down.constprop.0+0xae>

ffffffffc020442e <__up.constprop.0>:
ffffffffc020442e:	1101                	addi	sp,sp,-32
ffffffffc0204430:	e822                	sd	s0,16(sp)
ffffffffc0204432:	ec06                	sd	ra,24(sp)
ffffffffc0204434:	e426                	sd	s1,8(sp)
ffffffffc0204436:	e04a                	sd	s2,0(sp)
ffffffffc0204438:	842a                	mv	s0,a0
ffffffffc020443a:	100027f3          	csrr	a5,sstatus
ffffffffc020443e:	8b89                	andi	a5,a5,2
ffffffffc0204440:	4901                	li	s2,0
ffffffffc0204442:	eba1                	bnez	a5,ffffffffc0204492 <__up.constprop.0+0x64>
ffffffffc0204444:	00840493          	addi	s1,s0,8
ffffffffc0204448:	8526                	mv	a0,s1
ffffffffc020444a:	0ee000ef          	jal	ra,ffffffffc0204538 <wait_queue_first>
ffffffffc020444e:	85aa                	mv	a1,a0
ffffffffc0204450:	cd0d                	beqz	a0,ffffffffc020448a <__up.constprop.0+0x5c>
ffffffffc0204452:	6118                	ld	a4,0(a0)
ffffffffc0204454:	10000793          	li	a5,256
ffffffffc0204458:	0ec72703          	lw	a4,236(a4)
ffffffffc020445c:	02f71f63          	bne	a4,a5,ffffffffc020449a <__up.constprop.0+0x6c>
ffffffffc0204460:	4685                	li	a3,1
ffffffffc0204462:	10000613          	li	a2,256
ffffffffc0204466:	8526                	mv	a0,s1
ffffffffc0204468:	0fa000ef          	jal	ra,ffffffffc0204562 <wakeup_wait>
ffffffffc020446c:	00091863          	bnez	s2,ffffffffc020447c <__up.constprop.0+0x4e>
ffffffffc0204470:	60e2                	ld	ra,24(sp)
ffffffffc0204472:	6442                	ld	s0,16(sp)
ffffffffc0204474:	64a2                	ld	s1,8(sp)
ffffffffc0204476:	6902                	ld	s2,0(sp)
ffffffffc0204478:	6105                	addi	sp,sp,32
ffffffffc020447a:	8082                	ret
ffffffffc020447c:	6442                	ld	s0,16(sp)
ffffffffc020447e:	60e2                	ld	ra,24(sp)
ffffffffc0204480:	64a2                	ld	s1,8(sp)
ffffffffc0204482:	6902                	ld	s2,0(sp)
ffffffffc0204484:	6105                	addi	sp,sp,32
ffffffffc0204486:	fe6fc06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc020448a:	401c                	lw	a5,0(s0)
ffffffffc020448c:	2785                	addiw	a5,a5,1
ffffffffc020448e:	c01c                	sw	a5,0(s0)
ffffffffc0204490:	bff1                	j	ffffffffc020446c <__up.constprop.0+0x3e>
ffffffffc0204492:	fe0fc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0204496:	4905                	li	s2,1
ffffffffc0204498:	b775                	j	ffffffffc0204444 <__up.constprop.0+0x16>
ffffffffc020449a:	00009697          	auipc	a3,0x9
ffffffffc020449e:	9a668693          	addi	a3,a3,-1626 # ffffffffc020ce40 <default_pmm_manager+0xa90>
ffffffffc02044a2:	00007617          	auipc	a2,0x7
ffffffffc02044a6:	42660613          	addi	a2,a2,1062 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02044aa:	45e5                	li	a1,25
ffffffffc02044ac:	00009517          	auipc	a0,0x9
ffffffffc02044b0:	9bc50513          	addi	a0,a0,-1604 # ffffffffc020ce68 <default_pmm_manager+0xab8>
ffffffffc02044b4:	febfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02044b8 <sem_init>:
ffffffffc02044b8:	c10c                	sw	a1,0(a0)
ffffffffc02044ba:	0521                	addi	a0,a0,8
ffffffffc02044bc:	a825                	j	ffffffffc02044f4 <wait_queue_init>

ffffffffc02044be <up>:
ffffffffc02044be:	f71ff06f          	j	ffffffffc020442e <__up.constprop.0>

ffffffffc02044c2 <down>:
ffffffffc02044c2:	1141                	addi	sp,sp,-16
ffffffffc02044c4:	e406                	sd	ra,8(sp)
ffffffffc02044c6:	eabff0ef          	jal	ra,ffffffffc0204370 <__down.constprop.0>
ffffffffc02044ca:	2501                	sext.w	a0,a0
ffffffffc02044cc:	e501                	bnez	a0,ffffffffc02044d4 <down+0x12>
ffffffffc02044ce:	60a2                	ld	ra,8(sp)
ffffffffc02044d0:	0141                	addi	sp,sp,16
ffffffffc02044d2:	8082                	ret
ffffffffc02044d4:	00009697          	auipc	a3,0x9
ffffffffc02044d8:	9a468693          	addi	a3,a3,-1628 # ffffffffc020ce78 <default_pmm_manager+0xac8>
ffffffffc02044dc:	00007617          	auipc	a2,0x7
ffffffffc02044e0:	3ec60613          	addi	a2,a2,1004 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02044e4:	04000593          	li	a1,64
ffffffffc02044e8:	00009517          	auipc	a0,0x9
ffffffffc02044ec:	98050513          	addi	a0,a0,-1664 # ffffffffc020ce68 <default_pmm_manager+0xab8>
ffffffffc02044f0:	faffb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02044f4 <wait_queue_init>:
ffffffffc02044f4:	e508                	sd	a0,8(a0)
ffffffffc02044f6:	e108                	sd	a0,0(a0)
ffffffffc02044f8:	8082                	ret

ffffffffc02044fa <wait_queue_del>:
ffffffffc02044fa:	7198                	ld	a4,32(a1)
ffffffffc02044fc:	01858793          	addi	a5,a1,24
ffffffffc0204500:	00e78b63          	beq	a5,a4,ffffffffc0204516 <wait_queue_del+0x1c>
ffffffffc0204504:	6994                	ld	a3,16(a1)
ffffffffc0204506:	00a69863          	bne	a3,a0,ffffffffc0204516 <wait_queue_del+0x1c>
ffffffffc020450a:	6d94                	ld	a3,24(a1)
ffffffffc020450c:	e698                	sd	a4,8(a3)
ffffffffc020450e:	e314                	sd	a3,0(a4)
ffffffffc0204510:	f19c                	sd	a5,32(a1)
ffffffffc0204512:	ed9c                	sd	a5,24(a1)
ffffffffc0204514:	8082                	ret
ffffffffc0204516:	1141                	addi	sp,sp,-16
ffffffffc0204518:	00009697          	auipc	a3,0x9
ffffffffc020451c:	9c068693          	addi	a3,a3,-1600 # ffffffffc020ced8 <default_pmm_manager+0xb28>
ffffffffc0204520:	00007617          	auipc	a2,0x7
ffffffffc0204524:	3a860613          	addi	a2,a2,936 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0204528:	45f1                	li	a1,28
ffffffffc020452a:	00009517          	auipc	a0,0x9
ffffffffc020452e:	99650513          	addi	a0,a0,-1642 # ffffffffc020cec0 <default_pmm_manager+0xb10>
ffffffffc0204532:	e406                	sd	ra,8(sp)
ffffffffc0204534:	f6bfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204538 <wait_queue_first>:
ffffffffc0204538:	651c                	ld	a5,8(a0)
ffffffffc020453a:	00f50563          	beq	a0,a5,ffffffffc0204544 <wait_queue_first+0xc>
ffffffffc020453e:	fe878513          	addi	a0,a5,-24
ffffffffc0204542:	8082                	ret
ffffffffc0204544:	4501                	li	a0,0
ffffffffc0204546:	8082                	ret

ffffffffc0204548 <wait_queue_empty>:
ffffffffc0204548:	651c                	ld	a5,8(a0)
ffffffffc020454a:	40a78533          	sub	a0,a5,a0
ffffffffc020454e:	00153513          	seqz	a0,a0
ffffffffc0204552:	8082                	ret

ffffffffc0204554 <wait_in_queue>:
ffffffffc0204554:	711c                	ld	a5,32(a0)
ffffffffc0204556:	0561                	addi	a0,a0,24
ffffffffc0204558:	40a78533          	sub	a0,a5,a0
ffffffffc020455c:	00a03533          	snez	a0,a0
ffffffffc0204560:	8082                	ret

ffffffffc0204562 <wakeup_wait>:
ffffffffc0204562:	e689                	bnez	a3,ffffffffc020456c <wakeup_wait+0xa>
ffffffffc0204564:	6188                	ld	a0,0(a1)
ffffffffc0204566:	c590                	sw	a2,8(a1)
ffffffffc0204568:	45d0206f          	j	ffffffffc02071c4 <wakeup_proc>
ffffffffc020456c:	7198                	ld	a4,32(a1)
ffffffffc020456e:	01858793          	addi	a5,a1,24
ffffffffc0204572:	00e78e63          	beq	a5,a4,ffffffffc020458e <wakeup_wait+0x2c>
ffffffffc0204576:	6994                	ld	a3,16(a1)
ffffffffc0204578:	00d51b63          	bne	a0,a3,ffffffffc020458e <wakeup_wait+0x2c>
ffffffffc020457c:	6d94                	ld	a3,24(a1)
ffffffffc020457e:	6188                	ld	a0,0(a1)
ffffffffc0204580:	e698                	sd	a4,8(a3)
ffffffffc0204582:	e314                	sd	a3,0(a4)
ffffffffc0204584:	f19c                	sd	a5,32(a1)
ffffffffc0204586:	ed9c                	sd	a5,24(a1)
ffffffffc0204588:	c590                	sw	a2,8(a1)
ffffffffc020458a:	43b0206f          	j	ffffffffc02071c4 <wakeup_proc>
ffffffffc020458e:	1141                	addi	sp,sp,-16
ffffffffc0204590:	00009697          	auipc	a3,0x9
ffffffffc0204594:	94868693          	addi	a3,a3,-1720 # ffffffffc020ced8 <default_pmm_manager+0xb28>
ffffffffc0204598:	00007617          	auipc	a2,0x7
ffffffffc020459c:	33060613          	addi	a2,a2,816 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02045a0:	45f1                	li	a1,28
ffffffffc02045a2:	00009517          	auipc	a0,0x9
ffffffffc02045a6:	91e50513          	addi	a0,a0,-1762 # ffffffffc020cec0 <default_pmm_manager+0xb10>
ffffffffc02045aa:	e406                	sd	ra,8(sp)
ffffffffc02045ac:	ef3fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02045b0 <wakeup_queue>:
ffffffffc02045b0:	651c                	ld	a5,8(a0)
ffffffffc02045b2:	0ca78563          	beq	a5,a0,ffffffffc020467c <wakeup_queue+0xcc>
ffffffffc02045b6:	1101                	addi	sp,sp,-32
ffffffffc02045b8:	e822                	sd	s0,16(sp)
ffffffffc02045ba:	e426                	sd	s1,8(sp)
ffffffffc02045bc:	e04a                	sd	s2,0(sp)
ffffffffc02045be:	ec06                	sd	ra,24(sp)
ffffffffc02045c0:	84aa                	mv	s1,a0
ffffffffc02045c2:	892e                	mv	s2,a1
ffffffffc02045c4:	fe878413          	addi	s0,a5,-24
ffffffffc02045c8:	e23d                	bnez	a2,ffffffffc020462e <wakeup_queue+0x7e>
ffffffffc02045ca:	6008                	ld	a0,0(s0)
ffffffffc02045cc:	01242423          	sw	s2,8(s0)
ffffffffc02045d0:	3f5020ef          	jal	ra,ffffffffc02071c4 <wakeup_proc>
ffffffffc02045d4:	701c                	ld	a5,32(s0)
ffffffffc02045d6:	01840713          	addi	a4,s0,24
ffffffffc02045da:	02e78463          	beq	a5,a4,ffffffffc0204602 <wakeup_queue+0x52>
ffffffffc02045de:	6818                	ld	a4,16(s0)
ffffffffc02045e0:	02e49163          	bne	s1,a4,ffffffffc0204602 <wakeup_queue+0x52>
ffffffffc02045e4:	02f48f63          	beq	s1,a5,ffffffffc0204622 <wakeup_queue+0x72>
ffffffffc02045e8:	fe87b503          	ld	a0,-24(a5)
ffffffffc02045ec:	ff27a823          	sw	s2,-16(a5)
ffffffffc02045f0:	fe878413          	addi	s0,a5,-24
ffffffffc02045f4:	3d1020ef          	jal	ra,ffffffffc02071c4 <wakeup_proc>
ffffffffc02045f8:	701c                	ld	a5,32(s0)
ffffffffc02045fa:	01840713          	addi	a4,s0,24
ffffffffc02045fe:	fee790e3          	bne	a5,a4,ffffffffc02045de <wakeup_queue+0x2e>
ffffffffc0204602:	00009697          	auipc	a3,0x9
ffffffffc0204606:	8d668693          	addi	a3,a3,-1834 # ffffffffc020ced8 <default_pmm_manager+0xb28>
ffffffffc020460a:	00007617          	auipc	a2,0x7
ffffffffc020460e:	2be60613          	addi	a2,a2,702 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0204612:	02200593          	li	a1,34
ffffffffc0204616:	00009517          	auipc	a0,0x9
ffffffffc020461a:	8aa50513          	addi	a0,a0,-1878 # ffffffffc020cec0 <default_pmm_manager+0xb10>
ffffffffc020461e:	e81fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204622:	60e2                	ld	ra,24(sp)
ffffffffc0204624:	6442                	ld	s0,16(sp)
ffffffffc0204626:	64a2                	ld	s1,8(sp)
ffffffffc0204628:	6902                	ld	s2,0(sp)
ffffffffc020462a:	6105                	addi	sp,sp,32
ffffffffc020462c:	8082                	ret
ffffffffc020462e:	6798                	ld	a4,8(a5)
ffffffffc0204630:	02f70763          	beq	a4,a5,ffffffffc020465e <wakeup_queue+0xae>
ffffffffc0204634:	6814                	ld	a3,16(s0)
ffffffffc0204636:	02d49463          	bne	s1,a3,ffffffffc020465e <wakeup_queue+0xae>
ffffffffc020463a:	6c14                	ld	a3,24(s0)
ffffffffc020463c:	6008                	ld	a0,0(s0)
ffffffffc020463e:	e698                	sd	a4,8(a3)
ffffffffc0204640:	e314                	sd	a3,0(a4)
ffffffffc0204642:	f01c                	sd	a5,32(s0)
ffffffffc0204644:	ec1c                	sd	a5,24(s0)
ffffffffc0204646:	01242423          	sw	s2,8(s0)
ffffffffc020464a:	37b020ef          	jal	ra,ffffffffc02071c4 <wakeup_proc>
ffffffffc020464e:	6480                	ld	s0,8(s1)
ffffffffc0204650:	fc8489e3          	beq	s1,s0,ffffffffc0204622 <wakeup_queue+0x72>
ffffffffc0204654:	6418                	ld	a4,8(s0)
ffffffffc0204656:	87a2                	mv	a5,s0
ffffffffc0204658:	1421                	addi	s0,s0,-24
ffffffffc020465a:	fce79de3          	bne	a5,a4,ffffffffc0204634 <wakeup_queue+0x84>
ffffffffc020465e:	00009697          	auipc	a3,0x9
ffffffffc0204662:	87a68693          	addi	a3,a3,-1926 # ffffffffc020ced8 <default_pmm_manager+0xb28>
ffffffffc0204666:	00007617          	auipc	a2,0x7
ffffffffc020466a:	26260613          	addi	a2,a2,610 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020466e:	45f1                	li	a1,28
ffffffffc0204670:	00009517          	auipc	a0,0x9
ffffffffc0204674:	85050513          	addi	a0,a0,-1968 # ffffffffc020cec0 <default_pmm_manager+0xb10>
ffffffffc0204678:	e27fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020467c:	8082                	ret

ffffffffc020467e <wait_current_set>:
ffffffffc020467e:	00092797          	auipc	a5,0x92
ffffffffc0204682:	2427b783          	ld	a5,578(a5) # ffffffffc02968c0 <current>
ffffffffc0204686:	c39d                	beqz	a5,ffffffffc02046ac <wait_current_set+0x2e>
ffffffffc0204688:	01858713          	addi	a4,a1,24
ffffffffc020468c:	800006b7          	lui	a3,0x80000
ffffffffc0204690:	ed98                	sd	a4,24(a1)
ffffffffc0204692:	e19c                	sd	a5,0(a1)
ffffffffc0204694:	c594                	sw	a3,8(a1)
ffffffffc0204696:	4685                	li	a3,1
ffffffffc0204698:	c394                	sw	a3,0(a5)
ffffffffc020469a:	0ec7a623          	sw	a2,236(a5)
ffffffffc020469e:	611c                	ld	a5,0(a0)
ffffffffc02046a0:	e988                	sd	a0,16(a1)
ffffffffc02046a2:	e118                	sd	a4,0(a0)
ffffffffc02046a4:	e798                	sd	a4,8(a5)
ffffffffc02046a6:	f188                	sd	a0,32(a1)
ffffffffc02046a8:	ed9c                	sd	a5,24(a1)
ffffffffc02046aa:	8082                	ret
ffffffffc02046ac:	1141                	addi	sp,sp,-16
ffffffffc02046ae:	00009697          	auipc	a3,0x9
ffffffffc02046b2:	86a68693          	addi	a3,a3,-1942 # ffffffffc020cf18 <default_pmm_manager+0xb68>
ffffffffc02046b6:	00007617          	auipc	a2,0x7
ffffffffc02046ba:	21260613          	addi	a2,a2,530 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02046be:	07400593          	li	a1,116
ffffffffc02046c2:	00008517          	auipc	a0,0x8
ffffffffc02046c6:	7fe50513          	addi	a0,a0,2046 # ffffffffc020cec0 <default_pmm_manager+0xb10>
ffffffffc02046ca:	e406                	sd	ra,8(sp)
ffffffffc02046cc:	dd3fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02046d0 <get_fd_array.part.0>:
ffffffffc02046d0:	1141                	addi	sp,sp,-16
ffffffffc02046d2:	00009697          	auipc	a3,0x9
ffffffffc02046d6:	85668693          	addi	a3,a3,-1962 # ffffffffc020cf28 <default_pmm_manager+0xb78>
ffffffffc02046da:	00007617          	auipc	a2,0x7
ffffffffc02046de:	1ee60613          	addi	a2,a2,494 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02046e2:	45d1                	li	a1,20
ffffffffc02046e4:	00009517          	auipc	a0,0x9
ffffffffc02046e8:	87450513          	addi	a0,a0,-1932 # ffffffffc020cf58 <default_pmm_manager+0xba8>
ffffffffc02046ec:	e406                	sd	ra,8(sp)
ffffffffc02046ee:	db1fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02046f2 <fd_array_alloc>:
ffffffffc02046f2:	00092797          	auipc	a5,0x92
ffffffffc02046f6:	1ce7b783          	ld	a5,462(a5) # ffffffffc02968c0 <current>
ffffffffc02046fa:	1487b783          	ld	a5,328(a5)
ffffffffc02046fe:	1141                	addi	sp,sp,-16
ffffffffc0204700:	e406                	sd	ra,8(sp)
ffffffffc0204702:	c3a5                	beqz	a5,ffffffffc0204762 <fd_array_alloc+0x70>
ffffffffc0204704:	4b98                	lw	a4,16(a5)
ffffffffc0204706:	04e05e63          	blez	a4,ffffffffc0204762 <fd_array_alloc+0x70>
ffffffffc020470a:	775d                	lui	a4,0xffff7
ffffffffc020470c:	ad970713          	addi	a4,a4,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0204710:	679c                	ld	a5,8(a5)
ffffffffc0204712:	02e50863          	beq	a0,a4,ffffffffc0204742 <fd_array_alloc+0x50>
ffffffffc0204716:	04700713          	li	a4,71
ffffffffc020471a:	04a76263          	bltu	a4,a0,ffffffffc020475e <fd_array_alloc+0x6c>
ffffffffc020471e:	00351713          	slli	a4,a0,0x3
ffffffffc0204722:	40a70533          	sub	a0,a4,a0
ffffffffc0204726:	050e                	slli	a0,a0,0x3
ffffffffc0204728:	97aa                	add	a5,a5,a0
ffffffffc020472a:	4398                	lw	a4,0(a5)
ffffffffc020472c:	e71d                	bnez	a4,ffffffffc020475a <fd_array_alloc+0x68>
ffffffffc020472e:	5b88                	lw	a0,48(a5)
ffffffffc0204730:	e91d                	bnez	a0,ffffffffc0204766 <fd_array_alloc+0x74>
ffffffffc0204732:	4705                	li	a4,1
ffffffffc0204734:	c398                	sw	a4,0(a5)
ffffffffc0204736:	0207b423          	sd	zero,40(a5)
ffffffffc020473a:	e19c                	sd	a5,0(a1)
ffffffffc020473c:	60a2                	ld	ra,8(sp)
ffffffffc020473e:	0141                	addi	sp,sp,16
ffffffffc0204740:	8082                	ret
ffffffffc0204742:	6685                	lui	a3,0x1
ffffffffc0204744:	fc068693          	addi	a3,a3,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc0204748:	96be                	add	a3,a3,a5
ffffffffc020474a:	4398                	lw	a4,0(a5)
ffffffffc020474c:	d36d                	beqz	a4,ffffffffc020472e <fd_array_alloc+0x3c>
ffffffffc020474e:	03878793          	addi	a5,a5,56
ffffffffc0204752:	fef69ce3          	bne	a3,a5,ffffffffc020474a <fd_array_alloc+0x58>
ffffffffc0204756:	5529                	li	a0,-22
ffffffffc0204758:	b7d5                	j	ffffffffc020473c <fd_array_alloc+0x4a>
ffffffffc020475a:	5545                	li	a0,-15
ffffffffc020475c:	b7c5                	j	ffffffffc020473c <fd_array_alloc+0x4a>
ffffffffc020475e:	5575                	li	a0,-3
ffffffffc0204760:	bff1                	j	ffffffffc020473c <fd_array_alloc+0x4a>
ffffffffc0204762:	f6fff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>
ffffffffc0204766:	00009697          	auipc	a3,0x9
ffffffffc020476a:	80268693          	addi	a3,a3,-2046 # ffffffffc020cf68 <default_pmm_manager+0xbb8>
ffffffffc020476e:	00007617          	auipc	a2,0x7
ffffffffc0204772:	15a60613          	addi	a2,a2,346 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0204776:	03b00593          	li	a1,59
ffffffffc020477a:	00008517          	auipc	a0,0x8
ffffffffc020477e:	7de50513          	addi	a0,a0,2014 # ffffffffc020cf58 <default_pmm_manager+0xba8>
ffffffffc0204782:	d1dfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204786 <fd_array_free>:
ffffffffc0204786:	411c                	lw	a5,0(a0)
ffffffffc0204788:	1141                	addi	sp,sp,-16
ffffffffc020478a:	e022                	sd	s0,0(sp)
ffffffffc020478c:	e406                	sd	ra,8(sp)
ffffffffc020478e:	4705                	li	a4,1
ffffffffc0204790:	842a                	mv	s0,a0
ffffffffc0204792:	04e78063          	beq	a5,a4,ffffffffc02047d2 <fd_array_free+0x4c>
ffffffffc0204796:	470d                	li	a4,3
ffffffffc0204798:	04e79563          	bne	a5,a4,ffffffffc02047e2 <fd_array_free+0x5c>
ffffffffc020479c:	591c                	lw	a5,48(a0)
ffffffffc020479e:	c38d                	beqz	a5,ffffffffc02047c0 <fd_array_free+0x3a>
ffffffffc02047a0:	00008697          	auipc	a3,0x8
ffffffffc02047a4:	7c868693          	addi	a3,a3,1992 # ffffffffc020cf68 <default_pmm_manager+0xbb8>
ffffffffc02047a8:	00007617          	auipc	a2,0x7
ffffffffc02047ac:	12060613          	addi	a2,a2,288 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02047b0:	04500593          	li	a1,69
ffffffffc02047b4:	00008517          	auipc	a0,0x8
ffffffffc02047b8:	7a450513          	addi	a0,a0,1956 # ffffffffc020cf58 <default_pmm_manager+0xba8>
ffffffffc02047bc:	ce3fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02047c0:	7408                	ld	a0,40(s0)
ffffffffc02047c2:	079030ef          	jal	ra,ffffffffc020803a <vfs_close>
ffffffffc02047c6:	60a2                	ld	ra,8(sp)
ffffffffc02047c8:	00042023          	sw	zero,0(s0)
ffffffffc02047cc:	6402                	ld	s0,0(sp)
ffffffffc02047ce:	0141                	addi	sp,sp,16
ffffffffc02047d0:	8082                	ret
ffffffffc02047d2:	591c                	lw	a5,48(a0)
ffffffffc02047d4:	f7f1                	bnez	a5,ffffffffc02047a0 <fd_array_free+0x1a>
ffffffffc02047d6:	60a2                	ld	ra,8(sp)
ffffffffc02047d8:	00042023          	sw	zero,0(s0)
ffffffffc02047dc:	6402                	ld	s0,0(sp)
ffffffffc02047de:	0141                	addi	sp,sp,16
ffffffffc02047e0:	8082                	ret
ffffffffc02047e2:	00008697          	auipc	a3,0x8
ffffffffc02047e6:	7be68693          	addi	a3,a3,1982 # ffffffffc020cfa0 <default_pmm_manager+0xbf0>
ffffffffc02047ea:	00007617          	auipc	a2,0x7
ffffffffc02047ee:	0de60613          	addi	a2,a2,222 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02047f2:	04400593          	li	a1,68
ffffffffc02047f6:	00008517          	auipc	a0,0x8
ffffffffc02047fa:	76250513          	addi	a0,a0,1890 # ffffffffc020cf58 <default_pmm_manager+0xba8>
ffffffffc02047fe:	ca1fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204802 <fd_array_release>:
ffffffffc0204802:	4118                	lw	a4,0(a0)
ffffffffc0204804:	1141                	addi	sp,sp,-16
ffffffffc0204806:	e406                	sd	ra,8(sp)
ffffffffc0204808:	4685                	li	a3,1
ffffffffc020480a:	3779                	addiw	a4,a4,-2
ffffffffc020480c:	04e6e063          	bltu	a3,a4,ffffffffc020484c <fd_array_release+0x4a>
ffffffffc0204810:	5918                	lw	a4,48(a0)
ffffffffc0204812:	00e05d63          	blez	a4,ffffffffc020482c <fd_array_release+0x2a>
ffffffffc0204816:	fff7069b          	addiw	a3,a4,-1
ffffffffc020481a:	d914                	sw	a3,48(a0)
ffffffffc020481c:	c681                	beqz	a3,ffffffffc0204824 <fd_array_release+0x22>
ffffffffc020481e:	60a2                	ld	ra,8(sp)
ffffffffc0204820:	0141                	addi	sp,sp,16
ffffffffc0204822:	8082                	ret
ffffffffc0204824:	60a2                	ld	ra,8(sp)
ffffffffc0204826:	0141                	addi	sp,sp,16
ffffffffc0204828:	f5fff06f          	j	ffffffffc0204786 <fd_array_free>
ffffffffc020482c:	00008697          	auipc	a3,0x8
ffffffffc0204830:	7e468693          	addi	a3,a3,2020 # ffffffffc020d010 <default_pmm_manager+0xc60>
ffffffffc0204834:	00007617          	auipc	a2,0x7
ffffffffc0204838:	09460613          	addi	a2,a2,148 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020483c:	05600593          	li	a1,86
ffffffffc0204840:	00008517          	auipc	a0,0x8
ffffffffc0204844:	71850513          	addi	a0,a0,1816 # ffffffffc020cf58 <default_pmm_manager+0xba8>
ffffffffc0204848:	c57fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020484c:	00008697          	auipc	a3,0x8
ffffffffc0204850:	78c68693          	addi	a3,a3,1932 # ffffffffc020cfd8 <default_pmm_manager+0xc28>
ffffffffc0204854:	00007617          	auipc	a2,0x7
ffffffffc0204858:	07460613          	addi	a2,a2,116 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020485c:	05500593          	li	a1,85
ffffffffc0204860:	00008517          	auipc	a0,0x8
ffffffffc0204864:	6f850513          	addi	a0,a0,1784 # ffffffffc020cf58 <default_pmm_manager+0xba8>
ffffffffc0204868:	c37fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020486c <fd_array_open.part.0>:
ffffffffc020486c:	1141                	addi	sp,sp,-16
ffffffffc020486e:	00008697          	auipc	a3,0x8
ffffffffc0204872:	7ba68693          	addi	a3,a3,1978 # ffffffffc020d028 <default_pmm_manager+0xc78>
ffffffffc0204876:	00007617          	auipc	a2,0x7
ffffffffc020487a:	05260613          	addi	a2,a2,82 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020487e:	05f00593          	li	a1,95
ffffffffc0204882:	00008517          	auipc	a0,0x8
ffffffffc0204886:	6d650513          	addi	a0,a0,1750 # ffffffffc020cf58 <default_pmm_manager+0xba8>
ffffffffc020488a:	e406                	sd	ra,8(sp)
ffffffffc020488c:	c13fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204890 <fd_array_init>:
ffffffffc0204890:	4781                	li	a5,0
ffffffffc0204892:	04800713          	li	a4,72
ffffffffc0204896:	cd1c                	sw	a5,24(a0)
ffffffffc0204898:	02052823          	sw	zero,48(a0)
ffffffffc020489c:	00052023          	sw	zero,0(a0)
ffffffffc02048a0:	2785                	addiw	a5,a5,1
ffffffffc02048a2:	03850513          	addi	a0,a0,56
ffffffffc02048a6:	fee798e3          	bne	a5,a4,ffffffffc0204896 <fd_array_init+0x6>
ffffffffc02048aa:	8082                	ret

ffffffffc02048ac <fd_array_close>:
ffffffffc02048ac:	4118                	lw	a4,0(a0)
ffffffffc02048ae:	1141                	addi	sp,sp,-16
ffffffffc02048b0:	e406                	sd	ra,8(sp)
ffffffffc02048b2:	e022                	sd	s0,0(sp)
ffffffffc02048b4:	4789                	li	a5,2
ffffffffc02048b6:	04f71a63          	bne	a4,a5,ffffffffc020490a <fd_array_close+0x5e>
ffffffffc02048ba:	591c                	lw	a5,48(a0)
ffffffffc02048bc:	842a                	mv	s0,a0
ffffffffc02048be:	02f05663          	blez	a5,ffffffffc02048ea <fd_array_close+0x3e>
ffffffffc02048c2:	37fd                	addiw	a5,a5,-1
ffffffffc02048c4:	470d                	li	a4,3
ffffffffc02048c6:	c118                	sw	a4,0(a0)
ffffffffc02048c8:	d91c                	sw	a5,48(a0)
ffffffffc02048ca:	0007871b          	sext.w	a4,a5
ffffffffc02048ce:	c709                	beqz	a4,ffffffffc02048d8 <fd_array_close+0x2c>
ffffffffc02048d0:	60a2                	ld	ra,8(sp)
ffffffffc02048d2:	6402                	ld	s0,0(sp)
ffffffffc02048d4:	0141                	addi	sp,sp,16
ffffffffc02048d6:	8082                	ret
ffffffffc02048d8:	7508                	ld	a0,40(a0)
ffffffffc02048da:	760030ef          	jal	ra,ffffffffc020803a <vfs_close>
ffffffffc02048de:	60a2                	ld	ra,8(sp)
ffffffffc02048e0:	00042023          	sw	zero,0(s0)
ffffffffc02048e4:	6402                	ld	s0,0(sp)
ffffffffc02048e6:	0141                	addi	sp,sp,16
ffffffffc02048e8:	8082                	ret
ffffffffc02048ea:	00008697          	auipc	a3,0x8
ffffffffc02048ee:	72668693          	addi	a3,a3,1830 # ffffffffc020d010 <default_pmm_manager+0xc60>
ffffffffc02048f2:	00007617          	auipc	a2,0x7
ffffffffc02048f6:	fd660613          	addi	a2,a2,-42 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02048fa:	06800593          	li	a1,104
ffffffffc02048fe:	00008517          	auipc	a0,0x8
ffffffffc0204902:	65a50513          	addi	a0,a0,1626 # ffffffffc020cf58 <default_pmm_manager+0xba8>
ffffffffc0204906:	b99fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020490a:	00008697          	auipc	a3,0x8
ffffffffc020490e:	67668693          	addi	a3,a3,1654 # ffffffffc020cf80 <default_pmm_manager+0xbd0>
ffffffffc0204912:	00007617          	auipc	a2,0x7
ffffffffc0204916:	fb660613          	addi	a2,a2,-74 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020491a:	06700593          	li	a1,103
ffffffffc020491e:	00008517          	auipc	a0,0x8
ffffffffc0204922:	63a50513          	addi	a0,a0,1594 # ffffffffc020cf58 <default_pmm_manager+0xba8>
ffffffffc0204926:	b79fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020492a <fd_array_dup>:
ffffffffc020492a:	7179                	addi	sp,sp,-48
ffffffffc020492c:	e84a                	sd	s2,16(sp)
ffffffffc020492e:	00052903          	lw	s2,0(a0)
ffffffffc0204932:	f406                	sd	ra,40(sp)
ffffffffc0204934:	f022                	sd	s0,32(sp)
ffffffffc0204936:	ec26                	sd	s1,24(sp)
ffffffffc0204938:	e44e                	sd	s3,8(sp)
ffffffffc020493a:	4785                	li	a5,1
ffffffffc020493c:	04f91663          	bne	s2,a5,ffffffffc0204988 <fd_array_dup+0x5e>
ffffffffc0204940:	0005a983          	lw	s3,0(a1)
ffffffffc0204944:	4789                	li	a5,2
ffffffffc0204946:	04f99163          	bne	s3,a5,ffffffffc0204988 <fd_array_dup+0x5e>
ffffffffc020494a:	7584                	ld	s1,40(a1)
ffffffffc020494c:	699c                	ld	a5,16(a1)
ffffffffc020494e:	7194                	ld	a3,32(a1)
ffffffffc0204950:	6598                	ld	a4,8(a1)
ffffffffc0204952:	842a                	mv	s0,a0
ffffffffc0204954:	e91c                	sd	a5,16(a0)
ffffffffc0204956:	f114                	sd	a3,32(a0)
ffffffffc0204958:	e518                	sd	a4,8(a0)
ffffffffc020495a:	8526                	mv	a0,s1
ffffffffc020495c:	63d020ef          	jal	ra,ffffffffc0207798 <inode_ref_inc>
ffffffffc0204960:	8526                	mv	a0,s1
ffffffffc0204962:	643020ef          	jal	ra,ffffffffc02077a4 <inode_open_inc>
ffffffffc0204966:	401c                	lw	a5,0(s0)
ffffffffc0204968:	f404                	sd	s1,40(s0)
ffffffffc020496a:	03279f63          	bne	a5,s2,ffffffffc02049a8 <fd_array_dup+0x7e>
ffffffffc020496e:	cc8d                	beqz	s1,ffffffffc02049a8 <fd_array_dup+0x7e>
ffffffffc0204970:	581c                	lw	a5,48(s0)
ffffffffc0204972:	01342023          	sw	s3,0(s0)
ffffffffc0204976:	70a2                	ld	ra,40(sp)
ffffffffc0204978:	2785                	addiw	a5,a5,1
ffffffffc020497a:	d81c                	sw	a5,48(s0)
ffffffffc020497c:	7402                	ld	s0,32(sp)
ffffffffc020497e:	64e2                	ld	s1,24(sp)
ffffffffc0204980:	6942                	ld	s2,16(sp)
ffffffffc0204982:	69a2                	ld	s3,8(sp)
ffffffffc0204984:	6145                	addi	sp,sp,48
ffffffffc0204986:	8082                	ret
ffffffffc0204988:	00008697          	auipc	a3,0x8
ffffffffc020498c:	6d068693          	addi	a3,a3,1744 # ffffffffc020d058 <default_pmm_manager+0xca8>
ffffffffc0204990:	00007617          	auipc	a2,0x7
ffffffffc0204994:	f3860613          	addi	a2,a2,-200 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0204998:	07300593          	li	a1,115
ffffffffc020499c:	00008517          	auipc	a0,0x8
ffffffffc02049a0:	5bc50513          	addi	a0,a0,1468 # ffffffffc020cf58 <default_pmm_manager+0xba8>
ffffffffc02049a4:	afbfb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02049a8:	ec5ff0ef          	jal	ra,ffffffffc020486c <fd_array_open.part.0>

ffffffffc02049ac <file_testfd>:
ffffffffc02049ac:	04700793          	li	a5,71
ffffffffc02049b0:	04a7e263          	bltu	a5,a0,ffffffffc02049f4 <file_testfd+0x48>
ffffffffc02049b4:	00092797          	auipc	a5,0x92
ffffffffc02049b8:	f0c7b783          	ld	a5,-244(a5) # ffffffffc02968c0 <current>
ffffffffc02049bc:	1487b783          	ld	a5,328(a5)
ffffffffc02049c0:	cf85                	beqz	a5,ffffffffc02049f8 <file_testfd+0x4c>
ffffffffc02049c2:	4b98                	lw	a4,16(a5)
ffffffffc02049c4:	02e05a63          	blez	a4,ffffffffc02049f8 <file_testfd+0x4c>
ffffffffc02049c8:	6798                	ld	a4,8(a5)
ffffffffc02049ca:	00351793          	slli	a5,a0,0x3
ffffffffc02049ce:	8f89                	sub	a5,a5,a0
ffffffffc02049d0:	078e                	slli	a5,a5,0x3
ffffffffc02049d2:	97ba                	add	a5,a5,a4
ffffffffc02049d4:	4394                	lw	a3,0(a5)
ffffffffc02049d6:	4709                	li	a4,2
ffffffffc02049d8:	00e69e63          	bne	a3,a4,ffffffffc02049f4 <file_testfd+0x48>
ffffffffc02049dc:	4f98                	lw	a4,24(a5)
ffffffffc02049de:	00a71b63          	bne	a4,a0,ffffffffc02049f4 <file_testfd+0x48>
ffffffffc02049e2:	c199                	beqz	a1,ffffffffc02049e8 <file_testfd+0x3c>
ffffffffc02049e4:	6788                	ld	a0,8(a5)
ffffffffc02049e6:	c901                	beqz	a0,ffffffffc02049f6 <file_testfd+0x4a>
ffffffffc02049e8:	4505                	li	a0,1
ffffffffc02049ea:	c611                	beqz	a2,ffffffffc02049f6 <file_testfd+0x4a>
ffffffffc02049ec:	6b88                	ld	a0,16(a5)
ffffffffc02049ee:	00a03533          	snez	a0,a0
ffffffffc02049f2:	8082                	ret
ffffffffc02049f4:	4501                	li	a0,0
ffffffffc02049f6:	8082                	ret
ffffffffc02049f8:	1141                	addi	sp,sp,-16
ffffffffc02049fa:	e406                	sd	ra,8(sp)
ffffffffc02049fc:	cd5ff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>

ffffffffc0204a00 <file_open>:
ffffffffc0204a00:	711d                	addi	sp,sp,-96
ffffffffc0204a02:	ec86                	sd	ra,88(sp)
ffffffffc0204a04:	e8a2                	sd	s0,80(sp)
ffffffffc0204a06:	e4a6                	sd	s1,72(sp)
ffffffffc0204a08:	e0ca                	sd	s2,64(sp)
ffffffffc0204a0a:	fc4e                	sd	s3,56(sp)
ffffffffc0204a0c:	f852                	sd	s4,48(sp)
ffffffffc0204a0e:	0035f793          	andi	a5,a1,3
ffffffffc0204a12:	470d                	li	a4,3
ffffffffc0204a14:	0ce78163          	beq	a5,a4,ffffffffc0204ad6 <file_open+0xd6>
ffffffffc0204a18:	078e                	slli	a5,a5,0x3
ffffffffc0204a1a:	00009717          	auipc	a4,0x9
ffffffffc0204a1e:	8ae70713          	addi	a4,a4,-1874 # ffffffffc020d2c8 <CSWTCH.79>
ffffffffc0204a22:	892a                	mv	s2,a0
ffffffffc0204a24:	00009697          	auipc	a3,0x9
ffffffffc0204a28:	88c68693          	addi	a3,a3,-1908 # ffffffffc020d2b0 <CSWTCH.78>
ffffffffc0204a2c:	755d                	lui	a0,0xffff7
ffffffffc0204a2e:	96be                	add	a3,a3,a5
ffffffffc0204a30:	84ae                	mv	s1,a1
ffffffffc0204a32:	97ba                	add	a5,a5,a4
ffffffffc0204a34:	858a                	mv	a1,sp
ffffffffc0204a36:	ad950513          	addi	a0,a0,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0204a3a:	0006ba03          	ld	s4,0(a3)
ffffffffc0204a3e:	0007b983          	ld	s3,0(a5)
ffffffffc0204a42:	cb1ff0ef          	jal	ra,ffffffffc02046f2 <fd_array_alloc>
ffffffffc0204a46:	842a                	mv	s0,a0
ffffffffc0204a48:	c911                	beqz	a0,ffffffffc0204a5c <file_open+0x5c>
ffffffffc0204a4a:	60e6                	ld	ra,88(sp)
ffffffffc0204a4c:	8522                	mv	a0,s0
ffffffffc0204a4e:	6446                	ld	s0,80(sp)
ffffffffc0204a50:	64a6                	ld	s1,72(sp)
ffffffffc0204a52:	6906                	ld	s2,64(sp)
ffffffffc0204a54:	79e2                	ld	s3,56(sp)
ffffffffc0204a56:	7a42                	ld	s4,48(sp)
ffffffffc0204a58:	6125                	addi	sp,sp,96
ffffffffc0204a5a:	8082                	ret
ffffffffc0204a5c:	0030                	addi	a2,sp,8
ffffffffc0204a5e:	85a6                	mv	a1,s1
ffffffffc0204a60:	854a                	mv	a0,s2
ffffffffc0204a62:	432030ef          	jal	ra,ffffffffc0207e94 <vfs_open>
ffffffffc0204a66:	842a                	mv	s0,a0
ffffffffc0204a68:	e13d                	bnez	a0,ffffffffc0204ace <file_open+0xce>
ffffffffc0204a6a:	6782                	ld	a5,0(sp)
ffffffffc0204a6c:	0204f493          	andi	s1,s1,32
ffffffffc0204a70:	6422                	ld	s0,8(sp)
ffffffffc0204a72:	0207b023          	sd	zero,32(a5)
ffffffffc0204a76:	c885                	beqz	s1,ffffffffc0204aa6 <file_open+0xa6>
ffffffffc0204a78:	c03d                	beqz	s0,ffffffffc0204ade <file_open+0xde>
ffffffffc0204a7a:	783c                	ld	a5,112(s0)
ffffffffc0204a7c:	c3ad                	beqz	a5,ffffffffc0204ade <file_open+0xde>
ffffffffc0204a7e:	779c                	ld	a5,40(a5)
ffffffffc0204a80:	cfb9                	beqz	a5,ffffffffc0204ade <file_open+0xde>
ffffffffc0204a82:	8522                	mv	a0,s0
ffffffffc0204a84:	00008597          	auipc	a1,0x8
ffffffffc0204a88:	65c58593          	addi	a1,a1,1628 # ffffffffc020d0e0 <default_pmm_manager+0xd30>
ffffffffc0204a8c:	525020ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc0204a90:	783c                	ld	a5,112(s0)
ffffffffc0204a92:	6522                	ld	a0,8(sp)
ffffffffc0204a94:	080c                	addi	a1,sp,16
ffffffffc0204a96:	779c                	ld	a5,40(a5)
ffffffffc0204a98:	9782                	jalr	a5
ffffffffc0204a9a:	842a                	mv	s0,a0
ffffffffc0204a9c:	e515                	bnez	a0,ffffffffc0204ac8 <file_open+0xc8>
ffffffffc0204a9e:	6782                	ld	a5,0(sp)
ffffffffc0204aa0:	7722                	ld	a4,40(sp)
ffffffffc0204aa2:	6422                	ld	s0,8(sp)
ffffffffc0204aa4:	f398                	sd	a4,32(a5)
ffffffffc0204aa6:	4394                	lw	a3,0(a5)
ffffffffc0204aa8:	f780                	sd	s0,40(a5)
ffffffffc0204aaa:	0147b423          	sd	s4,8(a5)
ffffffffc0204aae:	0137b823          	sd	s3,16(a5)
ffffffffc0204ab2:	4705                	li	a4,1
ffffffffc0204ab4:	02e69363          	bne	a3,a4,ffffffffc0204ada <file_open+0xda>
ffffffffc0204ab8:	c00d                	beqz	s0,ffffffffc0204ada <file_open+0xda>
ffffffffc0204aba:	5b98                	lw	a4,48(a5)
ffffffffc0204abc:	4689                	li	a3,2
ffffffffc0204abe:	4f80                	lw	s0,24(a5)
ffffffffc0204ac0:	2705                	addiw	a4,a4,1
ffffffffc0204ac2:	c394                	sw	a3,0(a5)
ffffffffc0204ac4:	db98                	sw	a4,48(a5)
ffffffffc0204ac6:	b751                	j	ffffffffc0204a4a <file_open+0x4a>
ffffffffc0204ac8:	6522                	ld	a0,8(sp)
ffffffffc0204aca:	570030ef          	jal	ra,ffffffffc020803a <vfs_close>
ffffffffc0204ace:	6502                	ld	a0,0(sp)
ffffffffc0204ad0:	cb7ff0ef          	jal	ra,ffffffffc0204786 <fd_array_free>
ffffffffc0204ad4:	bf9d                	j	ffffffffc0204a4a <file_open+0x4a>
ffffffffc0204ad6:	5475                	li	s0,-3
ffffffffc0204ad8:	bf8d                	j	ffffffffc0204a4a <file_open+0x4a>
ffffffffc0204ada:	d93ff0ef          	jal	ra,ffffffffc020486c <fd_array_open.part.0>
ffffffffc0204ade:	00008697          	auipc	a3,0x8
ffffffffc0204ae2:	5b268693          	addi	a3,a3,1458 # ffffffffc020d090 <default_pmm_manager+0xce0>
ffffffffc0204ae6:	00007617          	auipc	a2,0x7
ffffffffc0204aea:	de260613          	addi	a2,a2,-542 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0204aee:	0b500593          	li	a1,181
ffffffffc0204af2:	00008517          	auipc	a0,0x8
ffffffffc0204af6:	46650513          	addi	a0,a0,1126 # ffffffffc020cf58 <default_pmm_manager+0xba8>
ffffffffc0204afa:	9a5fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204afe <file_close>:
ffffffffc0204afe:	04700713          	li	a4,71
ffffffffc0204b02:	04a76563          	bltu	a4,a0,ffffffffc0204b4c <file_close+0x4e>
ffffffffc0204b06:	00092717          	auipc	a4,0x92
ffffffffc0204b0a:	dba73703          	ld	a4,-582(a4) # ffffffffc02968c0 <current>
ffffffffc0204b0e:	14873703          	ld	a4,328(a4)
ffffffffc0204b12:	1141                	addi	sp,sp,-16
ffffffffc0204b14:	e406                	sd	ra,8(sp)
ffffffffc0204b16:	cf0d                	beqz	a4,ffffffffc0204b50 <file_close+0x52>
ffffffffc0204b18:	4b14                	lw	a3,16(a4)
ffffffffc0204b1a:	02d05b63          	blez	a3,ffffffffc0204b50 <file_close+0x52>
ffffffffc0204b1e:	6718                	ld	a4,8(a4)
ffffffffc0204b20:	87aa                	mv	a5,a0
ffffffffc0204b22:	050e                	slli	a0,a0,0x3
ffffffffc0204b24:	8d1d                	sub	a0,a0,a5
ffffffffc0204b26:	050e                	slli	a0,a0,0x3
ffffffffc0204b28:	953a                	add	a0,a0,a4
ffffffffc0204b2a:	4114                	lw	a3,0(a0)
ffffffffc0204b2c:	4709                	li	a4,2
ffffffffc0204b2e:	00e69b63          	bne	a3,a4,ffffffffc0204b44 <file_close+0x46>
ffffffffc0204b32:	4d18                	lw	a4,24(a0)
ffffffffc0204b34:	00f71863          	bne	a4,a5,ffffffffc0204b44 <file_close+0x46>
ffffffffc0204b38:	d75ff0ef          	jal	ra,ffffffffc02048ac <fd_array_close>
ffffffffc0204b3c:	60a2                	ld	ra,8(sp)
ffffffffc0204b3e:	4501                	li	a0,0
ffffffffc0204b40:	0141                	addi	sp,sp,16
ffffffffc0204b42:	8082                	ret
ffffffffc0204b44:	60a2                	ld	ra,8(sp)
ffffffffc0204b46:	5575                	li	a0,-3
ffffffffc0204b48:	0141                	addi	sp,sp,16
ffffffffc0204b4a:	8082                	ret
ffffffffc0204b4c:	5575                	li	a0,-3
ffffffffc0204b4e:	8082                	ret
ffffffffc0204b50:	b81ff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>

ffffffffc0204b54 <file_read>:
ffffffffc0204b54:	715d                	addi	sp,sp,-80
ffffffffc0204b56:	e486                	sd	ra,72(sp)
ffffffffc0204b58:	e0a2                	sd	s0,64(sp)
ffffffffc0204b5a:	fc26                	sd	s1,56(sp)
ffffffffc0204b5c:	f84a                	sd	s2,48(sp)
ffffffffc0204b5e:	f44e                	sd	s3,40(sp)
ffffffffc0204b60:	f052                	sd	s4,32(sp)
ffffffffc0204b62:	0006b023          	sd	zero,0(a3)
ffffffffc0204b66:	04700793          	li	a5,71
ffffffffc0204b6a:	0aa7e463          	bltu	a5,a0,ffffffffc0204c12 <file_read+0xbe>
ffffffffc0204b6e:	00092797          	auipc	a5,0x92
ffffffffc0204b72:	d527b783          	ld	a5,-686(a5) # ffffffffc02968c0 <current>
ffffffffc0204b76:	1487b783          	ld	a5,328(a5)
ffffffffc0204b7a:	cfd1                	beqz	a5,ffffffffc0204c16 <file_read+0xc2>
ffffffffc0204b7c:	4b98                	lw	a4,16(a5)
ffffffffc0204b7e:	08e05c63          	blez	a4,ffffffffc0204c16 <file_read+0xc2>
ffffffffc0204b82:	6780                	ld	s0,8(a5)
ffffffffc0204b84:	00351793          	slli	a5,a0,0x3
ffffffffc0204b88:	8f89                	sub	a5,a5,a0
ffffffffc0204b8a:	078e                	slli	a5,a5,0x3
ffffffffc0204b8c:	943e                	add	s0,s0,a5
ffffffffc0204b8e:	00042983          	lw	s3,0(s0)
ffffffffc0204b92:	4789                	li	a5,2
ffffffffc0204b94:	06f99f63          	bne	s3,a5,ffffffffc0204c12 <file_read+0xbe>
ffffffffc0204b98:	4c1c                	lw	a5,24(s0)
ffffffffc0204b9a:	06a79c63          	bne	a5,a0,ffffffffc0204c12 <file_read+0xbe>
ffffffffc0204b9e:	641c                	ld	a5,8(s0)
ffffffffc0204ba0:	cbad                	beqz	a5,ffffffffc0204c12 <file_read+0xbe>
ffffffffc0204ba2:	581c                	lw	a5,48(s0)
ffffffffc0204ba4:	8a36                	mv	s4,a3
ffffffffc0204ba6:	7014                	ld	a3,32(s0)
ffffffffc0204ba8:	2785                	addiw	a5,a5,1
ffffffffc0204baa:	850a                	mv	a0,sp
ffffffffc0204bac:	d81c                	sw	a5,48(s0)
ffffffffc0204bae:	792000ef          	jal	ra,ffffffffc0205340 <iobuf_init>
ffffffffc0204bb2:	02843903          	ld	s2,40(s0)
ffffffffc0204bb6:	84aa                	mv	s1,a0
ffffffffc0204bb8:	06090163          	beqz	s2,ffffffffc0204c1a <file_read+0xc6>
ffffffffc0204bbc:	07093783          	ld	a5,112(s2)
ffffffffc0204bc0:	cfa9                	beqz	a5,ffffffffc0204c1a <file_read+0xc6>
ffffffffc0204bc2:	6f9c                	ld	a5,24(a5)
ffffffffc0204bc4:	cbb9                	beqz	a5,ffffffffc0204c1a <file_read+0xc6>
ffffffffc0204bc6:	00008597          	auipc	a1,0x8
ffffffffc0204bca:	57258593          	addi	a1,a1,1394 # ffffffffc020d138 <default_pmm_manager+0xd88>
ffffffffc0204bce:	854a                	mv	a0,s2
ffffffffc0204bd0:	3e1020ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc0204bd4:	07093783          	ld	a5,112(s2)
ffffffffc0204bd8:	7408                	ld	a0,40(s0)
ffffffffc0204bda:	85a6                	mv	a1,s1
ffffffffc0204bdc:	6f9c                	ld	a5,24(a5)
ffffffffc0204bde:	9782                	jalr	a5
ffffffffc0204be0:	689c                	ld	a5,16(s1)
ffffffffc0204be2:	6c94                	ld	a3,24(s1)
ffffffffc0204be4:	4018                	lw	a4,0(s0)
ffffffffc0204be6:	84aa                	mv	s1,a0
ffffffffc0204be8:	8f95                	sub	a5,a5,a3
ffffffffc0204bea:	03370063          	beq	a4,s3,ffffffffc0204c0a <file_read+0xb6>
ffffffffc0204bee:	00fa3023          	sd	a5,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0204bf2:	8522                	mv	a0,s0
ffffffffc0204bf4:	c0fff0ef          	jal	ra,ffffffffc0204802 <fd_array_release>
ffffffffc0204bf8:	60a6                	ld	ra,72(sp)
ffffffffc0204bfa:	6406                	ld	s0,64(sp)
ffffffffc0204bfc:	7942                	ld	s2,48(sp)
ffffffffc0204bfe:	79a2                	ld	s3,40(sp)
ffffffffc0204c00:	7a02                	ld	s4,32(sp)
ffffffffc0204c02:	8526                	mv	a0,s1
ffffffffc0204c04:	74e2                	ld	s1,56(sp)
ffffffffc0204c06:	6161                	addi	sp,sp,80
ffffffffc0204c08:	8082                	ret
ffffffffc0204c0a:	7018                	ld	a4,32(s0)
ffffffffc0204c0c:	973e                	add	a4,a4,a5
ffffffffc0204c0e:	f018                	sd	a4,32(s0)
ffffffffc0204c10:	bff9                	j	ffffffffc0204bee <file_read+0x9a>
ffffffffc0204c12:	54f5                	li	s1,-3
ffffffffc0204c14:	b7d5                	j	ffffffffc0204bf8 <file_read+0xa4>
ffffffffc0204c16:	abbff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>
ffffffffc0204c1a:	00008697          	auipc	a3,0x8
ffffffffc0204c1e:	4ce68693          	addi	a3,a3,1230 # ffffffffc020d0e8 <default_pmm_manager+0xd38>
ffffffffc0204c22:	00007617          	auipc	a2,0x7
ffffffffc0204c26:	ca660613          	addi	a2,a2,-858 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0204c2a:	0de00593          	li	a1,222
ffffffffc0204c2e:	00008517          	auipc	a0,0x8
ffffffffc0204c32:	32a50513          	addi	a0,a0,810 # ffffffffc020cf58 <default_pmm_manager+0xba8>
ffffffffc0204c36:	869fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204c3a <file_write>:
ffffffffc0204c3a:	715d                	addi	sp,sp,-80
ffffffffc0204c3c:	e486                	sd	ra,72(sp)
ffffffffc0204c3e:	e0a2                	sd	s0,64(sp)
ffffffffc0204c40:	fc26                	sd	s1,56(sp)
ffffffffc0204c42:	f84a                	sd	s2,48(sp)
ffffffffc0204c44:	f44e                	sd	s3,40(sp)
ffffffffc0204c46:	f052                	sd	s4,32(sp)
ffffffffc0204c48:	0006b023          	sd	zero,0(a3)
ffffffffc0204c4c:	04700793          	li	a5,71
ffffffffc0204c50:	0aa7e463          	bltu	a5,a0,ffffffffc0204cf8 <file_write+0xbe>
ffffffffc0204c54:	00092797          	auipc	a5,0x92
ffffffffc0204c58:	c6c7b783          	ld	a5,-916(a5) # ffffffffc02968c0 <current>
ffffffffc0204c5c:	1487b783          	ld	a5,328(a5)
ffffffffc0204c60:	cfd1                	beqz	a5,ffffffffc0204cfc <file_write+0xc2>
ffffffffc0204c62:	4b98                	lw	a4,16(a5)
ffffffffc0204c64:	08e05c63          	blez	a4,ffffffffc0204cfc <file_write+0xc2>
ffffffffc0204c68:	6780                	ld	s0,8(a5)
ffffffffc0204c6a:	00351793          	slli	a5,a0,0x3
ffffffffc0204c6e:	8f89                	sub	a5,a5,a0
ffffffffc0204c70:	078e                	slli	a5,a5,0x3
ffffffffc0204c72:	943e                	add	s0,s0,a5
ffffffffc0204c74:	00042983          	lw	s3,0(s0)
ffffffffc0204c78:	4789                	li	a5,2
ffffffffc0204c7a:	06f99f63          	bne	s3,a5,ffffffffc0204cf8 <file_write+0xbe>
ffffffffc0204c7e:	4c1c                	lw	a5,24(s0)
ffffffffc0204c80:	06a79c63          	bne	a5,a0,ffffffffc0204cf8 <file_write+0xbe>
ffffffffc0204c84:	681c                	ld	a5,16(s0)
ffffffffc0204c86:	cbad                	beqz	a5,ffffffffc0204cf8 <file_write+0xbe>
ffffffffc0204c88:	581c                	lw	a5,48(s0)
ffffffffc0204c8a:	8a36                	mv	s4,a3
ffffffffc0204c8c:	7014                	ld	a3,32(s0)
ffffffffc0204c8e:	2785                	addiw	a5,a5,1
ffffffffc0204c90:	850a                	mv	a0,sp
ffffffffc0204c92:	d81c                	sw	a5,48(s0)
ffffffffc0204c94:	6ac000ef          	jal	ra,ffffffffc0205340 <iobuf_init>
ffffffffc0204c98:	02843903          	ld	s2,40(s0)
ffffffffc0204c9c:	84aa                	mv	s1,a0
ffffffffc0204c9e:	06090163          	beqz	s2,ffffffffc0204d00 <file_write+0xc6>
ffffffffc0204ca2:	07093783          	ld	a5,112(s2)
ffffffffc0204ca6:	cfa9                	beqz	a5,ffffffffc0204d00 <file_write+0xc6>
ffffffffc0204ca8:	739c                	ld	a5,32(a5)
ffffffffc0204caa:	cbb9                	beqz	a5,ffffffffc0204d00 <file_write+0xc6>
ffffffffc0204cac:	00008597          	auipc	a1,0x8
ffffffffc0204cb0:	4e458593          	addi	a1,a1,1252 # ffffffffc020d190 <default_pmm_manager+0xde0>
ffffffffc0204cb4:	854a                	mv	a0,s2
ffffffffc0204cb6:	2fb020ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc0204cba:	07093783          	ld	a5,112(s2)
ffffffffc0204cbe:	7408                	ld	a0,40(s0)
ffffffffc0204cc0:	85a6                	mv	a1,s1
ffffffffc0204cc2:	739c                	ld	a5,32(a5)
ffffffffc0204cc4:	9782                	jalr	a5
ffffffffc0204cc6:	689c                	ld	a5,16(s1)
ffffffffc0204cc8:	6c94                	ld	a3,24(s1)
ffffffffc0204cca:	4018                	lw	a4,0(s0)
ffffffffc0204ccc:	84aa                	mv	s1,a0
ffffffffc0204cce:	8f95                	sub	a5,a5,a3
ffffffffc0204cd0:	03370063          	beq	a4,s3,ffffffffc0204cf0 <file_write+0xb6>
ffffffffc0204cd4:	00fa3023          	sd	a5,0(s4)
ffffffffc0204cd8:	8522                	mv	a0,s0
ffffffffc0204cda:	b29ff0ef          	jal	ra,ffffffffc0204802 <fd_array_release>
ffffffffc0204cde:	60a6                	ld	ra,72(sp)
ffffffffc0204ce0:	6406                	ld	s0,64(sp)
ffffffffc0204ce2:	7942                	ld	s2,48(sp)
ffffffffc0204ce4:	79a2                	ld	s3,40(sp)
ffffffffc0204ce6:	7a02                	ld	s4,32(sp)
ffffffffc0204ce8:	8526                	mv	a0,s1
ffffffffc0204cea:	74e2                	ld	s1,56(sp)
ffffffffc0204cec:	6161                	addi	sp,sp,80
ffffffffc0204cee:	8082                	ret
ffffffffc0204cf0:	7018                	ld	a4,32(s0)
ffffffffc0204cf2:	973e                	add	a4,a4,a5
ffffffffc0204cf4:	f018                	sd	a4,32(s0)
ffffffffc0204cf6:	bff9                	j	ffffffffc0204cd4 <file_write+0x9a>
ffffffffc0204cf8:	54f5                	li	s1,-3
ffffffffc0204cfa:	b7d5                	j	ffffffffc0204cde <file_write+0xa4>
ffffffffc0204cfc:	9d5ff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>
ffffffffc0204d00:	00008697          	auipc	a3,0x8
ffffffffc0204d04:	44068693          	addi	a3,a3,1088 # ffffffffc020d140 <default_pmm_manager+0xd90>
ffffffffc0204d08:	00007617          	auipc	a2,0x7
ffffffffc0204d0c:	bc060613          	addi	a2,a2,-1088 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0204d10:	0f800593          	li	a1,248
ffffffffc0204d14:	00008517          	auipc	a0,0x8
ffffffffc0204d18:	24450513          	addi	a0,a0,580 # ffffffffc020cf58 <default_pmm_manager+0xba8>
ffffffffc0204d1c:	f82fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204d20 <file_seek>:
ffffffffc0204d20:	7139                	addi	sp,sp,-64
ffffffffc0204d22:	fc06                	sd	ra,56(sp)
ffffffffc0204d24:	f822                	sd	s0,48(sp)
ffffffffc0204d26:	f426                	sd	s1,40(sp)
ffffffffc0204d28:	f04a                	sd	s2,32(sp)
ffffffffc0204d2a:	04700793          	li	a5,71
ffffffffc0204d2e:	08a7e863          	bltu	a5,a0,ffffffffc0204dbe <file_seek+0x9e>
ffffffffc0204d32:	00092797          	auipc	a5,0x92
ffffffffc0204d36:	b8e7b783          	ld	a5,-1138(a5) # ffffffffc02968c0 <current>
ffffffffc0204d3a:	1487b783          	ld	a5,328(a5)
ffffffffc0204d3e:	cfdd                	beqz	a5,ffffffffc0204dfc <file_seek+0xdc>
ffffffffc0204d40:	4b98                	lw	a4,16(a5)
ffffffffc0204d42:	0ae05d63          	blez	a4,ffffffffc0204dfc <file_seek+0xdc>
ffffffffc0204d46:	6780                	ld	s0,8(a5)
ffffffffc0204d48:	00351793          	slli	a5,a0,0x3
ffffffffc0204d4c:	8f89                	sub	a5,a5,a0
ffffffffc0204d4e:	078e                	slli	a5,a5,0x3
ffffffffc0204d50:	943e                	add	s0,s0,a5
ffffffffc0204d52:	4018                	lw	a4,0(s0)
ffffffffc0204d54:	4789                	li	a5,2
ffffffffc0204d56:	06f71463          	bne	a4,a5,ffffffffc0204dbe <file_seek+0x9e>
ffffffffc0204d5a:	4c1c                	lw	a5,24(s0)
ffffffffc0204d5c:	06a79163          	bne	a5,a0,ffffffffc0204dbe <file_seek+0x9e>
ffffffffc0204d60:	581c                	lw	a5,48(s0)
ffffffffc0204d62:	4685                	li	a3,1
ffffffffc0204d64:	892e                	mv	s2,a1
ffffffffc0204d66:	2785                	addiw	a5,a5,1
ffffffffc0204d68:	d81c                	sw	a5,48(s0)
ffffffffc0204d6a:	02d60063          	beq	a2,a3,ffffffffc0204d8a <file_seek+0x6a>
ffffffffc0204d6e:	06e60063          	beq	a2,a4,ffffffffc0204dce <file_seek+0xae>
ffffffffc0204d72:	54f5                	li	s1,-3
ffffffffc0204d74:	ce11                	beqz	a2,ffffffffc0204d90 <file_seek+0x70>
ffffffffc0204d76:	8522                	mv	a0,s0
ffffffffc0204d78:	a8bff0ef          	jal	ra,ffffffffc0204802 <fd_array_release>
ffffffffc0204d7c:	70e2                	ld	ra,56(sp)
ffffffffc0204d7e:	7442                	ld	s0,48(sp)
ffffffffc0204d80:	7902                	ld	s2,32(sp)
ffffffffc0204d82:	8526                	mv	a0,s1
ffffffffc0204d84:	74a2                	ld	s1,40(sp)
ffffffffc0204d86:	6121                	addi	sp,sp,64
ffffffffc0204d88:	8082                	ret
ffffffffc0204d8a:	701c                	ld	a5,32(s0)
ffffffffc0204d8c:	00f58933          	add	s2,a1,a5
ffffffffc0204d90:	7404                	ld	s1,40(s0)
ffffffffc0204d92:	c4bd                	beqz	s1,ffffffffc0204e00 <file_seek+0xe0>
ffffffffc0204d94:	78bc                	ld	a5,112(s1)
ffffffffc0204d96:	c7ad                	beqz	a5,ffffffffc0204e00 <file_seek+0xe0>
ffffffffc0204d98:	6fbc                	ld	a5,88(a5)
ffffffffc0204d9a:	c3bd                	beqz	a5,ffffffffc0204e00 <file_seek+0xe0>
ffffffffc0204d9c:	8526                	mv	a0,s1
ffffffffc0204d9e:	00008597          	auipc	a1,0x8
ffffffffc0204da2:	44a58593          	addi	a1,a1,1098 # ffffffffc020d1e8 <default_pmm_manager+0xe38>
ffffffffc0204da6:	20b020ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc0204daa:	78bc                	ld	a5,112(s1)
ffffffffc0204dac:	7408                	ld	a0,40(s0)
ffffffffc0204dae:	85ca                	mv	a1,s2
ffffffffc0204db0:	6fbc                	ld	a5,88(a5)
ffffffffc0204db2:	9782                	jalr	a5
ffffffffc0204db4:	84aa                	mv	s1,a0
ffffffffc0204db6:	f161                	bnez	a0,ffffffffc0204d76 <file_seek+0x56>
ffffffffc0204db8:	03243023          	sd	s2,32(s0)
ffffffffc0204dbc:	bf6d                	j	ffffffffc0204d76 <file_seek+0x56>
ffffffffc0204dbe:	70e2                	ld	ra,56(sp)
ffffffffc0204dc0:	7442                	ld	s0,48(sp)
ffffffffc0204dc2:	54f5                	li	s1,-3
ffffffffc0204dc4:	7902                	ld	s2,32(sp)
ffffffffc0204dc6:	8526                	mv	a0,s1
ffffffffc0204dc8:	74a2                	ld	s1,40(sp)
ffffffffc0204dca:	6121                	addi	sp,sp,64
ffffffffc0204dcc:	8082                	ret
ffffffffc0204dce:	7404                	ld	s1,40(s0)
ffffffffc0204dd0:	c8a1                	beqz	s1,ffffffffc0204e20 <file_seek+0x100>
ffffffffc0204dd2:	78bc                	ld	a5,112(s1)
ffffffffc0204dd4:	c7b1                	beqz	a5,ffffffffc0204e20 <file_seek+0x100>
ffffffffc0204dd6:	779c                	ld	a5,40(a5)
ffffffffc0204dd8:	c7a1                	beqz	a5,ffffffffc0204e20 <file_seek+0x100>
ffffffffc0204dda:	8526                	mv	a0,s1
ffffffffc0204ddc:	00008597          	auipc	a1,0x8
ffffffffc0204de0:	30458593          	addi	a1,a1,772 # ffffffffc020d0e0 <default_pmm_manager+0xd30>
ffffffffc0204de4:	1cd020ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc0204de8:	78bc                	ld	a5,112(s1)
ffffffffc0204dea:	7408                	ld	a0,40(s0)
ffffffffc0204dec:	858a                	mv	a1,sp
ffffffffc0204dee:	779c                	ld	a5,40(a5)
ffffffffc0204df0:	9782                	jalr	a5
ffffffffc0204df2:	84aa                	mv	s1,a0
ffffffffc0204df4:	f149                	bnez	a0,ffffffffc0204d76 <file_seek+0x56>
ffffffffc0204df6:	67e2                	ld	a5,24(sp)
ffffffffc0204df8:	993e                	add	s2,s2,a5
ffffffffc0204dfa:	bf59                	j	ffffffffc0204d90 <file_seek+0x70>
ffffffffc0204dfc:	8d5ff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>
ffffffffc0204e00:	00008697          	auipc	a3,0x8
ffffffffc0204e04:	39868693          	addi	a3,a3,920 # ffffffffc020d198 <default_pmm_manager+0xde8>
ffffffffc0204e08:	00007617          	auipc	a2,0x7
ffffffffc0204e0c:	ac060613          	addi	a2,a2,-1344 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0204e10:	11a00593          	li	a1,282
ffffffffc0204e14:	00008517          	auipc	a0,0x8
ffffffffc0204e18:	14450513          	addi	a0,a0,324 # ffffffffc020cf58 <default_pmm_manager+0xba8>
ffffffffc0204e1c:	e82fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204e20:	00008697          	auipc	a3,0x8
ffffffffc0204e24:	27068693          	addi	a3,a3,624 # ffffffffc020d090 <default_pmm_manager+0xce0>
ffffffffc0204e28:	00007617          	auipc	a2,0x7
ffffffffc0204e2c:	aa060613          	addi	a2,a2,-1376 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0204e30:	11200593          	li	a1,274
ffffffffc0204e34:	00008517          	auipc	a0,0x8
ffffffffc0204e38:	12450513          	addi	a0,a0,292 # ffffffffc020cf58 <default_pmm_manager+0xba8>
ffffffffc0204e3c:	e62fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204e40 <file_fstat>:
ffffffffc0204e40:	1101                	addi	sp,sp,-32
ffffffffc0204e42:	ec06                	sd	ra,24(sp)
ffffffffc0204e44:	e822                	sd	s0,16(sp)
ffffffffc0204e46:	e426                	sd	s1,8(sp)
ffffffffc0204e48:	e04a                	sd	s2,0(sp)
ffffffffc0204e4a:	04700793          	li	a5,71
ffffffffc0204e4e:	06a7ef63          	bltu	a5,a0,ffffffffc0204ecc <file_fstat+0x8c>
ffffffffc0204e52:	00092797          	auipc	a5,0x92
ffffffffc0204e56:	a6e7b783          	ld	a5,-1426(a5) # ffffffffc02968c0 <current>
ffffffffc0204e5a:	1487b783          	ld	a5,328(a5)
ffffffffc0204e5e:	cfd9                	beqz	a5,ffffffffc0204efc <file_fstat+0xbc>
ffffffffc0204e60:	4b98                	lw	a4,16(a5)
ffffffffc0204e62:	08e05d63          	blez	a4,ffffffffc0204efc <file_fstat+0xbc>
ffffffffc0204e66:	6780                	ld	s0,8(a5)
ffffffffc0204e68:	00351793          	slli	a5,a0,0x3
ffffffffc0204e6c:	8f89                	sub	a5,a5,a0
ffffffffc0204e6e:	078e                	slli	a5,a5,0x3
ffffffffc0204e70:	943e                	add	s0,s0,a5
ffffffffc0204e72:	4018                	lw	a4,0(s0)
ffffffffc0204e74:	4789                	li	a5,2
ffffffffc0204e76:	04f71b63          	bne	a4,a5,ffffffffc0204ecc <file_fstat+0x8c>
ffffffffc0204e7a:	4c1c                	lw	a5,24(s0)
ffffffffc0204e7c:	04a79863          	bne	a5,a0,ffffffffc0204ecc <file_fstat+0x8c>
ffffffffc0204e80:	581c                	lw	a5,48(s0)
ffffffffc0204e82:	02843903          	ld	s2,40(s0)
ffffffffc0204e86:	2785                	addiw	a5,a5,1
ffffffffc0204e88:	d81c                	sw	a5,48(s0)
ffffffffc0204e8a:	04090963          	beqz	s2,ffffffffc0204edc <file_fstat+0x9c>
ffffffffc0204e8e:	07093783          	ld	a5,112(s2)
ffffffffc0204e92:	c7a9                	beqz	a5,ffffffffc0204edc <file_fstat+0x9c>
ffffffffc0204e94:	779c                	ld	a5,40(a5)
ffffffffc0204e96:	c3b9                	beqz	a5,ffffffffc0204edc <file_fstat+0x9c>
ffffffffc0204e98:	84ae                	mv	s1,a1
ffffffffc0204e9a:	854a                	mv	a0,s2
ffffffffc0204e9c:	00008597          	auipc	a1,0x8
ffffffffc0204ea0:	24458593          	addi	a1,a1,580 # ffffffffc020d0e0 <default_pmm_manager+0xd30>
ffffffffc0204ea4:	10d020ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc0204ea8:	07093783          	ld	a5,112(s2)
ffffffffc0204eac:	7408                	ld	a0,40(s0)
ffffffffc0204eae:	85a6                	mv	a1,s1
ffffffffc0204eb0:	779c                	ld	a5,40(a5)
ffffffffc0204eb2:	9782                	jalr	a5
ffffffffc0204eb4:	87aa                	mv	a5,a0
ffffffffc0204eb6:	8522                	mv	a0,s0
ffffffffc0204eb8:	843e                	mv	s0,a5
ffffffffc0204eba:	949ff0ef          	jal	ra,ffffffffc0204802 <fd_array_release>
ffffffffc0204ebe:	60e2                	ld	ra,24(sp)
ffffffffc0204ec0:	8522                	mv	a0,s0
ffffffffc0204ec2:	6442                	ld	s0,16(sp)
ffffffffc0204ec4:	64a2                	ld	s1,8(sp)
ffffffffc0204ec6:	6902                	ld	s2,0(sp)
ffffffffc0204ec8:	6105                	addi	sp,sp,32
ffffffffc0204eca:	8082                	ret
ffffffffc0204ecc:	5475                	li	s0,-3
ffffffffc0204ece:	60e2                	ld	ra,24(sp)
ffffffffc0204ed0:	8522                	mv	a0,s0
ffffffffc0204ed2:	6442                	ld	s0,16(sp)
ffffffffc0204ed4:	64a2                	ld	s1,8(sp)
ffffffffc0204ed6:	6902                	ld	s2,0(sp)
ffffffffc0204ed8:	6105                	addi	sp,sp,32
ffffffffc0204eda:	8082                	ret
ffffffffc0204edc:	00008697          	auipc	a3,0x8
ffffffffc0204ee0:	1b468693          	addi	a3,a3,436 # ffffffffc020d090 <default_pmm_manager+0xce0>
ffffffffc0204ee4:	00007617          	auipc	a2,0x7
ffffffffc0204ee8:	9e460613          	addi	a2,a2,-1564 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0204eec:	12c00593          	li	a1,300
ffffffffc0204ef0:	00008517          	auipc	a0,0x8
ffffffffc0204ef4:	06850513          	addi	a0,a0,104 # ffffffffc020cf58 <default_pmm_manager+0xba8>
ffffffffc0204ef8:	da6fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204efc:	fd4ff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>

ffffffffc0204f00 <file_fsync>:
ffffffffc0204f00:	1101                	addi	sp,sp,-32
ffffffffc0204f02:	ec06                	sd	ra,24(sp)
ffffffffc0204f04:	e822                	sd	s0,16(sp)
ffffffffc0204f06:	e426                	sd	s1,8(sp)
ffffffffc0204f08:	04700793          	li	a5,71
ffffffffc0204f0c:	06a7e863          	bltu	a5,a0,ffffffffc0204f7c <file_fsync+0x7c>
ffffffffc0204f10:	00092797          	auipc	a5,0x92
ffffffffc0204f14:	9b07b783          	ld	a5,-1616(a5) # ffffffffc02968c0 <current>
ffffffffc0204f18:	1487b783          	ld	a5,328(a5)
ffffffffc0204f1c:	c7d9                	beqz	a5,ffffffffc0204faa <file_fsync+0xaa>
ffffffffc0204f1e:	4b98                	lw	a4,16(a5)
ffffffffc0204f20:	08e05563          	blez	a4,ffffffffc0204faa <file_fsync+0xaa>
ffffffffc0204f24:	6780                	ld	s0,8(a5)
ffffffffc0204f26:	00351793          	slli	a5,a0,0x3
ffffffffc0204f2a:	8f89                	sub	a5,a5,a0
ffffffffc0204f2c:	078e                	slli	a5,a5,0x3
ffffffffc0204f2e:	943e                	add	s0,s0,a5
ffffffffc0204f30:	4018                	lw	a4,0(s0)
ffffffffc0204f32:	4789                	li	a5,2
ffffffffc0204f34:	04f71463          	bne	a4,a5,ffffffffc0204f7c <file_fsync+0x7c>
ffffffffc0204f38:	4c1c                	lw	a5,24(s0)
ffffffffc0204f3a:	04a79163          	bne	a5,a0,ffffffffc0204f7c <file_fsync+0x7c>
ffffffffc0204f3e:	581c                	lw	a5,48(s0)
ffffffffc0204f40:	7404                	ld	s1,40(s0)
ffffffffc0204f42:	2785                	addiw	a5,a5,1
ffffffffc0204f44:	d81c                	sw	a5,48(s0)
ffffffffc0204f46:	c0b1                	beqz	s1,ffffffffc0204f8a <file_fsync+0x8a>
ffffffffc0204f48:	78bc                	ld	a5,112(s1)
ffffffffc0204f4a:	c3a1                	beqz	a5,ffffffffc0204f8a <file_fsync+0x8a>
ffffffffc0204f4c:	7b9c                	ld	a5,48(a5)
ffffffffc0204f4e:	cf95                	beqz	a5,ffffffffc0204f8a <file_fsync+0x8a>
ffffffffc0204f50:	00008597          	auipc	a1,0x8
ffffffffc0204f54:	2f058593          	addi	a1,a1,752 # ffffffffc020d240 <default_pmm_manager+0xe90>
ffffffffc0204f58:	8526                	mv	a0,s1
ffffffffc0204f5a:	057020ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc0204f5e:	78bc                	ld	a5,112(s1)
ffffffffc0204f60:	7408                	ld	a0,40(s0)
ffffffffc0204f62:	7b9c                	ld	a5,48(a5)
ffffffffc0204f64:	9782                	jalr	a5
ffffffffc0204f66:	87aa                	mv	a5,a0
ffffffffc0204f68:	8522                	mv	a0,s0
ffffffffc0204f6a:	843e                	mv	s0,a5
ffffffffc0204f6c:	897ff0ef          	jal	ra,ffffffffc0204802 <fd_array_release>
ffffffffc0204f70:	60e2                	ld	ra,24(sp)
ffffffffc0204f72:	8522                	mv	a0,s0
ffffffffc0204f74:	6442                	ld	s0,16(sp)
ffffffffc0204f76:	64a2                	ld	s1,8(sp)
ffffffffc0204f78:	6105                	addi	sp,sp,32
ffffffffc0204f7a:	8082                	ret
ffffffffc0204f7c:	5475                	li	s0,-3
ffffffffc0204f7e:	60e2                	ld	ra,24(sp)
ffffffffc0204f80:	8522                	mv	a0,s0
ffffffffc0204f82:	6442                	ld	s0,16(sp)
ffffffffc0204f84:	64a2                	ld	s1,8(sp)
ffffffffc0204f86:	6105                	addi	sp,sp,32
ffffffffc0204f88:	8082                	ret
ffffffffc0204f8a:	00008697          	auipc	a3,0x8
ffffffffc0204f8e:	26668693          	addi	a3,a3,614 # ffffffffc020d1f0 <default_pmm_manager+0xe40>
ffffffffc0204f92:	00007617          	auipc	a2,0x7
ffffffffc0204f96:	93660613          	addi	a2,a2,-1738 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0204f9a:	13a00593          	li	a1,314
ffffffffc0204f9e:	00008517          	auipc	a0,0x8
ffffffffc0204fa2:	fba50513          	addi	a0,a0,-70 # ffffffffc020cf58 <default_pmm_manager+0xba8>
ffffffffc0204fa6:	cf8fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204faa:	f26ff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>

ffffffffc0204fae <file_getdirentry>:
ffffffffc0204fae:	715d                	addi	sp,sp,-80
ffffffffc0204fb0:	e486                	sd	ra,72(sp)
ffffffffc0204fb2:	e0a2                	sd	s0,64(sp)
ffffffffc0204fb4:	fc26                	sd	s1,56(sp)
ffffffffc0204fb6:	f84a                	sd	s2,48(sp)
ffffffffc0204fb8:	f44e                	sd	s3,40(sp)
ffffffffc0204fba:	04700793          	li	a5,71
ffffffffc0204fbe:	0aa7e063          	bltu	a5,a0,ffffffffc020505e <file_getdirentry+0xb0>
ffffffffc0204fc2:	00092797          	auipc	a5,0x92
ffffffffc0204fc6:	8fe7b783          	ld	a5,-1794(a5) # ffffffffc02968c0 <current>
ffffffffc0204fca:	1487b783          	ld	a5,328(a5)
ffffffffc0204fce:	c3e9                	beqz	a5,ffffffffc0205090 <file_getdirentry+0xe2>
ffffffffc0204fd0:	4b98                	lw	a4,16(a5)
ffffffffc0204fd2:	0ae05f63          	blez	a4,ffffffffc0205090 <file_getdirentry+0xe2>
ffffffffc0204fd6:	6780                	ld	s0,8(a5)
ffffffffc0204fd8:	00351793          	slli	a5,a0,0x3
ffffffffc0204fdc:	8f89                	sub	a5,a5,a0
ffffffffc0204fde:	078e                	slli	a5,a5,0x3
ffffffffc0204fe0:	943e                	add	s0,s0,a5
ffffffffc0204fe2:	4018                	lw	a4,0(s0)
ffffffffc0204fe4:	4789                	li	a5,2
ffffffffc0204fe6:	06f71c63          	bne	a4,a5,ffffffffc020505e <file_getdirentry+0xb0>
ffffffffc0204fea:	4c1c                	lw	a5,24(s0)
ffffffffc0204fec:	06a79963          	bne	a5,a0,ffffffffc020505e <file_getdirentry+0xb0>
ffffffffc0204ff0:	581c                	lw	a5,48(s0)
ffffffffc0204ff2:	6194                	ld	a3,0(a1)
ffffffffc0204ff4:	84ae                	mv	s1,a1
ffffffffc0204ff6:	2785                	addiw	a5,a5,1
ffffffffc0204ff8:	10000613          	li	a2,256
ffffffffc0204ffc:	d81c                	sw	a5,48(s0)
ffffffffc0204ffe:	05a1                	addi	a1,a1,8
ffffffffc0205000:	850a                	mv	a0,sp
ffffffffc0205002:	33e000ef          	jal	ra,ffffffffc0205340 <iobuf_init>
ffffffffc0205006:	02843983          	ld	s3,40(s0)
ffffffffc020500a:	892a                	mv	s2,a0
ffffffffc020500c:	06098263          	beqz	s3,ffffffffc0205070 <file_getdirentry+0xc2>
ffffffffc0205010:	0709b783          	ld	a5,112(s3) # 1070 <_binary_bin_swap_img_size-0x6c90>
ffffffffc0205014:	cfb1                	beqz	a5,ffffffffc0205070 <file_getdirentry+0xc2>
ffffffffc0205016:	63bc                	ld	a5,64(a5)
ffffffffc0205018:	cfa1                	beqz	a5,ffffffffc0205070 <file_getdirentry+0xc2>
ffffffffc020501a:	854e                	mv	a0,s3
ffffffffc020501c:	00008597          	auipc	a1,0x8
ffffffffc0205020:	28458593          	addi	a1,a1,644 # ffffffffc020d2a0 <default_pmm_manager+0xef0>
ffffffffc0205024:	78c020ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc0205028:	0709b783          	ld	a5,112(s3)
ffffffffc020502c:	7408                	ld	a0,40(s0)
ffffffffc020502e:	85ca                	mv	a1,s2
ffffffffc0205030:	63bc                	ld	a5,64(a5)
ffffffffc0205032:	9782                	jalr	a5
ffffffffc0205034:	89aa                	mv	s3,a0
ffffffffc0205036:	e909                	bnez	a0,ffffffffc0205048 <file_getdirentry+0x9a>
ffffffffc0205038:	609c                	ld	a5,0(s1)
ffffffffc020503a:	01093683          	ld	a3,16(s2)
ffffffffc020503e:	01893703          	ld	a4,24(s2)
ffffffffc0205042:	97b6                	add	a5,a5,a3
ffffffffc0205044:	8f99                	sub	a5,a5,a4
ffffffffc0205046:	e09c                	sd	a5,0(s1)
ffffffffc0205048:	8522                	mv	a0,s0
ffffffffc020504a:	fb8ff0ef          	jal	ra,ffffffffc0204802 <fd_array_release>
ffffffffc020504e:	60a6                	ld	ra,72(sp)
ffffffffc0205050:	6406                	ld	s0,64(sp)
ffffffffc0205052:	74e2                	ld	s1,56(sp)
ffffffffc0205054:	7942                	ld	s2,48(sp)
ffffffffc0205056:	854e                	mv	a0,s3
ffffffffc0205058:	79a2                	ld	s3,40(sp)
ffffffffc020505a:	6161                	addi	sp,sp,80
ffffffffc020505c:	8082                	ret
ffffffffc020505e:	60a6                	ld	ra,72(sp)
ffffffffc0205060:	6406                	ld	s0,64(sp)
ffffffffc0205062:	59f5                	li	s3,-3
ffffffffc0205064:	74e2                	ld	s1,56(sp)
ffffffffc0205066:	7942                	ld	s2,48(sp)
ffffffffc0205068:	854e                	mv	a0,s3
ffffffffc020506a:	79a2                	ld	s3,40(sp)
ffffffffc020506c:	6161                	addi	sp,sp,80
ffffffffc020506e:	8082                	ret
ffffffffc0205070:	00008697          	auipc	a3,0x8
ffffffffc0205074:	1d868693          	addi	a3,a3,472 # ffffffffc020d248 <default_pmm_manager+0xe98>
ffffffffc0205078:	00007617          	auipc	a2,0x7
ffffffffc020507c:	85060613          	addi	a2,a2,-1968 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0205080:	14a00593          	li	a1,330
ffffffffc0205084:	00008517          	auipc	a0,0x8
ffffffffc0205088:	ed450513          	addi	a0,a0,-300 # ffffffffc020cf58 <default_pmm_manager+0xba8>
ffffffffc020508c:	c12fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205090:	e40ff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>

ffffffffc0205094 <file_dup>:
ffffffffc0205094:	04700713          	li	a4,71
ffffffffc0205098:	06a76463          	bltu	a4,a0,ffffffffc0205100 <file_dup+0x6c>
ffffffffc020509c:	00092717          	auipc	a4,0x92
ffffffffc02050a0:	82473703          	ld	a4,-2012(a4) # ffffffffc02968c0 <current>
ffffffffc02050a4:	14873703          	ld	a4,328(a4)
ffffffffc02050a8:	1101                	addi	sp,sp,-32
ffffffffc02050aa:	ec06                	sd	ra,24(sp)
ffffffffc02050ac:	e822                	sd	s0,16(sp)
ffffffffc02050ae:	cb39                	beqz	a4,ffffffffc0205104 <file_dup+0x70>
ffffffffc02050b0:	4b14                	lw	a3,16(a4)
ffffffffc02050b2:	04d05963          	blez	a3,ffffffffc0205104 <file_dup+0x70>
ffffffffc02050b6:	6700                	ld	s0,8(a4)
ffffffffc02050b8:	00351713          	slli	a4,a0,0x3
ffffffffc02050bc:	8f09                	sub	a4,a4,a0
ffffffffc02050be:	070e                	slli	a4,a4,0x3
ffffffffc02050c0:	943a                	add	s0,s0,a4
ffffffffc02050c2:	4014                	lw	a3,0(s0)
ffffffffc02050c4:	4709                	li	a4,2
ffffffffc02050c6:	02e69863          	bne	a3,a4,ffffffffc02050f6 <file_dup+0x62>
ffffffffc02050ca:	4c18                	lw	a4,24(s0)
ffffffffc02050cc:	02a71563          	bne	a4,a0,ffffffffc02050f6 <file_dup+0x62>
ffffffffc02050d0:	852e                	mv	a0,a1
ffffffffc02050d2:	002c                	addi	a1,sp,8
ffffffffc02050d4:	e1eff0ef          	jal	ra,ffffffffc02046f2 <fd_array_alloc>
ffffffffc02050d8:	c509                	beqz	a0,ffffffffc02050e2 <file_dup+0x4e>
ffffffffc02050da:	60e2                	ld	ra,24(sp)
ffffffffc02050dc:	6442                	ld	s0,16(sp)
ffffffffc02050de:	6105                	addi	sp,sp,32
ffffffffc02050e0:	8082                	ret
ffffffffc02050e2:	6522                	ld	a0,8(sp)
ffffffffc02050e4:	85a2                	mv	a1,s0
ffffffffc02050e6:	845ff0ef          	jal	ra,ffffffffc020492a <fd_array_dup>
ffffffffc02050ea:	67a2                	ld	a5,8(sp)
ffffffffc02050ec:	60e2                	ld	ra,24(sp)
ffffffffc02050ee:	6442                	ld	s0,16(sp)
ffffffffc02050f0:	4f88                	lw	a0,24(a5)
ffffffffc02050f2:	6105                	addi	sp,sp,32
ffffffffc02050f4:	8082                	ret
ffffffffc02050f6:	60e2                	ld	ra,24(sp)
ffffffffc02050f8:	6442                	ld	s0,16(sp)
ffffffffc02050fa:	5575                	li	a0,-3
ffffffffc02050fc:	6105                	addi	sp,sp,32
ffffffffc02050fe:	8082                	ret
ffffffffc0205100:	5575                	li	a0,-3
ffffffffc0205102:	8082                	ret
ffffffffc0205104:	dccff0ef          	jal	ra,ffffffffc02046d0 <get_fd_array.part.0>

ffffffffc0205108 <fs_init>:
ffffffffc0205108:	1141                	addi	sp,sp,-16
ffffffffc020510a:	e406                	sd	ra,8(sp)
ffffffffc020510c:	0c3020ef          	jal	ra,ffffffffc02079ce <vfs_init>
ffffffffc0205110:	59a030ef          	jal	ra,ffffffffc02086aa <dev_init>
ffffffffc0205114:	60a2                	ld	ra,8(sp)
ffffffffc0205116:	0141                	addi	sp,sp,16
ffffffffc0205118:	6eb0306f          	j	ffffffffc0209002 <sfs_init>

ffffffffc020511c <fs_cleanup>:
ffffffffc020511c:	3050206f          	j	ffffffffc0207c20 <vfs_cleanup>

ffffffffc0205120 <lock_files>:
ffffffffc0205120:	0561                	addi	a0,a0,24
ffffffffc0205122:	ba0ff06f          	j	ffffffffc02044c2 <down>

ffffffffc0205126 <unlock_files>:
ffffffffc0205126:	0561                	addi	a0,a0,24
ffffffffc0205128:	b96ff06f          	j	ffffffffc02044be <up>

ffffffffc020512c <files_create>:
ffffffffc020512c:	1141                	addi	sp,sp,-16
ffffffffc020512e:	6505                	lui	a0,0x1
ffffffffc0205130:	e022                	sd	s0,0(sp)
ffffffffc0205132:	e406                	sd	ra,8(sp)
ffffffffc0205134:	e5bfc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0205138:	842a                	mv	s0,a0
ffffffffc020513a:	cd19                	beqz	a0,ffffffffc0205158 <files_create+0x2c>
ffffffffc020513c:	03050793          	addi	a5,a0,48 # 1030 <_binary_bin_swap_img_size-0x6cd0>
ffffffffc0205140:	00043023          	sd	zero,0(s0)
ffffffffc0205144:	0561                	addi	a0,a0,24
ffffffffc0205146:	e41c                	sd	a5,8(s0)
ffffffffc0205148:	00042823          	sw	zero,16(s0)
ffffffffc020514c:	4585                	li	a1,1
ffffffffc020514e:	b6aff0ef          	jal	ra,ffffffffc02044b8 <sem_init>
ffffffffc0205152:	6408                	ld	a0,8(s0)
ffffffffc0205154:	f3cff0ef          	jal	ra,ffffffffc0204890 <fd_array_init>
ffffffffc0205158:	60a2                	ld	ra,8(sp)
ffffffffc020515a:	8522                	mv	a0,s0
ffffffffc020515c:	6402                	ld	s0,0(sp)
ffffffffc020515e:	0141                	addi	sp,sp,16
ffffffffc0205160:	8082                	ret

ffffffffc0205162 <files_destroy>:
ffffffffc0205162:	7179                	addi	sp,sp,-48
ffffffffc0205164:	f406                	sd	ra,40(sp)
ffffffffc0205166:	f022                	sd	s0,32(sp)
ffffffffc0205168:	ec26                	sd	s1,24(sp)
ffffffffc020516a:	e84a                	sd	s2,16(sp)
ffffffffc020516c:	e44e                	sd	s3,8(sp)
ffffffffc020516e:	c52d                	beqz	a0,ffffffffc02051d8 <files_destroy+0x76>
ffffffffc0205170:	491c                	lw	a5,16(a0)
ffffffffc0205172:	89aa                	mv	s3,a0
ffffffffc0205174:	e3b5                	bnez	a5,ffffffffc02051d8 <files_destroy+0x76>
ffffffffc0205176:	6108                	ld	a0,0(a0)
ffffffffc0205178:	c119                	beqz	a0,ffffffffc020517e <files_destroy+0x1c>
ffffffffc020517a:	6ec020ef          	jal	ra,ffffffffc0207866 <inode_ref_dec>
ffffffffc020517e:	0089b403          	ld	s0,8(s3)
ffffffffc0205182:	6485                	lui	s1,0x1
ffffffffc0205184:	fc048493          	addi	s1,s1,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc0205188:	94a2                	add	s1,s1,s0
ffffffffc020518a:	4909                	li	s2,2
ffffffffc020518c:	401c                	lw	a5,0(s0)
ffffffffc020518e:	03278063          	beq	a5,s2,ffffffffc02051ae <files_destroy+0x4c>
ffffffffc0205192:	e39d                	bnez	a5,ffffffffc02051b8 <files_destroy+0x56>
ffffffffc0205194:	03840413          	addi	s0,s0,56
ffffffffc0205198:	fe849ae3          	bne	s1,s0,ffffffffc020518c <files_destroy+0x2a>
ffffffffc020519c:	7402                	ld	s0,32(sp)
ffffffffc020519e:	70a2                	ld	ra,40(sp)
ffffffffc02051a0:	64e2                	ld	s1,24(sp)
ffffffffc02051a2:	6942                	ld	s2,16(sp)
ffffffffc02051a4:	854e                	mv	a0,s3
ffffffffc02051a6:	69a2                	ld	s3,8(sp)
ffffffffc02051a8:	6145                	addi	sp,sp,48
ffffffffc02051aa:	e95fc06f          	j	ffffffffc020203e <kfree>
ffffffffc02051ae:	8522                	mv	a0,s0
ffffffffc02051b0:	efcff0ef          	jal	ra,ffffffffc02048ac <fd_array_close>
ffffffffc02051b4:	401c                	lw	a5,0(s0)
ffffffffc02051b6:	bff1                	j	ffffffffc0205192 <files_destroy+0x30>
ffffffffc02051b8:	00008697          	auipc	a3,0x8
ffffffffc02051bc:	16868693          	addi	a3,a3,360 # ffffffffc020d320 <CSWTCH.79+0x58>
ffffffffc02051c0:	00006617          	auipc	a2,0x6
ffffffffc02051c4:	70860613          	addi	a2,a2,1800 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02051c8:	03d00593          	li	a1,61
ffffffffc02051cc:	00008517          	auipc	a0,0x8
ffffffffc02051d0:	14450513          	addi	a0,a0,324 # ffffffffc020d310 <CSWTCH.79+0x48>
ffffffffc02051d4:	acafb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02051d8:	00008697          	auipc	a3,0x8
ffffffffc02051dc:	10868693          	addi	a3,a3,264 # ffffffffc020d2e0 <CSWTCH.79+0x18>
ffffffffc02051e0:	00006617          	auipc	a2,0x6
ffffffffc02051e4:	6e860613          	addi	a2,a2,1768 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02051e8:	03300593          	li	a1,51
ffffffffc02051ec:	00008517          	auipc	a0,0x8
ffffffffc02051f0:	12450513          	addi	a0,a0,292 # ffffffffc020d310 <CSWTCH.79+0x48>
ffffffffc02051f4:	aaafb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02051f8 <files_closeall>:
ffffffffc02051f8:	1101                	addi	sp,sp,-32
ffffffffc02051fa:	ec06                	sd	ra,24(sp)
ffffffffc02051fc:	e822                	sd	s0,16(sp)
ffffffffc02051fe:	e426                	sd	s1,8(sp)
ffffffffc0205200:	e04a                	sd	s2,0(sp)
ffffffffc0205202:	c129                	beqz	a0,ffffffffc0205244 <files_closeall+0x4c>
ffffffffc0205204:	491c                	lw	a5,16(a0)
ffffffffc0205206:	02f05f63          	blez	a5,ffffffffc0205244 <files_closeall+0x4c>
ffffffffc020520a:	6504                	ld	s1,8(a0)
ffffffffc020520c:	6785                	lui	a5,0x1
ffffffffc020520e:	fc078793          	addi	a5,a5,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc0205212:	07048413          	addi	s0,s1,112
ffffffffc0205216:	4909                	li	s2,2
ffffffffc0205218:	94be                	add	s1,s1,a5
ffffffffc020521a:	a029                	j	ffffffffc0205224 <files_closeall+0x2c>
ffffffffc020521c:	03840413          	addi	s0,s0,56
ffffffffc0205220:	00848c63          	beq	s1,s0,ffffffffc0205238 <files_closeall+0x40>
ffffffffc0205224:	401c                	lw	a5,0(s0)
ffffffffc0205226:	ff279be3          	bne	a5,s2,ffffffffc020521c <files_closeall+0x24>
ffffffffc020522a:	8522                	mv	a0,s0
ffffffffc020522c:	03840413          	addi	s0,s0,56
ffffffffc0205230:	e7cff0ef          	jal	ra,ffffffffc02048ac <fd_array_close>
ffffffffc0205234:	fe8498e3          	bne	s1,s0,ffffffffc0205224 <files_closeall+0x2c>
ffffffffc0205238:	60e2                	ld	ra,24(sp)
ffffffffc020523a:	6442                	ld	s0,16(sp)
ffffffffc020523c:	64a2                	ld	s1,8(sp)
ffffffffc020523e:	6902                	ld	s2,0(sp)
ffffffffc0205240:	6105                	addi	sp,sp,32
ffffffffc0205242:	8082                	ret
ffffffffc0205244:	00008697          	auipc	a3,0x8
ffffffffc0205248:	ce468693          	addi	a3,a3,-796 # ffffffffc020cf28 <default_pmm_manager+0xb78>
ffffffffc020524c:	00006617          	auipc	a2,0x6
ffffffffc0205250:	67c60613          	addi	a2,a2,1660 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0205254:	04500593          	li	a1,69
ffffffffc0205258:	00008517          	auipc	a0,0x8
ffffffffc020525c:	0b850513          	addi	a0,a0,184 # ffffffffc020d310 <CSWTCH.79+0x48>
ffffffffc0205260:	a3efb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205264 <dup_files>:
ffffffffc0205264:	7179                	addi	sp,sp,-48
ffffffffc0205266:	f406                	sd	ra,40(sp)
ffffffffc0205268:	f022                	sd	s0,32(sp)
ffffffffc020526a:	ec26                	sd	s1,24(sp)
ffffffffc020526c:	e84a                	sd	s2,16(sp)
ffffffffc020526e:	e44e                	sd	s3,8(sp)
ffffffffc0205270:	e052                	sd	s4,0(sp)
ffffffffc0205272:	c52d                	beqz	a0,ffffffffc02052dc <dup_files+0x78>
ffffffffc0205274:	842e                	mv	s0,a1
ffffffffc0205276:	c1bd                	beqz	a1,ffffffffc02052dc <dup_files+0x78>
ffffffffc0205278:	491c                	lw	a5,16(a0)
ffffffffc020527a:	84aa                	mv	s1,a0
ffffffffc020527c:	e3c1                	bnez	a5,ffffffffc02052fc <dup_files+0x98>
ffffffffc020527e:	499c                	lw	a5,16(a1)
ffffffffc0205280:	06f05e63          	blez	a5,ffffffffc02052fc <dup_files+0x98>
ffffffffc0205284:	6188                	ld	a0,0(a1)
ffffffffc0205286:	e088                	sd	a0,0(s1)
ffffffffc0205288:	c119                	beqz	a0,ffffffffc020528e <dup_files+0x2a>
ffffffffc020528a:	50e020ef          	jal	ra,ffffffffc0207798 <inode_ref_inc>
ffffffffc020528e:	6400                	ld	s0,8(s0)
ffffffffc0205290:	6905                	lui	s2,0x1
ffffffffc0205292:	fc090913          	addi	s2,s2,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc0205296:	6484                	ld	s1,8(s1)
ffffffffc0205298:	9922                	add	s2,s2,s0
ffffffffc020529a:	4989                	li	s3,2
ffffffffc020529c:	4a05                	li	s4,1
ffffffffc020529e:	a039                	j	ffffffffc02052ac <dup_files+0x48>
ffffffffc02052a0:	03840413          	addi	s0,s0,56
ffffffffc02052a4:	03848493          	addi	s1,s1,56
ffffffffc02052a8:	02890163          	beq	s2,s0,ffffffffc02052ca <dup_files+0x66>
ffffffffc02052ac:	401c                	lw	a5,0(s0)
ffffffffc02052ae:	ff3799e3          	bne	a5,s3,ffffffffc02052a0 <dup_files+0x3c>
ffffffffc02052b2:	0144a023          	sw	s4,0(s1)
ffffffffc02052b6:	85a2                	mv	a1,s0
ffffffffc02052b8:	8526                	mv	a0,s1
ffffffffc02052ba:	03840413          	addi	s0,s0,56
ffffffffc02052be:	e6cff0ef          	jal	ra,ffffffffc020492a <fd_array_dup>
ffffffffc02052c2:	03848493          	addi	s1,s1,56
ffffffffc02052c6:	fe8913e3          	bne	s2,s0,ffffffffc02052ac <dup_files+0x48>
ffffffffc02052ca:	70a2                	ld	ra,40(sp)
ffffffffc02052cc:	7402                	ld	s0,32(sp)
ffffffffc02052ce:	64e2                	ld	s1,24(sp)
ffffffffc02052d0:	6942                	ld	s2,16(sp)
ffffffffc02052d2:	69a2                	ld	s3,8(sp)
ffffffffc02052d4:	6a02                	ld	s4,0(sp)
ffffffffc02052d6:	4501                	li	a0,0
ffffffffc02052d8:	6145                	addi	sp,sp,48
ffffffffc02052da:	8082                	ret
ffffffffc02052dc:	00008697          	auipc	a3,0x8
ffffffffc02052e0:	99c68693          	addi	a3,a3,-1636 # ffffffffc020cc78 <default_pmm_manager+0x8c8>
ffffffffc02052e4:	00006617          	auipc	a2,0x6
ffffffffc02052e8:	5e460613          	addi	a2,a2,1508 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02052ec:	05300593          	li	a1,83
ffffffffc02052f0:	00008517          	auipc	a0,0x8
ffffffffc02052f4:	02050513          	addi	a0,a0,32 # ffffffffc020d310 <CSWTCH.79+0x48>
ffffffffc02052f8:	9a6fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02052fc:	00008697          	auipc	a3,0x8
ffffffffc0205300:	03c68693          	addi	a3,a3,60 # ffffffffc020d338 <CSWTCH.79+0x70>
ffffffffc0205304:	00006617          	auipc	a2,0x6
ffffffffc0205308:	5c460613          	addi	a2,a2,1476 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020530c:	05400593          	li	a1,84
ffffffffc0205310:	00008517          	auipc	a0,0x8
ffffffffc0205314:	00050513          	mv	a0,a0
ffffffffc0205318:	986fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020531c <iobuf_skip.part.0>:
ffffffffc020531c:	1141                	addi	sp,sp,-16
ffffffffc020531e:	00008697          	auipc	a3,0x8
ffffffffc0205322:	04a68693          	addi	a3,a3,74 # ffffffffc020d368 <CSWTCH.79+0xa0>
ffffffffc0205326:	00006617          	auipc	a2,0x6
ffffffffc020532a:	5a260613          	addi	a2,a2,1442 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020532e:	04a00593          	li	a1,74
ffffffffc0205332:	00008517          	auipc	a0,0x8
ffffffffc0205336:	04e50513          	addi	a0,a0,78 # ffffffffc020d380 <CSWTCH.79+0xb8>
ffffffffc020533a:	e406                	sd	ra,8(sp)
ffffffffc020533c:	962fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205340 <iobuf_init>:
ffffffffc0205340:	e10c                	sd	a1,0(a0)
ffffffffc0205342:	e514                	sd	a3,8(a0)
ffffffffc0205344:	ed10                	sd	a2,24(a0)
ffffffffc0205346:	e910                	sd	a2,16(a0)
ffffffffc0205348:	8082                	ret

ffffffffc020534a <iobuf_move>:
ffffffffc020534a:	7179                	addi	sp,sp,-48
ffffffffc020534c:	ec26                	sd	s1,24(sp)
ffffffffc020534e:	6d04                	ld	s1,24(a0)
ffffffffc0205350:	f022                	sd	s0,32(sp)
ffffffffc0205352:	e84a                	sd	s2,16(sp)
ffffffffc0205354:	e44e                	sd	s3,8(sp)
ffffffffc0205356:	f406                	sd	ra,40(sp)
ffffffffc0205358:	842a                	mv	s0,a0
ffffffffc020535a:	8932                	mv	s2,a2
ffffffffc020535c:	852e                	mv	a0,a1
ffffffffc020535e:	89ba                	mv	s3,a4
ffffffffc0205360:	00967363          	bgeu	a2,s1,ffffffffc0205366 <iobuf_move+0x1c>
ffffffffc0205364:	84b2                	mv	s1,a2
ffffffffc0205366:	c495                	beqz	s1,ffffffffc0205392 <iobuf_move+0x48>
ffffffffc0205368:	600c                	ld	a1,0(s0)
ffffffffc020536a:	c681                	beqz	a3,ffffffffc0205372 <iobuf_move+0x28>
ffffffffc020536c:	87ae                	mv	a5,a1
ffffffffc020536e:	85aa                	mv	a1,a0
ffffffffc0205370:	853e                	mv	a0,a5
ffffffffc0205372:	8626                	mv	a2,s1
ffffffffc0205374:	07e060ef          	jal	ra,ffffffffc020b3f2 <memmove>
ffffffffc0205378:	6c1c                	ld	a5,24(s0)
ffffffffc020537a:	0297ea63          	bltu	a5,s1,ffffffffc02053ae <iobuf_move+0x64>
ffffffffc020537e:	6014                	ld	a3,0(s0)
ffffffffc0205380:	6418                	ld	a4,8(s0)
ffffffffc0205382:	8f85                	sub	a5,a5,s1
ffffffffc0205384:	96a6                	add	a3,a3,s1
ffffffffc0205386:	9726                	add	a4,a4,s1
ffffffffc0205388:	e014                	sd	a3,0(s0)
ffffffffc020538a:	e418                	sd	a4,8(s0)
ffffffffc020538c:	ec1c                	sd	a5,24(s0)
ffffffffc020538e:	40990933          	sub	s2,s2,s1
ffffffffc0205392:	00098463          	beqz	s3,ffffffffc020539a <iobuf_move+0x50>
ffffffffc0205396:	0099b023          	sd	s1,0(s3)
ffffffffc020539a:	4501                	li	a0,0
ffffffffc020539c:	00091b63          	bnez	s2,ffffffffc02053b2 <iobuf_move+0x68>
ffffffffc02053a0:	70a2                	ld	ra,40(sp)
ffffffffc02053a2:	7402                	ld	s0,32(sp)
ffffffffc02053a4:	64e2                	ld	s1,24(sp)
ffffffffc02053a6:	6942                	ld	s2,16(sp)
ffffffffc02053a8:	69a2                	ld	s3,8(sp)
ffffffffc02053aa:	6145                	addi	sp,sp,48
ffffffffc02053ac:	8082                	ret
ffffffffc02053ae:	f6fff0ef          	jal	ra,ffffffffc020531c <iobuf_skip.part.0>
ffffffffc02053b2:	5571                	li	a0,-4
ffffffffc02053b4:	b7f5                	j	ffffffffc02053a0 <iobuf_move+0x56>

ffffffffc02053b6 <iobuf_skip>:
ffffffffc02053b6:	6d1c                	ld	a5,24(a0)
ffffffffc02053b8:	00b7eb63          	bltu	a5,a1,ffffffffc02053ce <iobuf_skip+0x18>
ffffffffc02053bc:	6114                	ld	a3,0(a0)
ffffffffc02053be:	6518                	ld	a4,8(a0)
ffffffffc02053c0:	8f8d                	sub	a5,a5,a1
ffffffffc02053c2:	96ae                	add	a3,a3,a1
ffffffffc02053c4:	95ba                	add	a1,a1,a4
ffffffffc02053c6:	e114                	sd	a3,0(a0)
ffffffffc02053c8:	e50c                	sd	a1,8(a0)
ffffffffc02053ca:	ed1c                	sd	a5,24(a0)
ffffffffc02053cc:	8082                	ret
ffffffffc02053ce:	1141                	addi	sp,sp,-16
ffffffffc02053d0:	e406                	sd	ra,8(sp)
ffffffffc02053d2:	f4bff0ef          	jal	ra,ffffffffc020531c <iobuf_skip.part.0>

ffffffffc02053d6 <copy_path>:
ffffffffc02053d6:	7139                	addi	sp,sp,-64
ffffffffc02053d8:	f04a                	sd	s2,32(sp)
ffffffffc02053da:	00091917          	auipc	s2,0x91
ffffffffc02053de:	4e690913          	addi	s2,s2,1254 # ffffffffc02968c0 <current>
ffffffffc02053e2:	00093703          	ld	a4,0(s2)
ffffffffc02053e6:	ec4e                	sd	s3,24(sp)
ffffffffc02053e8:	89aa                	mv	s3,a0
ffffffffc02053ea:	6505                	lui	a0,0x1
ffffffffc02053ec:	f426                	sd	s1,40(sp)
ffffffffc02053ee:	e852                	sd	s4,16(sp)
ffffffffc02053f0:	fc06                	sd	ra,56(sp)
ffffffffc02053f2:	f822                	sd	s0,48(sp)
ffffffffc02053f4:	e456                	sd	s5,8(sp)
ffffffffc02053f6:	02873a03          	ld	s4,40(a4)
ffffffffc02053fa:	84ae                	mv	s1,a1
ffffffffc02053fc:	b93fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0205400:	c141                	beqz	a0,ffffffffc0205480 <copy_path+0xaa>
ffffffffc0205402:	842a                	mv	s0,a0
ffffffffc0205404:	040a0563          	beqz	s4,ffffffffc020544e <copy_path+0x78>
ffffffffc0205408:	038a0a93          	addi	s5,s4,56
ffffffffc020540c:	8556                	mv	a0,s5
ffffffffc020540e:	8b4ff0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0205412:	00093783          	ld	a5,0(s2)
ffffffffc0205416:	cba1                	beqz	a5,ffffffffc0205466 <copy_path+0x90>
ffffffffc0205418:	43dc                	lw	a5,4(a5)
ffffffffc020541a:	6685                	lui	a3,0x1
ffffffffc020541c:	8626                	mv	a2,s1
ffffffffc020541e:	04fa2823          	sw	a5,80(s4)
ffffffffc0205422:	85a2                	mv	a1,s0
ffffffffc0205424:	8552                	mv	a0,s4
ffffffffc0205426:	ec5fe0ef          	jal	ra,ffffffffc02042ea <copy_string>
ffffffffc020542a:	c529                	beqz	a0,ffffffffc0205474 <copy_path+0x9e>
ffffffffc020542c:	8556                	mv	a0,s5
ffffffffc020542e:	890ff0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0205432:	040a2823          	sw	zero,80(s4)
ffffffffc0205436:	0089b023          	sd	s0,0(s3)
ffffffffc020543a:	4501                	li	a0,0
ffffffffc020543c:	70e2                	ld	ra,56(sp)
ffffffffc020543e:	7442                	ld	s0,48(sp)
ffffffffc0205440:	74a2                	ld	s1,40(sp)
ffffffffc0205442:	7902                	ld	s2,32(sp)
ffffffffc0205444:	69e2                	ld	s3,24(sp)
ffffffffc0205446:	6a42                	ld	s4,16(sp)
ffffffffc0205448:	6aa2                	ld	s5,8(sp)
ffffffffc020544a:	6121                	addi	sp,sp,64
ffffffffc020544c:	8082                	ret
ffffffffc020544e:	85aa                	mv	a1,a0
ffffffffc0205450:	6685                	lui	a3,0x1
ffffffffc0205452:	8626                	mv	a2,s1
ffffffffc0205454:	4501                	li	a0,0
ffffffffc0205456:	e95fe0ef          	jal	ra,ffffffffc02042ea <copy_string>
ffffffffc020545a:	fd71                	bnez	a0,ffffffffc0205436 <copy_path+0x60>
ffffffffc020545c:	8522                	mv	a0,s0
ffffffffc020545e:	be1fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205462:	5575                	li	a0,-3
ffffffffc0205464:	bfe1                	j	ffffffffc020543c <copy_path+0x66>
ffffffffc0205466:	6685                	lui	a3,0x1
ffffffffc0205468:	8626                	mv	a2,s1
ffffffffc020546a:	85a2                	mv	a1,s0
ffffffffc020546c:	8552                	mv	a0,s4
ffffffffc020546e:	e7dfe0ef          	jal	ra,ffffffffc02042ea <copy_string>
ffffffffc0205472:	fd4d                	bnez	a0,ffffffffc020542c <copy_path+0x56>
ffffffffc0205474:	8556                	mv	a0,s5
ffffffffc0205476:	848ff0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020547a:	040a2823          	sw	zero,80(s4)
ffffffffc020547e:	bff9                	j	ffffffffc020545c <copy_path+0x86>
ffffffffc0205480:	5571                	li	a0,-4
ffffffffc0205482:	bf6d                	j	ffffffffc020543c <copy_path+0x66>

ffffffffc0205484 <sysfile_open>:
ffffffffc0205484:	7179                	addi	sp,sp,-48
ffffffffc0205486:	872a                	mv	a4,a0
ffffffffc0205488:	ec26                	sd	s1,24(sp)
ffffffffc020548a:	0028                	addi	a0,sp,8
ffffffffc020548c:	84ae                	mv	s1,a1
ffffffffc020548e:	85ba                	mv	a1,a4
ffffffffc0205490:	f022                	sd	s0,32(sp)
ffffffffc0205492:	f406                	sd	ra,40(sp)
ffffffffc0205494:	f43ff0ef          	jal	ra,ffffffffc02053d6 <copy_path>
ffffffffc0205498:	842a                	mv	s0,a0
ffffffffc020549a:	e909                	bnez	a0,ffffffffc02054ac <sysfile_open+0x28>
ffffffffc020549c:	6522                	ld	a0,8(sp)
ffffffffc020549e:	85a6                	mv	a1,s1
ffffffffc02054a0:	d60ff0ef          	jal	ra,ffffffffc0204a00 <file_open>
ffffffffc02054a4:	842a                	mv	s0,a0
ffffffffc02054a6:	6522                	ld	a0,8(sp)
ffffffffc02054a8:	b97fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02054ac:	70a2                	ld	ra,40(sp)
ffffffffc02054ae:	8522                	mv	a0,s0
ffffffffc02054b0:	7402                	ld	s0,32(sp)
ffffffffc02054b2:	64e2                	ld	s1,24(sp)
ffffffffc02054b4:	6145                	addi	sp,sp,48
ffffffffc02054b6:	8082                	ret

ffffffffc02054b8 <sysfile_close>:
ffffffffc02054b8:	e46ff06f          	j	ffffffffc0204afe <file_close>

ffffffffc02054bc <sysfile_read>:
ffffffffc02054bc:	7159                	addi	sp,sp,-112
ffffffffc02054be:	f0a2                	sd	s0,96(sp)
ffffffffc02054c0:	f486                	sd	ra,104(sp)
ffffffffc02054c2:	eca6                	sd	s1,88(sp)
ffffffffc02054c4:	e8ca                	sd	s2,80(sp)
ffffffffc02054c6:	e4ce                	sd	s3,72(sp)
ffffffffc02054c8:	e0d2                	sd	s4,64(sp)
ffffffffc02054ca:	fc56                	sd	s5,56(sp)
ffffffffc02054cc:	f85a                	sd	s6,48(sp)
ffffffffc02054ce:	f45e                	sd	s7,40(sp)
ffffffffc02054d0:	f062                	sd	s8,32(sp)
ffffffffc02054d2:	ec66                	sd	s9,24(sp)
ffffffffc02054d4:	4401                	li	s0,0
ffffffffc02054d6:	ee19                	bnez	a2,ffffffffc02054f4 <sysfile_read+0x38>
ffffffffc02054d8:	70a6                	ld	ra,104(sp)
ffffffffc02054da:	8522                	mv	a0,s0
ffffffffc02054dc:	7406                	ld	s0,96(sp)
ffffffffc02054de:	64e6                	ld	s1,88(sp)
ffffffffc02054e0:	6946                	ld	s2,80(sp)
ffffffffc02054e2:	69a6                	ld	s3,72(sp)
ffffffffc02054e4:	6a06                	ld	s4,64(sp)
ffffffffc02054e6:	7ae2                	ld	s5,56(sp)
ffffffffc02054e8:	7b42                	ld	s6,48(sp)
ffffffffc02054ea:	7ba2                	ld	s7,40(sp)
ffffffffc02054ec:	7c02                	ld	s8,32(sp)
ffffffffc02054ee:	6ce2                	ld	s9,24(sp)
ffffffffc02054f0:	6165                	addi	sp,sp,112
ffffffffc02054f2:	8082                	ret
ffffffffc02054f4:	00091c97          	auipc	s9,0x91
ffffffffc02054f8:	3ccc8c93          	addi	s9,s9,972 # ffffffffc02968c0 <current>
ffffffffc02054fc:	000cb783          	ld	a5,0(s9)
ffffffffc0205500:	84b2                	mv	s1,a2
ffffffffc0205502:	8b2e                	mv	s6,a1
ffffffffc0205504:	4601                	li	a2,0
ffffffffc0205506:	4585                	li	a1,1
ffffffffc0205508:	0287b903          	ld	s2,40(a5)
ffffffffc020550c:	8aaa                	mv	s5,a0
ffffffffc020550e:	c9eff0ef          	jal	ra,ffffffffc02049ac <file_testfd>
ffffffffc0205512:	c959                	beqz	a0,ffffffffc02055a8 <sysfile_read+0xec>
ffffffffc0205514:	6505                	lui	a0,0x1
ffffffffc0205516:	a79fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020551a:	89aa                	mv	s3,a0
ffffffffc020551c:	c941                	beqz	a0,ffffffffc02055ac <sysfile_read+0xf0>
ffffffffc020551e:	4b81                	li	s7,0
ffffffffc0205520:	6a05                	lui	s4,0x1
ffffffffc0205522:	03890c13          	addi	s8,s2,56
ffffffffc0205526:	0744ec63          	bltu	s1,s4,ffffffffc020559e <sysfile_read+0xe2>
ffffffffc020552a:	e452                	sd	s4,8(sp)
ffffffffc020552c:	6605                	lui	a2,0x1
ffffffffc020552e:	0034                	addi	a3,sp,8
ffffffffc0205530:	85ce                	mv	a1,s3
ffffffffc0205532:	8556                	mv	a0,s5
ffffffffc0205534:	e20ff0ef          	jal	ra,ffffffffc0204b54 <file_read>
ffffffffc0205538:	66a2                	ld	a3,8(sp)
ffffffffc020553a:	842a                	mv	s0,a0
ffffffffc020553c:	ca9d                	beqz	a3,ffffffffc0205572 <sysfile_read+0xb6>
ffffffffc020553e:	00090c63          	beqz	s2,ffffffffc0205556 <sysfile_read+0x9a>
ffffffffc0205542:	8562                	mv	a0,s8
ffffffffc0205544:	f7ffe0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0205548:	000cb783          	ld	a5,0(s9)
ffffffffc020554c:	cfa1                	beqz	a5,ffffffffc02055a4 <sysfile_read+0xe8>
ffffffffc020554e:	43dc                	lw	a5,4(a5)
ffffffffc0205550:	66a2                	ld	a3,8(sp)
ffffffffc0205552:	04f92823          	sw	a5,80(s2)
ffffffffc0205556:	864e                	mv	a2,s3
ffffffffc0205558:	85da                	mv	a1,s6
ffffffffc020555a:	854a                	mv	a0,s2
ffffffffc020555c:	d5dfe0ef          	jal	ra,ffffffffc02042b8 <copy_to_user>
ffffffffc0205560:	c50d                	beqz	a0,ffffffffc020558a <sysfile_read+0xce>
ffffffffc0205562:	67a2                	ld	a5,8(sp)
ffffffffc0205564:	04f4e663          	bltu	s1,a5,ffffffffc02055b0 <sysfile_read+0xf4>
ffffffffc0205568:	9b3e                	add	s6,s6,a5
ffffffffc020556a:	8c9d                	sub	s1,s1,a5
ffffffffc020556c:	9bbe                	add	s7,s7,a5
ffffffffc020556e:	02091263          	bnez	s2,ffffffffc0205592 <sysfile_read+0xd6>
ffffffffc0205572:	e401                	bnez	s0,ffffffffc020557a <sysfile_read+0xbe>
ffffffffc0205574:	67a2                	ld	a5,8(sp)
ffffffffc0205576:	c391                	beqz	a5,ffffffffc020557a <sysfile_read+0xbe>
ffffffffc0205578:	f4dd                	bnez	s1,ffffffffc0205526 <sysfile_read+0x6a>
ffffffffc020557a:	854e                	mv	a0,s3
ffffffffc020557c:	ac3fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205580:	f40b8ce3          	beqz	s7,ffffffffc02054d8 <sysfile_read+0x1c>
ffffffffc0205584:	000b841b          	sext.w	s0,s7
ffffffffc0205588:	bf81                	j	ffffffffc02054d8 <sysfile_read+0x1c>
ffffffffc020558a:	e011                	bnez	s0,ffffffffc020558e <sysfile_read+0xd2>
ffffffffc020558c:	5475                	li	s0,-3
ffffffffc020558e:	fe0906e3          	beqz	s2,ffffffffc020557a <sysfile_read+0xbe>
ffffffffc0205592:	8562                	mv	a0,s8
ffffffffc0205594:	f2bfe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0205598:	04092823          	sw	zero,80(s2)
ffffffffc020559c:	bfd9                	j	ffffffffc0205572 <sysfile_read+0xb6>
ffffffffc020559e:	e426                	sd	s1,8(sp)
ffffffffc02055a0:	8626                	mv	a2,s1
ffffffffc02055a2:	b771                	j	ffffffffc020552e <sysfile_read+0x72>
ffffffffc02055a4:	66a2                	ld	a3,8(sp)
ffffffffc02055a6:	bf45                	j	ffffffffc0205556 <sysfile_read+0x9a>
ffffffffc02055a8:	5475                	li	s0,-3
ffffffffc02055aa:	b73d                	j	ffffffffc02054d8 <sysfile_read+0x1c>
ffffffffc02055ac:	5471                	li	s0,-4
ffffffffc02055ae:	b72d                	j	ffffffffc02054d8 <sysfile_read+0x1c>
ffffffffc02055b0:	00008697          	auipc	a3,0x8
ffffffffc02055b4:	de068693          	addi	a3,a3,-544 # ffffffffc020d390 <CSWTCH.79+0xc8>
ffffffffc02055b8:	00006617          	auipc	a2,0x6
ffffffffc02055bc:	31060613          	addi	a2,a2,784 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02055c0:	05500593          	li	a1,85
ffffffffc02055c4:	00008517          	auipc	a0,0x8
ffffffffc02055c8:	ddc50513          	addi	a0,a0,-548 # ffffffffc020d3a0 <CSWTCH.79+0xd8>
ffffffffc02055cc:	ed3fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02055d0 <sysfile_write>:
ffffffffc02055d0:	7159                	addi	sp,sp,-112
ffffffffc02055d2:	e8ca                	sd	s2,80(sp)
ffffffffc02055d4:	f486                	sd	ra,104(sp)
ffffffffc02055d6:	f0a2                	sd	s0,96(sp)
ffffffffc02055d8:	eca6                	sd	s1,88(sp)
ffffffffc02055da:	e4ce                	sd	s3,72(sp)
ffffffffc02055dc:	e0d2                	sd	s4,64(sp)
ffffffffc02055de:	fc56                	sd	s5,56(sp)
ffffffffc02055e0:	f85a                	sd	s6,48(sp)
ffffffffc02055e2:	f45e                	sd	s7,40(sp)
ffffffffc02055e4:	f062                	sd	s8,32(sp)
ffffffffc02055e6:	ec66                	sd	s9,24(sp)
ffffffffc02055e8:	4901                	li	s2,0
ffffffffc02055ea:	ee19                	bnez	a2,ffffffffc0205608 <sysfile_write+0x38>
ffffffffc02055ec:	70a6                	ld	ra,104(sp)
ffffffffc02055ee:	7406                	ld	s0,96(sp)
ffffffffc02055f0:	64e6                	ld	s1,88(sp)
ffffffffc02055f2:	69a6                	ld	s3,72(sp)
ffffffffc02055f4:	6a06                	ld	s4,64(sp)
ffffffffc02055f6:	7ae2                	ld	s5,56(sp)
ffffffffc02055f8:	7b42                	ld	s6,48(sp)
ffffffffc02055fa:	7ba2                	ld	s7,40(sp)
ffffffffc02055fc:	7c02                	ld	s8,32(sp)
ffffffffc02055fe:	6ce2                	ld	s9,24(sp)
ffffffffc0205600:	854a                	mv	a0,s2
ffffffffc0205602:	6946                	ld	s2,80(sp)
ffffffffc0205604:	6165                	addi	sp,sp,112
ffffffffc0205606:	8082                	ret
ffffffffc0205608:	00091c17          	auipc	s8,0x91
ffffffffc020560c:	2b8c0c13          	addi	s8,s8,696 # ffffffffc02968c0 <current>
ffffffffc0205610:	000c3783          	ld	a5,0(s8)
ffffffffc0205614:	8432                	mv	s0,a2
ffffffffc0205616:	89ae                	mv	s3,a1
ffffffffc0205618:	4605                	li	a2,1
ffffffffc020561a:	4581                	li	a1,0
ffffffffc020561c:	7784                	ld	s1,40(a5)
ffffffffc020561e:	8baa                	mv	s7,a0
ffffffffc0205620:	b8cff0ef          	jal	ra,ffffffffc02049ac <file_testfd>
ffffffffc0205624:	cd59                	beqz	a0,ffffffffc02056c2 <sysfile_write+0xf2>
ffffffffc0205626:	6505                	lui	a0,0x1
ffffffffc0205628:	967fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020562c:	8a2a                	mv	s4,a0
ffffffffc020562e:	cd41                	beqz	a0,ffffffffc02056c6 <sysfile_write+0xf6>
ffffffffc0205630:	4c81                	li	s9,0
ffffffffc0205632:	6a85                	lui	s5,0x1
ffffffffc0205634:	03848b13          	addi	s6,s1,56
ffffffffc0205638:	05546a63          	bltu	s0,s5,ffffffffc020568c <sysfile_write+0xbc>
ffffffffc020563c:	e456                	sd	s5,8(sp)
ffffffffc020563e:	c8a9                	beqz	s1,ffffffffc0205690 <sysfile_write+0xc0>
ffffffffc0205640:	855a                	mv	a0,s6
ffffffffc0205642:	e81fe0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0205646:	000c3783          	ld	a5,0(s8)
ffffffffc020564a:	c399                	beqz	a5,ffffffffc0205650 <sysfile_write+0x80>
ffffffffc020564c:	43dc                	lw	a5,4(a5)
ffffffffc020564e:	c8bc                	sw	a5,80(s1)
ffffffffc0205650:	66a2                	ld	a3,8(sp)
ffffffffc0205652:	4701                	li	a4,0
ffffffffc0205654:	864e                	mv	a2,s3
ffffffffc0205656:	85d2                	mv	a1,s4
ffffffffc0205658:	8526                	mv	a0,s1
ffffffffc020565a:	c2bfe0ef          	jal	ra,ffffffffc0204284 <copy_from_user>
ffffffffc020565e:	c139                	beqz	a0,ffffffffc02056a4 <sysfile_write+0xd4>
ffffffffc0205660:	855a                	mv	a0,s6
ffffffffc0205662:	e5dfe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0205666:	0404a823          	sw	zero,80(s1)
ffffffffc020566a:	6622                	ld	a2,8(sp)
ffffffffc020566c:	0034                	addi	a3,sp,8
ffffffffc020566e:	85d2                	mv	a1,s4
ffffffffc0205670:	855e                	mv	a0,s7
ffffffffc0205672:	dc8ff0ef          	jal	ra,ffffffffc0204c3a <file_write>
ffffffffc0205676:	67a2                	ld	a5,8(sp)
ffffffffc0205678:	892a                	mv	s2,a0
ffffffffc020567a:	ef85                	bnez	a5,ffffffffc02056b2 <sysfile_write+0xe2>
ffffffffc020567c:	8552                	mv	a0,s4
ffffffffc020567e:	9c1fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205682:	f60c85e3          	beqz	s9,ffffffffc02055ec <sysfile_write+0x1c>
ffffffffc0205686:	000c891b          	sext.w	s2,s9
ffffffffc020568a:	b78d                	j	ffffffffc02055ec <sysfile_write+0x1c>
ffffffffc020568c:	e422                	sd	s0,8(sp)
ffffffffc020568e:	f8cd                	bnez	s1,ffffffffc0205640 <sysfile_write+0x70>
ffffffffc0205690:	66a2                	ld	a3,8(sp)
ffffffffc0205692:	4701                	li	a4,0
ffffffffc0205694:	864e                	mv	a2,s3
ffffffffc0205696:	85d2                	mv	a1,s4
ffffffffc0205698:	4501                	li	a0,0
ffffffffc020569a:	bebfe0ef          	jal	ra,ffffffffc0204284 <copy_from_user>
ffffffffc020569e:	f571                	bnez	a0,ffffffffc020566a <sysfile_write+0x9a>
ffffffffc02056a0:	5975                	li	s2,-3
ffffffffc02056a2:	bfe9                	j	ffffffffc020567c <sysfile_write+0xac>
ffffffffc02056a4:	855a                	mv	a0,s6
ffffffffc02056a6:	e19fe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc02056aa:	5975                	li	s2,-3
ffffffffc02056ac:	0404a823          	sw	zero,80(s1)
ffffffffc02056b0:	b7f1                	j	ffffffffc020567c <sysfile_write+0xac>
ffffffffc02056b2:	00f46c63          	bltu	s0,a5,ffffffffc02056ca <sysfile_write+0xfa>
ffffffffc02056b6:	99be                	add	s3,s3,a5
ffffffffc02056b8:	8c1d                	sub	s0,s0,a5
ffffffffc02056ba:	9cbe                	add	s9,s9,a5
ffffffffc02056bc:	f161                	bnez	a0,ffffffffc020567c <sysfile_write+0xac>
ffffffffc02056be:	fc2d                	bnez	s0,ffffffffc0205638 <sysfile_write+0x68>
ffffffffc02056c0:	bf75                	j	ffffffffc020567c <sysfile_write+0xac>
ffffffffc02056c2:	5975                	li	s2,-3
ffffffffc02056c4:	b725                	j	ffffffffc02055ec <sysfile_write+0x1c>
ffffffffc02056c6:	5971                	li	s2,-4
ffffffffc02056c8:	b715                	j	ffffffffc02055ec <sysfile_write+0x1c>
ffffffffc02056ca:	00008697          	auipc	a3,0x8
ffffffffc02056ce:	cc668693          	addi	a3,a3,-826 # ffffffffc020d390 <CSWTCH.79+0xc8>
ffffffffc02056d2:	00006617          	auipc	a2,0x6
ffffffffc02056d6:	1f660613          	addi	a2,a2,502 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02056da:	08a00593          	li	a1,138
ffffffffc02056de:	00008517          	auipc	a0,0x8
ffffffffc02056e2:	cc250513          	addi	a0,a0,-830 # ffffffffc020d3a0 <CSWTCH.79+0xd8>
ffffffffc02056e6:	db9fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02056ea <sysfile_seek>:
ffffffffc02056ea:	e36ff06f          	j	ffffffffc0204d20 <file_seek>

ffffffffc02056ee <sysfile_fstat>:
ffffffffc02056ee:	715d                	addi	sp,sp,-80
ffffffffc02056f0:	f44e                	sd	s3,40(sp)
ffffffffc02056f2:	00091997          	auipc	s3,0x91
ffffffffc02056f6:	1ce98993          	addi	s3,s3,462 # ffffffffc02968c0 <current>
ffffffffc02056fa:	0009b703          	ld	a4,0(s3)
ffffffffc02056fe:	fc26                	sd	s1,56(sp)
ffffffffc0205700:	84ae                	mv	s1,a1
ffffffffc0205702:	858a                	mv	a1,sp
ffffffffc0205704:	e0a2                	sd	s0,64(sp)
ffffffffc0205706:	f84a                	sd	s2,48(sp)
ffffffffc0205708:	e486                	sd	ra,72(sp)
ffffffffc020570a:	02873903          	ld	s2,40(a4)
ffffffffc020570e:	f052                	sd	s4,32(sp)
ffffffffc0205710:	f30ff0ef          	jal	ra,ffffffffc0204e40 <file_fstat>
ffffffffc0205714:	842a                	mv	s0,a0
ffffffffc0205716:	e91d                	bnez	a0,ffffffffc020574c <sysfile_fstat+0x5e>
ffffffffc0205718:	04090363          	beqz	s2,ffffffffc020575e <sysfile_fstat+0x70>
ffffffffc020571c:	03890a13          	addi	s4,s2,56
ffffffffc0205720:	8552                	mv	a0,s4
ffffffffc0205722:	da1fe0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0205726:	0009b783          	ld	a5,0(s3)
ffffffffc020572a:	c3b9                	beqz	a5,ffffffffc0205770 <sysfile_fstat+0x82>
ffffffffc020572c:	43dc                	lw	a5,4(a5)
ffffffffc020572e:	02000693          	li	a3,32
ffffffffc0205732:	860a                	mv	a2,sp
ffffffffc0205734:	04f92823          	sw	a5,80(s2)
ffffffffc0205738:	85a6                	mv	a1,s1
ffffffffc020573a:	854a                	mv	a0,s2
ffffffffc020573c:	b7dfe0ef          	jal	ra,ffffffffc02042b8 <copy_to_user>
ffffffffc0205740:	c121                	beqz	a0,ffffffffc0205780 <sysfile_fstat+0x92>
ffffffffc0205742:	8552                	mv	a0,s4
ffffffffc0205744:	d7bfe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0205748:	04092823          	sw	zero,80(s2)
ffffffffc020574c:	60a6                	ld	ra,72(sp)
ffffffffc020574e:	8522                	mv	a0,s0
ffffffffc0205750:	6406                	ld	s0,64(sp)
ffffffffc0205752:	74e2                	ld	s1,56(sp)
ffffffffc0205754:	7942                	ld	s2,48(sp)
ffffffffc0205756:	79a2                	ld	s3,40(sp)
ffffffffc0205758:	7a02                	ld	s4,32(sp)
ffffffffc020575a:	6161                	addi	sp,sp,80
ffffffffc020575c:	8082                	ret
ffffffffc020575e:	02000693          	li	a3,32
ffffffffc0205762:	860a                	mv	a2,sp
ffffffffc0205764:	85a6                	mv	a1,s1
ffffffffc0205766:	b53fe0ef          	jal	ra,ffffffffc02042b8 <copy_to_user>
ffffffffc020576a:	f16d                	bnez	a0,ffffffffc020574c <sysfile_fstat+0x5e>
ffffffffc020576c:	5475                	li	s0,-3
ffffffffc020576e:	bff9                	j	ffffffffc020574c <sysfile_fstat+0x5e>
ffffffffc0205770:	02000693          	li	a3,32
ffffffffc0205774:	860a                	mv	a2,sp
ffffffffc0205776:	85a6                	mv	a1,s1
ffffffffc0205778:	854a                	mv	a0,s2
ffffffffc020577a:	b3ffe0ef          	jal	ra,ffffffffc02042b8 <copy_to_user>
ffffffffc020577e:	f171                	bnez	a0,ffffffffc0205742 <sysfile_fstat+0x54>
ffffffffc0205780:	8552                	mv	a0,s4
ffffffffc0205782:	d3dfe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0205786:	5475                	li	s0,-3
ffffffffc0205788:	04092823          	sw	zero,80(s2)
ffffffffc020578c:	b7c1                	j	ffffffffc020574c <sysfile_fstat+0x5e>

ffffffffc020578e <sysfile_fsync>:
ffffffffc020578e:	f72ff06f          	j	ffffffffc0204f00 <file_fsync>

ffffffffc0205792 <sysfile_getcwd>:
ffffffffc0205792:	715d                	addi	sp,sp,-80
ffffffffc0205794:	f44e                	sd	s3,40(sp)
ffffffffc0205796:	00091997          	auipc	s3,0x91
ffffffffc020579a:	12a98993          	addi	s3,s3,298 # ffffffffc02968c0 <current>
ffffffffc020579e:	0009b783          	ld	a5,0(s3)
ffffffffc02057a2:	f84a                	sd	s2,48(sp)
ffffffffc02057a4:	e486                	sd	ra,72(sp)
ffffffffc02057a6:	e0a2                	sd	s0,64(sp)
ffffffffc02057a8:	fc26                	sd	s1,56(sp)
ffffffffc02057aa:	f052                	sd	s4,32(sp)
ffffffffc02057ac:	0287b903          	ld	s2,40(a5)
ffffffffc02057b0:	cda9                	beqz	a1,ffffffffc020580a <sysfile_getcwd+0x78>
ffffffffc02057b2:	842e                	mv	s0,a1
ffffffffc02057b4:	84aa                	mv	s1,a0
ffffffffc02057b6:	04090363          	beqz	s2,ffffffffc02057fc <sysfile_getcwd+0x6a>
ffffffffc02057ba:	03890a13          	addi	s4,s2,56
ffffffffc02057be:	8552                	mv	a0,s4
ffffffffc02057c0:	d03fe0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc02057c4:	0009b783          	ld	a5,0(s3)
ffffffffc02057c8:	c781                	beqz	a5,ffffffffc02057d0 <sysfile_getcwd+0x3e>
ffffffffc02057ca:	43dc                	lw	a5,4(a5)
ffffffffc02057cc:	04f92823          	sw	a5,80(s2)
ffffffffc02057d0:	4685                	li	a3,1
ffffffffc02057d2:	8622                	mv	a2,s0
ffffffffc02057d4:	85a6                	mv	a1,s1
ffffffffc02057d6:	854a                	mv	a0,s2
ffffffffc02057d8:	a19fe0ef          	jal	ra,ffffffffc02041f0 <user_mem_check>
ffffffffc02057dc:	e90d                	bnez	a0,ffffffffc020580e <sysfile_getcwd+0x7c>
ffffffffc02057de:	5475                	li	s0,-3
ffffffffc02057e0:	8552                	mv	a0,s4
ffffffffc02057e2:	cddfe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc02057e6:	04092823          	sw	zero,80(s2)
ffffffffc02057ea:	60a6                	ld	ra,72(sp)
ffffffffc02057ec:	8522                	mv	a0,s0
ffffffffc02057ee:	6406                	ld	s0,64(sp)
ffffffffc02057f0:	74e2                	ld	s1,56(sp)
ffffffffc02057f2:	7942                	ld	s2,48(sp)
ffffffffc02057f4:	79a2                	ld	s3,40(sp)
ffffffffc02057f6:	7a02                	ld	s4,32(sp)
ffffffffc02057f8:	6161                	addi	sp,sp,80
ffffffffc02057fa:	8082                	ret
ffffffffc02057fc:	862e                	mv	a2,a1
ffffffffc02057fe:	4685                	li	a3,1
ffffffffc0205800:	85aa                	mv	a1,a0
ffffffffc0205802:	4501                	li	a0,0
ffffffffc0205804:	9edfe0ef          	jal	ra,ffffffffc02041f0 <user_mem_check>
ffffffffc0205808:	ed09                	bnez	a0,ffffffffc0205822 <sysfile_getcwd+0x90>
ffffffffc020580a:	5475                	li	s0,-3
ffffffffc020580c:	bff9                	j	ffffffffc02057ea <sysfile_getcwd+0x58>
ffffffffc020580e:	8622                	mv	a2,s0
ffffffffc0205810:	4681                	li	a3,0
ffffffffc0205812:	85a6                	mv	a1,s1
ffffffffc0205814:	850a                	mv	a0,sp
ffffffffc0205816:	b2bff0ef          	jal	ra,ffffffffc0205340 <iobuf_init>
ffffffffc020581a:	33d020ef          	jal	ra,ffffffffc0208356 <vfs_getcwd>
ffffffffc020581e:	842a                	mv	s0,a0
ffffffffc0205820:	b7c1                	j	ffffffffc02057e0 <sysfile_getcwd+0x4e>
ffffffffc0205822:	8622                	mv	a2,s0
ffffffffc0205824:	4681                	li	a3,0
ffffffffc0205826:	85a6                	mv	a1,s1
ffffffffc0205828:	850a                	mv	a0,sp
ffffffffc020582a:	b17ff0ef          	jal	ra,ffffffffc0205340 <iobuf_init>
ffffffffc020582e:	329020ef          	jal	ra,ffffffffc0208356 <vfs_getcwd>
ffffffffc0205832:	842a                	mv	s0,a0
ffffffffc0205834:	bf5d                	j	ffffffffc02057ea <sysfile_getcwd+0x58>

ffffffffc0205836 <sysfile_getdirentry>:
ffffffffc0205836:	7139                	addi	sp,sp,-64
ffffffffc0205838:	e852                	sd	s4,16(sp)
ffffffffc020583a:	00091a17          	auipc	s4,0x91
ffffffffc020583e:	086a0a13          	addi	s4,s4,134 # ffffffffc02968c0 <current>
ffffffffc0205842:	000a3703          	ld	a4,0(s4)
ffffffffc0205846:	ec4e                	sd	s3,24(sp)
ffffffffc0205848:	89aa                	mv	s3,a0
ffffffffc020584a:	10800513          	li	a0,264
ffffffffc020584e:	f426                	sd	s1,40(sp)
ffffffffc0205850:	f04a                	sd	s2,32(sp)
ffffffffc0205852:	fc06                	sd	ra,56(sp)
ffffffffc0205854:	f822                	sd	s0,48(sp)
ffffffffc0205856:	e456                	sd	s5,8(sp)
ffffffffc0205858:	7704                	ld	s1,40(a4)
ffffffffc020585a:	892e                	mv	s2,a1
ffffffffc020585c:	f32fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0205860:	c169                	beqz	a0,ffffffffc0205922 <sysfile_getdirentry+0xec>
ffffffffc0205862:	842a                	mv	s0,a0
ffffffffc0205864:	c8c1                	beqz	s1,ffffffffc02058f4 <sysfile_getdirentry+0xbe>
ffffffffc0205866:	03848a93          	addi	s5,s1,56
ffffffffc020586a:	8556                	mv	a0,s5
ffffffffc020586c:	c57fe0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0205870:	000a3783          	ld	a5,0(s4)
ffffffffc0205874:	c399                	beqz	a5,ffffffffc020587a <sysfile_getdirentry+0x44>
ffffffffc0205876:	43dc                	lw	a5,4(a5)
ffffffffc0205878:	c8bc                	sw	a5,80(s1)
ffffffffc020587a:	4705                	li	a4,1
ffffffffc020587c:	46a1                	li	a3,8
ffffffffc020587e:	864a                	mv	a2,s2
ffffffffc0205880:	85a2                	mv	a1,s0
ffffffffc0205882:	8526                	mv	a0,s1
ffffffffc0205884:	a01fe0ef          	jal	ra,ffffffffc0204284 <copy_from_user>
ffffffffc0205888:	e505                	bnez	a0,ffffffffc02058b0 <sysfile_getdirentry+0x7a>
ffffffffc020588a:	8556                	mv	a0,s5
ffffffffc020588c:	c33fe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0205890:	59f5                	li	s3,-3
ffffffffc0205892:	0404a823          	sw	zero,80(s1)
ffffffffc0205896:	8522                	mv	a0,s0
ffffffffc0205898:	fa6fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020589c:	70e2                	ld	ra,56(sp)
ffffffffc020589e:	7442                	ld	s0,48(sp)
ffffffffc02058a0:	74a2                	ld	s1,40(sp)
ffffffffc02058a2:	7902                	ld	s2,32(sp)
ffffffffc02058a4:	6a42                	ld	s4,16(sp)
ffffffffc02058a6:	6aa2                	ld	s5,8(sp)
ffffffffc02058a8:	854e                	mv	a0,s3
ffffffffc02058aa:	69e2                	ld	s3,24(sp)
ffffffffc02058ac:	6121                	addi	sp,sp,64
ffffffffc02058ae:	8082                	ret
ffffffffc02058b0:	8556                	mv	a0,s5
ffffffffc02058b2:	c0dfe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc02058b6:	854e                	mv	a0,s3
ffffffffc02058b8:	85a2                	mv	a1,s0
ffffffffc02058ba:	0404a823          	sw	zero,80(s1)
ffffffffc02058be:	ef0ff0ef          	jal	ra,ffffffffc0204fae <file_getdirentry>
ffffffffc02058c2:	89aa                	mv	s3,a0
ffffffffc02058c4:	f969                	bnez	a0,ffffffffc0205896 <sysfile_getdirentry+0x60>
ffffffffc02058c6:	8556                	mv	a0,s5
ffffffffc02058c8:	bfbfe0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc02058cc:	000a3783          	ld	a5,0(s4)
ffffffffc02058d0:	c399                	beqz	a5,ffffffffc02058d6 <sysfile_getdirentry+0xa0>
ffffffffc02058d2:	43dc                	lw	a5,4(a5)
ffffffffc02058d4:	c8bc                	sw	a5,80(s1)
ffffffffc02058d6:	10800693          	li	a3,264
ffffffffc02058da:	8622                	mv	a2,s0
ffffffffc02058dc:	85ca                	mv	a1,s2
ffffffffc02058de:	8526                	mv	a0,s1
ffffffffc02058e0:	9d9fe0ef          	jal	ra,ffffffffc02042b8 <copy_to_user>
ffffffffc02058e4:	e111                	bnez	a0,ffffffffc02058e8 <sysfile_getdirentry+0xb2>
ffffffffc02058e6:	59f5                	li	s3,-3
ffffffffc02058e8:	8556                	mv	a0,s5
ffffffffc02058ea:	bd5fe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc02058ee:	0404a823          	sw	zero,80(s1)
ffffffffc02058f2:	b755                	j	ffffffffc0205896 <sysfile_getdirentry+0x60>
ffffffffc02058f4:	85aa                	mv	a1,a0
ffffffffc02058f6:	4705                	li	a4,1
ffffffffc02058f8:	46a1                	li	a3,8
ffffffffc02058fa:	864a                	mv	a2,s2
ffffffffc02058fc:	4501                	li	a0,0
ffffffffc02058fe:	987fe0ef          	jal	ra,ffffffffc0204284 <copy_from_user>
ffffffffc0205902:	cd11                	beqz	a0,ffffffffc020591e <sysfile_getdirentry+0xe8>
ffffffffc0205904:	854e                	mv	a0,s3
ffffffffc0205906:	85a2                	mv	a1,s0
ffffffffc0205908:	ea6ff0ef          	jal	ra,ffffffffc0204fae <file_getdirentry>
ffffffffc020590c:	89aa                	mv	s3,a0
ffffffffc020590e:	f541                	bnez	a0,ffffffffc0205896 <sysfile_getdirentry+0x60>
ffffffffc0205910:	10800693          	li	a3,264
ffffffffc0205914:	8622                	mv	a2,s0
ffffffffc0205916:	85ca                	mv	a1,s2
ffffffffc0205918:	9a1fe0ef          	jal	ra,ffffffffc02042b8 <copy_to_user>
ffffffffc020591c:	fd2d                	bnez	a0,ffffffffc0205896 <sysfile_getdirentry+0x60>
ffffffffc020591e:	59f5                	li	s3,-3
ffffffffc0205920:	bf9d                	j	ffffffffc0205896 <sysfile_getdirentry+0x60>
ffffffffc0205922:	59f1                	li	s3,-4
ffffffffc0205924:	bfa5                	j	ffffffffc020589c <sysfile_getdirentry+0x66>

ffffffffc0205926 <sysfile_dup>:
ffffffffc0205926:	f6eff06f          	j	ffffffffc0205094 <file_dup>

ffffffffc020592a <kernel_thread_entry>:
ffffffffc020592a:	8526                	mv	a0,s1
ffffffffc020592c:	9402                	jalr	s0
ffffffffc020592e:	61c000ef          	jal	ra,ffffffffc0205f4a <do_exit>

ffffffffc0205932 <alloc_proc>:
ffffffffc0205932:	1141                	addi	sp,sp,-16
ffffffffc0205934:	15000513          	li	a0,336
ffffffffc0205938:	e022                	sd	s0,0(sp)
ffffffffc020593a:	e406                	sd	ra,8(sp)
ffffffffc020593c:	e52fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0205940:	842a                	mv	s0,a0
ffffffffc0205942:	c141                	beqz	a0,ffffffffc02059c2 <alloc_proc+0x90>
ffffffffc0205944:	57fd                	li	a5,-1
ffffffffc0205946:	1782                	slli	a5,a5,0x20
ffffffffc0205948:	e11c                	sd	a5,0(a0)
ffffffffc020594a:	07000613          	li	a2,112
ffffffffc020594e:	4581                	li	a1,0
ffffffffc0205950:	00052423          	sw	zero,8(a0)
ffffffffc0205954:	00053823          	sd	zero,16(a0)
ffffffffc0205958:	00053c23          	sd	zero,24(a0)
ffffffffc020595c:	02053023          	sd	zero,32(a0)
ffffffffc0205960:	02053423          	sd	zero,40(a0)
ffffffffc0205964:	03050513          	addi	a0,a0,48
ffffffffc0205968:	279050ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc020596c:	00091797          	auipc	a5,0x91
ffffffffc0205970:	f247b783          	ld	a5,-220(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc0205974:	f45c                	sd	a5,168(s0)
ffffffffc0205976:	0a043023          	sd	zero,160(s0)
ffffffffc020597a:	0a042823          	sw	zero,176(s0)
ffffffffc020597e:	463d                	li	a2,15
ffffffffc0205980:	4581                	li	a1,0
ffffffffc0205982:	0b440513          	addi	a0,s0,180
ffffffffc0205986:	25b050ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc020598a:	11040793          	addi	a5,s0,272
ffffffffc020598e:	0e042623          	sw	zero,236(s0)
ffffffffc0205992:	0e043c23          	sd	zero,248(s0)
ffffffffc0205996:	10043023          	sd	zero,256(s0)
ffffffffc020599a:	0e043823          	sd	zero,240(s0)
ffffffffc020599e:	10043423          	sd	zero,264(s0)
ffffffffc02059a2:	10f43c23          	sd	a5,280(s0)
ffffffffc02059a6:	10f43823          	sd	a5,272(s0)
ffffffffc02059aa:	12042023          	sw	zero,288(s0)
ffffffffc02059ae:	12043423          	sd	zero,296(s0)
ffffffffc02059b2:	12043823          	sd	zero,304(s0)
ffffffffc02059b6:	12043c23          	sd	zero,312(s0)
ffffffffc02059ba:	14043023          	sd	zero,320(s0)
ffffffffc02059be:	14043423          	sd	zero,328(s0)
ffffffffc02059c2:	60a2                	ld	ra,8(sp)
ffffffffc02059c4:	8522                	mv	a0,s0
ffffffffc02059c6:	6402                	ld	s0,0(sp)
ffffffffc02059c8:	0141                	addi	sp,sp,16
ffffffffc02059ca:	8082                	ret

ffffffffc02059cc <forkret>:
ffffffffc02059cc:	00091797          	auipc	a5,0x91
ffffffffc02059d0:	ef47b783          	ld	a5,-268(a5) # ffffffffc02968c0 <current>
ffffffffc02059d4:	73c8                	ld	a0,160(a5)
ffffffffc02059d6:	8d5fb06f          	j	ffffffffc02012aa <forkrets>

ffffffffc02059da <put_pgdir.isra.0>:
ffffffffc02059da:	1141                	addi	sp,sp,-16
ffffffffc02059dc:	e406                	sd	ra,8(sp)
ffffffffc02059de:	c02007b7          	lui	a5,0xc0200
ffffffffc02059e2:	02f56e63          	bltu	a0,a5,ffffffffc0205a1e <put_pgdir.isra.0+0x44>
ffffffffc02059e6:	00091697          	auipc	a3,0x91
ffffffffc02059ea:	ed26b683          	ld	a3,-302(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc02059ee:	8d15                	sub	a0,a0,a3
ffffffffc02059f0:	8131                	srli	a0,a0,0xc
ffffffffc02059f2:	00091797          	auipc	a5,0x91
ffffffffc02059f6:	eae7b783          	ld	a5,-338(a5) # ffffffffc02968a0 <npage>
ffffffffc02059fa:	02f57f63          	bgeu	a0,a5,ffffffffc0205a38 <put_pgdir.isra.0+0x5e>
ffffffffc02059fe:	0000a697          	auipc	a3,0xa
ffffffffc0205a02:	d2a6b683          	ld	a3,-726(a3) # ffffffffc020f728 <nbase>
ffffffffc0205a06:	60a2                	ld	ra,8(sp)
ffffffffc0205a08:	8d15                	sub	a0,a0,a3
ffffffffc0205a0a:	00091797          	auipc	a5,0x91
ffffffffc0205a0e:	e9e7b783          	ld	a5,-354(a5) # ffffffffc02968a8 <pages>
ffffffffc0205a12:	051a                	slli	a0,a0,0x6
ffffffffc0205a14:	4585                	li	a1,1
ffffffffc0205a16:	953e                	add	a0,a0,a5
ffffffffc0205a18:	0141                	addi	sp,sp,16
ffffffffc0205a1a:	f90fc06f          	j	ffffffffc02021aa <free_pages>
ffffffffc0205a1e:	86aa                	mv	a3,a0
ffffffffc0205a20:	00007617          	auipc	a2,0x7
ffffffffc0205a24:	a7060613          	addi	a2,a2,-1424 # ffffffffc020c490 <default_pmm_manager+0xe0>
ffffffffc0205a28:	07700593          	li	a1,119
ffffffffc0205a2c:	00007517          	auipc	a0,0x7
ffffffffc0205a30:	9e450513          	addi	a0,a0,-1564 # ffffffffc020c410 <default_pmm_manager+0x60>
ffffffffc0205a34:	a6bfa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205a38:	00007617          	auipc	a2,0x7
ffffffffc0205a3c:	a8060613          	addi	a2,a2,-1408 # ffffffffc020c4b8 <default_pmm_manager+0x108>
ffffffffc0205a40:	06900593          	li	a1,105
ffffffffc0205a44:	00007517          	auipc	a0,0x7
ffffffffc0205a48:	9cc50513          	addi	a0,a0,-1588 # ffffffffc020c410 <default_pmm_manager+0x60>
ffffffffc0205a4c:	a53fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205a50 <proc_run>:
ffffffffc0205a50:	7179                	addi	sp,sp,-48
ffffffffc0205a52:	ec4a                	sd	s2,24(sp)
ffffffffc0205a54:	00091917          	auipc	s2,0x91
ffffffffc0205a58:	e6c90913          	addi	s2,s2,-404 # ffffffffc02968c0 <current>
ffffffffc0205a5c:	f026                	sd	s1,32(sp)
ffffffffc0205a5e:	00093483          	ld	s1,0(s2)
ffffffffc0205a62:	f406                	sd	ra,40(sp)
ffffffffc0205a64:	e84e                	sd	s3,16(sp)
ffffffffc0205a66:	02a48a63          	beq	s1,a0,ffffffffc0205a9a <proc_run+0x4a>
ffffffffc0205a6a:	100027f3          	csrr	a5,sstatus
ffffffffc0205a6e:	8b89                	andi	a5,a5,2
ffffffffc0205a70:	4981                	li	s3,0
ffffffffc0205a72:	e3a9                	bnez	a5,ffffffffc0205ab4 <proc_run+0x64>
ffffffffc0205a74:	755c                	ld	a5,168(a0)
ffffffffc0205a76:	577d                	li	a4,-1
ffffffffc0205a78:	177e                	slli	a4,a4,0x3f
ffffffffc0205a7a:	83b1                	srli	a5,a5,0xc
ffffffffc0205a7c:	00a93023          	sd	a0,0(s2)
ffffffffc0205a80:	8fd9                	or	a5,a5,a4
ffffffffc0205a82:	18079073          	csrw	satp,a5
ffffffffc0205a86:	12000073          	sfence.vma
ffffffffc0205a8a:	03050593          	addi	a1,a0,48
ffffffffc0205a8e:	03048513          	addi	a0,s1,48
ffffffffc0205a92:	58e010ef          	jal	ra,ffffffffc0207020 <switch_to>
ffffffffc0205a96:	00099863          	bnez	s3,ffffffffc0205aa6 <proc_run+0x56>
ffffffffc0205a9a:	70a2                	ld	ra,40(sp)
ffffffffc0205a9c:	7482                	ld	s1,32(sp)
ffffffffc0205a9e:	6962                	ld	s2,24(sp)
ffffffffc0205aa0:	69c2                	ld	s3,16(sp)
ffffffffc0205aa2:	6145                	addi	sp,sp,48
ffffffffc0205aa4:	8082                	ret
ffffffffc0205aa6:	70a2                	ld	ra,40(sp)
ffffffffc0205aa8:	7482                	ld	s1,32(sp)
ffffffffc0205aaa:	6962                	ld	s2,24(sp)
ffffffffc0205aac:	69c2                	ld	s3,16(sp)
ffffffffc0205aae:	6145                	addi	sp,sp,48
ffffffffc0205ab0:	9bcfb06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0205ab4:	e42a                	sd	a0,8(sp)
ffffffffc0205ab6:	9bcfb0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0205aba:	6522                	ld	a0,8(sp)
ffffffffc0205abc:	4985                	li	s3,1
ffffffffc0205abe:	bf5d                	j	ffffffffc0205a74 <proc_run+0x24>

ffffffffc0205ac0 <do_fork>:
ffffffffc0205ac0:	7119                	addi	sp,sp,-128
ffffffffc0205ac2:	ecce                	sd	s3,88(sp)
ffffffffc0205ac4:	00091997          	auipc	s3,0x91
ffffffffc0205ac8:	e1498993          	addi	s3,s3,-492 # ffffffffc02968d8 <nr_process>
ffffffffc0205acc:	0009a703          	lw	a4,0(s3)
ffffffffc0205ad0:	fc86                	sd	ra,120(sp)
ffffffffc0205ad2:	f8a2                	sd	s0,112(sp)
ffffffffc0205ad4:	f4a6                	sd	s1,104(sp)
ffffffffc0205ad6:	f0ca                	sd	s2,96(sp)
ffffffffc0205ad8:	e8d2                	sd	s4,80(sp)
ffffffffc0205ada:	e4d6                	sd	s5,72(sp)
ffffffffc0205adc:	e0da                	sd	s6,64(sp)
ffffffffc0205ade:	fc5e                	sd	s7,56(sp)
ffffffffc0205ae0:	f862                	sd	s8,48(sp)
ffffffffc0205ae2:	f466                	sd	s9,40(sp)
ffffffffc0205ae4:	f06a                	sd	s10,32(sp)
ffffffffc0205ae6:	ec6e                	sd	s11,24(sp)
ffffffffc0205ae8:	6785                	lui	a5,0x1
ffffffffc0205aea:	32f75f63          	bge	a4,a5,ffffffffc0205e28 <do_fork+0x368>
ffffffffc0205aee:	84aa                	mv	s1,a0
ffffffffc0205af0:	892e                	mv	s2,a1
ffffffffc0205af2:	8432                	mv	s0,a2
ffffffffc0205af4:	e3fff0ef          	jal	ra,ffffffffc0205932 <alloc_proc>
ffffffffc0205af8:	8a2a                	mv	s4,a0
ffffffffc0205afa:	34050963          	beqz	a0,ffffffffc0205e4c <do_fork+0x38c>
ffffffffc0205afe:	00091b17          	auipc	s6,0x91
ffffffffc0205b02:	dc2b0b13          	addi	s6,s6,-574 # ffffffffc02968c0 <current>
ffffffffc0205b06:	000b3783          	ld	a5,0(s6)
ffffffffc0205b0a:	0ec7a703          	lw	a4,236(a5) # 10ec <_binary_bin_swap_img_size-0x6c14>
ffffffffc0205b0e:	f11c                	sd	a5,32(a0)
ffffffffc0205b10:	36071063          	bnez	a4,ffffffffc0205e70 <do_fork+0x3b0>
ffffffffc0205b14:	4509                	li	a0,2
ffffffffc0205b16:	e56fc0ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0205b1a:	30050063          	beqz	a0,ffffffffc0205e1a <do_fork+0x35a>
ffffffffc0205b1e:	00091c17          	auipc	s8,0x91
ffffffffc0205b22:	d8ac0c13          	addi	s8,s8,-630 # ffffffffc02968a8 <pages>
ffffffffc0205b26:	000c3683          	ld	a3,0(s8)
ffffffffc0205b2a:	00091d17          	auipc	s10,0x91
ffffffffc0205b2e:	d76d0d13          	addi	s10,s10,-650 # ffffffffc02968a0 <npage>
ffffffffc0205b32:	0000ab97          	auipc	s7,0xa
ffffffffc0205b36:	bf6bbb83          	ld	s7,-1034(s7) # ffffffffc020f728 <nbase>
ffffffffc0205b3a:	40d506b3          	sub	a3,a0,a3
ffffffffc0205b3e:	8699                	srai	a3,a3,0x6
ffffffffc0205b40:	5afd                	li	s5,-1
ffffffffc0205b42:	000d3783          	ld	a5,0(s10)
ffffffffc0205b46:	96de                	add	a3,a3,s7
ffffffffc0205b48:	00cada93          	srli	s5,s5,0xc
ffffffffc0205b4c:	0156f733          	and	a4,a3,s5
ffffffffc0205b50:	06b2                	slli	a3,a3,0xc
ffffffffc0205b52:	30f77363          	bgeu	a4,a5,ffffffffc0205e58 <do_fork+0x398>
ffffffffc0205b56:	000b3603          	ld	a2,0(s6)
ffffffffc0205b5a:	00091d97          	auipc	s11,0x91
ffffffffc0205b5e:	d5ed8d93          	addi	s11,s11,-674 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0205b62:	000db703          	ld	a4,0(s11)
ffffffffc0205b66:	02863c83          	ld	s9,40(a2)
ffffffffc0205b6a:	96ba                	add	a3,a3,a4
ffffffffc0205b6c:	00da3823          	sd	a3,16(s4)
ffffffffc0205b70:	020c8c63          	beqz	s9,ffffffffc0205ba8 <do_fork+0xe8>
ffffffffc0205b74:	1004f713          	andi	a4,s1,256
ffffffffc0205b78:	14070a63          	beqz	a4,ffffffffc0205ccc <do_fork+0x20c>
ffffffffc0205b7c:	030ca683          	lw	a3,48(s9)
ffffffffc0205b80:	018cb703          	ld	a4,24(s9)
ffffffffc0205b84:	c0200637          	lui	a2,0xc0200
ffffffffc0205b88:	2685                	addiw	a3,a3,1
ffffffffc0205b8a:	02dca823          	sw	a3,48(s9)
ffffffffc0205b8e:	039a3423          	sd	s9,40(s4)
ffffffffc0205b92:	2ec76f63          	bltu	a4,a2,ffffffffc0205e90 <do_fork+0x3d0>
ffffffffc0205b96:	000db783          	ld	a5,0(s11)
ffffffffc0205b9a:	000b3603          	ld	a2,0(s6)
ffffffffc0205b9e:	010a3683          	ld	a3,16(s4)
ffffffffc0205ba2:	8f1d                	sub	a4,a4,a5
ffffffffc0205ba4:	0aea3423          	sd	a4,168(s4)
ffffffffc0205ba8:	6789                	lui	a5,0x2
ffffffffc0205baa:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc0205bae:	96be                	add	a3,a3,a5
ffffffffc0205bb0:	0ada3023          	sd	a3,160(s4)
ffffffffc0205bb4:	87b6                	mv	a5,a3
ffffffffc0205bb6:	12040893          	addi	a7,s0,288
ffffffffc0205bba:	00043803          	ld	a6,0(s0)
ffffffffc0205bbe:	6408                	ld	a0,8(s0)
ffffffffc0205bc0:	680c                	ld	a1,16(s0)
ffffffffc0205bc2:	6c18                	ld	a4,24(s0)
ffffffffc0205bc4:	0107b023          	sd	a6,0(a5)
ffffffffc0205bc8:	e788                	sd	a0,8(a5)
ffffffffc0205bca:	eb8c                	sd	a1,16(a5)
ffffffffc0205bcc:	ef98                	sd	a4,24(a5)
ffffffffc0205bce:	02040413          	addi	s0,s0,32
ffffffffc0205bd2:	02078793          	addi	a5,a5,32
ffffffffc0205bd6:	ff1412e3          	bne	s0,a7,ffffffffc0205bba <do_fork+0xfa>
ffffffffc0205bda:	0406b823          	sd	zero,80(a3)
ffffffffc0205bde:	16090963          	beqz	s2,ffffffffc0205d50 <do_fork+0x290>
ffffffffc0205be2:	14863403          	ld	s0,328(a2) # ffffffffc0200148 <readline+0x96>
ffffffffc0205be6:	00000797          	auipc	a5,0x0
ffffffffc0205bea:	de678793          	addi	a5,a5,-538 # ffffffffc02059cc <forkret>
ffffffffc0205bee:	0126b823          	sd	s2,16(a3)
ffffffffc0205bf2:	02fa3823          	sd	a5,48(s4)
ffffffffc0205bf6:	02da3c23          	sd	a3,56(s4)
ffffffffc0205bfa:	2a040863          	beqz	s0,ffffffffc0205eaa <do_fork+0x3ea>
ffffffffc0205bfe:	80ad                	srli	s1,s1,0xb
ffffffffc0205c00:	8885                	andi	s1,s1,1
ffffffffc0205c02:	14048963          	beqz	s1,ffffffffc0205d54 <do_fork+0x294>
ffffffffc0205c06:	4818                	lw	a4,16(s0)
ffffffffc0205c08:	0008b597          	auipc	a1,0x8b
ffffffffc0205c0c:	45058593          	addi	a1,a1,1104 # ffffffffc0291058 <last_pid.1>
ffffffffc0205c10:	419c                	lw	a5,0(a1)
ffffffffc0205c12:	2705                	addiw	a4,a4,1
ffffffffc0205c14:	c818                	sw	a4,16(s0)
ffffffffc0205c16:	0017851b          	addiw	a0,a5,1
ffffffffc0205c1a:	148a3423          	sd	s0,328(s4)
ffffffffc0205c1e:	c188                	sw	a0,0(a1)
ffffffffc0205c20:	6789                	lui	a5,0x2
ffffffffc0205c22:	14f55963          	bge	a0,a5,ffffffffc0205d74 <do_fork+0x2b4>
ffffffffc0205c26:	0008b317          	auipc	t1,0x8b
ffffffffc0205c2a:	43630313          	addi	t1,t1,1078 # ffffffffc029105c <next_safe.0>
ffffffffc0205c2e:	00032783          	lw	a5,0(t1)
ffffffffc0205c32:	00090417          	auipc	s0,0x90
ffffffffc0205c36:	b8e40413          	addi	s0,s0,-1138 # ffffffffc02957c0 <proc_list>
ffffffffc0205c3a:	14f55463          	bge	a0,a5,ffffffffc0205d82 <do_fork+0x2c2>
ffffffffc0205c3e:	00aa2223          	sw	a0,4(s4)
ffffffffc0205c42:	45a9                	li	a1,10
ffffffffc0205c44:	2501                	sext.w	a0,a0
ffffffffc0205c46:	266050ef          	jal	ra,ffffffffc020aeac <hash32>
ffffffffc0205c4a:	02051793          	slli	a5,a0,0x20
ffffffffc0205c4e:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0205c52:	0008c797          	auipc	a5,0x8c
ffffffffc0205c56:	b6e78793          	addi	a5,a5,-1170 # ffffffffc02917c0 <hash_list>
ffffffffc0205c5a:	953e                	add	a0,a0,a5
ffffffffc0205c5c:	650c                	ld	a1,8(a0)
ffffffffc0205c5e:	020a3683          	ld	a3,32(s4)
ffffffffc0205c62:	0d8a0793          	addi	a5,s4,216
ffffffffc0205c66:	e19c                	sd	a5,0(a1)
ffffffffc0205c68:	6410                	ld	a2,8(s0)
ffffffffc0205c6a:	e51c                	sd	a5,8(a0)
ffffffffc0205c6c:	7af8                	ld	a4,240(a3)
ffffffffc0205c6e:	0c8a0793          	addi	a5,s4,200
ffffffffc0205c72:	0eba3023          	sd	a1,224(s4)
ffffffffc0205c76:	0caa3c23          	sd	a0,216(s4)
ffffffffc0205c7a:	e21c                	sd	a5,0(a2)
ffffffffc0205c7c:	e41c                	sd	a5,8(s0)
ffffffffc0205c7e:	0cca3823          	sd	a2,208(s4)
ffffffffc0205c82:	0c8a3423          	sd	s0,200(s4)
ffffffffc0205c86:	0e0a3c23          	sd	zero,248(s4)
ffffffffc0205c8a:	10ea3023          	sd	a4,256(s4)
ffffffffc0205c8e:	c319                	beqz	a4,ffffffffc0205c94 <do_fork+0x1d4>
ffffffffc0205c90:	0f473c23          	sd	s4,248(a4)
ffffffffc0205c94:	0009a783          	lw	a5,0(s3)
ffffffffc0205c98:	0f46b823          	sd	s4,240(a3)
ffffffffc0205c9c:	8552                	mv	a0,s4
ffffffffc0205c9e:	2785                	addiw	a5,a5,1
ffffffffc0205ca0:	00f9a023          	sw	a5,0(s3)
ffffffffc0205ca4:	520010ef          	jal	ra,ffffffffc02071c4 <wakeup_proc>
ffffffffc0205ca8:	004a2a83          	lw	s5,4(s4)
ffffffffc0205cac:	70e6                	ld	ra,120(sp)
ffffffffc0205cae:	7446                	ld	s0,112(sp)
ffffffffc0205cb0:	74a6                	ld	s1,104(sp)
ffffffffc0205cb2:	7906                	ld	s2,96(sp)
ffffffffc0205cb4:	69e6                	ld	s3,88(sp)
ffffffffc0205cb6:	6a46                	ld	s4,80(sp)
ffffffffc0205cb8:	6b06                	ld	s6,64(sp)
ffffffffc0205cba:	7be2                	ld	s7,56(sp)
ffffffffc0205cbc:	7c42                	ld	s8,48(sp)
ffffffffc0205cbe:	7ca2                	ld	s9,40(sp)
ffffffffc0205cc0:	7d02                	ld	s10,32(sp)
ffffffffc0205cc2:	6de2                	ld	s11,24(sp)
ffffffffc0205cc4:	8556                	mv	a0,s5
ffffffffc0205cc6:	6aa6                	ld	s5,72(sp)
ffffffffc0205cc8:	6109                	addi	sp,sp,128
ffffffffc0205cca:	8082                	ret
ffffffffc0205ccc:	e9bfd0ef          	jal	ra,ffffffffc0203b66 <mm_create>
ffffffffc0205cd0:	e02a                	sd	a0,0(sp)
ffffffffc0205cd2:	16050f63          	beqz	a0,ffffffffc0205e50 <do_fork+0x390>
ffffffffc0205cd6:	4505                	li	a0,1
ffffffffc0205cd8:	c94fc0ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0205cdc:	0e050763          	beqz	a0,ffffffffc0205dca <do_fork+0x30a>
ffffffffc0205ce0:	000c3683          	ld	a3,0(s8)
ffffffffc0205ce4:	000d3703          	ld	a4,0(s10)
ffffffffc0205ce8:	40d506b3          	sub	a3,a0,a3
ffffffffc0205cec:	8699                	srai	a3,a3,0x6
ffffffffc0205cee:	96de                	add	a3,a3,s7
ffffffffc0205cf0:	0156fab3          	and	s5,a3,s5
ffffffffc0205cf4:	06b2                	slli	a3,a3,0xc
ffffffffc0205cf6:	16eaf163          	bgeu	s5,a4,ffffffffc0205e58 <do_fork+0x398>
ffffffffc0205cfa:	000dba83          	ld	s5,0(s11)
ffffffffc0205cfe:	6605                	lui	a2,0x1
ffffffffc0205d00:	00091597          	auipc	a1,0x91
ffffffffc0205d04:	b985b583          	ld	a1,-1128(a1) # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0205d08:	9ab6                	add	s5,s5,a3
ffffffffc0205d0a:	8556                	mv	a0,s5
ffffffffc0205d0c:	726050ef          	jal	ra,ffffffffc020b432 <memcpy>
ffffffffc0205d10:	6782                	ld	a5,0(sp)
ffffffffc0205d12:	038c8713          	addi	a4,s9,56
ffffffffc0205d16:	853a                	mv	a0,a4
ffffffffc0205d18:	0157bc23          	sd	s5,24(a5)
ffffffffc0205d1c:	e43a                	sd	a4,8(sp)
ffffffffc0205d1e:	fa4fe0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0205d22:	000b3683          	ld	a3,0(s6)
ffffffffc0205d26:	6722                	ld	a4,8(sp)
ffffffffc0205d28:	c681                	beqz	a3,ffffffffc0205d30 <do_fork+0x270>
ffffffffc0205d2a:	42d4                	lw	a3,4(a3)
ffffffffc0205d2c:	04dca823          	sw	a3,80(s9)
ffffffffc0205d30:	6502                	ld	a0,0(sp)
ffffffffc0205d32:	85e6                	mv	a1,s9
ffffffffc0205d34:	e43a                	sd	a4,8(sp)
ffffffffc0205d36:	880fe0ef          	jal	ra,ffffffffc0203db6 <dup_mmap>
ffffffffc0205d3a:	6722                	ld	a4,8(sp)
ffffffffc0205d3c:	8aaa                	mv	s5,a0
ffffffffc0205d3e:	853a                	mv	a0,a4
ffffffffc0205d40:	f7efe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0205d44:	040ca823          	sw	zero,80(s9)
ffffffffc0205d48:	0e0a9263          	bnez	s5,ffffffffc0205e2c <do_fork+0x36c>
ffffffffc0205d4c:	6c82                	ld	s9,0(sp)
ffffffffc0205d4e:	b53d                	j	ffffffffc0205b7c <do_fork+0xbc>
ffffffffc0205d50:	8936                	mv	s2,a3
ffffffffc0205d52:	bd41                	j	ffffffffc0205be2 <do_fork+0x122>
ffffffffc0205d54:	bd8ff0ef          	jal	ra,ffffffffc020512c <files_create>
ffffffffc0205d58:	84aa                	mv	s1,a0
ffffffffc0205d5a:	0e050b63          	beqz	a0,ffffffffc0205e50 <do_fork+0x390>
ffffffffc0205d5e:	85a2                	mv	a1,s0
ffffffffc0205d60:	d04ff0ef          	jal	ra,ffffffffc0205264 <dup_files>
ffffffffc0205d64:	8aaa                	mv	s5,a0
ffffffffc0205d66:	8426                	mv	s0,s1
ffffffffc0205d68:	e8050fe3          	beqz	a0,ffffffffc0205c06 <do_fork+0x146>
ffffffffc0205d6c:	8526                	mv	a0,s1
ffffffffc0205d6e:	bf4ff0ef          	jal	ra,ffffffffc0205162 <files_destroy>
ffffffffc0205d72:	a085                	j	ffffffffc0205dd2 <do_fork+0x312>
ffffffffc0205d74:	4785                	li	a5,1
ffffffffc0205d76:	c19c                	sw	a5,0(a1)
ffffffffc0205d78:	4505                	li	a0,1
ffffffffc0205d7a:	0008b317          	auipc	t1,0x8b
ffffffffc0205d7e:	2e230313          	addi	t1,t1,738 # ffffffffc029105c <next_safe.0>
ffffffffc0205d82:	00090417          	auipc	s0,0x90
ffffffffc0205d86:	a3e40413          	addi	s0,s0,-1474 # ffffffffc02957c0 <proc_list>
ffffffffc0205d8a:	00843e03          	ld	t3,8(s0)
ffffffffc0205d8e:	6789                	lui	a5,0x2
ffffffffc0205d90:	00f32023          	sw	a5,0(t1)
ffffffffc0205d94:	86aa                	mv	a3,a0
ffffffffc0205d96:	4801                	li	a6,0
ffffffffc0205d98:	6e89                	lui	t4,0x2
ffffffffc0205d9a:	0a8e0463          	beq	t3,s0,ffffffffc0205e42 <do_fork+0x382>
ffffffffc0205d9e:	88c2                	mv	a7,a6
ffffffffc0205da0:	87f2                	mv	a5,t3
ffffffffc0205da2:	6609                	lui	a2,0x2
ffffffffc0205da4:	a811                	j	ffffffffc0205db8 <do_fork+0x2f8>
ffffffffc0205da6:	00e6d663          	bge	a3,a4,ffffffffc0205db2 <do_fork+0x2f2>
ffffffffc0205daa:	00c75463          	bge	a4,a2,ffffffffc0205db2 <do_fork+0x2f2>
ffffffffc0205dae:	863a                	mv	a2,a4
ffffffffc0205db0:	4885                	li	a7,1
ffffffffc0205db2:	679c                	ld	a5,8(a5)
ffffffffc0205db4:	04878a63          	beq	a5,s0,ffffffffc0205e08 <do_fork+0x348>
ffffffffc0205db8:	f3c7a703          	lw	a4,-196(a5) # 1f3c <_binary_bin_swap_img_size-0x5dc4>
ffffffffc0205dbc:	fed715e3          	bne	a4,a3,ffffffffc0205da6 <do_fork+0x2e6>
ffffffffc0205dc0:	2685                	addiw	a3,a3,1
ffffffffc0205dc2:	04c6de63          	bge	a3,a2,ffffffffc0205e1e <do_fork+0x35e>
ffffffffc0205dc6:	4805                	li	a6,1
ffffffffc0205dc8:	b7ed                	j	ffffffffc0205db2 <do_fork+0x2f2>
ffffffffc0205dca:	6502                	ld	a0,0(sp)
ffffffffc0205dcc:	5af1                	li	s5,-4
ffffffffc0205dce:	ee7fd0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc0205dd2:	010a3683          	ld	a3,16(s4)
ffffffffc0205dd6:	c02007b7          	lui	a5,0xc0200
ffffffffc0205dda:	10f6e463          	bltu	a3,a5,ffffffffc0205ee2 <do_fork+0x422>
ffffffffc0205dde:	000db503          	ld	a0,0(s11)
ffffffffc0205de2:	000d3783          	ld	a5,0(s10)
ffffffffc0205de6:	8e89                	sub	a3,a3,a0
ffffffffc0205de8:	82b1                	srli	a3,a3,0xc
ffffffffc0205dea:	0ef6f063          	bgeu	a3,a5,ffffffffc0205eca <do_fork+0x40a>
ffffffffc0205dee:	000c3503          	ld	a0,0(s8)
ffffffffc0205df2:	417686b3          	sub	a3,a3,s7
ffffffffc0205df6:	069a                	slli	a3,a3,0x6
ffffffffc0205df8:	4589                	li	a1,2
ffffffffc0205dfa:	9536                	add	a0,a0,a3
ffffffffc0205dfc:	baefc0ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0205e00:	8552                	mv	a0,s4
ffffffffc0205e02:	a3cfc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205e06:	b55d                	j	ffffffffc0205cac <do_fork+0x1ec>
ffffffffc0205e08:	00080463          	beqz	a6,ffffffffc0205e10 <do_fork+0x350>
ffffffffc0205e0c:	c194                	sw	a3,0(a1)
ffffffffc0205e0e:	8536                	mv	a0,a3
ffffffffc0205e10:	e20887e3          	beqz	a7,ffffffffc0205c3e <do_fork+0x17e>
ffffffffc0205e14:	00c32023          	sw	a2,0(t1)
ffffffffc0205e18:	b51d                	j	ffffffffc0205c3e <do_fork+0x17e>
ffffffffc0205e1a:	5af1                	li	s5,-4
ffffffffc0205e1c:	b7d5                	j	ffffffffc0205e00 <do_fork+0x340>
ffffffffc0205e1e:	01d6c363          	blt	a3,t4,ffffffffc0205e24 <do_fork+0x364>
ffffffffc0205e22:	4685                	li	a3,1
ffffffffc0205e24:	4805                	li	a6,1
ffffffffc0205e26:	bf95                	j	ffffffffc0205d9a <do_fork+0x2da>
ffffffffc0205e28:	5aed                	li	s5,-5
ffffffffc0205e2a:	b549                	j	ffffffffc0205cac <do_fork+0x1ec>
ffffffffc0205e2c:	6402                	ld	s0,0(sp)
ffffffffc0205e2e:	8522                	mv	a0,s0
ffffffffc0205e30:	820fe0ef          	jal	ra,ffffffffc0203e50 <exit_mmap>
ffffffffc0205e34:	6c08                	ld	a0,24(s0)
ffffffffc0205e36:	ba5ff0ef          	jal	ra,ffffffffc02059da <put_pgdir.isra.0>
ffffffffc0205e3a:	8522                	mv	a0,s0
ffffffffc0205e3c:	e79fd0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc0205e40:	bf49                	j	ffffffffc0205dd2 <do_fork+0x312>
ffffffffc0205e42:	00080963          	beqz	a6,ffffffffc0205e54 <do_fork+0x394>
ffffffffc0205e46:	c194                	sw	a3,0(a1)
ffffffffc0205e48:	8536                	mv	a0,a3
ffffffffc0205e4a:	bbd5                	j	ffffffffc0205c3e <do_fork+0x17e>
ffffffffc0205e4c:	5af1                	li	s5,-4
ffffffffc0205e4e:	bdb9                	j	ffffffffc0205cac <do_fork+0x1ec>
ffffffffc0205e50:	5af1                	li	s5,-4
ffffffffc0205e52:	b741                	j	ffffffffc0205dd2 <do_fork+0x312>
ffffffffc0205e54:	4188                	lw	a0,0(a1)
ffffffffc0205e56:	b3e5                	j	ffffffffc0205c3e <do_fork+0x17e>
ffffffffc0205e58:	00006617          	auipc	a2,0x6
ffffffffc0205e5c:	59060613          	addi	a2,a2,1424 # ffffffffc020c3e8 <default_pmm_manager+0x38>
ffffffffc0205e60:	07100593          	li	a1,113
ffffffffc0205e64:	00006517          	auipc	a0,0x6
ffffffffc0205e68:	5ac50513          	addi	a0,a0,1452 # ffffffffc020c410 <default_pmm_manager+0x60>
ffffffffc0205e6c:	e32fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205e70:	00007697          	auipc	a3,0x7
ffffffffc0205e74:	54868693          	addi	a3,a3,1352 # ffffffffc020d3b8 <CSWTCH.79+0xf0>
ffffffffc0205e78:	00006617          	auipc	a2,0x6
ffffffffc0205e7c:	a5060613          	addi	a2,a2,-1456 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0205e80:	22d00593          	li	a1,557
ffffffffc0205e84:	00007517          	auipc	a0,0x7
ffffffffc0205e88:	55450513          	addi	a0,a0,1364 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc0205e8c:	e12fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205e90:	86ba                	mv	a3,a4
ffffffffc0205e92:	00006617          	auipc	a2,0x6
ffffffffc0205e96:	5fe60613          	addi	a2,a2,1534 # ffffffffc020c490 <default_pmm_manager+0xe0>
ffffffffc0205e9a:	1b800593          	li	a1,440
ffffffffc0205e9e:	00007517          	auipc	a0,0x7
ffffffffc0205ea2:	53a50513          	addi	a0,a0,1338 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc0205ea6:	df8fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205eaa:	00007697          	auipc	a3,0x7
ffffffffc0205eae:	54668693          	addi	a3,a3,1350 # ffffffffc020d3f0 <CSWTCH.79+0x128>
ffffffffc0205eb2:	00006617          	auipc	a2,0x6
ffffffffc0205eb6:	a1660613          	addi	a2,a2,-1514 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0205eba:	1d800593          	li	a1,472
ffffffffc0205ebe:	00007517          	auipc	a0,0x7
ffffffffc0205ec2:	51a50513          	addi	a0,a0,1306 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc0205ec6:	dd8fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205eca:	00006617          	auipc	a2,0x6
ffffffffc0205ece:	5ee60613          	addi	a2,a2,1518 # ffffffffc020c4b8 <default_pmm_manager+0x108>
ffffffffc0205ed2:	06900593          	li	a1,105
ffffffffc0205ed6:	00006517          	auipc	a0,0x6
ffffffffc0205eda:	53a50513          	addi	a0,a0,1338 # ffffffffc020c410 <default_pmm_manager+0x60>
ffffffffc0205ede:	dc0fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205ee2:	00006617          	auipc	a2,0x6
ffffffffc0205ee6:	5ae60613          	addi	a2,a2,1454 # ffffffffc020c490 <default_pmm_manager+0xe0>
ffffffffc0205eea:	07700593          	li	a1,119
ffffffffc0205eee:	00006517          	auipc	a0,0x6
ffffffffc0205ef2:	52250513          	addi	a0,a0,1314 # ffffffffc020c410 <default_pmm_manager+0x60>
ffffffffc0205ef6:	da8fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205efa <kernel_thread>:
ffffffffc0205efa:	7129                	addi	sp,sp,-320
ffffffffc0205efc:	fa22                	sd	s0,304(sp)
ffffffffc0205efe:	f626                	sd	s1,296(sp)
ffffffffc0205f00:	f24a                	sd	s2,288(sp)
ffffffffc0205f02:	84ae                	mv	s1,a1
ffffffffc0205f04:	892a                	mv	s2,a0
ffffffffc0205f06:	8432                	mv	s0,a2
ffffffffc0205f08:	4581                	li	a1,0
ffffffffc0205f0a:	12000613          	li	a2,288
ffffffffc0205f0e:	850a                	mv	a0,sp
ffffffffc0205f10:	fe06                	sd	ra,312(sp)
ffffffffc0205f12:	4ce050ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc0205f16:	e0ca                	sd	s2,64(sp)
ffffffffc0205f18:	e4a6                	sd	s1,72(sp)
ffffffffc0205f1a:	100027f3          	csrr	a5,sstatus
ffffffffc0205f1e:	edd7f793          	andi	a5,a5,-291
ffffffffc0205f22:	1207e793          	ori	a5,a5,288
ffffffffc0205f26:	e23e                	sd	a5,256(sp)
ffffffffc0205f28:	860a                	mv	a2,sp
ffffffffc0205f2a:	10046513          	ori	a0,s0,256
ffffffffc0205f2e:	00000797          	auipc	a5,0x0
ffffffffc0205f32:	9fc78793          	addi	a5,a5,-1540 # ffffffffc020592a <kernel_thread_entry>
ffffffffc0205f36:	4581                	li	a1,0
ffffffffc0205f38:	e63e                	sd	a5,264(sp)
ffffffffc0205f3a:	b87ff0ef          	jal	ra,ffffffffc0205ac0 <do_fork>
ffffffffc0205f3e:	70f2                	ld	ra,312(sp)
ffffffffc0205f40:	7452                	ld	s0,304(sp)
ffffffffc0205f42:	74b2                	ld	s1,296(sp)
ffffffffc0205f44:	7912                	ld	s2,288(sp)
ffffffffc0205f46:	6131                	addi	sp,sp,320
ffffffffc0205f48:	8082                	ret

ffffffffc0205f4a <do_exit>:
ffffffffc0205f4a:	7179                	addi	sp,sp,-48
ffffffffc0205f4c:	f022                	sd	s0,32(sp)
ffffffffc0205f4e:	00091417          	auipc	s0,0x91
ffffffffc0205f52:	97240413          	addi	s0,s0,-1678 # ffffffffc02968c0 <current>
ffffffffc0205f56:	601c                	ld	a5,0(s0)
ffffffffc0205f58:	f406                	sd	ra,40(sp)
ffffffffc0205f5a:	ec26                	sd	s1,24(sp)
ffffffffc0205f5c:	e84a                	sd	s2,16(sp)
ffffffffc0205f5e:	e44e                	sd	s3,8(sp)
ffffffffc0205f60:	e052                	sd	s4,0(sp)
ffffffffc0205f62:	00091717          	auipc	a4,0x91
ffffffffc0205f66:	96673703          	ld	a4,-1690(a4) # ffffffffc02968c8 <idleproc>
ffffffffc0205f6a:	0ee78763          	beq	a5,a4,ffffffffc0206058 <do_exit+0x10e>
ffffffffc0205f6e:	00091497          	auipc	s1,0x91
ffffffffc0205f72:	96248493          	addi	s1,s1,-1694 # ffffffffc02968d0 <initproc>
ffffffffc0205f76:	6098                	ld	a4,0(s1)
ffffffffc0205f78:	10e78763          	beq	a5,a4,ffffffffc0206086 <do_exit+0x13c>
ffffffffc0205f7c:	0287b983          	ld	s3,40(a5)
ffffffffc0205f80:	892a                	mv	s2,a0
ffffffffc0205f82:	02098e63          	beqz	s3,ffffffffc0205fbe <do_exit+0x74>
ffffffffc0205f86:	00091797          	auipc	a5,0x91
ffffffffc0205f8a:	90a7b783          	ld	a5,-1782(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc0205f8e:	577d                	li	a4,-1
ffffffffc0205f90:	177e                	slli	a4,a4,0x3f
ffffffffc0205f92:	83b1                	srli	a5,a5,0xc
ffffffffc0205f94:	8fd9                	or	a5,a5,a4
ffffffffc0205f96:	18079073          	csrw	satp,a5
ffffffffc0205f9a:	0309a783          	lw	a5,48(s3)
ffffffffc0205f9e:	fff7871b          	addiw	a4,a5,-1
ffffffffc0205fa2:	02e9a823          	sw	a4,48(s3)
ffffffffc0205fa6:	c769                	beqz	a4,ffffffffc0206070 <do_exit+0x126>
ffffffffc0205fa8:	601c                	ld	a5,0(s0)
ffffffffc0205faa:	1487b503          	ld	a0,328(a5)
ffffffffc0205fae:	0207b423          	sd	zero,40(a5)
ffffffffc0205fb2:	c511                	beqz	a0,ffffffffc0205fbe <do_exit+0x74>
ffffffffc0205fb4:	491c                	lw	a5,16(a0)
ffffffffc0205fb6:	fff7871b          	addiw	a4,a5,-1
ffffffffc0205fba:	c918                	sw	a4,16(a0)
ffffffffc0205fbc:	cb59                	beqz	a4,ffffffffc0206052 <do_exit+0x108>
ffffffffc0205fbe:	601c                	ld	a5,0(s0)
ffffffffc0205fc0:	470d                	li	a4,3
ffffffffc0205fc2:	c398                	sw	a4,0(a5)
ffffffffc0205fc4:	0f27a423          	sw	s2,232(a5)
ffffffffc0205fc8:	100027f3          	csrr	a5,sstatus
ffffffffc0205fcc:	8b89                	andi	a5,a5,2
ffffffffc0205fce:	4a01                	li	s4,0
ffffffffc0205fd0:	e7f9                	bnez	a5,ffffffffc020609e <do_exit+0x154>
ffffffffc0205fd2:	6018                	ld	a4,0(s0)
ffffffffc0205fd4:	800007b7          	lui	a5,0x80000
ffffffffc0205fd8:	0785                	addi	a5,a5,1
ffffffffc0205fda:	7308                	ld	a0,32(a4)
ffffffffc0205fdc:	0ec52703          	lw	a4,236(a0)
ffffffffc0205fe0:	0cf70363          	beq	a4,a5,ffffffffc02060a6 <do_exit+0x15c>
ffffffffc0205fe4:	6018                	ld	a4,0(s0)
ffffffffc0205fe6:	7b7c                	ld	a5,240(a4)
ffffffffc0205fe8:	c3a1                	beqz	a5,ffffffffc0206028 <do_exit+0xde>
ffffffffc0205fea:	800009b7          	lui	s3,0x80000
ffffffffc0205fee:	490d                	li	s2,3
ffffffffc0205ff0:	0985                	addi	s3,s3,1
ffffffffc0205ff2:	a021                	j	ffffffffc0205ffa <do_exit+0xb0>
ffffffffc0205ff4:	6018                	ld	a4,0(s0)
ffffffffc0205ff6:	7b7c                	ld	a5,240(a4)
ffffffffc0205ff8:	cb85                	beqz	a5,ffffffffc0206028 <do_exit+0xde>
ffffffffc0205ffa:	1007b683          	ld	a3,256(a5) # ffffffff80000100 <_binary_bin_sfs_img_size+0xffffffff7ff8ae00>
ffffffffc0205ffe:	6088                	ld	a0,0(s1)
ffffffffc0206000:	fb74                	sd	a3,240(a4)
ffffffffc0206002:	7978                	ld	a4,240(a0)
ffffffffc0206004:	0e07bc23          	sd	zero,248(a5)
ffffffffc0206008:	10e7b023          	sd	a4,256(a5)
ffffffffc020600c:	c311                	beqz	a4,ffffffffc0206010 <do_exit+0xc6>
ffffffffc020600e:	ff7c                	sd	a5,248(a4)
ffffffffc0206010:	4398                	lw	a4,0(a5)
ffffffffc0206012:	f388                	sd	a0,32(a5)
ffffffffc0206014:	f97c                	sd	a5,240(a0)
ffffffffc0206016:	fd271fe3          	bne	a4,s2,ffffffffc0205ff4 <do_exit+0xaa>
ffffffffc020601a:	0ec52783          	lw	a5,236(a0)
ffffffffc020601e:	fd379be3          	bne	a5,s3,ffffffffc0205ff4 <do_exit+0xaa>
ffffffffc0206022:	1a2010ef          	jal	ra,ffffffffc02071c4 <wakeup_proc>
ffffffffc0206026:	b7f9                	j	ffffffffc0205ff4 <do_exit+0xaa>
ffffffffc0206028:	020a1263          	bnez	s4,ffffffffc020604c <do_exit+0x102>
ffffffffc020602c:	24a010ef          	jal	ra,ffffffffc0207276 <schedule>
ffffffffc0206030:	601c                	ld	a5,0(s0)
ffffffffc0206032:	00007617          	auipc	a2,0x7
ffffffffc0206036:	3f660613          	addi	a2,a2,1014 # ffffffffc020d428 <CSWTCH.79+0x160>
ffffffffc020603a:	29800593          	li	a1,664
ffffffffc020603e:	43d4                	lw	a3,4(a5)
ffffffffc0206040:	00007517          	auipc	a0,0x7
ffffffffc0206044:	39850513          	addi	a0,a0,920 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc0206048:	c56fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020604c:	c21fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0206050:	bff1                	j	ffffffffc020602c <do_exit+0xe2>
ffffffffc0206052:	910ff0ef          	jal	ra,ffffffffc0205162 <files_destroy>
ffffffffc0206056:	b7a5                	j	ffffffffc0205fbe <do_exit+0x74>
ffffffffc0206058:	00007617          	auipc	a2,0x7
ffffffffc020605c:	3b060613          	addi	a2,a2,944 # ffffffffc020d408 <CSWTCH.79+0x140>
ffffffffc0206060:	26300593          	li	a1,611
ffffffffc0206064:	00007517          	auipc	a0,0x7
ffffffffc0206068:	37450513          	addi	a0,a0,884 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc020606c:	c32fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206070:	854e                	mv	a0,s3
ffffffffc0206072:	ddffd0ef          	jal	ra,ffffffffc0203e50 <exit_mmap>
ffffffffc0206076:	0189b503          	ld	a0,24(s3) # ffffffff80000018 <_binary_bin_sfs_img_size+0xffffffff7ff8ad18>
ffffffffc020607a:	961ff0ef          	jal	ra,ffffffffc02059da <put_pgdir.isra.0>
ffffffffc020607e:	854e                	mv	a0,s3
ffffffffc0206080:	c35fd0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc0206084:	b715                	j	ffffffffc0205fa8 <do_exit+0x5e>
ffffffffc0206086:	00007617          	auipc	a2,0x7
ffffffffc020608a:	39260613          	addi	a2,a2,914 # ffffffffc020d418 <CSWTCH.79+0x150>
ffffffffc020608e:	26700593          	li	a1,615
ffffffffc0206092:	00007517          	auipc	a0,0x7
ffffffffc0206096:	34650513          	addi	a0,a0,838 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc020609a:	c04fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020609e:	bd5fa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02060a2:	4a05                	li	s4,1
ffffffffc02060a4:	b73d                	j	ffffffffc0205fd2 <do_exit+0x88>
ffffffffc02060a6:	11e010ef          	jal	ra,ffffffffc02071c4 <wakeup_proc>
ffffffffc02060aa:	bf2d                	j	ffffffffc0205fe4 <do_exit+0x9a>

ffffffffc02060ac <do_wait.part.0>:
ffffffffc02060ac:	715d                	addi	sp,sp,-80
ffffffffc02060ae:	f84a                	sd	s2,48(sp)
ffffffffc02060b0:	f44e                	sd	s3,40(sp)
ffffffffc02060b2:	80000937          	lui	s2,0x80000
ffffffffc02060b6:	6989                	lui	s3,0x2
ffffffffc02060b8:	fc26                	sd	s1,56(sp)
ffffffffc02060ba:	f052                	sd	s4,32(sp)
ffffffffc02060bc:	ec56                	sd	s5,24(sp)
ffffffffc02060be:	e85a                	sd	s6,16(sp)
ffffffffc02060c0:	e45e                	sd	s7,8(sp)
ffffffffc02060c2:	e486                	sd	ra,72(sp)
ffffffffc02060c4:	e0a2                	sd	s0,64(sp)
ffffffffc02060c6:	84aa                	mv	s1,a0
ffffffffc02060c8:	8a2e                	mv	s4,a1
ffffffffc02060ca:	00090b97          	auipc	s7,0x90
ffffffffc02060ce:	7f6b8b93          	addi	s7,s7,2038 # ffffffffc02968c0 <current>
ffffffffc02060d2:	00050b1b          	sext.w	s6,a0
ffffffffc02060d6:	fff50a9b          	addiw	s5,a0,-1
ffffffffc02060da:	19f9                	addi	s3,s3,-2
ffffffffc02060dc:	0905                	addi	s2,s2,1
ffffffffc02060de:	ccbd                	beqz	s1,ffffffffc020615c <do_wait.part.0+0xb0>
ffffffffc02060e0:	0359e863          	bltu	s3,s5,ffffffffc0206110 <do_wait.part.0+0x64>
ffffffffc02060e4:	45a9                	li	a1,10
ffffffffc02060e6:	855a                	mv	a0,s6
ffffffffc02060e8:	5c5040ef          	jal	ra,ffffffffc020aeac <hash32>
ffffffffc02060ec:	02051793          	slli	a5,a0,0x20
ffffffffc02060f0:	01c7d513          	srli	a0,a5,0x1c
ffffffffc02060f4:	0008b797          	auipc	a5,0x8b
ffffffffc02060f8:	6cc78793          	addi	a5,a5,1740 # ffffffffc02917c0 <hash_list>
ffffffffc02060fc:	953e                	add	a0,a0,a5
ffffffffc02060fe:	842a                	mv	s0,a0
ffffffffc0206100:	a029                	j	ffffffffc020610a <do_wait.part.0+0x5e>
ffffffffc0206102:	f2c42783          	lw	a5,-212(s0)
ffffffffc0206106:	02978163          	beq	a5,s1,ffffffffc0206128 <do_wait.part.0+0x7c>
ffffffffc020610a:	6400                	ld	s0,8(s0)
ffffffffc020610c:	fe851be3          	bne	a0,s0,ffffffffc0206102 <do_wait.part.0+0x56>
ffffffffc0206110:	5579                	li	a0,-2
ffffffffc0206112:	60a6                	ld	ra,72(sp)
ffffffffc0206114:	6406                	ld	s0,64(sp)
ffffffffc0206116:	74e2                	ld	s1,56(sp)
ffffffffc0206118:	7942                	ld	s2,48(sp)
ffffffffc020611a:	79a2                	ld	s3,40(sp)
ffffffffc020611c:	7a02                	ld	s4,32(sp)
ffffffffc020611e:	6ae2                	ld	s5,24(sp)
ffffffffc0206120:	6b42                	ld	s6,16(sp)
ffffffffc0206122:	6ba2                	ld	s7,8(sp)
ffffffffc0206124:	6161                	addi	sp,sp,80
ffffffffc0206126:	8082                	ret
ffffffffc0206128:	000bb683          	ld	a3,0(s7)
ffffffffc020612c:	f4843783          	ld	a5,-184(s0)
ffffffffc0206130:	fed790e3          	bne	a5,a3,ffffffffc0206110 <do_wait.part.0+0x64>
ffffffffc0206134:	f2842703          	lw	a4,-216(s0)
ffffffffc0206138:	478d                	li	a5,3
ffffffffc020613a:	0ef70b63          	beq	a4,a5,ffffffffc0206230 <do_wait.part.0+0x184>
ffffffffc020613e:	4785                	li	a5,1
ffffffffc0206140:	c29c                	sw	a5,0(a3)
ffffffffc0206142:	0f26a623          	sw	s2,236(a3)
ffffffffc0206146:	130010ef          	jal	ra,ffffffffc0207276 <schedule>
ffffffffc020614a:	000bb783          	ld	a5,0(s7)
ffffffffc020614e:	0b07a783          	lw	a5,176(a5)
ffffffffc0206152:	8b85                	andi	a5,a5,1
ffffffffc0206154:	d7c9                	beqz	a5,ffffffffc02060de <do_wait.part.0+0x32>
ffffffffc0206156:	555d                	li	a0,-9
ffffffffc0206158:	df3ff0ef          	jal	ra,ffffffffc0205f4a <do_exit>
ffffffffc020615c:	000bb683          	ld	a3,0(s7)
ffffffffc0206160:	7ae0                	ld	s0,240(a3)
ffffffffc0206162:	d45d                	beqz	s0,ffffffffc0206110 <do_wait.part.0+0x64>
ffffffffc0206164:	470d                	li	a4,3
ffffffffc0206166:	a021                	j	ffffffffc020616e <do_wait.part.0+0xc2>
ffffffffc0206168:	10043403          	ld	s0,256(s0)
ffffffffc020616c:	d869                	beqz	s0,ffffffffc020613e <do_wait.part.0+0x92>
ffffffffc020616e:	401c                	lw	a5,0(s0)
ffffffffc0206170:	fee79ce3          	bne	a5,a4,ffffffffc0206168 <do_wait.part.0+0xbc>
ffffffffc0206174:	00090797          	auipc	a5,0x90
ffffffffc0206178:	7547b783          	ld	a5,1876(a5) # ffffffffc02968c8 <idleproc>
ffffffffc020617c:	0c878963          	beq	a5,s0,ffffffffc020624e <do_wait.part.0+0x1a2>
ffffffffc0206180:	00090797          	auipc	a5,0x90
ffffffffc0206184:	7507b783          	ld	a5,1872(a5) # ffffffffc02968d0 <initproc>
ffffffffc0206188:	0cf40363          	beq	s0,a5,ffffffffc020624e <do_wait.part.0+0x1a2>
ffffffffc020618c:	000a0663          	beqz	s4,ffffffffc0206198 <do_wait.part.0+0xec>
ffffffffc0206190:	0e842783          	lw	a5,232(s0)
ffffffffc0206194:	00fa2023          	sw	a5,0(s4)
ffffffffc0206198:	100027f3          	csrr	a5,sstatus
ffffffffc020619c:	8b89                	andi	a5,a5,2
ffffffffc020619e:	4581                	li	a1,0
ffffffffc02061a0:	e7c1                	bnez	a5,ffffffffc0206228 <do_wait.part.0+0x17c>
ffffffffc02061a2:	6c70                	ld	a2,216(s0)
ffffffffc02061a4:	7074                	ld	a3,224(s0)
ffffffffc02061a6:	10043703          	ld	a4,256(s0)
ffffffffc02061aa:	7c7c                	ld	a5,248(s0)
ffffffffc02061ac:	e614                	sd	a3,8(a2)
ffffffffc02061ae:	e290                	sd	a2,0(a3)
ffffffffc02061b0:	6470                	ld	a2,200(s0)
ffffffffc02061b2:	6874                	ld	a3,208(s0)
ffffffffc02061b4:	e614                	sd	a3,8(a2)
ffffffffc02061b6:	e290                	sd	a2,0(a3)
ffffffffc02061b8:	c319                	beqz	a4,ffffffffc02061be <do_wait.part.0+0x112>
ffffffffc02061ba:	ff7c                	sd	a5,248(a4)
ffffffffc02061bc:	7c7c                	ld	a5,248(s0)
ffffffffc02061be:	c3b5                	beqz	a5,ffffffffc0206222 <do_wait.part.0+0x176>
ffffffffc02061c0:	10e7b023          	sd	a4,256(a5)
ffffffffc02061c4:	00090717          	auipc	a4,0x90
ffffffffc02061c8:	71470713          	addi	a4,a4,1812 # ffffffffc02968d8 <nr_process>
ffffffffc02061cc:	431c                	lw	a5,0(a4)
ffffffffc02061ce:	37fd                	addiw	a5,a5,-1
ffffffffc02061d0:	c31c                	sw	a5,0(a4)
ffffffffc02061d2:	e5a9                	bnez	a1,ffffffffc020621c <do_wait.part.0+0x170>
ffffffffc02061d4:	6814                	ld	a3,16(s0)
ffffffffc02061d6:	c02007b7          	lui	a5,0xc0200
ffffffffc02061da:	04f6ee63          	bltu	a3,a5,ffffffffc0206236 <do_wait.part.0+0x18a>
ffffffffc02061de:	00090797          	auipc	a5,0x90
ffffffffc02061e2:	6da7b783          	ld	a5,1754(a5) # ffffffffc02968b8 <va_pa_offset>
ffffffffc02061e6:	8e9d                	sub	a3,a3,a5
ffffffffc02061e8:	82b1                	srli	a3,a3,0xc
ffffffffc02061ea:	00090797          	auipc	a5,0x90
ffffffffc02061ee:	6b67b783          	ld	a5,1718(a5) # ffffffffc02968a0 <npage>
ffffffffc02061f2:	06f6fa63          	bgeu	a3,a5,ffffffffc0206266 <do_wait.part.0+0x1ba>
ffffffffc02061f6:	00009517          	auipc	a0,0x9
ffffffffc02061fa:	53253503          	ld	a0,1330(a0) # ffffffffc020f728 <nbase>
ffffffffc02061fe:	8e89                	sub	a3,a3,a0
ffffffffc0206200:	069a                	slli	a3,a3,0x6
ffffffffc0206202:	00090517          	auipc	a0,0x90
ffffffffc0206206:	6a653503          	ld	a0,1702(a0) # ffffffffc02968a8 <pages>
ffffffffc020620a:	9536                	add	a0,a0,a3
ffffffffc020620c:	4589                	li	a1,2
ffffffffc020620e:	f9dfb0ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0206212:	8522                	mv	a0,s0
ffffffffc0206214:	e2bfb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206218:	4501                	li	a0,0
ffffffffc020621a:	bde5                	j	ffffffffc0206112 <do_wait.part.0+0x66>
ffffffffc020621c:	a51fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0206220:	bf55                	j	ffffffffc02061d4 <do_wait.part.0+0x128>
ffffffffc0206222:	701c                	ld	a5,32(s0)
ffffffffc0206224:	fbf8                	sd	a4,240(a5)
ffffffffc0206226:	bf79                	j	ffffffffc02061c4 <do_wait.part.0+0x118>
ffffffffc0206228:	a4bfa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020622c:	4585                	li	a1,1
ffffffffc020622e:	bf95                	j	ffffffffc02061a2 <do_wait.part.0+0xf6>
ffffffffc0206230:	f2840413          	addi	s0,s0,-216
ffffffffc0206234:	b781                	j	ffffffffc0206174 <do_wait.part.0+0xc8>
ffffffffc0206236:	00006617          	auipc	a2,0x6
ffffffffc020623a:	25a60613          	addi	a2,a2,602 # ffffffffc020c490 <default_pmm_manager+0xe0>
ffffffffc020623e:	07700593          	li	a1,119
ffffffffc0206242:	00006517          	auipc	a0,0x6
ffffffffc0206246:	1ce50513          	addi	a0,a0,462 # ffffffffc020c410 <default_pmm_manager+0x60>
ffffffffc020624a:	a54fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020624e:	00007617          	auipc	a2,0x7
ffffffffc0206252:	1fa60613          	addi	a2,a2,506 # ffffffffc020d448 <CSWTCH.79+0x180>
ffffffffc0206256:	44d00593          	li	a1,1101
ffffffffc020625a:	00007517          	auipc	a0,0x7
ffffffffc020625e:	17e50513          	addi	a0,a0,382 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc0206262:	a3cfa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206266:	00006617          	auipc	a2,0x6
ffffffffc020626a:	25260613          	addi	a2,a2,594 # ffffffffc020c4b8 <default_pmm_manager+0x108>
ffffffffc020626e:	06900593          	li	a1,105
ffffffffc0206272:	00006517          	auipc	a0,0x6
ffffffffc0206276:	19e50513          	addi	a0,a0,414 # ffffffffc020c410 <default_pmm_manager+0x60>
ffffffffc020627a:	a24fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020627e <init_main>:
ffffffffc020627e:	1141                	addi	sp,sp,-16
ffffffffc0206280:	00007517          	auipc	a0,0x7
ffffffffc0206284:	1e850513          	addi	a0,a0,488 # ffffffffc020d468 <CSWTCH.79+0x1a0>
ffffffffc0206288:	e406                	sd	ra,8(sp)
ffffffffc020628a:	75c010ef          	jal	ra,ffffffffc02079e6 <vfs_set_bootfs>
ffffffffc020628e:	e179                	bnez	a0,ffffffffc0206354 <init_main+0xd6>
ffffffffc0206290:	f5bfb0ef          	jal	ra,ffffffffc02021ea <nr_free_pages>
ffffffffc0206294:	cf7fb0ef          	jal	ra,ffffffffc0201f8a <kallocated>
ffffffffc0206298:	4601                	li	a2,0
ffffffffc020629a:	4581                	li	a1,0
ffffffffc020629c:	00001517          	auipc	a0,0x1
ffffffffc02062a0:	98250513          	addi	a0,a0,-1662 # ffffffffc0206c1e <user_main>
ffffffffc02062a4:	c57ff0ef          	jal	ra,ffffffffc0205efa <kernel_thread>
ffffffffc02062a8:	00a04563          	bgtz	a0,ffffffffc02062b2 <init_main+0x34>
ffffffffc02062ac:	a841                	j	ffffffffc020633c <init_main+0xbe>
ffffffffc02062ae:	7c9000ef          	jal	ra,ffffffffc0207276 <schedule>
ffffffffc02062b2:	4581                	li	a1,0
ffffffffc02062b4:	4501                	li	a0,0
ffffffffc02062b6:	df7ff0ef          	jal	ra,ffffffffc02060ac <do_wait.part.0>
ffffffffc02062ba:	d975                	beqz	a0,ffffffffc02062ae <init_main+0x30>
ffffffffc02062bc:	e61fe0ef          	jal	ra,ffffffffc020511c <fs_cleanup>
ffffffffc02062c0:	00007517          	auipc	a0,0x7
ffffffffc02062c4:	1f050513          	addi	a0,a0,496 # ffffffffc020d4b0 <CSWTCH.79+0x1e8>
ffffffffc02062c8:	edff90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02062cc:	00090797          	auipc	a5,0x90
ffffffffc02062d0:	6047b783          	ld	a5,1540(a5) # ffffffffc02968d0 <initproc>
ffffffffc02062d4:	7bf8                	ld	a4,240(a5)
ffffffffc02062d6:	e339                	bnez	a4,ffffffffc020631c <init_main+0x9e>
ffffffffc02062d8:	7ff8                	ld	a4,248(a5)
ffffffffc02062da:	e329                	bnez	a4,ffffffffc020631c <init_main+0x9e>
ffffffffc02062dc:	1007b703          	ld	a4,256(a5)
ffffffffc02062e0:	ef15                	bnez	a4,ffffffffc020631c <init_main+0x9e>
ffffffffc02062e2:	00090697          	auipc	a3,0x90
ffffffffc02062e6:	5f66a683          	lw	a3,1526(a3) # ffffffffc02968d8 <nr_process>
ffffffffc02062ea:	4709                	li	a4,2
ffffffffc02062ec:	0ce69163          	bne	a3,a4,ffffffffc02063ae <init_main+0x130>
ffffffffc02062f0:	0008f717          	auipc	a4,0x8f
ffffffffc02062f4:	4d070713          	addi	a4,a4,1232 # ffffffffc02957c0 <proc_list>
ffffffffc02062f8:	6714                	ld	a3,8(a4)
ffffffffc02062fa:	0c878793          	addi	a5,a5,200
ffffffffc02062fe:	08d79863          	bne	a5,a3,ffffffffc020638e <init_main+0x110>
ffffffffc0206302:	6318                	ld	a4,0(a4)
ffffffffc0206304:	06e79563          	bne	a5,a4,ffffffffc020636e <init_main+0xf0>
ffffffffc0206308:	00007517          	auipc	a0,0x7
ffffffffc020630c:	29050513          	addi	a0,a0,656 # ffffffffc020d598 <CSWTCH.79+0x2d0>
ffffffffc0206310:	e97f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206314:	60a2                	ld	ra,8(sp)
ffffffffc0206316:	4501                	li	a0,0
ffffffffc0206318:	0141                	addi	sp,sp,16
ffffffffc020631a:	8082                	ret
ffffffffc020631c:	00007697          	auipc	a3,0x7
ffffffffc0206320:	1bc68693          	addi	a3,a3,444 # ffffffffc020d4d8 <CSWTCH.79+0x210>
ffffffffc0206324:	00005617          	auipc	a2,0x5
ffffffffc0206328:	5a460613          	addi	a2,a2,1444 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020632c:	4c300593          	li	a1,1219
ffffffffc0206330:	00007517          	auipc	a0,0x7
ffffffffc0206334:	0a850513          	addi	a0,a0,168 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc0206338:	966fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020633c:	00007617          	auipc	a2,0x7
ffffffffc0206340:	15460613          	addi	a2,a2,340 # ffffffffc020d490 <CSWTCH.79+0x1c8>
ffffffffc0206344:	4b600593          	li	a1,1206
ffffffffc0206348:	00007517          	auipc	a0,0x7
ffffffffc020634c:	09050513          	addi	a0,a0,144 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc0206350:	94efa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206354:	86aa                	mv	a3,a0
ffffffffc0206356:	00007617          	auipc	a2,0x7
ffffffffc020635a:	11a60613          	addi	a2,a2,282 # ffffffffc020d470 <CSWTCH.79+0x1a8>
ffffffffc020635e:	4ae00593          	li	a1,1198
ffffffffc0206362:	00007517          	auipc	a0,0x7
ffffffffc0206366:	07650513          	addi	a0,a0,118 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc020636a:	934fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020636e:	00007697          	auipc	a3,0x7
ffffffffc0206372:	1fa68693          	addi	a3,a3,506 # ffffffffc020d568 <CSWTCH.79+0x2a0>
ffffffffc0206376:	00005617          	auipc	a2,0x5
ffffffffc020637a:	55260613          	addi	a2,a2,1362 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020637e:	4c600593          	li	a1,1222
ffffffffc0206382:	00007517          	auipc	a0,0x7
ffffffffc0206386:	05650513          	addi	a0,a0,86 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc020638a:	914fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020638e:	00007697          	auipc	a3,0x7
ffffffffc0206392:	1aa68693          	addi	a3,a3,426 # ffffffffc020d538 <CSWTCH.79+0x270>
ffffffffc0206396:	00005617          	auipc	a2,0x5
ffffffffc020639a:	53260613          	addi	a2,a2,1330 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020639e:	4c500593          	li	a1,1221
ffffffffc02063a2:	00007517          	auipc	a0,0x7
ffffffffc02063a6:	03650513          	addi	a0,a0,54 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc02063aa:	8f4fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02063ae:	00007697          	auipc	a3,0x7
ffffffffc02063b2:	17a68693          	addi	a3,a3,378 # ffffffffc020d528 <CSWTCH.79+0x260>
ffffffffc02063b6:	00005617          	auipc	a2,0x5
ffffffffc02063ba:	51260613          	addi	a2,a2,1298 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02063be:	4c400593          	li	a1,1220
ffffffffc02063c2:	00007517          	auipc	a0,0x7
ffffffffc02063c6:	01650513          	addi	a0,a0,22 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc02063ca:	8d4fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02063ce <do_execve>:
ffffffffc02063ce:	dd010113          	addi	sp,sp,-560
ffffffffc02063d2:	20913c23          	sd	s1,536(sp)
ffffffffc02063d6:	00090497          	auipc	s1,0x90
ffffffffc02063da:	4ea48493          	addi	s1,s1,1258 # ffffffffc02968c0 <current>
ffffffffc02063de:	6094                	ld	a3,0(s1)
ffffffffc02063e0:	21413023          	sd	s4,512(sp)
ffffffffc02063e4:	fff58a1b          	addiw	s4,a1,-1
ffffffffc02063e8:	f7de                	sd	s7,488(sp)
ffffffffc02063ea:	22113423          	sd	ra,552(sp)
ffffffffc02063ee:	22813023          	sd	s0,544(sp)
ffffffffc02063f2:	21213823          	sd	s2,528(sp)
ffffffffc02063f6:	21313423          	sd	s3,520(sp)
ffffffffc02063fa:	ffd6                	sd	s5,504(sp)
ffffffffc02063fc:	fbda                	sd	s6,496(sp)
ffffffffc02063fe:	f3e2                	sd	s8,480(sp)
ffffffffc0206400:	efe6                	sd	s9,472(sp)
ffffffffc0206402:	ebea                	sd	s10,464(sp)
ffffffffc0206404:	e7ee                	sd	s11,456(sp)
ffffffffc0206406:	000a071b          	sext.w	a4,s4
ffffffffc020640a:	47fd                	li	a5,31
ffffffffc020640c:	0286bb83          	ld	s7,40(a3)
ffffffffc0206410:	30e7e263          	bltu	a5,a4,ffffffffc0206714 <do_execve+0x346>
ffffffffc0206414:	842e                	mv	s0,a1
ffffffffc0206416:	892a                	mv	s2,a0
ffffffffc0206418:	8cb2                	mv	s9,a2
ffffffffc020641a:	4581                	li	a1,0
ffffffffc020641c:	4641                	li	a2,16
ffffffffc020641e:	1888                	addi	a0,sp,112
ffffffffc0206420:	7c1040ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc0206424:	000b8b63          	beqz	s7,ffffffffc020643a <do_execve+0x6c>
ffffffffc0206428:	038b8513          	addi	a0,s7,56
ffffffffc020642c:	896fe0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0206430:	609c                	ld	a5,0(s1)
ffffffffc0206432:	c781                	beqz	a5,ffffffffc020643a <do_execve+0x6c>
ffffffffc0206434:	43dc                	lw	a5,4(a5)
ffffffffc0206436:	04fba823          	sw	a5,80(s7)
ffffffffc020643a:	20090f63          	beqz	s2,ffffffffc0206658 <do_execve+0x28a>
ffffffffc020643e:	46c1                	li	a3,16
ffffffffc0206440:	864a                	mv	a2,s2
ffffffffc0206442:	188c                	addi	a1,sp,112
ffffffffc0206444:	855e                	mv	a0,s7
ffffffffc0206446:	ea5fd0ef          	jal	ra,ffffffffc02042ea <copy_string>
ffffffffc020644a:	50050f63          	beqz	a0,ffffffffc0206968 <do_execve+0x59a>
ffffffffc020644e:	00341a93          	slli	s5,s0,0x3
ffffffffc0206452:	4681                	li	a3,0
ffffffffc0206454:	8656                	mv	a2,s5
ffffffffc0206456:	85e6                	mv	a1,s9
ffffffffc0206458:	855e                	mv	a0,s7
ffffffffc020645a:	d97fd0ef          	jal	ra,ffffffffc02041f0 <user_mem_check>
ffffffffc020645e:	8b66                	mv	s6,s9
ffffffffc0206460:	46050b63          	beqz	a0,ffffffffc02068d6 <do_execve+0x508>
ffffffffc0206464:	0c010c13          	addi	s8,sp,192
ffffffffc0206468:	4981                	li	s3,0
ffffffffc020646a:	6505                	lui	a0,0x1
ffffffffc020646c:	b23fb0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0206470:	892a                	mv	s2,a0
ffffffffc0206472:	16050663          	beqz	a0,ffffffffc02065de <do_execve+0x210>
ffffffffc0206476:	000b3603          	ld	a2,0(s6)
ffffffffc020647a:	85aa                	mv	a1,a0
ffffffffc020647c:	6685                	lui	a3,0x1
ffffffffc020647e:	855e                	mv	a0,s7
ffffffffc0206480:	e6bfd0ef          	jal	ra,ffffffffc02042ea <copy_string>
ffffffffc0206484:	1c050563          	beqz	a0,ffffffffc020664e <do_execve+0x280>
ffffffffc0206488:	012c3023          	sd	s2,0(s8)
ffffffffc020648c:	2985                	addiw	s3,s3,1
ffffffffc020648e:	0c21                	addi	s8,s8,8
ffffffffc0206490:	0b21                	addi	s6,s6,8
ffffffffc0206492:	fd341ce3          	bne	s0,s3,ffffffffc020646a <do_execve+0x9c>
ffffffffc0206496:	000cb903          	ld	s2,0(s9)
ffffffffc020649a:	100b8263          	beqz	s7,ffffffffc020659e <do_execve+0x1d0>
ffffffffc020649e:	038b8513          	addi	a0,s7,56
ffffffffc02064a2:	81cfe0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc02064a6:	609c                	ld	a5,0(s1)
ffffffffc02064a8:	040ba823          	sw	zero,80(s7)
ffffffffc02064ac:	1487b503          	ld	a0,328(a5)
ffffffffc02064b0:	d49fe0ef          	jal	ra,ffffffffc02051f8 <files_closeall>
ffffffffc02064b4:	4581                	li	a1,0
ffffffffc02064b6:	854a                	mv	a0,s2
ffffffffc02064b8:	fcdfe0ef          	jal	ra,ffffffffc0205484 <sysfile_open>
ffffffffc02064bc:	89aa                	mv	s3,a0
ffffffffc02064be:	0a054b63          	bltz	a0,ffffffffc0206574 <do_execve+0x1a6>
ffffffffc02064c2:	00090797          	auipc	a5,0x90
ffffffffc02064c6:	3ce7b783          	ld	a5,974(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc02064ca:	577d                	li	a4,-1
ffffffffc02064cc:	177e                	slli	a4,a4,0x3f
ffffffffc02064ce:	83b1                	srli	a5,a5,0xc
ffffffffc02064d0:	8fd9                	or	a5,a5,a4
ffffffffc02064d2:	18079073          	csrw	satp,a5
ffffffffc02064d6:	030ba783          	lw	a5,48(s7)
ffffffffc02064da:	fff7871b          	addiw	a4,a5,-1
ffffffffc02064de:	02eba823          	sw	a4,48(s7)
ffffffffc02064e2:	18070663          	beqz	a4,ffffffffc020666e <do_execve+0x2a0>
ffffffffc02064e6:	609c                	ld	a5,0(s1)
ffffffffc02064e8:	0207b423          	sd	zero,40(a5)
ffffffffc02064ec:	e7afd0ef          	jal	ra,ffffffffc0203b66 <mm_create>
ffffffffc02064f0:	892a                	mv	s2,a0
ffffffffc02064f2:	0e050463          	beqz	a0,ffffffffc02065da <do_execve+0x20c>
ffffffffc02064f6:	4505                	li	a0,1
ffffffffc02064f8:	c75fb0ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02064fc:	cd61                	beqz	a0,ffffffffc02065d4 <do_execve+0x206>
ffffffffc02064fe:	00090d17          	auipc	s10,0x90
ffffffffc0206502:	3aad0d13          	addi	s10,s10,938 # ffffffffc02968a8 <pages>
ffffffffc0206506:	000d3683          	ld	a3,0(s10)
ffffffffc020650a:	00009d97          	auipc	s11,0x9
ffffffffc020650e:	21edbd83          	ld	s11,542(s11) # ffffffffc020f728 <nbase>
ffffffffc0206512:	00090b97          	auipc	s7,0x90
ffffffffc0206516:	38eb8b93          	addi	s7,s7,910 # ffffffffc02968a0 <npage>
ffffffffc020651a:	40d506b3          	sub	a3,a0,a3
ffffffffc020651e:	8699                	srai	a3,a3,0x6
ffffffffc0206520:	96ee                	add	a3,a3,s11
ffffffffc0206522:	000bb703          	ld	a4,0(s7)
ffffffffc0206526:	00c69793          	slli	a5,a3,0xc
ffffffffc020652a:	83b1                	srli	a5,a5,0xc
ffffffffc020652c:	06b2                	slli	a3,a3,0xc
ffffffffc020652e:	64e7f063          	bgeu	a5,a4,ffffffffc0206b6e <do_execve+0x7a0>
ffffffffc0206532:	00090c97          	auipc	s9,0x90
ffffffffc0206536:	386c8c93          	addi	s9,s9,902 # ffffffffc02968b8 <va_pa_offset>
ffffffffc020653a:	000cbb03          	ld	s6,0(s9)
ffffffffc020653e:	6605                	lui	a2,0x1
ffffffffc0206540:	00090597          	auipc	a1,0x90
ffffffffc0206544:	3585b583          	ld	a1,856(a1) # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0206548:	9b36                	add	s6,s6,a3
ffffffffc020654a:	855a                	mv	a0,s6
ffffffffc020654c:	6e7040ef          	jal	ra,ffffffffc020b432 <memcpy>
ffffffffc0206550:	4601                	li	a2,0
ffffffffc0206552:	01693c23          	sd	s6,24(s2) # ffffffff80000018 <_binary_bin_sfs_img_size+0xffffffff7ff8ad18>
ffffffffc0206556:	4581                	li	a1,0
ffffffffc0206558:	854e                	mv	a0,s3
ffffffffc020655a:	990ff0ef          	jal	ra,ffffffffc02056ea <sysfile_seek>
ffffffffc020655e:	8c2a                	mv	s8,a0
ffffffffc0206560:	12050263          	beqz	a0,ffffffffc0206684 <do_execve+0x2b6>
ffffffffc0206564:	01893503          	ld	a0,24(s2)
ffffffffc0206568:	89e2                	mv	s3,s8
ffffffffc020656a:	c70ff0ef          	jal	ra,ffffffffc02059da <put_pgdir.isra.0>
ffffffffc020656e:	854a                	mv	a0,s2
ffffffffc0206570:	f44fd0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc0206574:	020a1793          	slli	a5,s4,0x20
ffffffffc0206578:	147d                	addi	s0,s0,-1
ffffffffc020657a:	1904                	addi	s1,sp,176
ffffffffc020657c:	01d7da13          	srli	s4,a5,0x1d
ffffffffc0206580:	040e                	slli	s0,s0,0x3
ffffffffc0206582:	94d6                	add	s1,s1,s5
ffffffffc0206584:	019c                	addi	a5,sp,192
ffffffffc0206586:	943e                	add	s0,s0,a5
ffffffffc0206588:	414484b3          	sub	s1,s1,s4
ffffffffc020658c:	6008                	ld	a0,0(s0)
ffffffffc020658e:	1461                	addi	s0,s0,-8
ffffffffc0206590:	aaffb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206594:	fe849ce3          	bne	s1,s0,ffffffffc020658c <do_execve+0x1be>
ffffffffc0206598:	854e                	mv	a0,s3
ffffffffc020659a:	9b1ff0ef          	jal	ra,ffffffffc0205f4a <do_exit>
ffffffffc020659e:	609c                	ld	a5,0(s1)
ffffffffc02065a0:	1487b503          	ld	a0,328(a5)
ffffffffc02065a4:	c55fe0ef          	jal	ra,ffffffffc02051f8 <files_closeall>
ffffffffc02065a8:	4581                	li	a1,0
ffffffffc02065aa:	854a                	mv	a0,s2
ffffffffc02065ac:	ed9fe0ef          	jal	ra,ffffffffc0205484 <sysfile_open>
ffffffffc02065b0:	89aa                	mv	s3,a0
ffffffffc02065b2:	fc0541e3          	bltz	a0,ffffffffc0206574 <do_execve+0x1a6>
ffffffffc02065b6:	609c                	ld	a5,0(s1)
ffffffffc02065b8:	779c                	ld	a5,40(a5)
ffffffffc02065ba:	db8d                	beqz	a5,ffffffffc02064ec <do_execve+0x11e>
ffffffffc02065bc:	00007617          	auipc	a2,0x7
ffffffffc02065c0:	00c60613          	addi	a2,a2,12 # ffffffffc020d5c8 <CSWTCH.79+0x300>
ffffffffc02065c4:	2cc00593          	li	a1,716
ffffffffc02065c8:	00007517          	auipc	a0,0x7
ffffffffc02065cc:	e1050513          	addi	a0,a0,-496 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc02065d0:	ecff90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02065d4:	854a                	mv	a0,s2
ffffffffc02065d6:	edefd0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc02065da:	59f1                	li	s3,-4
ffffffffc02065dc:	bf61                	j	ffffffffc0206574 <do_execve+0x1a6>
ffffffffc02065de:	5b71                	li	s6,-4
ffffffffc02065e0:	02098863          	beqz	s3,ffffffffc0206610 <do_execve+0x242>
ffffffffc02065e4:	00399713          	slli	a4,s3,0x3
ffffffffc02065e8:	fff98413          	addi	s0,s3,-1 # 1fff <_binary_bin_swap_img_size-0x5d01>
ffffffffc02065ec:	191c                	addi	a5,sp,176
ffffffffc02065ee:	39fd                	addiw	s3,s3,-1
ffffffffc02065f0:	97ba                	add	a5,a5,a4
ffffffffc02065f2:	02099713          	slli	a4,s3,0x20
ffffffffc02065f6:	01d75993          	srli	s3,a4,0x1d
ffffffffc02065fa:	040e                	slli	s0,s0,0x3
ffffffffc02065fc:	0198                	addi	a4,sp,192
ffffffffc02065fe:	943a                	add	s0,s0,a4
ffffffffc0206600:	413789b3          	sub	s3,a5,s3
ffffffffc0206604:	6008                	ld	a0,0(s0)
ffffffffc0206606:	1461                	addi	s0,s0,-8
ffffffffc0206608:	a37fb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020660c:	fe899ce3          	bne	s3,s0,ffffffffc0206604 <do_execve+0x236>
ffffffffc0206610:	000b8863          	beqz	s7,ffffffffc0206620 <do_execve+0x252>
ffffffffc0206614:	038b8513          	addi	a0,s7,56
ffffffffc0206618:	ea7fd0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020661c:	040ba823          	sw	zero,80(s7)
ffffffffc0206620:	22813083          	ld	ra,552(sp)
ffffffffc0206624:	22013403          	ld	s0,544(sp)
ffffffffc0206628:	21813483          	ld	s1,536(sp)
ffffffffc020662c:	21013903          	ld	s2,528(sp)
ffffffffc0206630:	20813983          	ld	s3,520(sp)
ffffffffc0206634:	20013a03          	ld	s4,512(sp)
ffffffffc0206638:	7afe                	ld	s5,504(sp)
ffffffffc020663a:	7bbe                	ld	s7,488(sp)
ffffffffc020663c:	7c1e                	ld	s8,480(sp)
ffffffffc020663e:	6cfe                	ld	s9,472(sp)
ffffffffc0206640:	6d5e                	ld	s10,464(sp)
ffffffffc0206642:	6dbe                	ld	s11,456(sp)
ffffffffc0206644:	855a                	mv	a0,s6
ffffffffc0206646:	7b5e                	ld	s6,496(sp)
ffffffffc0206648:	23010113          	addi	sp,sp,560
ffffffffc020664c:	8082                	ret
ffffffffc020664e:	854a                	mv	a0,s2
ffffffffc0206650:	9effb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206654:	5b75                	li	s6,-3
ffffffffc0206656:	b769                	j	ffffffffc02065e0 <do_execve+0x212>
ffffffffc0206658:	609c                	ld	a5,0(s1)
ffffffffc020665a:	00007617          	auipc	a2,0x7
ffffffffc020665e:	f5e60613          	addi	a2,a2,-162 # ffffffffc020d5b8 <CSWTCH.79+0x2f0>
ffffffffc0206662:	45c1                	li	a1,16
ffffffffc0206664:	43d4                	lw	a3,4(a5)
ffffffffc0206666:	1888                	addi	a0,sp,112
ffffffffc0206668:	489040ef          	jal	ra,ffffffffc020b2f0 <snprintf>
ffffffffc020666c:	b3cd                	j	ffffffffc020644e <do_execve+0x80>
ffffffffc020666e:	855e                	mv	a0,s7
ffffffffc0206670:	fe0fd0ef          	jal	ra,ffffffffc0203e50 <exit_mmap>
ffffffffc0206674:	018bb503          	ld	a0,24(s7)
ffffffffc0206678:	b62ff0ef          	jal	ra,ffffffffc02059da <put_pgdir.isra.0>
ffffffffc020667c:	855e                	mv	a0,s7
ffffffffc020667e:	e36fd0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc0206682:	b595                	j	ffffffffc02064e6 <do_execve+0x118>
ffffffffc0206684:	04000613          	li	a2,64
ffffffffc0206688:	010c                	addi	a1,sp,128
ffffffffc020668a:	854e                	mv	a0,s3
ffffffffc020668c:	e31fe0ef          	jal	ra,ffffffffc02054bc <sysfile_read>
ffffffffc0206690:	04000793          	li	a5,64
ffffffffc0206694:	00f50863          	beq	a0,a5,ffffffffc02066a4 <do_execve+0x2d6>
ffffffffc0206698:	00050c1b          	sext.w	s8,a0
ffffffffc020669c:	ec0544e3          	bltz	a0,ffffffffc0206564 <do_execve+0x196>
ffffffffc02066a0:	5c7d                	li	s8,-1
ffffffffc02066a2:	b5c9                	j	ffffffffc0206564 <do_execve+0x196>
ffffffffc02066a4:	470a                	lw	a4,128(sp)
ffffffffc02066a6:	464c47b7          	lui	a5,0x464c4
ffffffffc02066aa:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_bin_sfs_img_size+0x4644f27f>
ffffffffc02066ae:	00f70b63          	beq	a4,a5,ffffffffc02066c4 <do_execve+0x2f6>
ffffffffc02066b2:	01893503          	ld	a0,24(s2)
ffffffffc02066b6:	59e1                	li	s3,-8
ffffffffc02066b8:	b22ff0ef          	jal	ra,ffffffffc02059da <put_pgdir.isra.0>
ffffffffc02066bc:	854a                	mv	a0,s2
ffffffffc02066be:	df6fd0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc02066c2:	bd4d                	j	ffffffffc0206574 <do_execve+0x1a6>
ffffffffc02066c4:	0b815783          	lhu	a5,184(sp)
ffffffffc02066c8:	00379513          	slli	a0,a5,0x3
ffffffffc02066cc:	8d1d                	sub	a0,a0,a5
ffffffffc02066ce:	050e                	slli	a0,a0,0x3
ffffffffc02066d0:	8bffb0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02066d4:	e42a                	sd	a0,8(sp)
ffffffffc02066d6:	1c050f63          	beqz	a0,ffffffffc02068b4 <do_execve+0x4e6>
ffffffffc02066da:	758a                	ld	a1,160(sp)
ffffffffc02066dc:	4601                	li	a2,0
ffffffffc02066de:	854e                	mv	a0,s3
ffffffffc02066e0:	0b815c03          	lhu	s8,184(sp)
ffffffffc02066e4:	806ff0ef          	jal	ra,ffffffffc02056ea <sysfile_seek>
ffffffffc02066e8:	8b2a                	mv	s6,a0
ffffffffc02066ea:	c51d                	beqz	a0,ffffffffc0206718 <do_execve+0x34a>
ffffffffc02066ec:	0b815503          	lhu	a0,184(sp)
ffffffffc02066f0:	6785                	lui	a5,0x1
ffffffffc02066f2:	c4078793          	addi	a5,a5,-960 # c40 <_binary_bin_swap_img_size-0x70c0>
ffffffffc02066f6:	02f50533          	mul	a0,a0,a5
ffffffffc02066fa:	89da                	mv	s3,s6
ffffffffc02066fc:	40a00533          	neg	a0,a0
ffffffffc0206700:	93ffb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206704:	01893503          	ld	a0,24(s2)
ffffffffc0206708:	ad2ff0ef          	jal	ra,ffffffffc02059da <put_pgdir.isra.0>
ffffffffc020670c:	854a                	mv	a0,s2
ffffffffc020670e:	da6fd0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc0206712:	b58d                	j	ffffffffc0206574 <do_execve+0x1a6>
ffffffffc0206714:	5b75                	li	s6,-3
ffffffffc0206716:	b729                	j	ffffffffc0206620 <do_execve+0x252>
ffffffffc0206718:	003c1793          	slli	a5,s8,0x3
ffffffffc020671c:	41878c33          	sub	s8,a5,s8
ffffffffc0206720:	65a2                	ld	a1,8(sp)
ffffffffc0206722:	0c0e                	slli	s8,s8,0x3
ffffffffc0206724:	8662                	mv	a2,s8
ffffffffc0206726:	854e                	mv	a0,s3
ffffffffc0206728:	d95fe0ef          	jal	ra,ffffffffc02054bc <sysfile_read>
ffffffffc020672c:	00ac0863          	beq	s8,a0,ffffffffc020673c <do_execve+0x36e>
ffffffffc0206730:	00050b1b          	sext.w	s6,a0
ffffffffc0206734:	fa054ce3          	bltz	a0,ffffffffc02066ec <do_execve+0x31e>
ffffffffc0206738:	5b7d                	li	s6,-1
ffffffffc020673a:	bf4d                	j	ffffffffc02066ec <do_execve+0x31e>
ffffffffc020673c:	0b815703          	lhu	a4,184(sp)
ffffffffc0206740:	66a2                	ld	a3,8(sp)
ffffffffc0206742:	00371793          	slli	a5,a4,0x3
ffffffffc0206746:	8f99                	sub	a5,a5,a4
ffffffffc0206748:	078e                	slli	a5,a5,0x3
ffffffffc020674a:	97b6                	add	a5,a5,a3
ffffffffc020674c:	e0be                	sd	a5,64(sp)
ffffffffc020674e:	32f6f763          	bgeu	a3,a5,ffffffffc0206a7c <do_execve+0x6ae>
ffffffffc0206752:	57fd                	li	a5,-1
ffffffffc0206754:	83b1                	srli	a5,a5,0xc
ffffffffc0206756:	e4d6                	sd	s5,72(sp)
ffffffffc0206758:	e8a2                	sd	s0,80(sp)
ffffffffc020675a:	f43e                	sd	a5,40(sp)
ffffffffc020675c:	6442                	ld	s0,16(sp)
ffffffffc020675e:	e44a                	sd	s2,8(sp)
ffffffffc0206760:	8ab6                	mv	s5,a3
ffffffffc0206762:	fc6e                	sd	s11,56(sp)
ffffffffc0206764:	ec4e                	sd	s3,24(sp)
ffffffffc0206766:	f0da                	sd	s6,96(sp)
ffffffffc0206768:	ced2                	sw	s4,92(sp)
ffffffffc020676a:	a031                	j	ffffffffc0206776 <do_execve+0x3a8>
ffffffffc020676c:	6786                	ld	a5,64(sp)
ffffffffc020676e:	038a8a93          	addi	s5,s5,56 # 1038 <_binary_bin_swap_img_size-0x6cc8>
ffffffffc0206772:	2efafe63          	bgeu	s5,a5,ffffffffc0206a6e <do_execve+0x6a0>
ffffffffc0206776:	000aa783          	lw	a5,0(s5)
ffffffffc020677a:	4705                	li	a4,1
ffffffffc020677c:	fee798e3          	bne	a5,a4,ffffffffc020676c <do_execve+0x39e>
ffffffffc0206780:	020ab783          	ld	a5,32(s5)
ffffffffc0206784:	028ab603          	ld	a2,40(s5)
ffffffffc0206788:	32f66763          	bltu	a2,a5,ffffffffc0206ab6 <do_execve+0x6e8>
ffffffffc020678c:	d3e5                	beqz	a5,ffffffffc020676c <do_execve+0x39e>
ffffffffc020678e:	004aa783          	lw	a5,4(s5)
ffffffffc0206792:	0017f693          	andi	a3,a5,1
ffffffffc0206796:	c291                	beqz	a3,ffffffffc020679a <do_execve+0x3cc>
ffffffffc0206798:	4691                	li	a3,4
ffffffffc020679a:	0027f713          	andi	a4,a5,2
ffffffffc020679e:	8b91                	andi	a5,a5,4
ffffffffc02067a0:	12070663          	beqz	a4,ffffffffc02068cc <do_execve+0x4fe>
ffffffffc02067a4:	0026e693          	ori	a3,a3,2
ffffffffc02067a8:	10078f63          	beqz	a5,ffffffffc02068c6 <do_execve+0x4f8>
ffffffffc02067ac:	47cd                	li	a5,19
ffffffffc02067ae:	0016e693          	ori	a3,a3,1
ffffffffc02067b2:	f83e                	sd	a5,48(sp)
ffffffffc02067b4:	0026f793          	andi	a5,a3,2
ffffffffc02067b8:	10079763          	bnez	a5,ffffffffc02068c6 <do_execve+0x4f8>
ffffffffc02067bc:	0046f793          	andi	a5,a3,4
ffffffffc02067c0:	c789                	beqz	a5,ffffffffc02067ca <do_execve+0x3fc>
ffffffffc02067c2:	77c2                	ld	a5,48(sp)
ffffffffc02067c4:	0087e793          	ori	a5,a5,8
ffffffffc02067c8:	f83e                	sd	a5,48(sp)
ffffffffc02067ca:	010ab583          	ld	a1,16(s5)
ffffffffc02067ce:	6522                	ld	a0,8(sp)
ffffffffc02067d0:	4701                	li	a4,0
ffffffffc02067d2:	d34fd0ef          	jal	ra,ffffffffc0203d06 <mm_map>
ffffffffc02067d6:	e82a                	sd	a0,16(sp)
ffffffffc02067d8:	e969                	bnez	a0,ffffffffc02068aa <do_execve+0x4dc>
ffffffffc02067da:	010ab903          	ld	s2,16(s5)
ffffffffc02067de:	020abb03          	ld	s6,32(s5)
ffffffffc02067e2:	777d                	lui	a4,0xfffff
ffffffffc02067e4:	008aba03          	ld	s4,8(s5)
ffffffffc02067e8:	9b4a                	add	s6,s6,s2
ffffffffc02067ea:	87ca                	mv	a5,s2
ffffffffc02067ec:	00e97c33          	and	s8,s2,a4
ffffffffc02067f0:	2b697f63          	bgeu	s2,s6,ffffffffc0206aae <do_execve+0x6e0>
ffffffffc02067f4:	57f1                	li	a5,-4
ffffffffc02067f6:	f4d6                	sd	s5,104(sp)
ffffffffc02067f8:	e83e                	sd	a5,16(sp)
ffffffffc02067fa:	8ae2                	mv	s5,s8
ffffffffc02067fc:	67a2                	ld	a5,8(sp)
ffffffffc02067fe:	7642                	ld	a2,48(sp)
ffffffffc0206800:	85d6                	mv	a1,s5
ffffffffc0206802:	6f88                	ld	a0,24(a5)
ffffffffc0206804:	a7cfd0ef          	jal	ra,ffffffffc0203a80 <pgdir_alloc_page>
ffffffffc0206808:	8daa                	mv	s11,a0
ffffffffc020680a:	16050963          	beqz	a0,ffffffffc020697c <do_execve+0x5ae>
ffffffffc020680e:	6785                	lui	a5,0x1
ffffffffc0206810:	00fa8c33          	add	s8,s5,a5
ffffffffc0206814:	412c0433          	sub	s0,s8,s2
ffffffffc0206818:	018b7463          	bgeu	s6,s8,ffffffffc0206820 <do_execve+0x452>
ffffffffc020681c:	412b0433          	sub	s0,s6,s2
ffffffffc0206820:	000d3983          	ld	s3,0(s10)
ffffffffc0206824:	77e2                	ld	a5,56(sp)
ffffffffc0206826:	000bb603          	ld	a2,0(s7)
ffffffffc020682a:	413d89b3          	sub	s3,s11,s3
ffffffffc020682e:	4069d993          	srai	s3,s3,0x6
ffffffffc0206832:	99be                	add	s3,s3,a5
ffffffffc0206834:	77a2                	ld	a5,40(sp)
ffffffffc0206836:	00f9f5b3          	and	a1,s3,a5
ffffffffc020683a:	00c99793          	slli	a5,s3,0xc
ffffffffc020683e:	f03e                	sd	a5,32(sp)
ffffffffc0206840:	32c5f663          	bgeu	a1,a2,ffffffffc0206b6c <do_execve+0x79e>
ffffffffc0206844:	6562                	ld	a0,24(sp)
ffffffffc0206846:	4601                	li	a2,0
ffffffffc0206848:	85d2                	mv	a1,s4
ffffffffc020684a:	000cb983          	ld	s3,0(s9)
ffffffffc020684e:	e9dfe0ef          	jal	ra,ffffffffc02056ea <sysfile_seek>
ffffffffc0206852:	e82a                	sd	a0,16(sp)
ffffffffc0206854:	e939                	bnez	a0,ffffffffc02068aa <do_execve+0x4dc>
ffffffffc0206856:	7782                	ld	a5,32(sp)
ffffffffc0206858:	6562                	ld	a0,24(sp)
ffffffffc020685a:	415905b3          	sub	a1,s2,s5
ffffffffc020685e:	97ce                	add	a5,a5,s3
ffffffffc0206860:	8622                	mv	a2,s0
ffffffffc0206862:	95be                	add	a1,a1,a5
ffffffffc0206864:	c59fe0ef          	jal	ra,ffffffffc02054bc <sysfile_read>
ffffffffc0206868:	02a40b63          	beq	s0,a0,ffffffffc020689e <do_execve+0x4d0>
ffffffffc020686c:	6aa6                	ld	s5,72(sp)
ffffffffc020686e:	6922                	ld	s2,8(sp)
ffffffffc0206870:	6446                	ld	s0,80(sp)
ffffffffc0206872:	4a76                	lw	s4,92(sp)
ffffffffc0206874:	0005079b          	sext.w	a5,a0
ffffffffc0206878:	00054363          	bltz	a0,ffffffffc020687e <do_execve+0x4b0>
ffffffffc020687c:	57fd                	li	a5,-1
ffffffffc020687e:	e83e                	sd	a5,16(sp)
ffffffffc0206880:	854a                	mv	a0,s2
ffffffffc0206882:	dcefd0ef          	jal	ra,ffffffffc0203e50 <exit_mmap>
ffffffffc0206886:	0b815503          	lhu	a0,184(sp)
ffffffffc020688a:	6785                	lui	a5,0x1
ffffffffc020688c:	c4078793          	addi	a5,a5,-960 # c40 <_binary_bin_swap_img_size-0x70c0>
ffffffffc0206890:	02f50533          	mul	a0,a0,a5
ffffffffc0206894:	6786                	ld	a5,64(sp)
ffffffffc0206896:	69c2                	ld	s3,16(sp)
ffffffffc0206898:	40a78533          	sub	a0,a5,a0
ffffffffc020689c:	b595                	j	ffffffffc0206700 <do_execve+0x332>
ffffffffc020689e:	9922                	add	s2,s2,s0
ffffffffc02068a0:	9a22                	add	s4,s4,s0
ffffffffc02068a2:	03697e63          	bgeu	s2,s6,ffffffffc02068de <do_execve+0x510>
ffffffffc02068a6:	8ae2                	mv	s5,s8
ffffffffc02068a8:	bf91                	j	ffffffffc02067fc <do_execve+0x42e>
ffffffffc02068aa:	6aa6                	ld	s5,72(sp)
ffffffffc02068ac:	6922                	ld	s2,8(sp)
ffffffffc02068ae:	6446                	ld	s0,80(sp)
ffffffffc02068b0:	4a76                	lw	s4,92(sp)
ffffffffc02068b2:	b7f9                	j	ffffffffc0206880 <do_execve+0x4b2>
ffffffffc02068b4:	01893503          	ld	a0,24(s2)
ffffffffc02068b8:	59f1                	li	s3,-4
ffffffffc02068ba:	920ff0ef          	jal	ra,ffffffffc02059da <put_pgdir.isra.0>
ffffffffc02068be:	854a                	mv	a0,s2
ffffffffc02068c0:	bf4fd0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc02068c4:	b945                	j	ffffffffc0206574 <do_execve+0x1a6>
ffffffffc02068c6:	47dd                	li	a5,23
ffffffffc02068c8:	f83e                	sd	a5,48(sp)
ffffffffc02068ca:	bdcd                	j	ffffffffc02067bc <do_execve+0x3ee>
ffffffffc02068cc:	4745                	li	a4,17
ffffffffc02068ce:	f83a                	sd	a4,48(sp)
ffffffffc02068d0:	ee0782e3          	beqz	a5,ffffffffc02067b4 <do_execve+0x3e6>
ffffffffc02068d4:	bde1                	j	ffffffffc02067ac <do_execve+0x3de>
ffffffffc02068d6:	5b75                	li	s6,-3
ffffffffc02068d8:	d20b9ee3          	bnez	s7,ffffffffc0206614 <do_execve+0x246>
ffffffffc02068dc:	b391                	j	ffffffffc0206620 <do_execve+0x252>
ffffffffc02068de:	7aa6                	ld	s5,104(sp)
ffffffffc02068e0:	846e                	mv	s0,s11
ffffffffc02068e2:	8de2                	mv	s11,s8
ffffffffc02068e4:	010ab783          	ld	a5,16(s5)
ffffffffc02068e8:	028aba03          	ld	s4,40(s5)
ffffffffc02068ec:	9a3e                	add	s4,s4,a5
ffffffffc02068ee:	11b97963          	bgeu	s2,s11,ffffffffc0206a00 <do_execve+0x632>
ffffffffc02068f2:	e72a0de3          	beq	s4,s2,ffffffffc020676c <do_execve+0x39e>
ffffffffc02068f6:	6785                	lui	a5,0x1
ffffffffc02068f8:	00f90533          	add	a0,s2,a5
ffffffffc02068fc:	41b50533          	sub	a0,a0,s11
ffffffffc0206900:	412a0b33          	sub	s6,s4,s2
ffffffffc0206904:	01ba6463          	bltu	s4,s11,ffffffffc020690c <do_execve+0x53e>
ffffffffc0206908:	412d8b33          	sub	s6,s11,s2
ffffffffc020690c:	000d3783          	ld	a5,0(s10)
ffffffffc0206910:	7762                	ld	a4,56(sp)
ffffffffc0206912:	000bb603          	ld	a2,0(s7)
ffffffffc0206916:	40f407b3          	sub	a5,s0,a5
ffffffffc020691a:	8799                	srai	a5,a5,0x6
ffffffffc020691c:	97ba                	add	a5,a5,a4
ffffffffc020691e:	7722                	ld	a4,40(sp)
ffffffffc0206920:	00c79693          	slli	a3,a5,0xc
ffffffffc0206924:	00e7f5b3          	and	a1,a5,a4
ffffffffc0206928:	24c5f363          	bgeu	a1,a2,ffffffffc0206b6e <do_execve+0x7a0>
ffffffffc020692c:	000cb783          	ld	a5,0(s9)
ffffffffc0206930:	865a                	mv	a2,s6
ffffffffc0206932:	4581                	li	a1,0
ffffffffc0206934:	97b6                	add	a5,a5,a3
ffffffffc0206936:	953e                	add	a0,a0,a5
ffffffffc0206938:	2a9040ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc020693c:	012b0733          	add	a4,s6,s2
ffffffffc0206940:	0bba7d63          	bgeu	s4,s11,ffffffffc02069fa <do_execve+0x62c>
ffffffffc0206944:	e2ea04e3          	beq	s4,a4,ffffffffc020676c <do_execve+0x39e>
ffffffffc0206948:	00007697          	auipc	a3,0x7
ffffffffc020694c:	ca868693          	addi	a3,a3,-856 # ffffffffc020d5f0 <CSWTCH.79+0x328>
ffffffffc0206950:	00005617          	auipc	a2,0x5
ffffffffc0206954:	f7860613          	addi	a2,a2,-136 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0206958:	35000593          	li	a1,848
ffffffffc020695c:	00007517          	auipc	a0,0x7
ffffffffc0206960:	a7c50513          	addi	a0,a0,-1412 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc0206964:	b3bf90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206968:	da0b86e3          	beqz	s7,ffffffffc0206714 <do_execve+0x346>
ffffffffc020696c:	038b8513          	addi	a0,s7,56
ffffffffc0206970:	b4ffd0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0206974:	5b75                	li	s6,-3
ffffffffc0206976:	040ba823          	sw	zero,80(s7)
ffffffffc020697a:	b15d                	j	ffffffffc0206620 <do_execve+0x252>
ffffffffc020697c:	6aa6                	ld	s5,72(sp)
ffffffffc020697e:	6922                	ld	s2,8(sp)
ffffffffc0206980:	7b06                	ld	s6,96(sp)
ffffffffc0206982:	6446                	ld	s0,80(sp)
ffffffffc0206984:	4a76                	lw	s4,92(sp)
ffffffffc0206986:	854a                	mv	a0,s2
ffffffffc0206988:	cc8fd0ef          	jal	ra,ffffffffc0203e50 <exit_mmap>
ffffffffc020698c:	0b815503          	lhu	a0,184(sp)
ffffffffc0206990:	6785                	lui	a5,0x1
ffffffffc0206992:	c4078793          	addi	a5,a5,-960 # c40 <_binary_bin_swap_img_size-0x70c0>
ffffffffc0206996:	02f50533          	mul	a0,a0,a5
ffffffffc020699a:	6786                	ld	a5,64(sp)
ffffffffc020699c:	40a78533          	sub	a0,a5,a0
ffffffffc02069a0:	e9efb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02069a4:	01893503          	ld	a0,24(s2)
ffffffffc02069a8:	832ff0ef          	jal	ra,ffffffffc02059da <put_pgdir.isra.0>
ffffffffc02069ac:	854a                	mv	a0,s2
ffffffffc02069ae:	b06fd0ef          	jal	ra,ffffffffc0203cb4 <mm_destroy>
ffffffffc02069b2:	67c2                	ld	a5,16(sp)
ffffffffc02069b4:	1a079a63          	bnez	a5,ffffffffc0206b68 <do_execve+0x79a>
ffffffffc02069b8:	020a1793          	slli	a5,s4,0x20
ffffffffc02069bc:	147d                	addi	s0,s0,-1
ffffffffc02069be:	0b010913          	addi	s2,sp,176
ffffffffc02069c2:	01d7da13          	srli	s4,a5,0x1d
ffffffffc02069c6:	040e                	slli	s0,s0,0x3
ffffffffc02069c8:	9956                	add	s2,s2,s5
ffffffffc02069ca:	019c                	addi	a5,sp,192
ffffffffc02069cc:	943e                	add	s0,s0,a5
ffffffffc02069ce:	41490933          	sub	s2,s2,s4
ffffffffc02069d2:	6008                	ld	a0,0(s0)
ffffffffc02069d4:	1461                	addi	s0,s0,-8
ffffffffc02069d6:	e68fb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02069da:	fe891ce3          	bne	s2,s0,ffffffffc02069d2 <do_execve+0x604>
ffffffffc02069de:	6080                	ld	s0,0(s1)
ffffffffc02069e0:	4641                	li	a2,16
ffffffffc02069e2:	4581                	li	a1,0
ffffffffc02069e4:	0b440413          	addi	s0,s0,180
ffffffffc02069e8:	8522                	mv	a0,s0
ffffffffc02069ea:	1f7040ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc02069ee:	463d                	li	a2,15
ffffffffc02069f0:	188c                	addi	a1,sp,112
ffffffffc02069f2:	8522                	mv	a0,s0
ffffffffc02069f4:	23f040ef          	jal	ra,ffffffffc020b432 <memcpy>
ffffffffc02069f8:	b125                	j	ffffffffc0206620 <do_execve+0x252>
ffffffffc02069fa:	f5b717e3          	bne	a4,s11,ffffffffc0206948 <do_execve+0x57a>
ffffffffc02069fe:	896e                	mv	s2,s11
ffffffffc0206a00:	d74976e3          	bgeu	s2,s4,ffffffffc020676c <do_execve+0x39e>
ffffffffc0206a04:	69a2                	ld	s3,8(sp)
ffffffffc0206a06:	7b42                	ld	s6,48(sp)
ffffffffc0206a08:	7c62                	ld	s8,56(sp)
ffffffffc0206a0a:	a0a1                	j	ffffffffc0206a52 <do_execve+0x684>
ffffffffc0206a0c:	6785                	lui	a5,0x1
ffffffffc0206a0e:	41b90533          	sub	a0,s2,s11
ffffffffc0206a12:	9dbe                	add	s11,s11,a5
ffffffffc0206a14:	412d8633          	sub	a2,s11,s2
ffffffffc0206a18:	01ba7463          	bgeu	s4,s11,ffffffffc0206a20 <do_execve+0x652>
ffffffffc0206a1c:	412a0633          	sub	a2,s4,s2
ffffffffc0206a20:	000d3783          	ld	a5,0(s10)
ffffffffc0206a24:	76a2                	ld	a3,40(sp)
ffffffffc0206a26:	000bb703          	ld	a4,0(s7)
ffffffffc0206a2a:	40f407b3          	sub	a5,s0,a5
ffffffffc0206a2e:	8799                	srai	a5,a5,0x6
ffffffffc0206a30:	97e2                	add	a5,a5,s8
ffffffffc0206a32:	00d7f5b3          	and	a1,a5,a3
ffffffffc0206a36:	00c79693          	slli	a3,a5,0xc
ffffffffc0206a3a:	12e5fa63          	bgeu	a1,a4,ffffffffc0206b6e <do_execve+0x7a0>
ffffffffc0206a3e:	000cb783          	ld	a5,0(s9)
ffffffffc0206a42:	9932                	add	s2,s2,a2
ffffffffc0206a44:	4581                	li	a1,0
ffffffffc0206a46:	97b6                	add	a5,a5,a3
ffffffffc0206a48:	953e                	add	a0,a0,a5
ffffffffc0206a4a:	197040ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc0206a4e:	d1497fe3          	bgeu	s2,s4,ffffffffc020676c <do_execve+0x39e>
ffffffffc0206a52:	0189b503          	ld	a0,24(s3)
ffffffffc0206a56:	865a                	mv	a2,s6
ffffffffc0206a58:	85ee                	mv	a1,s11
ffffffffc0206a5a:	826fd0ef          	jal	ra,ffffffffc0203a80 <pgdir_alloc_page>
ffffffffc0206a5e:	842a                	mv	s0,a0
ffffffffc0206a60:	f555                	bnez	a0,ffffffffc0206a0c <do_execve+0x63e>
ffffffffc0206a62:	6aa6                	ld	s5,72(sp)
ffffffffc0206a64:	7b06                	ld	s6,96(sp)
ffffffffc0206a66:	6446                	ld	s0,80(sp)
ffffffffc0206a68:	4a76                	lw	s4,92(sp)
ffffffffc0206a6a:	894e                	mv	s2,s3
ffffffffc0206a6c:	bf29                	j	ffffffffc0206986 <do_execve+0x5b8>
ffffffffc0206a6e:	6aa6                	ld	s5,72(sp)
ffffffffc0206a70:	6922                	ld	s2,8(sp)
ffffffffc0206a72:	7b06                	ld	s6,96(sp)
ffffffffc0206a74:	6446                	ld	s0,80(sp)
ffffffffc0206a76:	4a76                	lw	s4,92(sp)
ffffffffc0206a78:	0b815703          	lhu	a4,184(sp)
ffffffffc0206a7c:	6785                	lui	a5,0x1
ffffffffc0206a7e:	c4078793          	addi	a5,a5,-960 # c40 <_binary_bin_swap_img_size-0x70c0>
ffffffffc0206a82:	02f70733          	mul	a4,a4,a5
ffffffffc0206a86:	6786                	ld	a5,64(sp)
ffffffffc0206a88:	40e78533          	sub	a0,a5,a4
ffffffffc0206a8c:	db2fb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206a90:	4701                	li	a4,0
ffffffffc0206a92:	46ad                	li	a3,11
ffffffffc0206a94:	00100637          	lui	a2,0x100
ffffffffc0206a98:	7ff005b7          	lui	a1,0x7ff00
ffffffffc0206a9c:	854a                	mv	a0,s2
ffffffffc0206a9e:	a68fd0ef          	jal	ra,ffffffffc0203d06 <mm_map>
ffffffffc0206aa2:	8c2a                	mv	s8,a0
ffffffffc0206aa4:	cd19                	beqz	a0,ffffffffc0206ac2 <do_execve+0x6f4>
ffffffffc0206aa6:	854a                	mv	a0,s2
ffffffffc0206aa8:	ba8fd0ef          	jal	ra,ffffffffc0203e50 <exit_mmap>
ffffffffc0206aac:	bc65                	j	ffffffffc0206564 <do_execve+0x196>
ffffffffc0206aae:	5771                	li	a4,-4
ffffffffc0206ab0:	8de2                	mv	s11,s8
ffffffffc0206ab2:	e83a                	sd	a4,16(sp)
ffffffffc0206ab4:	bd15                	j	ffffffffc02068e8 <do_execve+0x51a>
ffffffffc0206ab6:	6aa6                	ld	s5,72(sp)
ffffffffc0206ab8:	6922                	ld	s2,8(sp)
ffffffffc0206aba:	6446                	ld	s0,80(sp)
ffffffffc0206abc:	4a76                	lw	s4,92(sp)
ffffffffc0206abe:	57e1                	li	a5,-8
ffffffffc0206ac0:	bb7d                	j	ffffffffc020687e <do_execve+0x4b0>
ffffffffc0206ac2:	01893503          	ld	a0,24(s2)
ffffffffc0206ac6:	467d                	li	a2,31
ffffffffc0206ac8:	7ffff5b7          	lui	a1,0x7ffff
ffffffffc0206acc:	fb5fc0ef          	jal	ra,ffffffffc0203a80 <pgdir_alloc_page>
ffffffffc0206ad0:	12050763          	beqz	a0,ffffffffc0206bfe <do_execve+0x830>
ffffffffc0206ad4:	01893503          	ld	a0,24(s2)
ffffffffc0206ad8:	467d                	li	a2,31
ffffffffc0206ada:	7fffe5b7          	lui	a1,0x7fffe
ffffffffc0206ade:	fa3fc0ef          	jal	ra,ffffffffc0203a80 <pgdir_alloc_page>
ffffffffc0206ae2:	0e050e63          	beqz	a0,ffffffffc0206bde <do_execve+0x810>
ffffffffc0206ae6:	01893503          	ld	a0,24(s2)
ffffffffc0206aea:	467d                	li	a2,31
ffffffffc0206aec:	7fffd5b7          	lui	a1,0x7fffd
ffffffffc0206af0:	f91fc0ef          	jal	ra,ffffffffc0203a80 <pgdir_alloc_page>
ffffffffc0206af4:	c569                	beqz	a0,ffffffffc0206bbe <do_execve+0x7f0>
ffffffffc0206af6:	01893503          	ld	a0,24(s2)
ffffffffc0206afa:	467d                	li	a2,31
ffffffffc0206afc:	7fffc5b7          	lui	a1,0x7fffc
ffffffffc0206b00:	f81fc0ef          	jal	ra,ffffffffc0203a80 <pgdir_alloc_page>
ffffffffc0206b04:	cd49                	beqz	a0,ffffffffc0206b9e <do_execve+0x7d0>
ffffffffc0206b06:	03092703          	lw	a4,48(s2)
ffffffffc0206b0a:	609c                	ld	a5,0(s1)
ffffffffc0206b0c:	01893683          	ld	a3,24(s2)
ffffffffc0206b10:	2705                	addiw	a4,a4,1
ffffffffc0206b12:	02e92823          	sw	a4,48(s2)
ffffffffc0206b16:	0327b423          	sd	s2,40(a5)
ffffffffc0206b1a:	c0200737          	lui	a4,0xc0200
ffffffffc0206b1e:	06e6e463          	bltu	a3,a4,ffffffffc0206b86 <do_execve+0x7b8>
ffffffffc0206b22:	000cb703          	ld	a4,0(s9)
ffffffffc0206b26:	8e99                	sub	a3,a3,a4
ffffffffc0206b28:	00c6d713          	srli	a4,a3,0xc
ffffffffc0206b2c:	f7d4                	sd	a3,168(a5)
ffffffffc0206b2e:	56fd                	li	a3,-1
ffffffffc0206b30:	16fe                	slli	a3,a3,0x3f
ffffffffc0206b32:	8f55                	or	a4,a4,a3
ffffffffc0206b34:	18071073          	csrw	satp,a4
ffffffffc0206b38:	0a07b983          	ld	s3,160(a5)
ffffffffc0206b3c:	10002973          	csrr	s2,sstatus
ffffffffc0206b40:	12000613          	li	a2,288
ffffffffc0206b44:	4581                	li	a1,0
ffffffffc0206b46:	854e                	mv	a0,s3
ffffffffc0206b48:	099040ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc0206b4c:	66ea                	ld	a3,152(sp)
ffffffffc0206b4e:	edf97793          	andi	a5,s2,-289
ffffffffc0206b52:	4705                	li	a4,1
ffffffffc0206b54:	0207e793          	ori	a5,a5,32
ffffffffc0206b58:	077e                	slli	a4,a4,0x1f
ffffffffc0206b5a:	00e9b823          	sd	a4,16(s3)
ffffffffc0206b5e:	10d9b423          	sd	a3,264(s3)
ffffffffc0206b62:	10f9b023          	sd	a5,256(s3)
ffffffffc0206b66:	bd89                	j	ffffffffc02069b8 <do_execve+0x5ea>
ffffffffc0206b68:	69c2                	ld	s3,16(sp)
ffffffffc0206b6a:	b429                	j	ffffffffc0206574 <do_execve+0x1a6>
ffffffffc0206b6c:	86be                	mv	a3,a5
ffffffffc0206b6e:	00006617          	auipc	a2,0x6
ffffffffc0206b72:	87a60613          	addi	a2,a2,-1926 # ffffffffc020c3e8 <default_pmm_manager+0x38>
ffffffffc0206b76:	07100593          	li	a1,113
ffffffffc0206b7a:	00006517          	auipc	a0,0x6
ffffffffc0206b7e:	89650513          	addi	a0,a0,-1898 # ffffffffc020c410 <default_pmm_manager+0x60>
ffffffffc0206b82:	91df90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206b86:	00006617          	auipc	a2,0x6
ffffffffc0206b8a:	90a60613          	addi	a2,a2,-1782 # ffffffffc020c490 <default_pmm_manager+0xe0>
ffffffffc0206b8e:	37300593          	li	a1,883
ffffffffc0206b92:	00007517          	auipc	a0,0x7
ffffffffc0206b96:	84650513          	addi	a0,a0,-1978 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc0206b9a:	905f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206b9e:	00007697          	auipc	a3,0x7
ffffffffc0206ba2:	b6a68693          	addi	a3,a3,-1174 # ffffffffc020d708 <CSWTCH.79+0x440>
ffffffffc0206ba6:	00005617          	auipc	a2,0x5
ffffffffc0206baa:	d2260613          	addi	a2,a2,-734 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0206bae:	36e00593          	li	a1,878
ffffffffc0206bb2:	00007517          	auipc	a0,0x7
ffffffffc0206bb6:	82650513          	addi	a0,a0,-2010 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc0206bba:	8e5f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206bbe:	00007697          	auipc	a3,0x7
ffffffffc0206bc2:	b0268693          	addi	a3,a3,-1278 # ffffffffc020d6c0 <CSWTCH.79+0x3f8>
ffffffffc0206bc6:	00005617          	auipc	a2,0x5
ffffffffc0206bca:	d0260613          	addi	a2,a2,-766 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0206bce:	36d00593          	li	a1,877
ffffffffc0206bd2:	00007517          	auipc	a0,0x7
ffffffffc0206bd6:	80650513          	addi	a0,a0,-2042 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc0206bda:	8c5f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206bde:	00007697          	auipc	a3,0x7
ffffffffc0206be2:	a9a68693          	addi	a3,a3,-1382 # ffffffffc020d678 <CSWTCH.79+0x3b0>
ffffffffc0206be6:	00005617          	auipc	a2,0x5
ffffffffc0206bea:	ce260613          	addi	a2,a2,-798 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0206bee:	36c00593          	li	a1,876
ffffffffc0206bf2:	00006517          	auipc	a0,0x6
ffffffffc0206bf6:	7e650513          	addi	a0,a0,2022 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc0206bfa:	8a5f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206bfe:	00007697          	auipc	a3,0x7
ffffffffc0206c02:	a3268693          	addi	a3,a3,-1486 # ffffffffc020d630 <CSWTCH.79+0x368>
ffffffffc0206c06:	00005617          	auipc	a2,0x5
ffffffffc0206c0a:	cc260613          	addi	a2,a2,-830 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0206c0e:	36b00593          	li	a1,875
ffffffffc0206c12:	00006517          	auipc	a0,0x6
ffffffffc0206c16:	7c650513          	addi	a0,a0,1990 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc0206c1a:	885f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0206c1e <user_main>:
ffffffffc0206c1e:	7179                	addi	sp,sp,-48
ffffffffc0206c20:	e84a                	sd	s2,16(sp)
ffffffffc0206c22:	00090917          	auipc	s2,0x90
ffffffffc0206c26:	c9e90913          	addi	s2,s2,-866 # ffffffffc02968c0 <current>
ffffffffc0206c2a:	00093783          	ld	a5,0(s2)
ffffffffc0206c2e:	00007617          	auipc	a2,0x7
ffffffffc0206c32:	b2260613          	addi	a2,a2,-1246 # ffffffffc020d750 <CSWTCH.79+0x488>
ffffffffc0206c36:	00007517          	auipc	a0,0x7
ffffffffc0206c3a:	b2250513          	addi	a0,a0,-1246 # ffffffffc020d758 <CSWTCH.79+0x490>
ffffffffc0206c3e:	43cc                	lw	a1,4(a5)
ffffffffc0206c40:	f406                	sd	ra,40(sp)
ffffffffc0206c42:	f022                	sd	s0,32(sp)
ffffffffc0206c44:	ec26                	sd	s1,24(sp)
ffffffffc0206c46:	e032                	sd	a2,0(sp)
ffffffffc0206c48:	e402                	sd	zero,8(sp)
ffffffffc0206c4a:	d5cf90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206c4e:	6782                	ld	a5,0(sp)
ffffffffc0206c50:	cfb9                	beqz	a5,ffffffffc0206cae <user_main+0x90>
ffffffffc0206c52:	003c                	addi	a5,sp,8
ffffffffc0206c54:	4401                	li	s0,0
ffffffffc0206c56:	6398                	ld	a4,0(a5)
ffffffffc0206c58:	0405                	addi	s0,s0,1
ffffffffc0206c5a:	07a1                	addi	a5,a5,8
ffffffffc0206c5c:	ff6d                	bnez	a4,ffffffffc0206c56 <user_main+0x38>
ffffffffc0206c5e:	00093783          	ld	a5,0(s2)
ffffffffc0206c62:	12000613          	li	a2,288
ffffffffc0206c66:	6b84                	ld	s1,16(a5)
ffffffffc0206c68:	73cc                	ld	a1,160(a5)
ffffffffc0206c6a:	6789                	lui	a5,0x2
ffffffffc0206c6c:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc0206c70:	94be                	add	s1,s1,a5
ffffffffc0206c72:	8526                	mv	a0,s1
ffffffffc0206c74:	7be040ef          	jal	ra,ffffffffc020b432 <memcpy>
ffffffffc0206c78:	00093783          	ld	a5,0(s2)
ffffffffc0206c7c:	860a                	mv	a2,sp
ffffffffc0206c7e:	0004059b          	sext.w	a1,s0
ffffffffc0206c82:	f3c4                	sd	s1,160(a5)
ffffffffc0206c84:	00007517          	auipc	a0,0x7
ffffffffc0206c88:	acc50513          	addi	a0,a0,-1332 # ffffffffc020d750 <CSWTCH.79+0x488>
ffffffffc0206c8c:	f42ff0ef          	jal	ra,ffffffffc02063ce <do_execve>
ffffffffc0206c90:	8126                	mv	sp,s1
ffffffffc0206c92:	dbefa06f          	j	ffffffffc0201250 <__trapret>
ffffffffc0206c96:	00007617          	auipc	a2,0x7
ffffffffc0206c9a:	aea60613          	addi	a2,a2,-1302 # ffffffffc020d780 <CSWTCH.79+0x4b8>
ffffffffc0206c9e:	4a400593          	li	a1,1188
ffffffffc0206ca2:	00006517          	auipc	a0,0x6
ffffffffc0206ca6:	73650513          	addi	a0,a0,1846 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc0206caa:	ff4f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206cae:	4401                	li	s0,0
ffffffffc0206cb0:	b77d                	j	ffffffffc0206c5e <user_main+0x40>

ffffffffc0206cb2 <do_yield>:
ffffffffc0206cb2:	00090797          	auipc	a5,0x90
ffffffffc0206cb6:	c0e7b783          	ld	a5,-1010(a5) # ffffffffc02968c0 <current>
ffffffffc0206cba:	4705                	li	a4,1
ffffffffc0206cbc:	ef98                	sd	a4,24(a5)
ffffffffc0206cbe:	4501                	li	a0,0
ffffffffc0206cc0:	8082                	ret

ffffffffc0206cc2 <do_wait>:
ffffffffc0206cc2:	1101                	addi	sp,sp,-32
ffffffffc0206cc4:	e822                	sd	s0,16(sp)
ffffffffc0206cc6:	e426                	sd	s1,8(sp)
ffffffffc0206cc8:	ec06                	sd	ra,24(sp)
ffffffffc0206cca:	842e                	mv	s0,a1
ffffffffc0206ccc:	84aa                	mv	s1,a0
ffffffffc0206cce:	c999                	beqz	a1,ffffffffc0206ce4 <do_wait+0x22>
ffffffffc0206cd0:	00090797          	auipc	a5,0x90
ffffffffc0206cd4:	bf07b783          	ld	a5,-1040(a5) # ffffffffc02968c0 <current>
ffffffffc0206cd8:	7788                	ld	a0,40(a5)
ffffffffc0206cda:	4685                	li	a3,1
ffffffffc0206cdc:	4611                	li	a2,4
ffffffffc0206cde:	d12fd0ef          	jal	ra,ffffffffc02041f0 <user_mem_check>
ffffffffc0206ce2:	c909                	beqz	a0,ffffffffc0206cf4 <do_wait+0x32>
ffffffffc0206ce4:	85a2                	mv	a1,s0
ffffffffc0206ce6:	6442                	ld	s0,16(sp)
ffffffffc0206ce8:	60e2                	ld	ra,24(sp)
ffffffffc0206cea:	8526                	mv	a0,s1
ffffffffc0206cec:	64a2                	ld	s1,8(sp)
ffffffffc0206cee:	6105                	addi	sp,sp,32
ffffffffc0206cf0:	bbcff06f          	j	ffffffffc02060ac <do_wait.part.0>
ffffffffc0206cf4:	60e2                	ld	ra,24(sp)
ffffffffc0206cf6:	6442                	ld	s0,16(sp)
ffffffffc0206cf8:	64a2                	ld	s1,8(sp)
ffffffffc0206cfa:	5575                	li	a0,-3
ffffffffc0206cfc:	6105                	addi	sp,sp,32
ffffffffc0206cfe:	8082                	ret

ffffffffc0206d00 <do_kill>:
ffffffffc0206d00:	1141                	addi	sp,sp,-16
ffffffffc0206d02:	6789                	lui	a5,0x2
ffffffffc0206d04:	e406                	sd	ra,8(sp)
ffffffffc0206d06:	e022                	sd	s0,0(sp)
ffffffffc0206d08:	fff5071b          	addiw	a4,a0,-1
ffffffffc0206d0c:	17f9                	addi	a5,a5,-2
ffffffffc0206d0e:	02e7e963          	bltu	a5,a4,ffffffffc0206d40 <do_kill+0x40>
ffffffffc0206d12:	842a                	mv	s0,a0
ffffffffc0206d14:	45a9                	li	a1,10
ffffffffc0206d16:	2501                	sext.w	a0,a0
ffffffffc0206d18:	194040ef          	jal	ra,ffffffffc020aeac <hash32>
ffffffffc0206d1c:	02051793          	slli	a5,a0,0x20
ffffffffc0206d20:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0206d24:	0008b797          	auipc	a5,0x8b
ffffffffc0206d28:	a9c78793          	addi	a5,a5,-1380 # ffffffffc02917c0 <hash_list>
ffffffffc0206d2c:	953e                	add	a0,a0,a5
ffffffffc0206d2e:	87aa                	mv	a5,a0
ffffffffc0206d30:	a029                	j	ffffffffc0206d3a <do_kill+0x3a>
ffffffffc0206d32:	f2c7a703          	lw	a4,-212(a5)
ffffffffc0206d36:	00870b63          	beq	a4,s0,ffffffffc0206d4c <do_kill+0x4c>
ffffffffc0206d3a:	679c                	ld	a5,8(a5)
ffffffffc0206d3c:	fef51be3          	bne	a0,a5,ffffffffc0206d32 <do_kill+0x32>
ffffffffc0206d40:	5475                	li	s0,-3
ffffffffc0206d42:	60a2                	ld	ra,8(sp)
ffffffffc0206d44:	8522                	mv	a0,s0
ffffffffc0206d46:	6402                	ld	s0,0(sp)
ffffffffc0206d48:	0141                	addi	sp,sp,16
ffffffffc0206d4a:	8082                	ret
ffffffffc0206d4c:	fd87a703          	lw	a4,-40(a5)
ffffffffc0206d50:	00177693          	andi	a3,a4,1
ffffffffc0206d54:	e295                	bnez	a3,ffffffffc0206d78 <do_kill+0x78>
ffffffffc0206d56:	4bd4                	lw	a3,20(a5)
ffffffffc0206d58:	00176713          	ori	a4,a4,1
ffffffffc0206d5c:	fce7ac23          	sw	a4,-40(a5)
ffffffffc0206d60:	4401                	li	s0,0
ffffffffc0206d62:	fe06d0e3          	bgez	a3,ffffffffc0206d42 <do_kill+0x42>
ffffffffc0206d66:	f2878513          	addi	a0,a5,-216
ffffffffc0206d6a:	45a000ef          	jal	ra,ffffffffc02071c4 <wakeup_proc>
ffffffffc0206d6e:	60a2                	ld	ra,8(sp)
ffffffffc0206d70:	8522                	mv	a0,s0
ffffffffc0206d72:	6402                	ld	s0,0(sp)
ffffffffc0206d74:	0141                	addi	sp,sp,16
ffffffffc0206d76:	8082                	ret
ffffffffc0206d78:	545d                	li	s0,-9
ffffffffc0206d7a:	b7e1                	j	ffffffffc0206d42 <do_kill+0x42>

ffffffffc0206d7c <proc_init>:
ffffffffc0206d7c:	1101                	addi	sp,sp,-32
ffffffffc0206d7e:	e426                	sd	s1,8(sp)
ffffffffc0206d80:	0008f797          	auipc	a5,0x8f
ffffffffc0206d84:	a4078793          	addi	a5,a5,-1472 # ffffffffc02957c0 <proc_list>
ffffffffc0206d88:	ec06                	sd	ra,24(sp)
ffffffffc0206d8a:	e822                	sd	s0,16(sp)
ffffffffc0206d8c:	e04a                	sd	s2,0(sp)
ffffffffc0206d8e:	0008b497          	auipc	s1,0x8b
ffffffffc0206d92:	a3248493          	addi	s1,s1,-1486 # ffffffffc02917c0 <hash_list>
ffffffffc0206d96:	e79c                	sd	a5,8(a5)
ffffffffc0206d98:	e39c                	sd	a5,0(a5)
ffffffffc0206d9a:	0008f717          	auipc	a4,0x8f
ffffffffc0206d9e:	a2670713          	addi	a4,a4,-1498 # ffffffffc02957c0 <proc_list>
ffffffffc0206da2:	87a6                	mv	a5,s1
ffffffffc0206da4:	e79c                	sd	a5,8(a5)
ffffffffc0206da6:	e39c                	sd	a5,0(a5)
ffffffffc0206da8:	07c1                	addi	a5,a5,16
ffffffffc0206daa:	fef71de3          	bne	a4,a5,ffffffffc0206da4 <proc_init+0x28>
ffffffffc0206dae:	b85fe0ef          	jal	ra,ffffffffc0205932 <alloc_proc>
ffffffffc0206db2:	00090917          	auipc	s2,0x90
ffffffffc0206db6:	b1690913          	addi	s2,s2,-1258 # ffffffffc02968c8 <idleproc>
ffffffffc0206dba:	00a93023          	sd	a0,0(s2)
ffffffffc0206dbe:	842a                	mv	s0,a0
ffffffffc0206dc0:	12050863          	beqz	a0,ffffffffc0206ef0 <proc_init+0x174>
ffffffffc0206dc4:	4789                	li	a5,2
ffffffffc0206dc6:	e11c                	sd	a5,0(a0)
ffffffffc0206dc8:	0000a797          	auipc	a5,0xa
ffffffffc0206dcc:	23878793          	addi	a5,a5,568 # ffffffffc0211000 <bootstack>
ffffffffc0206dd0:	e91c                	sd	a5,16(a0)
ffffffffc0206dd2:	4785                	li	a5,1
ffffffffc0206dd4:	ed1c                	sd	a5,24(a0)
ffffffffc0206dd6:	b56fe0ef          	jal	ra,ffffffffc020512c <files_create>
ffffffffc0206dda:	14a43423          	sd	a0,328(s0)
ffffffffc0206dde:	0e050d63          	beqz	a0,ffffffffc0206ed8 <proc_init+0x15c>
ffffffffc0206de2:	00093403          	ld	s0,0(s2)
ffffffffc0206de6:	4641                	li	a2,16
ffffffffc0206de8:	4581                	li	a1,0
ffffffffc0206dea:	14843703          	ld	a4,328(s0)
ffffffffc0206dee:	0b440413          	addi	s0,s0,180
ffffffffc0206df2:	8522                	mv	a0,s0
ffffffffc0206df4:	4b1c                	lw	a5,16(a4)
ffffffffc0206df6:	2785                	addiw	a5,a5,1
ffffffffc0206df8:	cb1c                	sw	a5,16(a4)
ffffffffc0206dfa:	5e6040ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc0206dfe:	463d                	li	a2,15
ffffffffc0206e00:	00007597          	auipc	a1,0x7
ffffffffc0206e04:	9e058593          	addi	a1,a1,-1568 # ffffffffc020d7e0 <CSWTCH.79+0x518>
ffffffffc0206e08:	8522                	mv	a0,s0
ffffffffc0206e0a:	628040ef          	jal	ra,ffffffffc020b432 <memcpy>
ffffffffc0206e0e:	00090717          	auipc	a4,0x90
ffffffffc0206e12:	aca70713          	addi	a4,a4,-1334 # ffffffffc02968d8 <nr_process>
ffffffffc0206e16:	431c                	lw	a5,0(a4)
ffffffffc0206e18:	00093683          	ld	a3,0(s2)
ffffffffc0206e1c:	4601                	li	a2,0
ffffffffc0206e1e:	2785                	addiw	a5,a5,1
ffffffffc0206e20:	4581                	li	a1,0
ffffffffc0206e22:	fffff517          	auipc	a0,0xfffff
ffffffffc0206e26:	45c50513          	addi	a0,a0,1116 # ffffffffc020627e <init_main>
ffffffffc0206e2a:	c31c                	sw	a5,0(a4)
ffffffffc0206e2c:	00090797          	auipc	a5,0x90
ffffffffc0206e30:	a8d7ba23          	sd	a3,-1388(a5) # ffffffffc02968c0 <current>
ffffffffc0206e34:	8c6ff0ef          	jal	ra,ffffffffc0205efa <kernel_thread>
ffffffffc0206e38:	842a                	mv	s0,a0
ffffffffc0206e3a:	08a05363          	blez	a0,ffffffffc0206ec0 <proc_init+0x144>
ffffffffc0206e3e:	6789                	lui	a5,0x2
ffffffffc0206e40:	fff5071b          	addiw	a4,a0,-1
ffffffffc0206e44:	17f9                	addi	a5,a5,-2
ffffffffc0206e46:	2501                	sext.w	a0,a0
ffffffffc0206e48:	02e7e363          	bltu	a5,a4,ffffffffc0206e6e <proc_init+0xf2>
ffffffffc0206e4c:	45a9                	li	a1,10
ffffffffc0206e4e:	05e040ef          	jal	ra,ffffffffc020aeac <hash32>
ffffffffc0206e52:	02051793          	slli	a5,a0,0x20
ffffffffc0206e56:	01c7d693          	srli	a3,a5,0x1c
ffffffffc0206e5a:	96a6                	add	a3,a3,s1
ffffffffc0206e5c:	87b6                	mv	a5,a3
ffffffffc0206e5e:	a029                	j	ffffffffc0206e68 <proc_init+0xec>
ffffffffc0206e60:	f2c7a703          	lw	a4,-212(a5) # 1f2c <_binary_bin_swap_img_size-0x5dd4>
ffffffffc0206e64:	04870b63          	beq	a4,s0,ffffffffc0206eba <proc_init+0x13e>
ffffffffc0206e68:	679c                	ld	a5,8(a5)
ffffffffc0206e6a:	fef69be3          	bne	a3,a5,ffffffffc0206e60 <proc_init+0xe4>
ffffffffc0206e6e:	4781                	li	a5,0
ffffffffc0206e70:	0b478493          	addi	s1,a5,180
ffffffffc0206e74:	4641                	li	a2,16
ffffffffc0206e76:	4581                	li	a1,0
ffffffffc0206e78:	00090417          	auipc	s0,0x90
ffffffffc0206e7c:	a5840413          	addi	s0,s0,-1448 # ffffffffc02968d0 <initproc>
ffffffffc0206e80:	8526                	mv	a0,s1
ffffffffc0206e82:	e01c                	sd	a5,0(s0)
ffffffffc0206e84:	55c040ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc0206e88:	463d                	li	a2,15
ffffffffc0206e8a:	00007597          	auipc	a1,0x7
ffffffffc0206e8e:	97e58593          	addi	a1,a1,-1666 # ffffffffc020d808 <CSWTCH.79+0x540>
ffffffffc0206e92:	8526                	mv	a0,s1
ffffffffc0206e94:	59e040ef          	jal	ra,ffffffffc020b432 <memcpy>
ffffffffc0206e98:	00093783          	ld	a5,0(s2)
ffffffffc0206e9c:	c7d1                	beqz	a5,ffffffffc0206f28 <proc_init+0x1ac>
ffffffffc0206e9e:	43dc                	lw	a5,4(a5)
ffffffffc0206ea0:	e7c1                	bnez	a5,ffffffffc0206f28 <proc_init+0x1ac>
ffffffffc0206ea2:	601c                	ld	a5,0(s0)
ffffffffc0206ea4:	c3b5                	beqz	a5,ffffffffc0206f08 <proc_init+0x18c>
ffffffffc0206ea6:	43d8                	lw	a4,4(a5)
ffffffffc0206ea8:	4785                	li	a5,1
ffffffffc0206eaa:	04f71f63          	bne	a4,a5,ffffffffc0206f08 <proc_init+0x18c>
ffffffffc0206eae:	60e2                	ld	ra,24(sp)
ffffffffc0206eb0:	6442                	ld	s0,16(sp)
ffffffffc0206eb2:	64a2                	ld	s1,8(sp)
ffffffffc0206eb4:	6902                	ld	s2,0(sp)
ffffffffc0206eb6:	6105                	addi	sp,sp,32
ffffffffc0206eb8:	8082                	ret
ffffffffc0206eba:	f2878793          	addi	a5,a5,-216
ffffffffc0206ebe:	bf4d                	j	ffffffffc0206e70 <proc_init+0xf4>
ffffffffc0206ec0:	00007617          	auipc	a2,0x7
ffffffffc0206ec4:	92860613          	addi	a2,a2,-1752 # ffffffffc020d7e8 <CSWTCH.79+0x520>
ffffffffc0206ec8:	4f000593          	li	a1,1264
ffffffffc0206ecc:	00006517          	auipc	a0,0x6
ffffffffc0206ed0:	50c50513          	addi	a0,a0,1292 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc0206ed4:	dcaf90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206ed8:	00007617          	auipc	a2,0x7
ffffffffc0206edc:	8e060613          	addi	a2,a2,-1824 # ffffffffc020d7b8 <CSWTCH.79+0x4f0>
ffffffffc0206ee0:	4e400593          	li	a1,1252
ffffffffc0206ee4:	00006517          	auipc	a0,0x6
ffffffffc0206ee8:	4f450513          	addi	a0,a0,1268 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc0206eec:	db2f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206ef0:	00007617          	auipc	a2,0x7
ffffffffc0206ef4:	8b060613          	addi	a2,a2,-1872 # ffffffffc020d7a0 <CSWTCH.79+0x4d8>
ffffffffc0206ef8:	4da00593          	li	a1,1242
ffffffffc0206efc:	00006517          	auipc	a0,0x6
ffffffffc0206f00:	4dc50513          	addi	a0,a0,1244 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc0206f04:	d9af90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206f08:	00007697          	auipc	a3,0x7
ffffffffc0206f0c:	93068693          	addi	a3,a3,-1744 # ffffffffc020d838 <CSWTCH.79+0x570>
ffffffffc0206f10:	00005617          	auipc	a2,0x5
ffffffffc0206f14:	9b860613          	addi	a2,a2,-1608 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0206f18:	4f700593          	li	a1,1271
ffffffffc0206f1c:	00006517          	auipc	a0,0x6
ffffffffc0206f20:	4bc50513          	addi	a0,a0,1212 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc0206f24:	d7af90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206f28:	00007697          	auipc	a3,0x7
ffffffffc0206f2c:	8e868693          	addi	a3,a3,-1816 # ffffffffc020d810 <CSWTCH.79+0x548>
ffffffffc0206f30:	00005617          	auipc	a2,0x5
ffffffffc0206f34:	99860613          	addi	a2,a2,-1640 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0206f38:	4f600593          	li	a1,1270
ffffffffc0206f3c:	00006517          	auipc	a0,0x6
ffffffffc0206f40:	49c50513          	addi	a0,a0,1180 # ffffffffc020d3d8 <CSWTCH.79+0x110>
ffffffffc0206f44:	d5af90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0206f48 <cpu_idle>:
ffffffffc0206f48:	1141                	addi	sp,sp,-16
ffffffffc0206f4a:	e022                	sd	s0,0(sp)
ffffffffc0206f4c:	e406                	sd	ra,8(sp)
ffffffffc0206f4e:	00090417          	auipc	s0,0x90
ffffffffc0206f52:	97240413          	addi	s0,s0,-1678 # ffffffffc02968c0 <current>
ffffffffc0206f56:	6018                	ld	a4,0(s0)
ffffffffc0206f58:	6f1c                	ld	a5,24(a4)
ffffffffc0206f5a:	dffd                	beqz	a5,ffffffffc0206f58 <cpu_idle+0x10>
ffffffffc0206f5c:	31a000ef          	jal	ra,ffffffffc0207276 <schedule>
ffffffffc0206f60:	bfdd                	j	ffffffffc0206f56 <cpu_idle+0xe>

ffffffffc0206f62 <lab6_set_priority>:
ffffffffc0206f62:	1141                	addi	sp,sp,-16
ffffffffc0206f64:	e022                	sd	s0,0(sp)
ffffffffc0206f66:	85aa                	mv	a1,a0
ffffffffc0206f68:	842a                	mv	s0,a0
ffffffffc0206f6a:	00007517          	auipc	a0,0x7
ffffffffc0206f6e:	8f650513          	addi	a0,a0,-1802 # ffffffffc020d860 <CSWTCH.79+0x598>
ffffffffc0206f72:	e406                	sd	ra,8(sp)
ffffffffc0206f74:	a32f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206f78:	00090797          	auipc	a5,0x90
ffffffffc0206f7c:	9487b783          	ld	a5,-1720(a5) # ffffffffc02968c0 <current>
ffffffffc0206f80:	e801                	bnez	s0,ffffffffc0206f90 <lab6_set_priority+0x2e>
ffffffffc0206f82:	60a2                	ld	ra,8(sp)
ffffffffc0206f84:	6402                	ld	s0,0(sp)
ffffffffc0206f86:	4705                	li	a4,1
ffffffffc0206f88:	14e7a223          	sw	a4,324(a5)
ffffffffc0206f8c:	0141                	addi	sp,sp,16
ffffffffc0206f8e:	8082                	ret
ffffffffc0206f90:	60a2                	ld	ra,8(sp)
ffffffffc0206f92:	1487a223          	sw	s0,324(a5)
ffffffffc0206f96:	6402                	ld	s0,0(sp)
ffffffffc0206f98:	0141                	addi	sp,sp,16
ffffffffc0206f9a:	8082                	ret

ffffffffc0206f9c <do_sleep>:
ffffffffc0206f9c:	c539                	beqz	a0,ffffffffc0206fea <do_sleep+0x4e>
ffffffffc0206f9e:	7179                	addi	sp,sp,-48
ffffffffc0206fa0:	f022                	sd	s0,32(sp)
ffffffffc0206fa2:	f406                	sd	ra,40(sp)
ffffffffc0206fa4:	842a                	mv	s0,a0
ffffffffc0206fa6:	100027f3          	csrr	a5,sstatus
ffffffffc0206faa:	8b89                	andi	a5,a5,2
ffffffffc0206fac:	e3a9                	bnez	a5,ffffffffc0206fee <do_sleep+0x52>
ffffffffc0206fae:	00090797          	auipc	a5,0x90
ffffffffc0206fb2:	9127b783          	ld	a5,-1774(a5) # ffffffffc02968c0 <current>
ffffffffc0206fb6:	0818                	addi	a4,sp,16
ffffffffc0206fb8:	c02a                	sw	a0,0(sp)
ffffffffc0206fba:	ec3a                	sd	a4,24(sp)
ffffffffc0206fbc:	e83a                	sd	a4,16(sp)
ffffffffc0206fbe:	e43e                	sd	a5,8(sp)
ffffffffc0206fc0:	4705                	li	a4,1
ffffffffc0206fc2:	c398                	sw	a4,0(a5)
ffffffffc0206fc4:	80000737          	lui	a4,0x80000
ffffffffc0206fc8:	840a                	mv	s0,sp
ffffffffc0206fca:	0709                	addi	a4,a4,2
ffffffffc0206fcc:	0ee7a623          	sw	a4,236(a5)
ffffffffc0206fd0:	8522                	mv	a0,s0
ffffffffc0206fd2:	364000ef          	jal	ra,ffffffffc0207336 <add_timer>
ffffffffc0206fd6:	2a0000ef          	jal	ra,ffffffffc0207276 <schedule>
ffffffffc0206fda:	8522                	mv	a0,s0
ffffffffc0206fdc:	422000ef          	jal	ra,ffffffffc02073fe <del_timer>
ffffffffc0206fe0:	70a2                	ld	ra,40(sp)
ffffffffc0206fe2:	7402                	ld	s0,32(sp)
ffffffffc0206fe4:	4501                	li	a0,0
ffffffffc0206fe6:	6145                	addi	sp,sp,48
ffffffffc0206fe8:	8082                	ret
ffffffffc0206fea:	4501                	li	a0,0
ffffffffc0206fec:	8082                	ret
ffffffffc0206fee:	c85f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0206ff2:	00090797          	auipc	a5,0x90
ffffffffc0206ff6:	8ce7b783          	ld	a5,-1842(a5) # ffffffffc02968c0 <current>
ffffffffc0206ffa:	0818                	addi	a4,sp,16
ffffffffc0206ffc:	c022                	sw	s0,0(sp)
ffffffffc0206ffe:	e43e                	sd	a5,8(sp)
ffffffffc0207000:	ec3a                	sd	a4,24(sp)
ffffffffc0207002:	e83a                	sd	a4,16(sp)
ffffffffc0207004:	4705                	li	a4,1
ffffffffc0207006:	c398                	sw	a4,0(a5)
ffffffffc0207008:	80000737          	lui	a4,0x80000
ffffffffc020700c:	0709                	addi	a4,a4,2
ffffffffc020700e:	840a                	mv	s0,sp
ffffffffc0207010:	8522                	mv	a0,s0
ffffffffc0207012:	0ee7a623          	sw	a4,236(a5)
ffffffffc0207016:	320000ef          	jal	ra,ffffffffc0207336 <add_timer>
ffffffffc020701a:	c53f90ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020701e:	bf65                	j	ffffffffc0206fd6 <do_sleep+0x3a>

ffffffffc0207020 <switch_to>:
ffffffffc0207020:	00153023          	sd	ra,0(a0)
ffffffffc0207024:	00253423          	sd	sp,8(a0)
ffffffffc0207028:	e900                	sd	s0,16(a0)
ffffffffc020702a:	ed04                	sd	s1,24(a0)
ffffffffc020702c:	03253023          	sd	s2,32(a0)
ffffffffc0207030:	03353423          	sd	s3,40(a0)
ffffffffc0207034:	03453823          	sd	s4,48(a0)
ffffffffc0207038:	03553c23          	sd	s5,56(a0)
ffffffffc020703c:	05653023          	sd	s6,64(a0)
ffffffffc0207040:	05753423          	sd	s7,72(a0)
ffffffffc0207044:	05853823          	sd	s8,80(a0)
ffffffffc0207048:	05953c23          	sd	s9,88(a0)
ffffffffc020704c:	07a53023          	sd	s10,96(a0)
ffffffffc0207050:	07b53423          	sd	s11,104(a0)
ffffffffc0207054:	0005b083          	ld	ra,0(a1)
ffffffffc0207058:	0085b103          	ld	sp,8(a1)
ffffffffc020705c:	6980                	ld	s0,16(a1)
ffffffffc020705e:	6d84                	ld	s1,24(a1)
ffffffffc0207060:	0205b903          	ld	s2,32(a1)
ffffffffc0207064:	0285b983          	ld	s3,40(a1)
ffffffffc0207068:	0305ba03          	ld	s4,48(a1)
ffffffffc020706c:	0385ba83          	ld	s5,56(a1)
ffffffffc0207070:	0405bb03          	ld	s6,64(a1)
ffffffffc0207074:	0485bb83          	ld	s7,72(a1)
ffffffffc0207078:	0505bc03          	ld	s8,80(a1)
ffffffffc020707c:	0585bc83          	ld	s9,88(a1)
ffffffffc0207080:	0605bd03          	ld	s10,96(a1)
ffffffffc0207084:	0685bd83          	ld	s11,104(a1)
ffffffffc0207088:	8082                	ret

ffffffffc020708a <RR_init>:
ffffffffc020708a:	e508                	sd	a0,8(a0)
ffffffffc020708c:	e108                	sd	a0,0(a0)
ffffffffc020708e:	00052823          	sw	zero,16(a0)
ffffffffc0207092:	8082                	ret

ffffffffc0207094 <RR_pick_next>:
ffffffffc0207094:	651c                	ld	a5,8(a0)
ffffffffc0207096:	00f50563          	beq	a0,a5,ffffffffc02070a0 <RR_pick_next+0xc>
ffffffffc020709a:	ef078513          	addi	a0,a5,-272
ffffffffc020709e:	8082                	ret
ffffffffc02070a0:	4501                	li	a0,0
ffffffffc02070a2:	8082                	ret

ffffffffc02070a4 <RR_proc_tick>:
ffffffffc02070a4:	1205a783          	lw	a5,288(a1)
ffffffffc02070a8:	00f05563          	blez	a5,ffffffffc02070b2 <RR_proc_tick+0xe>
ffffffffc02070ac:	37fd                	addiw	a5,a5,-1
ffffffffc02070ae:	12f5a023          	sw	a5,288(a1)
ffffffffc02070b2:	e399                	bnez	a5,ffffffffc02070b8 <RR_proc_tick+0x14>
ffffffffc02070b4:	4785                	li	a5,1
ffffffffc02070b6:	ed9c                	sd	a5,24(a1)
ffffffffc02070b8:	8082                	ret

ffffffffc02070ba <RR_dequeue>:
ffffffffc02070ba:	1185b703          	ld	a4,280(a1)
ffffffffc02070be:	11058793          	addi	a5,a1,272
ffffffffc02070c2:	02e78363          	beq	a5,a4,ffffffffc02070e8 <RR_dequeue+0x2e>
ffffffffc02070c6:	1085b683          	ld	a3,264(a1)
ffffffffc02070ca:	00a69f63          	bne	a3,a0,ffffffffc02070e8 <RR_dequeue+0x2e>
ffffffffc02070ce:	1105b503          	ld	a0,272(a1)
ffffffffc02070d2:	4a90                	lw	a2,16(a3)
ffffffffc02070d4:	e518                	sd	a4,8(a0)
ffffffffc02070d6:	e308                	sd	a0,0(a4)
ffffffffc02070d8:	10f5bc23          	sd	a5,280(a1)
ffffffffc02070dc:	10f5b823          	sd	a5,272(a1)
ffffffffc02070e0:	fff6079b          	addiw	a5,a2,-1
ffffffffc02070e4:	ca9c                	sw	a5,16(a3)
ffffffffc02070e6:	8082                	ret
ffffffffc02070e8:	1141                	addi	sp,sp,-16
ffffffffc02070ea:	00006697          	auipc	a3,0x6
ffffffffc02070ee:	78e68693          	addi	a3,a3,1934 # ffffffffc020d878 <CSWTCH.79+0x5b0>
ffffffffc02070f2:	00004617          	auipc	a2,0x4
ffffffffc02070f6:	7d660613          	addi	a2,a2,2006 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02070fa:	03c00593          	li	a1,60
ffffffffc02070fe:	00006517          	auipc	a0,0x6
ffffffffc0207102:	7b250513          	addi	a0,a0,1970 # ffffffffc020d8b0 <CSWTCH.79+0x5e8>
ffffffffc0207106:	e406                	sd	ra,8(sp)
ffffffffc0207108:	b96f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020710c <RR_enqueue>:
ffffffffc020710c:	1185b703          	ld	a4,280(a1)
ffffffffc0207110:	11058793          	addi	a5,a1,272
ffffffffc0207114:	02e79d63          	bne	a5,a4,ffffffffc020714e <RR_enqueue+0x42>
ffffffffc0207118:	6118                	ld	a4,0(a0)
ffffffffc020711a:	1205a683          	lw	a3,288(a1)
ffffffffc020711e:	e11c                	sd	a5,0(a0)
ffffffffc0207120:	e71c                	sd	a5,8(a4)
ffffffffc0207122:	10a5bc23          	sd	a0,280(a1)
ffffffffc0207126:	10e5b823          	sd	a4,272(a1)
ffffffffc020712a:	495c                	lw	a5,20(a0)
ffffffffc020712c:	ea89                	bnez	a3,ffffffffc020713e <RR_enqueue+0x32>
ffffffffc020712e:	12f5a023          	sw	a5,288(a1)
ffffffffc0207132:	491c                	lw	a5,16(a0)
ffffffffc0207134:	10a5b423          	sd	a0,264(a1)
ffffffffc0207138:	2785                	addiw	a5,a5,1
ffffffffc020713a:	c91c                	sw	a5,16(a0)
ffffffffc020713c:	8082                	ret
ffffffffc020713e:	fed7c8e3          	blt	a5,a3,ffffffffc020712e <RR_enqueue+0x22>
ffffffffc0207142:	491c                	lw	a5,16(a0)
ffffffffc0207144:	10a5b423          	sd	a0,264(a1)
ffffffffc0207148:	2785                	addiw	a5,a5,1
ffffffffc020714a:	c91c                	sw	a5,16(a0)
ffffffffc020714c:	8082                	ret
ffffffffc020714e:	1141                	addi	sp,sp,-16
ffffffffc0207150:	00006697          	auipc	a3,0x6
ffffffffc0207154:	78068693          	addi	a3,a3,1920 # ffffffffc020d8d0 <CSWTCH.79+0x608>
ffffffffc0207158:	00004617          	auipc	a2,0x4
ffffffffc020715c:	77060613          	addi	a2,a2,1904 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0207160:	02800593          	li	a1,40
ffffffffc0207164:	00006517          	auipc	a0,0x6
ffffffffc0207168:	74c50513          	addi	a0,a0,1868 # ffffffffc020d8b0 <CSWTCH.79+0x5e8>
ffffffffc020716c:	e406                	sd	ra,8(sp)
ffffffffc020716e:	b30f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207172 <sched_init>:
ffffffffc0207172:	1141                	addi	sp,sp,-16
ffffffffc0207174:	0008a717          	auipc	a4,0x8a
ffffffffc0207178:	eac70713          	addi	a4,a4,-340 # ffffffffc0291020 <default_sched_class>
ffffffffc020717c:	e022                	sd	s0,0(sp)
ffffffffc020717e:	e406                	sd	ra,8(sp)
ffffffffc0207180:	0008e797          	auipc	a5,0x8e
ffffffffc0207184:	67078793          	addi	a5,a5,1648 # ffffffffc02957f0 <timer_list>
ffffffffc0207188:	6714                	ld	a3,8(a4)
ffffffffc020718a:	0008e517          	auipc	a0,0x8e
ffffffffc020718e:	64650513          	addi	a0,a0,1606 # ffffffffc02957d0 <__rq>
ffffffffc0207192:	e79c                	sd	a5,8(a5)
ffffffffc0207194:	e39c                	sd	a5,0(a5)
ffffffffc0207196:	4795                	li	a5,5
ffffffffc0207198:	c95c                	sw	a5,20(a0)
ffffffffc020719a:	0008f417          	auipc	s0,0x8f
ffffffffc020719e:	74e40413          	addi	s0,s0,1870 # ffffffffc02968e8 <sched_class>
ffffffffc02071a2:	0008f797          	auipc	a5,0x8f
ffffffffc02071a6:	72a7bf23          	sd	a0,1854(a5) # ffffffffc02968e0 <rq>
ffffffffc02071aa:	e018                	sd	a4,0(s0)
ffffffffc02071ac:	9682                	jalr	a3
ffffffffc02071ae:	601c                	ld	a5,0(s0)
ffffffffc02071b0:	6402                	ld	s0,0(sp)
ffffffffc02071b2:	60a2                	ld	ra,8(sp)
ffffffffc02071b4:	638c                	ld	a1,0(a5)
ffffffffc02071b6:	00006517          	auipc	a0,0x6
ffffffffc02071ba:	74a50513          	addi	a0,a0,1866 # ffffffffc020d900 <CSWTCH.79+0x638>
ffffffffc02071be:	0141                	addi	sp,sp,16
ffffffffc02071c0:	fe7f806f          	j	ffffffffc02001a6 <cprintf>

ffffffffc02071c4 <wakeup_proc>:
ffffffffc02071c4:	4118                	lw	a4,0(a0)
ffffffffc02071c6:	1101                	addi	sp,sp,-32
ffffffffc02071c8:	ec06                	sd	ra,24(sp)
ffffffffc02071ca:	e822                	sd	s0,16(sp)
ffffffffc02071cc:	e426                	sd	s1,8(sp)
ffffffffc02071ce:	478d                	li	a5,3
ffffffffc02071d0:	08f70363          	beq	a4,a5,ffffffffc0207256 <wakeup_proc+0x92>
ffffffffc02071d4:	842a                	mv	s0,a0
ffffffffc02071d6:	100027f3          	csrr	a5,sstatus
ffffffffc02071da:	8b89                	andi	a5,a5,2
ffffffffc02071dc:	4481                	li	s1,0
ffffffffc02071de:	e7bd                	bnez	a5,ffffffffc020724c <wakeup_proc+0x88>
ffffffffc02071e0:	4789                	li	a5,2
ffffffffc02071e2:	04f70863          	beq	a4,a5,ffffffffc0207232 <wakeup_proc+0x6e>
ffffffffc02071e6:	c01c                	sw	a5,0(s0)
ffffffffc02071e8:	0e042623          	sw	zero,236(s0)
ffffffffc02071ec:	0008f797          	auipc	a5,0x8f
ffffffffc02071f0:	6d47b783          	ld	a5,1748(a5) # ffffffffc02968c0 <current>
ffffffffc02071f4:	02878363          	beq	a5,s0,ffffffffc020721a <wakeup_proc+0x56>
ffffffffc02071f8:	0008f797          	auipc	a5,0x8f
ffffffffc02071fc:	6d07b783          	ld	a5,1744(a5) # ffffffffc02968c8 <idleproc>
ffffffffc0207200:	00f40d63          	beq	s0,a5,ffffffffc020721a <wakeup_proc+0x56>
ffffffffc0207204:	0008f797          	auipc	a5,0x8f
ffffffffc0207208:	6e47b783          	ld	a5,1764(a5) # ffffffffc02968e8 <sched_class>
ffffffffc020720c:	6b9c                	ld	a5,16(a5)
ffffffffc020720e:	85a2                	mv	a1,s0
ffffffffc0207210:	0008f517          	auipc	a0,0x8f
ffffffffc0207214:	6d053503          	ld	a0,1744(a0) # ffffffffc02968e0 <rq>
ffffffffc0207218:	9782                	jalr	a5
ffffffffc020721a:	e491                	bnez	s1,ffffffffc0207226 <wakeup_proc+0x62>
ffffffffc020721c:	60e2                	ld	ra,24(sp)
ffffffffc020721e:	6442                	ld	s0,16(sp)
ffffffffc0207220:	64a2                	ld	s1,8(sp)
ffffffffc0207222:	6105                	addi	sp,sp,32
ffffffffc0207224:	8082                	ret
ffffffffc0207226:	6442                	ld	s0,16(sp)
ffffffffc0207228:	60e2                	ld	ra,24(sp)
ffffffffc020722a:	64a2                	ld	s1,8(sp)
ffffffffc020722c:	6105                	addi	sp,sp,32
ffffffffc020722e:	a3ff906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0207232:	00006617          	auipc	a2,0x6
ffffffffc0207236:	71e60613          	addi	a2,a2,1822 # ffffffffc020d950 <CSWTCH.79+0x688>
ffffffffc020723a:	05200593          	li	a1,82
ffffffffc020723e:	00006517          	auipc	a0,0x6
ffffffffc0207242:	6fa50513          	addi	a0,a0,1786 # ffffffffc020d938 <CSWTCH.79+0x670>
ffffffffc0207246:	ac0f90ef          	jal	ra,ffffffffc0200506 <__warn>
ffffffffc020724a:	bfc1                	j	ffffffffc020721a <wakeup_proc+0x56>
ffffffffc020724c:	a27f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207250:	4018                	lw	a4,0(s0)
ffffffffc0207252:	4485                	li	s1,1
ffffffffc0207254:	b771                	j	ffffffffc02071e0 <wakeup_proc+0x1c>
ffffffffc0207256:	00006697          	auipc	a3,0x6
ffffffffc020725a:	6c268693          	addi	a3,a3,1730 # ffffffffc020d918 <CSWTCH.79+0x650>
ffffffffc020725e:	00004617          	auipc	a2,0x4
ffffffffc0207262:	66a60613          	addi	a2,a2,1642 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0207266:	04300593          	li	a1,67
ffffffffc020726a:	00006517          	auipc	a0,0x6
ffffffffc020726e:	6ce50513          	addi	a0,a0,1742 # ffffffffc020d938 <CSWTCH.79+0x670>
ffffffffc0207272:	a2cf90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207276 <schedule>:
ffffffffc0207276:	7179                	addi	sp,sp,-48
ffffffffc0207278:	f406                	sd	ra,40(sp)
ffffffffc020727a:	f022                	sd	s0,32(sp)
ffffffffc020727c:	ec26                	sd	s1,24(sp)
ffffffffc020727e:	e84a                	sd	s2,16(sp)
ffffffffc0207280:	e44e                	sd	s3,8(sp)
ffffffffc0207282:	e052                	sd	s4,0(sp)
ffffffffc0207284:	100027f3          	csrr	a5,sstatus
ffffffffc0207288:	8b89                	andi	a5,a5,2
ffffffffc020728a:	4a01                	li	s4,0
ffffffffc020728c:	e3cd                	bnez	a5,ffffffffc020732e <schedule+0xb8>
ffffffffc020728e:	0008f497          	auipc	s1,0x8f
ffffffffc0207292:	63248493          	addi	s1,s1,1586 # ffffffffc02968c0 <current>
ffffffffc0207296:	608c                	ld	a1,0(s1)
ffffffffc0207298:	0008f997          	auipc	s3,0x8f
ffffffffc020729c:	65098993          	addi	s3,s3,1616 # ffffffffc02968e8 <sched_class>
ffffffffc02072a0:	0008f917          	auipc	s2,0x8f
ffffffffc02072a4:	64090913          	addi	s2,s2,1600 # ffffffffc02968e0 <rq>
ffffffffc02072a8:	4194                	lw	a3,0(a1)
ffffffffc02072aa:	0005bc23          	sd	zero,24(a1)
ffffffffc02072ae:	4709                	li	a4,2
ffffffffc02072b0:	0009b783          	ld	a5,0(s3)
ffffffffc02072b4:	00093503          	ld	a0,0(s2)
ffffffffc02072b8:	04e68e63          	beq	a3,a4,ffffffffc0207314 <schedule+0x9e>
ffffffffc02072bc:	739c                	ld	a5,32(a5)
ffffffffc02072be:	9782                	jalr	a5
ffffffffc02072c0:	842a                	mv	s0,a0
ffffffffc02072c2:	c521                	beqz	a0,ffffffffc020730a <schedule+0x94>
ffffffffc02072c4:	0009b783          	ld	a5,0(s3)
ffffffffc02072c8:	00093503          	ld	a0,0(s2)
ffffffffc02072cc:	85a2                	mv	a1,s0
ffffffffc02072ce:	6f9c                	ld	a5,24(a5)
ffffffffc02072d0:	9782                	jalr	a5
ffffffffc02072d2:	441c                	lw	a5,8(s0)
ffffffffc02072d4:	6098                	ld	a4,0(s1)
ffffffffc02072d6:	2785                	addiw	a5,a5,1
ffffffffc02072d8:	c41c                	sw	a5,8(s0)
ffffffffc02072da:	00870563          	beq	a4,s0,ffffffffc02072e4 <schedule+0x6e>
ffffffffc02072de:	8522                	mv	a0,s0
ffffffffc02072e0:	f70fe0ef          	jal	ra,ffffffffc0205a50 <proc_run>
ffffffffc02072e4:	000a1a63          	bnez	s4,ffffffffc02072f8 <schedule+0x82>
ffffffffc02072e8:	70a2                	ld	ra,40(sp)
ffffffffc02072ea:	7402                	ld	s0,32(sp)
ffffffffc02072ec:	64e2                	ld	s1,24(sp)
ffffffffc02072ee:	6942                	ld	s2,16(sp)
ffffffffc02072f0:	69a2                	ld	s3,8(sp)
ffffffffc02072f2:	6a02                	ld	s4,0(sp)
ffffffffc02072f4:	6145                	addi	sp,sp,48
ffffffffc02072f6:	8082                	ret
ffffffffc02072f8:	7402                	ld	s0,32(sp)
ffffffffc02072fa:	70a2                	ld	ra,40(sp)
ffffffffc02072fc:	64e2                	ld	s1,24(sp)
ffffffffc02072fe:	6942                	ld	s2,16(sp)
ffffffffc0207300:	69a2                	ld	s3,8(sp)
ffffffffc0207302:	6a02                	ld	s4,0(sp)
ffffffffc0207304:	6145                	addi	sp,sp,48
ffffffffc0207306:	967f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc020730a:	0008f417          	auipc	s0,0x8f
ffffffffc020730e:	5be43403          	ld	s0,1470(s0) # ffffffffc02968c8 <idleproc>
ffffffffc0207312:	b7c1                	j	ffffffffc02072d2 <schedule+0x5c>
ffffffffc0207314:	0008f717          	auipc	a4,0x8f
ffffffffc0207318:	5b473703          	ld	a4,1460(a4) # ffffffffc02968c8 <idleproc>
ffffffffc020731c:	fae580e3          	beq	a1,a4,ffffffffc02072bc <schedule+0x46>
ffffffffc0207320:	6b9c                	ld	a5,16(a5)
ffffffffc0207322:	9782                	jalr	a5
ffffffffc0207324:	0009b783          	ld	a5,0(s3)
ffffffffc0207328:	00093503          	ld	a0,0(s2)
ffffffffc020732c:	bf41                	j	ffffffffc02072bc <schedule+0x46>
ffffffffc020732e:	945f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207332:	4a05                	li	s4,1
ffffffffc0207334:	bfa9                	j	ffffffffc020728e <schedule+0x18>

ffffffffc0207336 <add_timer>:
ffffffffc0207336:	1141                	addi	sp,sp,-16
ffffffffc0207338:	e022                	sd	s0,0(sp)
ffffffffc020733a:	e406                	sd	ra,8(sp)
ffffffffc020733c:	842a                	mv	s0,a0
ffffffffc020733e:	100027f3          	csrr	a5,sstatus
ffffffffc0207342:	8b89                	andi	a5,a5,2
ffffffffc0207344:	4501                	li	a0,0
ffffffffc0207346:	eba5                	bnez	a5,ffffffffc02073b6 <add_timer+0x80>
ffffffffc0207348:	401c                	lw	a5,0(s0)
ffffffffc020734a:	cbb5                	beqz	a5,ffffffffc02073be <add_timer+0x88>
ffffffffc020734c:	6418                	ld	a4,8(s0)
ffffffffc020734e:	cb25                	beqz	a4,ffffffffc02073be <add_timer+0x88>
ffffffffc0207350:	6c18                	ld	a4,24(s0)
ffffffffc0207352:	01040593          	addi	a1,s0,16
ffffffffc0207356:	08e59463          	bne	a1,a4,ffffffffc02073de <add_timer+0xa8>
ffffffffc020735a:	0008e617          	auipc	a2,0x8e
ffffffffc020735e:	49660613          	addi	a2,a2,1174 # ffffffffc02957f0 <timer_list>
ffffffffc0207362:	6618                	ld	a4,8(a2)
ffffffffc0207364:	00c71863          	bne	a4,a2,ffffffffc0207374 <add_timer+0x3e>
ffffffffc0207368:	a80d                	j	ffffffffc020739a <add_timer+0x64>
ffffffffc020736a:	6718                	ld	a4,8(a4)
ffffffffc020736c:	9f95                	subw	a5,a5,a3
ffffffffc020736e:	c01c                	sw	a5,0(s0)
ffffffffc0207370:	02c70563          	beq	a4,a2,ffffffffc020739a <add_timer+0x64>
ffffffffc0207374:	ff072683          	lw	a3,-16(a4)
ffffffffc0207378:	fed7f9e3          	bgeu	a5,a3,ffffffffc020736a <add_timer+0x34>
ffffffffc020737c:	40f687bb          	subw	a5,a3,a5
ffffffffc0207380:	fef72823          	sw	a5,-16(a4)
ffffffffc0207384:	631c                	ld	a5,0(a4)
ffffffffc0207386:	e30c                	sd	a1,0(a4)
ffffffffc0207388:	e78c                	sd	a1,8(a5)
ffffffffc020738a:	ec18                	sd	a4,24(s0)
ffffffffc020738c:	e81c                	sd	a5,16(s0)
ffffffffc020738e:	c105                	beqz	a0,ffffffffc02073ae <add_timer+0x78>
ffffffffc0207390:	6402                	ld	s0,0(sp)
ffffffffc0207392:	60a2                	ld	ra,8(sp)
ffffffffc0207394:	0141                	addi	sp,sp,16
ffffffffc0207396:	8d7f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc020739a:	0008e717          	auipc	a4,0x8e
ffffffffc020739e:	45670713          	addi	a4,a4,1110 # ffffffffc02957f0 <timer_list>
ffffffffc02073a2:	631c                	ld	a5,0(a4)
ffffffffc02073a4:	e30c                	sd	a1,0(a4)
ffffffffc02073a6:	e78c                	sd	a1,8(a5)
ffffffffc02073a8:	ec18                	sd	a4,24(s0)
ffffffffc02073aa:	e81c                	sd	a5,16(s0)
ffffffffc02073ac:	f175                	bnez	a0,ffffffffc0207390 <add_timer+0x5a>
ffffffffc02073ae:	60a2                	ld	ra,8(sp)
ffffffffc02073b0:	6402                	ld	s0,0(sp)
ffffffffc02073b2:	0141                	addi	sp,sp,16
ffffffffc02073b4:	8082                	ret
ffffffffc02073b6:	8bdf90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02073ba:	4505                	li	a0,1
ffffffffc02073bc:	b771                	j	ffffffffc0207348 <add_timer+0x12>
ffffffffc02073be:	00006697          	auipc	a3,0x6
ffffffffc02073c2:	5b268693          	addi	a3,a3,1458 # ffffffffc020d970 <CSWTCH.79+0x6a8>
ffffffffc02073c6:	00004617          	auipc	a2,0x4
ffffffffc02073ca:	50260613          	addi	a2,a2,1282 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02073ce:	07a00593          	li	a1,122
ffffffffc02073d2:	00006517          	auipc	a0,0x6
ffffffffc02073d6:	56650513          	addi	a0,a0,1382 # ffffffffc020d938 <CSWTCH.79+0x670>
ffffffffc02073da:	8c4f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02073de:	00006697          	auipc	a3,0x6
ffffffffc02073e2:	5c268693          	addi	a3,a3,1474 # ffffffffc020d9a0 <CSWTCH.79+0x6d8>
ffffffffc02073e6:	00004617          	auipc	a2,0x4
ffffffffc02073ea:	4e260613          	addi	a2,a2,1250 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02073ee:	07b00593          	li	a1,123
ffffffffc02073f2:	00006517          	auipc	a0,0x6
ffffffffc02073f6:	54650513          	addi	a0,a0,1350 # ffffffffc020d938 <CSWTCH.79+0x670>
ffffffffc02073fa:	8a4f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02073fe <del_timer>:
ffffffffc02073fe:	1101                	addi	sp,sp,-32
ffffffffc0207400:	e822                	sd	s0,16(sp)
ffffffffc0207402:	ec06                	sd	ra,24(sp)
ffffffffc0207404:	e426                	sd	s1,8(sp)
ffffffffc0207406:	842a                	mv	s0,a0
ffffffffc0207408:	100027f3          	csrr	a5,sstatus
ffffffffc020740c:	8b89                	andi	a5,a5,2
ffffffffc020740e:	01050493          	addi	s1,a0,16
ffffffffc0207412:	eb9d                	bnez	a5,ffffffffc0207448 <del_timer+0x4a>
ffffffffc0207414:	6d1c                	ld	a5,24(a0)
ffffffffc0207416:	02978463          	beq	a5,s1,ffffffffc020743e <del_timer+0x40>
ffffffffc020741a:	4114                	lw	a3,0(a0)
ffffffffc020741c:	6918                	ld	a4,16(a0)
ffffffffc020741e:	ce81                	beqz	a3,ffffffffc0207436 <del_timer+0x38>
ffffffffc0207420:	0008e617          	auipc	a2,0x8e
ffffffffc0207424:	3d060613          	addi	a2,a2,976 # ffffffffc02957f0 <timer_list>
ffffffffc0207428:	00c78763          	beq	a5,a2,ffffffffc0207436 <del_timer+0x38>
ffffffffc020742c:	ff07a603          	lw	a2,-16(a5)
ffffffffc0207430:	9eb1                	addw	a3,a3,a2
ffffffffc0207432:	fed7a823          	sw	a3,-16(a5)
ffffffffc0207436:	e71c                	sd	a5,8(a4)
ffffffffc0207438:	e398                	sd	a4,0(a5)
ffffffffc020743a:	ec04                	sd	s1,24(s0)
ffffffffc020743c:	e804                	sd	s1,16(s0)
ffffffffc020743e:	60e2                	ld	ra,24(sp)
ffffffffc0207440:	6442                	ld	s0,16(sp)
ffffffffc0207442:	64a2                	ld	s1,8(sp)
ffffffffc0207444:	6105                	addi	sp,sp,32
ffffffffc0207446:	8082                	ret
ffffffffc0207448:	82bf90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020744c:	6c1c                	ld	a5,24(s0)
ffffffffc020744e:	02978463          	beq	a5,s1,ffffffffc0207476 <del_timer+0x78>
ffffffffc0207452:	4014                	lw	a3,0(s0)
ffffffffc0207454:	6818                	ld	a4,16(s0)
ffffffffc0207456:	ce81                	beqz	a3,ffffffffc020746e <del_timer+0x70>
ffffffffc0207458:	0008e617          	auipc	a2,0x8e
ffffffffc020745c:	39860613          	addi	a2,a2,920 # ffffffffc02957f0 <timer_list>
ffffffffc0207460:	00c78763          	beq	a5,a2,ffffffffc020746e <del_timer+0x70>
ffffffffc0207464:	ff07a603          	lw	a2,-16(a5)
ffffffffc0207468:	9eb1                	addw	a3,a3,a2
ffffffffc020746a:	fed7a823          	sw	a3,-16(a5)
ffffffffc020746e:	e71c                	sd	a5,8(a4)
ffffffffc0207470:	e398                	sd	a4,0(a5)
ffffffffc0207472:	ec04                	sd	s1,24(s0)
ffffffffc0207474:	e804                	sd	s1,16(s0)
ffffffffc0207476:	6442                	ld	s0,16(sp)
ffffffffc0207478:	60e2                	ld	ra,24(sp)
ffffffffc020747a:	64a2                	ld	s1,8(sp)
ffffffffc020747c:	6105                	addi	sp,sp,32
ffffffffc020747e:	feef906f          	j	ffffffffc0200c6c <intr_enable>

ffffffffc0207482 <run_timer_list>:
ffffffffc0207482:	7139                	addi	sp,sp,-64
ffffffffc0207484:	fc06                	sd	ra,56(sp)
ffffffffc0207486:	f822                	sd	s0,48(sp)
ffffffffc0207488:	f426                	sd	s1,40(sp)
ffffffffc020748a:	f04a                	sd	s2,32(sp)
ffffffffc020748c:	ec4e                	sd	s3,24(sp)
ffffffffc020748e:	e852                	sd	s4,16(sp)
ffffffffc0207490:	e456                	sd	s5,8(sp)
ffffffffc0207492:	e05a                	sd	s6,0(sp)
ffffffffc0207494:	100027f3          	csrr	a5,sstatus
ffffffffc0207498:	8b89                	andi	a5,a5,2
ffffffffc020749a:	4b01                	li	s6,0
ffffffffc020749c:	efe9                	bnez	a5,ffffffffc0207576 <run_timer_list+0xf4>
ffffffffc020749e:	0008e997          	auipc	s3,0x8e
ffffffffc02074a2:	35298993          	addi	s3,s3,850 # ffffffffc02957f0 <timer_list>
ffffffffc02074a6:	0089b403          	ld	s0,8(s3)
ffffffffc02074aa:	07340a63          	beq	s0,s3,ffffffffc020751e <run_timer_list+0x9c>
ffffffffc02074ae:	ff042783          	lw	a5,-16(s0)
ffffffffc02074b2:	ff040913          	addi	s2,s0,-16
ffffffffc02074b6:	0e078763          	beqz	a5,ffffffffc02075a4 <run_timer_list+0x122>
ffffffffc02074ba:	fff7871b          	addiw	a4,a5,-1
ffffffffc02074be:	fee42823          	sw	a4,-16(s0)
ffffffffc02074c2:	ef31                	bnez	a4,ffffffffc020751e <run_timer_list+0x9c>
ffffffffc02074c4:	00006a97          	auipc	s5,0x6
ffffffffc02074c8:	544a8a93          	addi	s5,s5,1348 # ffffffffc020da08 <CSWTCH.79+0x740>
ffffffffc02074cc:	00006a17          	auipc	s4,0x6
ffffffffc02074d0:	46ca0a13          	addi	s4,s4,1132 # ffffffffc020d938 <CSWTCH.79+0x670>
ffffffffc02074d4:	a005                	j	ffffffffc02074f4 <run_timer_list+0x72>
ffffffffc02074d6:	0a07d763          	bgez	a5,ffffffffc0207584 <run_timer_list+0x102>
ffffffffc02074da:	8526                	mv	a0,s1
ffffffffc02074dc:	ce9ff0ef          	jal	ra,ffffffffc02071c4 <wakeup_proc>
ffffffffc02074e0:	854a                	mv	a0,s2
ffffffffc02074e2:	f1dff0ef          	jal	ra,ffffffffc02073fe <del_timer>
ffffffffc02074e6:	03340c63          	beq	s0,s3,ffffffffc020751e <run_timer_list+0x9c>
ffffffffc02074ea:	ff042783          	lw	a5,-16(s0)
ffffffffc02074ee:	ff040913          	addi	s2,s0,-16
ffffffffc02074f2:	e795                	bnez	a5,ffffffffc020751e <run_timer_list+0x9c>
ffffffffc02074f4:	00893483          	ld	s1,8(s2)
ffffffffc02074f8:	6400                	ld	s0,8(s0)
ffffffffc02074fa:	0ec4a783          	lw	a5,236(s1)
ffffffffc02074fe:	ffe1                	bnez	a5,ffffffffc02074d6 <run_timer_list+0x54>
ffffffffc0207500:	40d4                	lw	a3,4(s1)
ffffffffc0207502:	8656                	mv	a2,s5
ffffffffc0207504:	0ba00593          	li	a1,186
ffffffffc0207508:	8552                	mv	a0,s4
ffffffffc020750a:	ffdf80ef          	jal	ra,ffffffffc0200506 <__warn>
ffffffffc020750e:	8526                	mv	a0,s1
ffffffffc0207510:	cb5ff0ef          	jal	ra,ffffffffc02071c4 <wakeup_proc>
ffffffffc0207514:	854a                	mv	a0,s2
ffffffffc0207516:	ee9ff0ef          	jal	ra,ffffffffc02073fe <del_timer>
ffffffffc020751a:	fd3418e3          	bne	s0,s3,ffffffffc02074ea <run_timer_list+0x68>
ffffffffc020751e:	0008f597          	auipc	a1,0x8f
ffffffffc0207522:	3a25b583          	ld	a1,930(a1) # ffffffffc02968c0 <current>
ffffffffc0207526:	c18d                	beqz	a1,ffffffffc0207548 <run_timer_list+0xc6>
ffffffffc0207528:	0008f797          	auipc	a5,0x8f
ffffffffc020752c:	3a07b783          	ld	a5,928(a5) # ffffffffc02968c8 <idleproc>
ffffffffc0207530:	04f58763          	beq	a1,a5,ffffffffc020757e <run_timer_list+0xfc>
ffffffffc0207534:	0008f797          	auipc	a5,0x8f
ffffffffc0207538:	3b47b783          	ld	a5,948(a5) # ffffffffc02968e8 <sched_class>
ffffffffc020753c:	779c                	ld	a5,40(a5)
ffffffffc020753e:	0008f517          	auipc	a0,0x8f
ffffffffc0207542:	3a253503          	ld	a0,930(a0) # ffffffffc02968e0 <rq>
ffffffffc0207546:	9782                	jalr	a5
ffffffffc0207548:	000b1c63          	bnez	s6,ffffffffc0207560 <run_timer_list+0xde>
ffffffffc020754c:	70e2                	ld	ra,56(sp)
ffffffffc020754e:	7442                	ld	s0,48(sp)
ffffffffc0207550:	74a2                	ld	s1,40(sp)
ffffffffc0207552:	7902                	ld	s2,32(sp)
ffffffffc0207554:	69e2                	ld	s3,24(sp)
ffffffffc0207556:	6a42                	ld	s4,16(sp)
ffffffffc0207558:	6aa2                	ld	s5,8(sp)
ffffffffc020755a:	6b02                	ld	s6,0(sp)
ffffffffc020755c:	6121                	addi	sp,sp,64
ffffffffc020755e:	8082                	ret
ffffffffc0207560:	7442                	ld	s0,48(sp)
ffffffffc0207562:	70e2                	ld	ra,56(sp)
ffffffffc0207564:	74a2                	ld	s1,40(sp)
ffffffffc0207566:	7902                	ld	s2,32(sp)
ffffffffc0207568:	69e2                	ld	s3,24(sp)
ffffffffc020756a:	6a42                	ld	s4,16(sp)
ffffffffc020756c:	6aa2                	ld	s5,8(sp)
ffffffffc020756e:	6b02                	ld	s6,0(sp)
ffffffffc0207570:	6121                	addi	sp,sp,64
ffffffffc0207572:	efaf906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0207576:	efcf90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020757a:	4b05                	li	s6,1
ffffffffc020757c:	b70d                	j	ffffffffc020749e <run_timer_list+0x1c>
ffffffffc020757e:	4785                	li	a5,1
ffffffffc0207580:	ed9c                	sd	a5,24(a1)
ffffffffc0207582:	b7d9                	j	ffffffffc0207548 <run_timer_list+0xc6>
ffffffffc0207584:	00006697          	auipc	a3,0x6
ffffffffc0207588:	45c68693          	addi	a3,a3,1116 # ffffffffc020d9e0 <CSWTCH.79+0x718>
ffffffffc020758c:	00004617          	auipc	a2,0x4
ffffffffc0207590:	33c60613          	addi	a2,a2,828 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0207594:	0b600593          	li	a1,182
ffffffffc0207598:	00006517          	auipc	a0,0x6
ffffffffc020759c:	3a050513          	addi	a0,a0,928 # ffffffffc020d938 <CSWTCH.79+0x670>
ffffffffc02075a0:	efff80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02075a4:	00006697          	auipc	a3,0x6
ffffffffc02075a8:	42468693          	addi	a3,a3,1060 # ffffffffc020d9c8 <CSWTCH.79+0x700>
ffffffffc02075ac:	00004617          	auipc	a2,0x4
ffffffffc02075b0:	31c60613          	addi	a2,a2,796 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02075b4:	0ae00593          	li	a1,174
ffffffffc02075b8:	00006517          	auipc	a0,0x6
ffffffffc02075bc:	38050513          	addi	a0,a0,896 # ffffffffc020d938 <CSWTCH.79+0x670>
ffffffffc02075c0:	edff80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02075c4 <sys_getpid>:
ffffffffc02075c4:	0008f797          	auipc	a5,0x8f
ffffffffc02075c8:	2fc7b783          	ld	a5,764(a5) # ffffffffc02968c0 <current>
ffffffffc02075cc:	43c8                	lw	a0,4(a5)
ffffffffc02075ce:	8082                	ret

ffffffffc02075d0 <sys_pgdir>:
ffffffffc02075d0:	4501                	li	a0,0
ffffffffc02075d2:	8082                	ret

ffffffffc02075d4 <sys_gettime>:
ffffffffc02075d4:	0008f797          	auipc	a5,0x8f
ffffffffc02075d8:	29c7b783          	ld	a5,668(a5) # ffffffffc0296870 <ticks>
ffffffffc02075dc:	0027951b          	slliw	a0,a5,0x2
ffffffffc02075e0:	9d3d                	addw	a0,a0,a5
ffffffffc02075e2:	0015151b          	slliw	a0,a0,0x1
ffffffffc02075e6:	8082                	ret

ffffffffc02075e8 <sys_lab6_set_priority>:
ffffffffc02075e8:	4108                	lw	a0,0(a0)
ffffffffc02075ea:	1141                	addi	sp,sp,-16
ffffffffc02075ec:	e406                	sd	ra,8(sp)
ffffffffc02075ee:	975ff0ef          	jal	ra,ffffffffc0206f62 <lab6_set_priority>
ffffffffc02075f2:	60a2                	ld	ra,8(sp)
ffffffffc02075f4:	4501                	li	a0,0
ffffffffc02075f6:	0141                	addi	sp,sp,16
ffffffffc02075f8:	8082                	ret

ffffffffc02075fa <sys_dup>:
ffffffffc02075fa:	450c                	lw	a1,8(a0)
ffffffffc02075fc:	4108                	lw	a0,0(a0)
ffffffffc02075fe:	b28fe06f          	j	ffffffffc0205926 <sysfile_dup>

ffffffffc0207602 <sys_getdirentry>:
ffffffffc0207602:	650c                	ld	a1,8(a0)
ffffffffc0207604:	4108                	lw	a0,0(a0)
ffffffffc0207606:	a30fe06f          	j	ffffffffc0205836 <sysfile_getdirentry>

ffffffffc020760a <sys_getcwd>:
ffffffffc020760a:	650c                	ld	a1,8(a0)
ffffffffc020760c:	6108                	ld	a0,0(a0)
ffffffffc020760e:	984fe06f          	j	ffffffffc0205792 <sysfile_getcwd>

ffffffffc0207612 <sys_fsync>:
ffffffffc0207612:	4108                	lw	a0,0(a0)
ffffffffc0207614:	97afe06f          	j	ffffffffc020578e <sysfile_fsync>

ffffffffc0207618 <sys_fstat>:
ffffffffc0207618:	650c                	ld	a1,8(a0)
ffffffffc020761a:	4108                	lw	a0,0(a0)
ffffffffc020761c:	8d2fe06f          	j	ffffffffc02056ee <sysfile_fstat>

ffffffffc0207620 <sys_seek>:
ffffffffc0207620:	4910                	lw	a2,16(a0)
ffffffffc0207622:	650c                	ld	a1,8(a0)
ffffffffc0207624:	4108                	lw	a0,0(a0)
ffffffffc0207626:	8c4fe06f          	j	ffffffffc02056ea <sysfile_seek>

ffffffffc020762a <sys_write>:
ffffffffc020762a:	6910                	ld	a2,16(a0)
ffffffffc020762c:	650c                	ld	a1,8(a0)
ffffffffc020762e:	4108                	lw	a0,0(a0)
ffffffffc0207630:	fa1fd06f          	j	ffffffffc02055d0 <sysfile_write>

ffffffffc0207634 <sys_read>:
ffffffffc0207634:	6910                	ld	a2,16(a0)
ffffffffc0207636:	650c                	ld	a1,8(a0)
ffffffffc0207638:	4108                	lw	a0,0(a0)
ffffffffc020763a:	e83fd06f          	j	ffffffffc02054bc <sysfile_read>

ffffffffc020763e <sys_close>:
ffffffffc020763e:	4108                	lw	a0,0(a0)
ffffffffc0207640:	e79fd06f          	j	ffffffffc02054b8 <sysfile_close>

ffffffffc0207644 <sys_open>:
ffffffffc0207644:	450c                	lw	a1,8(a0)
ffffffffc0207646:	6108                	ld	a0,0(a0)
ffffffffc0207648:	e3dfd06f          	j	ffffffffc0205484 <sysfile_open>

ffffffffc020764c <sys_putc>:
ffffffffc020764c:	4108                	lw	a0,0(a0)
ffffffffc020764e:	1141                	addi	sp,sp,-16
ffffffffc0207650:	e406                	sd	ra,8(sp)
ffffffffc0207652:	b91f80ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0207656:	60a2                	ld	ra,8(sp)
ffffffffc0207658:	4501                	li	a0,0
ffffffffc020765a:	0141                	addi	sp,sp,16
ffffffffc020765c:	8082                	ret

ffffffffc020765e <sys_kill>:
ffffffffc020765e:	4108                	lw	a0,0(a0)
ffffffffc0207660:	ea0ff06f          	j	ffffffffc0206d00 <do_kill>

ffffffffc0207664 <sys_sleep>:
ffffffffc0207664:	4108                	lw	a0,0(a0)
ffffffffc0207666:	937ff06f          	j	ffffffffc0206f9c <do_sleep>

ffffffffc020766a <sys_yield>:
ffffffffc020766a:	e48ff06f          	j	ffffffffc0206cb2 <do_yield>

ffffffffc020766e <sys_exec>:
ffffffffc020766e:	6910                	ld	a2,16(a0)
ffffffffc0207670:	450c                	lw	a1,8(a0)
ffffffffc0207672:	6108                	ld	a0,0(a0)
ffffffffc0207674:	d5bfe06f          	j	ffffffffc02063ce <do_execve>

ffffffffc0207678 <sys_wait>:
ffffffffc0207678:	650c                	ld	a1,8(a0)
ffffffffc020767a:	4108                	lw	a0,0(a0)
ffffffffc020767c:	e46ff06f          	j	ffffffffc0206cc2 <do_wait>

ffffffffc0207680 <sys_fork>:
ffffffffc0207680:	0008f797          	auipc	a5,0x8f
ffffffffc0207684:	2407b783          	ld	a5,576(a5) # ffffffffc02968c0 <current>
ffffffffc0207688:	73d0                	ld	a2,160(a5)
ffffffffc020768a:	4501                	li	a0,0
ffffffffc020768c:	6a0c                	ld	a1,16(a2)
ffffffffc020768e:	c32fe06f          	j	ffffffffc0205ac0 <do_fork>

ffffffffc0207692 <sys_exit>:
ffffffffc0207692:	4108                	lw	a0,0(a0)
ffffffffc0207694:	8b7fe06f          	j	ffffffffc0205f4a <do_exit>

ffffffffc0207698 <syscall>:
ffffffffc0207698:	715d                	addi	sp,sp,-80
ffffffffc020769a:	fc26                	sd	s1,56(sp)
ffffffffc020769c:	0008f497          	auipc	s1,0x8f
ffffffffc02076a0:	22448493          	addi	s1,s1,548 # ffffffffc02968c0 <current>
ffffffffc02076a4:	6098                	ld	a4,0(s1)
ffffffffc02076a6:	e0a2                	sd	s0,64(sp)
ffffffffc02076a8:	f84a                	sd	s2,48(sp)
ffffffffc02076aa:	7340                	ld	s0,160(a4)
ffffffffc02076ac:	e486                	sd	ra,72(sp)
ffffffffc02076ae:	0ff00793          	li	a5,255
ffffffffc02076b2:	05042903          	lw	s2,80(s0)
ffffffffc02076b6:	0327ee63          	bltu	a5,s2,ffffffffc02076f2 <syscall+0x5a>
ffffffffc02076ba:	00391713          	slli	a4,s2,0x3
ffffffffc02076be:	00006797          	auipc	a5,0x6
ffffffffc02076c2:	3b278793          	addi	a5,a5,946 # ffffffffc020da70 <syscalls>
ffffffffc02076c6:	97ba                	add	a5,a5,a4
ffffffffc02076c8:	639c                	ld	a5,0(a5)
ffffffffc02076ca:	c785                	beqz	a5,ffffffffc02076f2 <syscall+0x5a>
ffffffffc02076cc:	6c28                	ld	a0,88(s0)
ffffffffc02076ce:	702c                	ld	a1,96(s0)
ffffffffc02076d0:	7430                	ld	a2,104(s0)
ffffffffc02076d2:	7834                	ld	a3,112(s0)
ffffffffc02076d4:	7c38                	ld	a4,120(s0)
ffffffffc02076d6:	e42a                	sd	a0,8(sp)
ffffffffc02076d8:	e82e                	sd	a1,16(sp)
ffffffffc02076da:	ec32                	sd	a2,24(sp)
ffffffffc02076dc:	f036                	sd	a3,32(sp)
ffffffffc02076de:	f43a                	sd	a4,40(sp)
ffffffffc02076e0:	0028                	addi	a0,sp,8
ffffffffc02076e2:	9782                	jalr	a5
ffffffffc02076e4:	60a6                	ld	ra,72(sp)
ffffffffc02076e6:	e828                	sd	a0,80(s0)
ffffffffc02076e8:	6406                	ld	s0,64(sp)
ffffffffc02076ea:	74e2                	ld	s1,56(sp)
ffffffffc02076ec:	7942                	ld	s2,48(sp)
ffffffffc02076ee:	6161                	addi	sp,sp,80
ffffffffc02076f0:	8082                	ret
ffffffffc02076f2:	8522                	mv	a0,s0
ffffffffc02076f4:	897f90ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc02076f8:	609c                	ld	a5,0(s1)
ffffffffc02076fa:	86ca                	mv	a3,s2
ffffffffc02076fc:	00006617          	auipc	a2,0x6
ffffffffc0207700:	32c60613          	addi	a2,a2,812 # ffffffffc020da28 <CSWTCH.79+0x760>
ffffffffc0207704:	43d8                	lw	a4,4(a5)
ffffffffc0207706:	0d800593          	li	a1,216
ffffffffc020770a:	0b478793          	addi	a5,a5,180
ffffffffc020770e:	00006517          	auipc	a0,0x6
ffffffffc0207712:	34a50513          	addi	a0,a0,842 # ffffffffc020da58 <CSWTCH.79+0x790>
ffffffffc0207716:	d89f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020771a <__alloc_inode>:
ffffffffc020771a:	1141                	addi	sp,sp,-16
ffffffffc020771c:	e022                	sd	s0,0(sp)
ffffffffc020771e:	842a                	mv	s0,a0
ffffffffc0207720:	07800513          	li	a0,120
ffffffffc0207724:	e406                	sd	ra,8(sp)
ffffffffc0207726:	869fa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020772a:	c111                	beqz	a0,ffffffffc020772e <__alloc_inode+0x14>
ffffffffc020772c:	cd20                	sw	s0,88(a0)
ffffffffc020772e:	60a2                	ld	ra,8(sp)
ffffffffc0207730:	6402                	ld	s0,0(sp)
ffffffffc0207732:	0141                	addi	sp,sp,16
ffffffffc0207734:	8082                	ret

ffffffffc0207736 <inode_init>:
ffffffffc0207736:	4785                	li	a5,1
ffffffffc0207738:	06052023          	sw	zero,96(a0)
ffffffffc020773c:	f92c                	sd	a1,112(a0)
ffffffffc020773e:	f530                	sd	a2,104(a0)
ffffffffc0207740:	cd7c                	sw	a5,92(a0)
ffffffffc0207742:	8082                	ret

ffffffffc0207744 <inode_kill>:
ffffffffc0207744:	4d78                	lw	a4,92(a0)
ffffffffc0207746:	1141                	addi	sp,sp,-16
ffffffffc0207748:	e406                	sd	ra,8(sp)
ffffffffc020774a:	e719                	bnez	a4,ffffffffc0207758 <inode_kill+0x14>
ffffffffc020774c:	513c                	lw	a5,96(a0)
ffffffffc020774e:	e78d                	bnez	a5,ffffffffc0207778 <inode_kill+0x34>
ffffffffc0207750:	60a2                	ld	ra,8(sp)
ffffffffc0207752:	0141                	addi	sp,sp,16
ffffffffc0207754:	8ebfa06f          	j	ffffffffc020203e <kfree>
ffffffffc0207758:	00007697          	auipc	a3,0x7
ffffffffc020775c:	b1868693          	addi	a3,a3,-1256 # ffffffffc020e270 <syscalls+0x800>
ffffffffc0207760:	00004617          	auipc	a2,0x4
ffffffffc0207764:	16860613          	addi	a2,a2,360 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0207768:	02900593          	li	a1,41
ffffffffc020776c:	00007517          	auipc	a0,0x7
ffffffffc0207770:	b2450513          	addi	a0,a0,-1244 # ffffffffc020e290 <syscalls+0x820>
ffffffffc0207774:	d2bf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207778:	00007697          	auipc	a3,0x7
ffffffffc020777c:	b3068693          	addi	a3,a3,-1232 # ffffffffc020e2a8 <syscalls+0x838>
ffffffffc0207780:	00004617          	auipc	a2,0x4
ffffffffc0207784:	14860613          	addi	a2,a2,328 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0207788:	02a00593          	li	a1,42
ffffffffc020778c:	00007517          	auipc	a0,0x7
ffffffffc0207790:	b0450513          	addi	a0,a0,-1276 # ffffffffc020e290 <syscalls+0x820>
ffffffffc0207794:	d0bf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207798 <inode_ref_inc>:
ffffffffc0207798:	4d7c                	lw	a5,92(a0)
ffffffffc020779a:	2785                	addiw	a5,a5,1
ffffffffc020779c:	cd7c                	sw	a5,92(a0)
ffffffffc020779e:	0007851b          	sext.w	a0,a5
ffffffffc02077a2:	8082                	ret

ffffffffc02077a4 <inode_open_inc>:
ffffffffc02077a4:	513c                	lw	a5,96(a0)
ffffffffc02077a6:	2785                	addiw	a5,a5,1
ffffffffc02077a8:	d13c                	sw	a5,96(a0)
ffffffffc02077aa:	0007851b          	sext.w	a0,a5
ffffffffc02077ae:	8082                	ret

ffffffffc02077b0 <inode_check>:
ffffffffc02077b0:	1141                	addi	sp,sp,-16
ffffffffc02077b2:	e406                	sd	ra,8(sp)
ffffffffc02077b4:	c90d                	beqz	a0,ffffffffc02077e6 <inode_check+0x36>
ffffffffc02077b6:	793c                	ld	a5,112(a0)
ffffffffc02077b8:	c79d                	beqz	a5,ffffffffc02077e6 <inode_check+0x36>
ffffffffc02077ba:	6398                	ld	a4,0(a5)
ffffffffc02077bc:	4625d7b7          	lui	a5,0x4625d
ffffffffc02077c0:	0786                	slli	a5,a5,0x1
ffffffffc02077c2:	47678793          	addi	a5,a5,1142 # 4625d476 <_binary_bin_sfs_img_size+0x461e8176>
ffffffffc02077c6:	08f71063          	bne	a4,a5,ffffffffc0207846 <inode_check+0x96>
ffffffffc02077ca:	4d78                	lw	a4,92(a0)
ffffffffc02077cc:	513c                	lw	a5,96(a0)
ffffffffc02077ce:	04f74c63          	blt	a4,a5,ffffffffc0207826 <inode_check+0x76>
ffffffffc02077d2:	0407ca63          	bltz	a5,ffffffffc0207826 <inode_check+0x76>
ffffffffc02077d6:	66c1                	lui	a3,0x10
ffffffffc02077d8:	02d75763          	bge	a4,a3,ffffffffc0207806 <inode_check+0x56>
ffffffffc02077dc:	02d7d563          	bge	a5,a3,ffffffffc0207806 <inode_check+0x56>
ffffffffc02077e0:	60a2                	ld	ra,8(sp)
ffffffffc02077e2:	0141                	addi	sp,sp,16
ffffffffc02077e4:	8082                	ret
ffffffffc02077e6:	00007697          	auipc	a3,0x7
ffffffffc02077ea:	ae268693          	addi	a3,a3,-1310 # ffffffffc020e2c8 <syscalls+0x858>
ffffffffc02077ee:	00004617          	auipc	a2,0x4
ffffffffc02077f2:	0da60613          	addi	a2,a2,218 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02077f6:	06e00593          	li	a1,110
ffffffffc02077fa:	00007517          	auipc	a0,0x7
ffffffffc02077fe:	a9650513          	addi	a0,a0,-1386 # ffffffffc020e290 <syscalls+0x820>
ffffffffc0207802:	c9df80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207806:	00007697          	auipc	a3,0x7
ffffffffc020780a:	b4268693          	addi	a3,a3,-1214 # ffffffffc020e348 <syscalls+0x8d8>
ffffffffc020780e:	00004617          	auipc	a2,0x4
ffffffffc0207812:	0ba60613          	addi	a2,a2,186 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0207816:	07200593          	li	a1,114
ffffffffc020781a:	00007517          	auipc	a0,0x7
ffffffffc020781e:	a7650513          	addi	a0,a0,-1418 # ffffffffc020e290 <syscalls+0x820>
ffffffffc0207822:	c7df80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207826:	00007697          	auipc	a3,0x7
ffffffffc020782a:	af268693          	addi	a3,a3,-1294 # ffffffffc020e318 <syscalls+0x8a8>
ffffffffc020782e:	00004617          	auipc	a2,0x4
ffffffffc0207832:	09a60613          	addi	a2,a2,154 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0207836:	07100593          	li	a1,113
ffffffffc020783a:	00007517          	auipc	a0,0x7
ffffffffc020783e:	a5650513          	addi	a0,a0,-1450 # ffffffffc020e290 <syscalls+0x820>
ffffffffc0207842:	c5df80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207846:	00007697          	auipc	a3,0x7
ffffffffc020784a:	aaa68693          	addi	a3,a3,-1366 # ffffffffc020e2f0 <syscalls+0x880>
ffffffffc020784e:	00004617          	auipc	a2,0x4
ffffffffc0207852:	07a60613          	addi	a2,a2,122 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0207856:	06f00593          	li	a1,111
ffffffffc020785a:	00007517          	auipc	a0,0x7
ffffffffc020785e:	a3650513          	addi	a0,a0,-1482 # ffffffffc020e290 <syscalls+0x820>
ffffffffc0207862:	c3df80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207866 <inode_ref_dec>:
ffffffffc0207866:	4d7c                	lw	a5,92(a0)
ffffffffc0207868:	1101                	addi	sp,sp,-32
ffffffffc020786a:	ec06                	sd	ra,24(sp)
ffffffffc020786c:	e822                	sd	s0,16(sp)
ffffffffc020786e:	e426                	sd	s1,8(sp)
ffffffffc0207870:	e04a                	sd	s2,0(sp)
ffffffffc0207872:	06f05e63          	blez	a5,ffffffffc02078ee <inode_ref_dec+0x88>
ffffffffc0207876:	fff7849b          	addiw	s1,a5,-1
ffffffffc020787a:	cd64                	sw	s1,92(a0)
ffffffffc020787c:	842a                	mv	s0,a0
ffffffffc020787e:	e09d                	bnez	s1,ffffffffc02078a4 <inode_ref_dec+0x3e>
ffffffffc0207880:	793c                	ld	a5,112(a0)
ffffffffc0207882:	c7b1                	beqz	a5,ffffffffc02078ce <inode_ref_dec+0x68>
ffffffffc0207884:	0487b903          	ld	s2,72(a5)
ffffffffc0207888:	04090363          	beqz	s2,ffffffffc02078ce <inode_ref_dec+0x68>
ffffffffc020788c:	00007597          	auipc	a1,0x7
ffffffffc0207890:	b6c58593          	addi	a1,a1,-1172 # ffffffffc020e3f8 <syscalls+0x988>
ffffffffc0207894:	f1dff0ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc0207898:	8522                	mv	a0,s0
ffffffffc020789a:	9902                	jalr	s2
ffffffffc020789c:	c501                	beqz	a0,ffffffffc02078a4 <inode_ref_dec+0x3e>
ffffffffc020789e:	57c5                	li	a5,-15
ffffffffc02078a0:	00f51963          	bne	a0,a5,ffffffffc02078b2 <inode_ref_dec+0x4c>
ffffffffc02078a4:	60e2                	ld	ra,24(sp)
ffffffffc02078a6:	6442                	ld	s0,16(sp)
ffffffffc02078a8:	6902                	ld	s2,0(sp)
ffffffffc02078aa:	8526                	mv	a0,s1
ffffffffc02078ac:	64a2                	ld	s1,8(sp)
ffffffffc02078ae:	6105                	addi	sp,sp,32
ffffffffc02078b0:	8082                	ret
ffffffffc02078b2:	85aa                	mv	a1,a0
ffffffffc02078b4:	00007517          	auipc	a0,0x7
ffffffffc02078b8:	b4c50513          	addi	a0,a0,-1204 # ffffffffc020e400 <syscalls+0x990>
ffffffffc02078bc:	8ebf80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02078c0:	60e2                	ld	ra,24(sp)
ffffffffc02078c2:	6442                	ld	s0,16(sp)
ffffffffc02078c4:	6902                	ld	s2,0(sp)
ffffffffc02078c6:	8526                	mv	a0,s1
ffffffffc02078c8:	64a2                	ld	s1,8(sp)
ffffffffc02078ca:	6105                	addi	sp,sp,32
ffffffffc02078cc:	8082                	ret
ffffffffc02078ce:	00007697          	auipc	a3,0x7
ffffffffc02078d2:	ada68693          	addi	a3,a3,-1318 # ffffffffc020e3a8 <syscalls+0x938>
ffffffffc02078d6:	00004617          	auipc	a2,0x4
ffffffffc02078da:	ff260613          	addi	a2,a2,-14 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02078de:	04400593          	li	a1,68
ffffffffc02078e2:	00007517          	auipc	a0,0x7
ffffffffc02078e6:	9ae50513          	addi	a0,a0,-1618 # ffffffffc020e290 <syscalls+0x820>
ffffffffc02078ea:	bb5f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02078ee:	00007697          	auipc	a3,0x7
ffffffffc02078f2:	a9a68693          	addi	a3,a3,-1382 # ffffffffc020e388 <syscalls+0x918>
ffffffffc02078f6:	00004617          	auipc	a2,0x4
ffffffffc02078fa:	fd260613          	addi	a2,a2,-46 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02078fe:	03f00593          	li	a1,63
ffffffffc0207902:	00007517          	auipc	a0,0x7
ffffffffc0207906:	98e50513          	addi	a0,a0,-1650 # ffffffffc020e290 <syscalls+0x820>
ffffffffc020790a:	b95f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020790e <inode_open_dec>:
ffffffffc020790e:	513c                	lw	a5,96(a0)
ffffffffc0207910:	1101                	addi	sp,sp,-32
ffffffffc0207912:	ec06                	sd	ra,24(sp)
ffffffffc0207914:	e822                	sd	s0,16(sp)
ffffffffc0207916:	e426                	sd	s1,8(sp)
ffffffffc0207918:	e04a                	sd	s2,0(sp)
ffffffffc020791a:	06f05b63          	blez	a5,ffffffffc0207990 <inode_open_dec+0x82>
ffffffffc020791e:	fff7849b          	addiw	s1,a5,-1
ffffffffc0207922:	d124                	sw	s1,96(a0)
ffffffffc0207924:	842a                	mv	s0,a0
ffffffffc0207926:	e085                	bnez	s1,ffffffffc0207946 <inode_open_dec+0x38>
ffffffffc0207928:	793c                	ld	a5,112(a0)
ffffffffc020792a:	c3b9                	beqz	a5,ffffffffc0207970 <inode_open_dec+0x62>
ffffffffc020792c:	0107b903          	ld	s2,16(a5)
ffffffffc0207930:	04090063          	beqz	s2,ffffffffc0207970 <inode_open_dec+0x62>
ffffffffc0207934:	00007597          	auipc	a1,0x7
ffffffffc0207938:	b5c58593          	addi	a1,a1,-1188 # ffffffffc020e490 <syscalls+0xa20>
ffffffffc020793c:	e75ff0ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc0207940:	8522                	mv	a0,s0
ffffffffc0207942:	9902                	jalr	s2
ffffffffc0207944:	e901                	bnez	a0,ffffffffc0207954 <inode_open_dec+0x46>
ffffffffc0207946:	60e2                	ld	ra,24(sp)
ffffffffc0207948:	6442                	ld	s0,16(sp)
ffffffffc020794a:	6902                	ld	s2,0(sp)
ffffffffc020794c:	8526                	mv	a0,s1
ffffffffc020794e:	64a2                	ld	s1,8(sp)
ffffffffc0207950:	6105                	addi	sp,sp,32
ffffffffc0207952:	8082                	ret
ffffffffc0207954:	85aa                	mv	a1,a0
ffffffffc0207956:	00007517          	auipc	a0,0x7
ffffffffc020795a:	b4250513          	addi	a0,a0,-1214 # ffffffffc020e498 <syscalls+0xa28>
ffffffffc020795e:	849f80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0207962:	60e2                	ld	ra,24(sp)
ffffffffc0207964:	6442                	ld	s0,16(sp)
ffffffffc0207966:	6902                	ld	s2,0(sp)
ffffffffc0207968:	8526                	mv	a0,s1
ffffffffc020796a:	64a2                	ld	s1,8(sp)
ffffffffc020796c:	6105                	addi	sp,sp,32
ffffffffc020796e:	8082                	ret
ffffffffc0207970:	00007697          	auipc	a3,0x7
ffffffffc0207974:	ad068693          	addi	a3,a3,-1328 # ffffffffc020e440 <syscalls+0x9d0>
ffffffffc0207978:	00004617          	auipc	a2,0x4
ffffffffc020797c:	f5060613          	addi	a2,a2,-176 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0207980:	06100593          	li	a1,97
ffffffffc0207984:	00007517          	auipc	a0,0x7
ffffffffc0207988:	90c50513          	addi	a0,a0,-1780 # ffffffffc020e290 <syscalls+0x820>
ffffffffc020798c:	b13f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207990:	00007697          	auipc	a3,0x7
ffffffffc0207994:	a9068693          	addi	a3,a3,-1392 # ffffffffc020e420 <syscalls+0x9b0>
ffffffffc0207998:	00004617          	auipc	a2,0x4
ffffffffc020799c:	f3060613          	addi	a2,a2,-208 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02079a0:	05c00593          	li	a1,92
ffffffffc02079a4:	00007517          	auipc	a0,0x7
ffffffffc02079a8:	8ec50513          	addi	a0,a0,-1812 # ffffffffc020e290 <syscalls+0x820>
ffffffffc02079ac:	af3f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02079b0 <__alloc_fs>:
ffffffffc02079b0:	1141                	addi	sp,sp,-16
ffffffffc02079b2:	e022                	sd	s0,0(sp)
ffffffffc02079b4:	842a                	mv	s0,a0
ffffffffc02079b6:	0d800513          	li	a0,216
ffffffffc02079ba:	e406                	sd	ra,8(sp)
ffffffffc02079bc:	dd2fa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02079c0:	c119                	beqz	a0,ffffffffc02079c6 <__alloc_fs+0x16>
ffffffffc02079c2:	0a852823          	sw	s0,176(a0)
ffffffffc02079c6:	60a2                	ld	ra,8(sp)
ffffffffc02079c8:	6402                	ld	s0,0(sp)
ffffffffc02079ca:	0141                	addi	sp,sp,16
ffffffffc02079cc:	8082                	ret

ffffffffc02079ce <vfs_init>:
ffffffffc02079ce:	1141                	addi	sp,sp,-16
ffffffffc02079d0:	4585                	li	a1,1
ffffffffc02079d2:	0008e517          	auipc	a0,0x8e
ffffffffc02079d6:	e2e50513          	addi	a0,a0,-466 # ffffffffc0295800 <bootfs_sem>
ffffffffc02079da:	e406                	sd	ra,8(sp)
ffffffffc02079dc:	addfc0ef          	jal	ra,ffffffffc02044b8 <sem_init>
ffffffffc02079e0:	60a2                	ld	ra,8(sp)
ffffffffc02079e2:	0141                	addi	sp,sp,16
ffffffffc02079e4:	a40d                	j	ffffffffc0207c06 <vfs_devlist_init>

ffffffffc02079e6 <vfs_set_bootfs>:
ffffffffc02079e6:	7179                	addi	sp,sp,-48
ffffffffc02079e8:	f022                	sd	s0,32(sp)
ffffffffc02079ea:	f406                	sd	ra,40(sp)
ffffffffc02079ec:	ec26                	sd	s1,24(sp)
ffffffffc02079ee:	e402                	sd	zero,8(sp)
ffffffffc02079f0:	842a                	mv	s0,a0
ffffffffc02079f2:	c915                	beqz	a0,ffffffffc0207a26 <vfs_set_bootfs+0x40>
ffffffffc02079f4:	03a00593          	li	a1,58
ffffffffc02079f8:	1d3030ef          	jal	ra,ffffffffc020b3ca <strchr>
ffffffffc02079fc:	c135                	beqz	a0,ffffffffc0207a60 <vfs_set_bootfs+0x7a>
ffffffffc02079fe:	00154783          	lbu	a5,1(a0)
ffffffffc0207a02:	efb9                	bnez	a5,ffffffffc0207a60 <vfs_set_bootfs+0x7a>
ffffffffc0207a04:	8522                	mv	a0,s0
ffffffffc0207a06:	11f000ef          	jal	ra,ffffffffc0208324 <vfs_chdir>
ffffffffc0207a0a:	842a                	mv	s0,a0
ffffffffc0207a0c:	c519                	beqz	a0,ffffffffc0207a1a <vfs_set_bootfs+0x34>
ffffffffc0207a0e:	70a2                	ld	ra,40(sp)
ffffffffc0207a10:	8522                	mv	a0,s0
ffffffffc0207a12:	7402                	ld	s0,32(sp)
ffffffffc0207a14:	64e2                	ld	s1,24(sp)
ffffffffc0207a16:	6145                	addi	sp,sp,48
ffffffffc0207a18:	8082                	ret
ffffffffc0207a1a:	0028                	addi	a0,sp,8
ffffffffc0207a1c:	013000ef          	jal	ra,ffffffffc020822e <vfs_get_curdir>
ffffffffc0207a20:	842a                	mv	s0,a0
ffffffffc0207a22:	f575                	bnez	a0,ffffffffc0207a0e <vfs_set_bootfs+0x28>
ffffffffc0207a24:	6422                	ld	s0,8(sp)
ffffffffc0207a26:	0008e517          	auipc	a0,0x8e
ffffffffc0207a2a:	dda50513          	addi	a0,a0,-550 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207a2e:	a95fc0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0207a32:	0008f797          	auipc	a5,0x8f
ffffffffc0207a36:	ebe78793          	addi	a5,a5,-322 # ffffffffc02968f0 <bootfs_node>
ffffffffc0207a3a:	6384                	ld	s1,0(a5)
ffffffffc0207a3c:	0008e517          	auipc	a0,0x8e
ffffffffc0207a40:	dc450513          	addi	a0,a0,-572 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207a44:	e380                	sd	s0,0(a5)
ffffffffc0207a46:	4401                	li	s0,0
ffffffffc0207a48:	a77fc0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0207a4c:	d0e9                	beqz	s1,ffffffffc0207a0e <vfs_set_bootfs+0x28>
ffffffffc0207a4e:	8526                	mv	a0,s1
ffffffffc0207a50:	e17ff0ef          	jal	ra,ffffffffc0207866 <inode_ref_dec>
ffffffffc0207a54:	70a2                	ld	ra,40(sp)
ffffffffc0207a56:	8522                	mv	a0,s0
ffffffffc0207a58:	7402                	ld	s0,32(sp)
ffffffffc0207a5a:	64e2                	ld	s1,24(sp)
ffffffffc0207a5c:	6145                	addi	sp,sp,48
ffffffffc0207a5e:	8082                	ret
ffffffffc0207a60:	5475                	li	s0,-3
ffffffffc0207a62:	b775                	j	ffffffffc0207a0e <vfs_set_bootfs+0x28>

ffffffffc0207a64 <vfs_get_bootfs>:
ffffffffc0207a64:	1101                	addi	sp,sp,-32
ffffffffc0207a66:	e426                	sd	s1,8(sp)
ffffffffc0207a68:	0008f497          	auipc	s1,0x8f
ffffffffc0207a6c:	e8848493          	addi	s1,s1,-376 # ffffffffc02968f0 <bootfs_node>
ffffffffc0207a70:	609c                	ld	a5,0(s1)
ffffffffc0207a72:	ec06                	sd	ra,24(sp)
ffffffffc0207a74:	e822                	sd	s0,16(sp)
ffffffffc0207a76:	c3a1                	beqz	a5,ffffffffc0207ab6 <vfs_get_bootfs+0x52>
ffffffffc0207a78:	842a                	mv	s0,a0
ffffffffc0207a7a:	0008e517          	auipc	a0,0x8e
ffffffffc0207a7e:	d8650513          	addi	a0,a0,-634 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207a82:	a41fc0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0207a86:	6084                	ld	s1,0(s1)
ffffffffc0207a88:	c08d                	beqz	s1,ffffffffc0207aaa <vfs_get_bootfs+0x46>
ffffffffc0207a8a:	8526                	mv	a0,s1
ffffffffc0207a8c:	d0dff0ef          	jal	ra,ffffffffc0207798 <inode_ref_inc>
ffffffffc0207a90:	0008e517          	auipc	a0,0x8e
ffffffffc0207a94:	d7050513          	addi	a0,a0,-656 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207a98:	a27fc0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0207a9c:	4501                	li	a0,0
ffffffffc0207a9e:	e004                	sd	s1,0(s0)
ffffffffc0207aa0:	60e2                	ld	ra,24(sp)
ffffffffc0207aa2:	6442                	ld	s0,16(sp)
ffffffffc0207aa4:	64a2                	ld	s1,8(sp)
ffffffffc0207aa6:	6105                	addi	sp,sp,32
ffffffffc0207aa8:	8082                	ret
ffffffffc0207aaa:	0008e517          	auipc	a0,0x8e
ffffffffc0207aae:	d5650513          	addi	a0,a0,-682 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207ab2:	a0dfc0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0207ab6:	5541                	li	a0,-16
ffffffffc0207ab8:	b7e5                	j	ffffffffc0207aa0 <vfs_get_bootfs+0x3c>

ffffffffc0207aba <vfs_do_add>:
ffffffffc0207aba:	7139                	addi	sp,sp,-64
ffffffffc0207abc:	fc06                	sd	ra,56(sp)
ffffffffc0207abe:	f822                	sd	s0,48(sp)
ffffffffc0207ac0:	f426                	sd	s1,40(sp)
ffffffffc0207ac2:	f04a                	sd	s2,32(sp)
ffffffffc0207ac4:	ec4e                	sd	s3,24(sp)
ffffffffc0207ac6:	e852                	sd	s4,16(sp)
ffffffffc0207ac8:	e456                	sd	s5,8(sp)
ffffffffc0207aca:	e05a                	sd	s6,0(sp)
ffffffffc0207acc:	0e050b63          	beqz	a0,ffffffffc0207bc2 <vfs_do_add+0x108>
ffffffffc0207ad0:	842a                	mv	s0,a0
ffffffffc0207ad2:	8a2e                	mv	s4,a1
ffffffffc0207ad4:	8b32                	mv	s6,a2
ffffffffc0207ad6:	8ab6                	mv	s5,a3
ffffffffc0207ad8:	c5cd                	beqz	a1,ffffffffc0207b82 <vfs_do_add+0xc8>
ffffffffc0207ada:	4db8                	lw	a4,88(a1)
ffffffffc0207adc:	6785                	lui	a5,0x1
ffffffffc0207ade:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0207ae2:	0af71163          	bne	a4,a5,ffffffffc0207b84 <vfs_do_add+0xca>
ffffffffc0207ae6:	8522                	mv	a0,s0
ffffffffc0207ae8:	057030ef          	jal	ra,ffffffffc020b33e <strlen>
ffffffffc0207aec:	47fd                	li	a5,31
ffffffffc0207aee:	0ca7e663          	bltu	a5,a0,ffffffffc0207bba <vfs_do_add+0x100>
ffffffffc0207af2:	8522                	mv	a0,s0
ffffffffc0207af4:	f00f80ef          	jal	ra,ffffffffc02001f4 <strdup>
ffffffffc0207af8:	84aa                	mv	s1,a0
ffffffffc0207afa:	c171                	beqz	a0,ffffffffc0207bbe <vfs_do_add+0x104>
ffffffffc0207afc:	03000513          	li	a0,48
ffffffffc0207b00:	c8efa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0207b04:	89aa                	mv	s3,a0
ffffffffc0207b06:	c92d                	beqz	a0,ffffffffc0207b78 <vfs_do_add+0xbe>
ffffffffc0207b08:	0008e517          	auipc	a0,0x8e
ffffffffc0207b0c:	d2050513          	addi	a0,a0,-736 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207b10:	0008e917          	auipc	s2,0x8e
ffffffffc0207b14:	d0890913          	addi	s2,s2,-760 # ffffffffc0295818 <vdev_list>
ffffffffc0207b18:	9abfc0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0207b1c:	844a                	mv	s0,s2
ffffffffc0207b1e:	a039                	j	ffffffffc0207b2c <vfs_do_add+0x72>
ffffffffc0207b20:	fe043503          	ld	a0,-32(s0)
ffffffffc0207b24:	85a6                	mv	a1,s1
ffffffffc0207b26:	061030ef          	jal	ra,ffffffffc020b386 <strcmp>
ffffffffc0207b2a:	cd2d                	beqz	a0,ffffffffc0207ba4 <vfs_do_add+0xea>
ffffffffc0207b2c:	6400                	ld	s0,8(s0)
ffffffffc0207b2e:	ff2419e3          	bne	s0,s2,ffffffffc0207b20 <vfs_do_add+0x66>
ffffffffc0207b32:	6418                	ld	a4,8(s0)
ffffffffc0207b34:	02098793          	addi	a5,s3,32
ffffffffc0207b38:	0099b023          	sd	s1,0(s3)
ffffffffc0207b3c:	0149b423          	sd	s4,8(s3)
ffffffffc0207b40:	0159bc23          	sd	s5,24(s3)
ffffffffc0207b44:	0169b823          	sd	s6,16(s3)
ffffffffc0207b48:	e31c                	sd	a5,0(a4)
ffffffffc0207b4a:	0289b023          	sd	s0,32(s3)
ffffffffc0207b4e:	02e9b423          	sd	a4,40(s3)
ffffffffc0207b52:	0008e517          	auipc	a0,0x8e
ffffffffc0207b56:	cd650513          	addi	a0,a0,-810 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207b5a:	e41c                	sd	a5,8(s0)
ffffffffc0207b5c:	4401                	li	s0,0
ffffffffc0207b5e:	961fc0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0207b62:	70e2                	ld	ra,56(sp)
ffffffffc0207b64:	8522                	mv	a0,s0
ffffffffc0207b66:	7442                	ld	s0,48(sp)
ffffffffc0207b68:	74a2                	ld	s1,40(sp)
ffffffffc0207b6a:	7902                	ld	s2,32(sp)
ffffffffc0207b6c:	69e2                	ld	s3,24(sp)
ffffffffc0207b6e:	6a42                	ld	s4,16(sp)
ffffffffc0207b70:	6aa2                	ld	s5,8(sp)
ffffffffc0207b72:	6b02                	ld	s6,0(sp)
ffffffffc0207b74:	6121                	addi	sp,sp,64
ffffffffc0207b76:	8082                	ret
ffffffffc0207b78:	5471                	li	s0,-4
ffffffffc0207b7a:	8526                	mv	a0,s1
ffffffffc0207b7c:	cc2fa0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0207b80:	b7cd                	j	ffffffffc0207b62 <vfs_do_add+0xa8>
ffffffffc0207b82:	d2b5                	beqz	a3,ffffffffc0207ae6 <vfs_do_add+0x2c>
ffffffffc0207b84:	00007697          	auipc	a3,0x7
ffffffffc0207b88:	95c68693          	addi	a3,a3,-1700 # ffffffffc020e4e0 <syscalls+0xa70>
ffffffffc0207b8c:	00004617          	auipc	a2,0x4
ffffffffc0207b90:	d3c60613          	addi	a2,a2,-708 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0207b94:	08f00593          	li	a1,143
ffffffffc0207b98:	00007517          	auipc	a0,0x7
ffffffffc0207b9c:	93050513          	addi	a0,a0,-1744 # ffffffffc020e4c8 <syscalls+0xa58>
ffffffffc0207ba0:	8fff80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207ba4:	0008e517          	auipc	a0,0x8e
ffffffffc0207ba8:	c8450513          	addi	a0,a0,-892 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207bac:	913fc0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0207bb0:	854e                	mv	a0,s3
ffffffffc0207bb2:	c8cfa0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0207bb6:	5425                	li	s0,-23
ffffffffc0207bb8:	b7c9                	j	ffffffffc0207b7a <vfs_do_add+0xc0>
ffffffffc0207bba:	5451                	li	s0,-12
ffffffffc0207bbc:	b75d                	j	ffffffffc0207b62 <vfs_do_add+0xa8>
ffffffffc0207bbe:	5471                	li	s0,-4
ffffffffc0207bc0:	b74d                	j	ffffffffc0207b62 <vfs_do_add+0xa8>
ffffffffc0207bc2:	00007697          	auipc	a3,0x7
ffffffffc0207bc6:	8f668693          	addi	a3,a3,-1802 # ffffffffc020e4b8 <syscalls+0xa48>
ffffffffc0207bca:	00004617          	auipc	a2,0x4
ffffffffc0207bce:	cfe60613          	addi	a2,a2,-770 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0207bd2:	08e00593          	li	a1,142
ffffffffc0207bd6:	00007517          	auipc	a0,0x7
ffffffffc0207bda:	8f250513          	addi	a0,a0,-1806 # ffffffffc020e4c8 <syscalls+0xa58>
ffffffffc0207bde:	8c1f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207be2 <find_mount.part.0>:
ffffffffc0207be2:	1141                	addi	sp,sp,-16
ffffffffc0207be4:	00007697          	auipc	a3,0x7
ffffffffc0207be8:	8d468693          	addi	a3,a3,-1836 # ffffffffc020e4b8 <syscalls+0xa48>
ffffffffc0207bec:	00004617          	auipc	a2,0x4
ffffffffc0207bf0:	cdc60613          	addi	a2,a2,-804 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0207bf4:	0cd00593          	li	a1,205
ffffffffc0207bf8:	00007517          	auipc	a0,0x7
ffffffffc0207bfc:	8d050513          	addi	a0,a0,-1840 # ffffffffc020e4c8 <syscalls+0xa58>
ffffffffc0207c00:	e406                	sd	ra,8(sp)
ffffffffc0207c02:	89df80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207c06 <vfs_devlist_init>:
ffffffffc0207c06:	0008e797          	auipc	a5,0x8e
ffffffffc0207c0a:	c1278793          	addi	a5,a5,-1006 # ffffffffc0295818 <vdev_list>
ffffffffc0207c0e:	4585                	li	a1,1
ffffffffc0207c10:	0008e517          	auipc	a0,0x8e
ffffffffc0207c14:	c1850513          	addi	a0,a0,-1000 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207c18:	e79c                	sd	a5,8(a5)
ffffffffc0207c1a:	e39c                	sd	a5,0(a5)
ffffffffc0207c1c:	89dfc06f          	j	ffffffffc02044b8 <sem_init>

ffffffffc0207c20 <vfs_cleanup>:
ffffffffc0207c20:	1101                	addi	sp,sp,-32
ffffffffc0207c22:	e426                	sd	s1,8(sp)
ffffffffc0207c24:	0008e497          	auipc	s1,0x8e
ffffffffc0207c28:	bf448493          	addi	s1,s1,-1036 # ffffffffc0295818 <vdev_list>
ffffffffc0207c2c:	649c                	ld	a5,8(s1)
ffffffffc0207c2e:	ec06                	sd	ra,24(sp)
ffffffffc0207c30:	e822                	sd	s0,16(sp)
ffffffffc0207c32:	02978e63          	beq	a5,s1,ffffffffc0207c6e <vfs_cleanup+0x4e>
ffffffffc0207c36:	0008e517          	auipc	a0,0x8e
ffffffffc0207c3a:	bf250513          	addi	a0,a0,-1038 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207c3e:	885fc0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0207c42:	6480                	ld	s0,8(s1)
ffffffffc0207c44:	00940b63          	beq	s0,s1,ffffffffc0207c5a <vfs_cleanup+0x3a>
ffffffffc0207c48:	ff043783          	ld	a5,-16(s0)
ffffffffc0207c4c:	853e                	mv	a0,a5
ffffffffc0207c4e:	c399                	beqz	a5,ffffffffc0207c54 <vfs_cleanup+0x34>
ffffffffc0207c50:	6bfc                	ld	a5,208(a5)
ffffffffc0207c52:	9782                	jalr	a5
ffffffffc0207c54:	6400                	ld	s0,8(s0)
ffffffffc0207c56:	fe9419e3          	bne	s0,s1,ffffffffc0207c48 <vfs_cleanup+0x28>
ffffffffc0207c5a:	6442                	ld	s0,16(sp)
ffffffffc0207c5c:	60e2                	ld	ra,24(sp)
ffffffffc0207c5e:	64a2                	ld	s1,8(sp)
ffffffffc0207c60:	0008e517          	auipc	a0,0x8e
ffffffffc0207c64:	bc850513          	addi	a0,a0,-1080 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207c68:	6105                	addi	sp,sp,32
ffffffffc0207c6a:	855fc06f          	j	ffffffffc02044be <up>
ffffffffc0207c6e:	60e2                	ld	ra,24(sp)
ffffffffc0207c70:	6442                	ld	s0,16(sp)
ffffffffc0207c72:	64a2                	ld	s1,8(sp)
ffffffffc0207c74:	6105                	addi	sp,sp,32
ffffffffc0207c76:	8082                	ret

ffffffffc0207c78 <vfs_get_root>:
ffffffffc0207c78:	7179                	addi	sp,sp,-48
ffffffffc0207c7a:	f406                	sd	ra,40(sp)
ffffffffc0207c7c:	f022                	sd	s0,32(sp)
ffffffffc0207c7e:	ec26                	sd	s1,24(sp)
ffffffffc0207c80:	e84a                	sd	s2,16(sp)
ffffffffc0207c82:	e44e                	sd	s3,8(sp)
ffffffffc0207c84:	e052                	sd	s4,0(sp)
ffffffffc0207c86:	c541                	beqz	a0,ffffffffc0207d0e <vfs_get_root+0x96>
ffffffffc0207c88:	0008e917          	auipc	s2,0x8e
ffffffffc0207c8c:	b9090913          	addi	s2,s2,-1136 # ffffffffc0295818 <vdev_list>
ffffffffc0207c90:	00893783          	ld	a5,8(s2)
ffffffffc0207c94:	07278b63          	beq	a5,s2,ffffffffc0207d0a <vfs_get_root+0x92>
ffffffffc0207c98:	89aa                	mv	s3,a0
ffffffffc0207c9a:	0008e517          	auipc	a0,0x8e
ffffffffc0207c9e:	b8e50513          	addi	a0,a0,-1138 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207ca2:	8a2e                	mv	s4,a1
ffffffffc0207ca4:	844a                	mv	s0,s2
ffffffffc0207ca6:	81dfc0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0207caa:	a801                	j	ffffffffc0207cba <vfs_get_root+0x42>
ffffffffc0207cac:	fe043583          	ld	a1,-32(s0)
ffffffffc0207cb0:	854e                	mv	a0,s3
ffffffffc0207cb2:	6d4030ef          	jal	ra,ffffffffc020b386 <strcmp>
ffffffffc0207cb6:	84aa                	mv	s1,a0
ffffffffc0207cb8:	c505                	beqz	a0,ffffffffc0207ce0 <vfs_get_root+0x68>
ffffffffc0207cba:	6400                	ld	s0,8(s0)
ffffffffc0207cbc:	ff2418e3          	bne	s0,s2,ffffffffc0207cac <vfs_get_root+0x34>
ffffffffc0207cc0:	54cd                	li	s1,-13
ffffffffc0207cc2:	0008e517          	auipc	a0,0x8e
ffffffffc0207cc6:	b6650513          	addi	a0,a0,-1178 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207cca:	ff4fc0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0207cce:	70a2                	ld	ra,40(sp)
ffffffffc0207cd0:	7402                	ld	s0,32(sp)
ffffffffc0207cd2:	6942                	ld	s2,16(sp)
ffffffffc0207cd4:	69a2                	ld	s3,8(sp)
ffffffffc0207cd6:	6a02                	ld	s4,0(sp)
ffffffffc0207cd8:	8526                	mv	a0,s1
ffffffffc0207cda:	64e2                	ld	s1,24(sp)
ffffffffc0207cdc:	6145                	addi	sp,sp,48
ffffffffc0207cde:	8082                	ret
ffffffffc0207ce0:	ff043503          	ld	a0,-16(s0)
ffffffffc0207ce4:	c519                	beqz	a0,ffffffffc0207cf2 <vfs_get_root+0x7a>
ffffffffc0207ce6:	617c                	ld	a5,192(a0)
ffffffffc0207ce8:	9782                	jalr	a5
ffffffffc0207cea:	c519                	beqz	a0,ffffffffc0207cf8 <vfs_get_root+0x80>
ffffffffc0207cec:	00aa3023          	sd	a0,0(s4)
ffffffffc0207cf0:	bfc9                	j	ffffffffc0207cc2 <vfs_get_root+0x4a>
ffffffffc0207cf2:	ff843783          	ld	a5,-8(s0)
ffffffffc0207cf6:	c399                	beqz	a5,ffffffffc0207cfc <vfs_get_root+0x84>
ffffffffc0207cf8:	54c9                	li	s1,-14
ffffffffc0207cfa:	b7e1                	j	ffffffffc0207cc2 <vfs_get_root+0x4a>
ffffffffc0207cfc:	fe843503          	ld	a0,-24(s0)
ffffffffc0207d00:	a99ff0ef          	jal	ra,ffffffffc0207798 <inode_ref_inc>
ffffffffc0207d04:	fe843503          	ld	a0,-24(s0)
ffffffffc0207d08:	b7cd                	j	ffffffffc0207cea <vfs_get_root+0x72>
ffffffffc0207d0a:	54cd                	li	s1,-13
ffffffffc0207d0c:	b7c9                	j	ffffffffc0207cce <vfs_get_root+0x56>
ffffffffc0207d0e:	00006697          	auipc	a3,0x6
ffffffffc0207d12:	7aa68693          	addi	a3,a3,1962 # ffffffffc020e4b8 <syscalls+0xa48>
ffffffffc0207d16:	00004617          	auipc	a2,0x4
ffffffffc0207d1a:	bb260613          	addi	a2,a2,-1102 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0207d1e:	04500593          	li	a1,69
ffffffffc0207d22:	00006517          	auipc	a0,0x6
ffffffffc0207d26:	7a650513          	addi	a0,a0,1958 # ffffffffc020e4c8 <syscalls+0xa58>
ffffffffc0207d2a:	f74f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207d2e <vfs_get_devname>:
ffffffffc0207d2e:	0008e697          	auipc	a3,0x8e
ffffffffc0207d32:	aea68693          	addi	a3,a3,-1302 # ffffffffc0295818 <vdev_list>
ffffffffc0207d36:	87b6                	mv	a5,a3
ffffffffc0207d38:	e511                	bnez	a0,ffffffffc0207d44 <vfs_get_devname+0x16>
ffffffffc0207d3a:	a829                	j	ffffffffc0207d54 <vfs_get_devname+0x26>
ffffffffc0207d3c:	ff07b703          	ld	a4,-16(a5)
ffffffffc0207d40:	00a70763          	beq	a4,a0,ffffffffc0207d4e <vfs_get_devname+0x20>
ffffffffc0207d44:	679c                	ld	a5,8(a5)
ffffffffc0207d46:	fed79be3          	bne	a5,a3,ffffffffc0207d3c <vfs_get_devname+0xe>
ffffffffc0207d4a:	4501                	li	a0,0
ffffffffc0207d4c:	8082                	ret
ffffffffc0207d4e:	fe07b503          	ld	a0,-32(a5)
ffffffffc0207d52:	8082                	ret
ffffffffc0207d54:	1141                	addi	sp,sp,-16
ffffffffc0207d56:	00006697          	auipc	a3,0x6
ffffffffc0207d5a:	7ea68693          	addi	a3,a3,2026 # ffffffffc020e540 <syscalls+0xad0>
ffffffffc0207d5e:	00004617          	auipc	a2,0x4
ffffffffc0207d62:	b6a60613          	addi	a2,a2,-1174 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0207d66:	06a00593          	li	a1,106
ffffffffc0207d6a:	00006517          	auipc	a0,0x6
ffffffffc0207d6e:	75e50513          	addi	a0,a0,1886 # ffffffffc020e4c8 <syscalls+0xa58>
ffffffffc0207d72:	e406                	sd	ra,8(sp)
ffffffffc0207d74:	f2af80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207d78 <vfs_add_dev>:
ffffffffc0207d78:	86b2                	mv	a3,a2
ffffffffc0207d7a:	4601                	li	a2,0
ffffffffc0207d7c:	d3fff06f          	j	ffffffffc0207aba <vfs_do_add>

ffffffffc0207d80 <vfs_mount>:
ffffffffc0207d80:	7179                	addi	sp,sp,-48
ffffffffc0207d82:	e84a                	sd	s2,16(sp)
ffffffffc0207d84:	892a                	mv	s2,a0
ffffffffc0207d86:	0008e517          	auipc	a0,0x8e
ffffffffc0207d8a:	aa250513          	addi	a0,a0,-1374 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207d8e:	e44e                	sd	s3,8(sp)
ffffffffc0207d90:	f406                	sd	ra,40(sp)
ffffffffc0207d92:	f022                	sd	s0,32(sp)
ffffffffc0207d94:	ec26                	sd	s1,24(sp)
ffffffffc0207d96:	89ae                	mv	s3,a1
ffffffffc0207d98:	f2afc0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0207d9c:	08090a63          	beqz	s2,ffffffffc0207e30 <vfs_mount+0xb0>
ffffffffc0207da0:	0008e497          	auipc	s1,0x8e
ffffffffc0207da4:	a7848493          	addi	s1,s1,-1416 # ffffffffc0295818 <vdev_list>
ffffffffc0207da8:	6480                	ld	s0,8(s1)
ffffffffc0207daa:	00941663          	bne	s0,s1,ffffffffc0207db6 <vfs_mount+0x36>
ffffffffc0207dae:	a8ad                	j	ffffffffc0207e28 <vfs_mount+0xa8>
ffffffffc0207db0:	6400                	ld	s0,8(s0)
ffffffffc0207db2:	06940b63          	beq	s0,s1,ffffffffc0207e28 <vfs_mount+0xa8>
ffffffffc0207db6:	ff843783          	ld	a5,-8(s0)
ffffffffc0207dba:	dbfd                	beqz	a5,ffffffffc0207db0 <vfs_mount+0x30>
ffffffffc0207dbc:	fe043503          	ld	a0,-32(s0)
ffffffffc0207dc0:	85ca                	mv	a1,s2
ffffffffc0207dc2:	5c4030ef          	jal	ra,ffffffffc020b386 <strcmp>
ffffffffc0207dc6:	f56d                	bnez	a0,ffffffffc0207db0 <vfs_mount+0x30>
ffffffffc0207dc8:	ff043783          	ld	a5,-16(s0)
ffffffffc0207dcc:	e3a5                	bnez	a5,ffffffffc0207e2c <vfs_mount+0xac>
ffffffffc0207dce:	fe043783          	ld	a5,-32(s0)
ffffffffc0207dd2:	c3c9                	beqz	a5,ffffffffc0207e54 <vfs_mount+0xd4>
ffffffffc0207dd4:	ff843783          	ld	a5,-8(s0)
ffffffffc0207dd8:	cfb5                	beqz	a5,ffffffffc0207e54 <vfs_mount+0xd4>
ffffffffc0207dda:	fe843503          	ld	a0,-24(s0)
ffffffffc0207dde:	c939                	beqz	a0,ffffffffc0207e34 <vfs_mount+0xb4>
ffffffffc0207de0:	4d38                	lw	a4,88(a0)
ffffffffc0207de2:	6785                	lui	a5,0x1
ffffffffc0207de4:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0207de8:	04f71663          	bne	a4,a5,ffffffffc0207e34 <vfs_mount+0xb4>
ffffffffc0207dec:	ff040593          	addi	a1,s0,-16
ffffffffc0207df0:	9982                	jalr	s3
ffffffffc0207df2:	84aa                	mv	s1,a0
ffffffffc0207df4:	ed01                	bnez	a0,ffffffffc0207e0c <vfs_mount+0x8c>
ffffffffc0207df6:	ff043783          	ld	a5,-16(s0)
ffffffffc0207dfa:	cfad                	beqz	a5,ffffffffc0207e74 <vfs_mount+0xf4>
ffffffffc0207dfc:	fe043583          	ld	a1,-32(s0)
ffffffffc0207e00:	00006517          	auipc	a0,0x6
ffffffffc0207e04:	7d050513          	addi	a0,a0,2000 # ffffffffc020e5d0 <syscalls+0xb60>
ffffffffc0207e08:	b9ef80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0207e0c:	0008e517          	auipc	a0,0x8e
ffffffffc0207e10:	a1c50513          	addi	a0,a0,-1508 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207e14:	eaafc0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0207e18:	70a2                	ld	ra,40(sp)
ffffffffc0207e1a:	7402                	ld	s0,32(sp)
ffffffffc0207e1c:	6942                	ld	s2,16(sp)
ffffffffc0207e1e:	69a2                	ld	s3,8(sp)
ffffffffc0207e20:	8526                	mv	a0,s1
ffffffffc0207e22:	64e2                	ld	s1,24(sp)
ffffffffc0207e24:	6145                	addi	sp,sp,48
ffffffffc0207e26:	8082                	ret
ffffffffc0207e28:	54cd                	li	s1,-13
ffffffffc0207e2a:	b7cd                	j	ffffffffc0207e0c <vfs_mount+0x8c>
ffffffffc0207e2c:	54c5                	li	s1,-15
ffffffffc0207e2e:	bff9                	j	ffffffffc0207e0c <vfs_mount+0x8c>
ffffffffc0207e30:	db3ff0ef          	jal	ra,ffffffffc0207be2 <find_mount.part.0>
ffffffffc0207e34:	00006697          	auipc	a3,0x6
ffffffffc0207e38:	74c68693          	addi	a3,a3,1868 # ffffffffc020e580 <syscalls+0xb10>
ffffffffc0207e3c:	00004617          	auipc	a2,0x4
ffffffffc0207e40:	a8c60613          	addi	a2,a2,-1396 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0207e44:	0ed00593          	li	a1,237
ffffffffc0207e48:	00006517          	auipc	a0,0x6
ffffffffc0207e4c:	68050513          	addi	a0,a0,1664 # ffffffffc020e4c8 <syscalls+0xa58>
ffffffffc0207e50:	e4ef80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207e54:	00006697          	auipc	a3,0x6
ffffffffc0207e58:	6fc68693          	addi	a3,a3,1788 # ffffffffc020e550 <syscalls+0xae0>
ffffffffc0207e5c:	00004617          	auipc	a2,0x4
ffffffffc0207e60:	a6c60613          	addi	a2,a2,-1428 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0207e64:	0eb00593          	li	a1,235
ffffffffc0207e68:	00006517          	auipc	a0,0x6
ffffffffc0207e6c:	66050513          	addi	a0,a0,1632 # ffffffffc020e4c8 <syscalls+0xa58>
ffffffffc0207e70:	e2ef80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207e74:	00006697          	auipc	a3,0x6
ffffffffc0207e78:	74468693          	addi	a3,a3,1860 # ffffffffc020e5b8 <syscalls+0xb48>
ffffffffc0207e7c:	00004617          	auipc	a2,0x4
ffffffffc0207e80:	a4c60613          	addi	a2,a2,-1460 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0207e84:	0ef00593          	li	a1,239
ffffffffc0207e88:	00006517          	auipc	a0,0x6
ffffffffc0207e8c:	64050513          	addi	a0,a0,1600 # ffffffffc020e4c8 <syscalls+0xa58>
ffffffffc0207e90:	e0ef80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207e94 <vfs_open>:
ffffffffc0207e94:	711d                	addi	sp,sp,-96
ffffffffc0207e96:	e4a6                	sd	s1,72(sp)
ffffffffc0207e98:	e0ca                	sd	s2,64(sp)
ffffffffc0207e9a:	fc4e                	sd	s3,56(sp)
ffffffffc0207e9c:	ec86                	sd	ra,88(sp)
ffffffffc0207e9e:	e8a2                	sd	s0,80(sp)
ffffffffc0207ea0:	f852                	sd	s4,48(sp)
ffffffffc0207ea2:	f456                	sd	s5,40(sp)
ffffffffc0207ea4:	0035f793          	andi	a5,a1,3
ffffffffc0207ea8:	84ae                	mv	s1,a1
ffffffffc0207eaa:	892a                	mv	s2,a0
ffffffffc0207eac:	89b2                	mv	s3,a2
ffffffffc0207eae:	0e078663          	beqz	a5,ffffffffc0207f9a <vfs_open+0x106>
ffffffffc0207eb2:	470d                	li	a4,3
ffffffffc0207eb4:	0105fa93          	andi	s5,a1,16
ffffffffc0207eb8:	0ce78f63          	beq	a5,a4,ffffffffc0207f96 <vfs_open+0x102>
ffffffffc0207ebc:	002c                	addi	a1,sp,8
ffffffffc0207ebe:	854a                	mv	a0,s2
ffffffffc0207ec0:	2ae000ef          	jal	ra,ffffffffc020816e <vfs_lookup>
ffffffffc0207ec4:	842a                	mv	s0,a0
ffffffffc0207ec6:	0044fa13          	andi	s4,s1,4
ffffffffc0207eca:	e159                	bnez	a0,ffffffffc0207f50 <vfs_open+0xbc>
ffffffffc0207ecc:	00c4f793          	andi	a5,s1,12
ffffffffc0207ed0:	4731                	li	a4,12
ffffffffc0207ed2:	0ee78263          	beq	a5,a4,ffffffffc0207fb6 <vfs_open+0x122>
ffffffffc0207ed6:	6422                	ld	s0,8(sp)
ffffffffc0207ed8:	12040163          	beqz	s0,ffffffffc0207ffa <vfs_open+0x166>
ffffffffc0207edc:	783c                	ld	a5,112(s0)
ffffffffc0207ede:	cff1                	beqz	a5,ffffffffc0207fba <vfs_open+0x126>
ffffffffc0207ee0:	679c                	ld	a5,8(a5)
ffffffffc0207ee2:	cfe1                	beqz	a5,ffffffffc0207fba <vfs_open+0x126>
ffffffffc0207ee4:	8522                	mv	a0,s0
ffffffffc0207ee6:	00006597          	auipc	a1,0x6
ffffffffc0207eea:	7ca58593          	addi	a1,a1,1994 # ffffffffc020e6b0 <syscalls+0xc40>
ffffffffc0207eee:	8c3ff0ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc0207ef2:	783c                	ld	a5,112(s0)
ffffffffc0207ef4:	6522                	ld	a0,8(sp)
ffffffffc0207ef6:	85a6                	mv	a1,s1
ffffffffc0207ef8:	679c                	ld	a5,8(a5)
ffffffffc0207efa:	9782                	jalr	a5
ffffffffc0207efc:	842a                	mv	s0,a0
ffffffffc0207efe:	6522                	ld	a0,8(sp)
ffffffffc0207f00:	e845                	bnez	s0,ffffffffc0207fb0 <vfs_open+0x11c>
ffffffffc0207f02:	015a6a33          	or	s4,s4,s5
ffffffffc0207f06:	89fff0ef          	jal	ra,ffffffffc02077a4 <inode_open_inc>
ffffffffc0207f0a:	020a0663          	beqz	s4,ffffffffc0207f36 <vfs_open+0xa2>
ffffffffc0207f0e:	64a2                	ld	s1,8(sp)
ffffffffc0207f10:	c4e9                	beqz	s1,ffffffffc0207fda <vfs_open+0x146>
ffffffffc0207f12:	78bc                	ld	a5,112(s1)
ffffffffc0207f14:	c3f9                	beqz	a5,ffffffffc0207fda <vfs_open+0x146>
ffffffffc0207f16:	73bc                	ld	a5,96(a5)
ffffffffc0207f18:	c3e9                	beqz	a5,ffffffffc0207fda <vfs_open+0x146>
ffffffffc0207f1a:	00006597          	auipc	a1,0x6
ffffffffc0207f1e:	7f658593          	addi	a1,a1,2038 # ffffffffc020e710 <syscalls+0xca0>
ffffffffc0207f22:	8526                	mv	a0,s1
ffffffffc0207f24:	88dff0ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc0207f28:	78bc                	ld	a5,112(s1)
ffffffffc0207f2a:	6522                	ld	a0,8(sp)
ffffffffc0207f2c:	4581                	li	a1,0
ffffffffc0207f2e:	73bc                	ld	a5,96(a5)
ffffffffc0207f30:	9782                	jalr	a5
ffffffffc0207f32:	87aa                	mv	a5,a0
ffffffffc0207f34:	e92d                	bnez	a0,ffffffffc0207fa6 <vfs_open+0x112>
ffffffffc0207f36:	67a2                	ld	a5,8(sp)
ffffffffc0207f38:	00f9b023          	sd	a5,0(s3)
ffffffffc0207f3c:	60e6                	ld	ra,88(sp)
ffffffffc0207f3e:	8522                	mv	a0,s0
ffffffffc0207f40:	6446                	ld	s0,80(sp)
ffffffffc0207f42:	64a6                	ld	s1,72(sp)
ffffffffc0207f44:	6906                	ld	s2,64(sp)
ffffffffc0207f46:	79e2                	ld	s3,56(sp)
ffffffffc0207f48:	7a42                	ld	s4,48(sp)
ffffffffc0207f4a:	7aa2                	ld	s5,40(sp)
ffffffffc0207f4c:	6125                	addi	sp,sp,96
ffffffffc0207f4e:	8082                	ret
ffffffffc0207f50:	57c1                	li	a5,-16
ffffffffc0207f52:	fef515e3          	bne	a0,a5,ffffffffc0207f3c <vfs_open+0xa8>
ffffffffc0207f56:	fe0a03e3          	beqz	s4,ffffffffc0207f3c <vfs_open+0xa8>
ffffffffc0207f5a:	0810                	addi	a2,sp,16
ffffffffc0207f5c:	082c                	addi	a1,sp,24
ffffffffc0207f5e:	854a                	mv	a0,s2
ffffffffc0207f60:	2a4000ef          	jal	ra,ffffffffc0208204 <vfs_lookup_parent>
ffffffffc0207f64:	842a                	mv	s0,a0
ffffffffc0207f66:	f979                	bnez	a0,ffffffffc0207f3c <vfs_open+0xa8>
ffffffffc0207f68:	6462                	ld	s0,24(sp)
ffffffffc0207f6a:	c845                	beqz	s0,ffffffffc020801a <vfs_open+0x186>
ffffffffc0207f6c:	783c                	ld	a5,112(s0)
ffffffffc0207f6e:	c7d5                	beqz	a5,ffffffffc020801a <vfs_open+0x186>
ffffffffc0207f70:	77bc                	ld	a5,104(a5)
ffffffffc0207f72:	c7c5                	beqz	a5,ffffffffc020801a <vfs_open+0x186>
ffffffffc0207f74:	8522                	mv	a0,s0
ffffffffc0207f76:	00006597          	auipc	a1,0x6
ffffffffc0207f7a:	6d258593          	addi	a1,a1,1746 # ffffffffc020e648 <syscalls+0xbd8>
ffffffffc0207f7e:	833ff0ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc0207f82:	783c                	ld	a5,112(s0)
ffffffffc0207f84:	65c2                	ld	a1,16(sp)
ffffffffc0207f86:	6562                	ld	a0,24(sp)
ffffffffc0207f88:	77bc                	ld	a5,104(a5)
ffffffffc0207f8a:	4034d613          	srai	a2,s1,0x3
ffffffffc0207f8e:	0034                	addi	a3,sp,8
ffffffffc0207f90:	8a05                	andi	a2,a2,1
ffffffffc0207f92:	9782                	jalr	a5
ffffffffc0207f94:	b789                	j	ffffffffc0207ed6 <vfs_open+0x42>
ffffffffc0207f96:	5475                	li	s0,-3
ffffffffc0207f98:	b755                	j	ffffffffc0207f3c <vfs_open+0xa8>
ffffffffc0207f9a:	0105fa93          	andi	s5,a1,16
ffffffffc0207f9e:	5475                	li	s0,-3
ffffffffc0207fa0:	f80a9ee3          	bnez	s5,ffffffffc0207f3c <vfs_open+0xa8>
ffffffffc0207fa4:	bf21                	j	ffffffffc0207ebc <vfs_open+0x28>
ffffffffc0207fa6:	6522                	ld	a0,8(sp)
ffffffffc0207fa8:	843e                	mv	s0,a5
ffffffffc0207faa:	965ff0ef          	jal	ra,ffffffffc020790e <inode_open_dec>
ffffffffc0207fae:	6522                	ld	a0,8(sp)
ffffffffc0207fb0:	8b7ff0ef          	jal	ra,ffffffffc0207866 <inode_ref_dec>
ffffffffc0207fb4:	b761                	j	ffffffffc0207f3c <vfs_open+0xa8>
ffffffffc0207fb6:	5425                	li	s0,-23
ffffffffc0207fb8:	b751                	j	ffffffffc0207f3c <vfs_open+0xa8>
ffffffffc0207fba:	00006697          	auipc	a3,0x6
ffffffffc0207fbe:	6a668693          	addi	a3,a3,1702 # ffffffffc020e660 <syscalls+0xbf0>
ffffffffc0207fc2:	00004617          	auipc	a2,0x4
ffffffffc0207fc6:	90660613          	addi	a2,a2,-1786 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0207fca:	03300593          	li	a1,51
ffffffffc0207fce:	00006517          	auipc	a0,0x6
ffffffffc0207fd2:	66250513          	addi	a0,a0,1634 # ffffffffc020e630 <syscalls+0xbc0>
ffffffffc0207fd6:	cc8f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207fda:	00006697          	auipc	a3,0x6
ffffffffc0207fde:	6de68693          	addi	a3,a3,1758 # ffffffffc020e6b8 <syscalls+0xc48>
ffffffffc0207fe2:	00004617          	auipc	a2,0x4
ffffffffc0207fe6:	8e660613          	addi	a2,a2,-1818 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0207fea:	03a00593          	li	a1,58
ffffffffc0207fee:	00006517          	auipc	a0,0x6
ffffffffc0207ff2:	64250513          	addi	a0,a0,1602 # ffffffffc020e630 <syscalls+0xbc0>
ffffffffc0207ff6:	ca8f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207ffa:	00006697          	auipc	a3,0x6
ffffffffc0207ffe:	65668693          	addi	a3,a3,1622 # ffffffffc020e650 <syscalls+0xbe0>
ffffffffc0208002:	00004617          	auipc	a2,0x4
ffffffffc0208006:	8c660613          	addi	a2,a2,-1850 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020800a:	03100593          	li	a1,49
ffffffffc020800e:	00006517          	auipc	a0,0x6
ffffffffc0208012:	62250513          	addi	a0,a0,1570 # ffffffffc020e630 <syscalls+0xbc0>
ffffffffc0208016:	c88f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020801a:	00006697          	auipc	a3,0x6
ffffffffc020801e:	5c668693          	addi	a3,a3,1478 # ffffffffc020e5e0 <syscalls+0xb70>
ffffffffc0208022:	00004617          	auipc	a2,0x4
ffffffffc0208026:	8a660613          	addi	a2,a2,-1882 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020802a:	02c00593          	li	a1,44
ffffffffc020802e:	00006517          	auipc	a0,0x6
ffffffffc0208032:	60250513          	addi	a0,a0,1538 # ffffffffc020e630 <syscalls+0xbc0>
ffffffffc0208036:	c68f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020803a <vfs_close>:
ffffffffc020803a:	1141                	addi	sp,sp,-16
ffffffffc020803c:	e406                	sd	ra,8(sp)
ffffffffc020803e:	e022                	sd	s0,0(sp)
ffffffffc0208040:	842a                	mv	s0,a0
ffffffffc0208042:	8cdff0ef          	jal	ra,ffffffffc020790e <inode_open_dec>
ffffffffc0208046:	8522                	mv	a0,s0
ffffffffc0208048:	81fff0ef          	jal	ra,ffffffffc0207866 <inode_ref_dec>
ffffffffc020804c:	60a2                	ld	ra,8(sp)
ffffffffc020804e:	6402                	ld	s0,0(sp)
ffffffffc0208050:	4501                	li	a0,0
ffffffffc0208052:	0141                	addi	sp,sp,16
ffffffffc0208054:	8082                	ret

ffffffffc0208056 <get_device>:
ffffffffc0208056:	7179                	addi	sp,sp,-48
ffffffffc0208058:	ec26                	sd	s1,24(sp)
ffffffffc020805a:	e84a                	sd	s2,16(sp)
ffffffffc020805c:	f406                	sd	ra,40(sp)
ffffffffc020805e:	f022                	sd	s0,32(sp)
ffffffffc0208060:	00054303          	lbu	t1,0(a0)
ffffffffc0208064:	892e                	mv	s2,a1
ffffffffc0208066:	84b2                	mv	s1,a2
ffffffffc0208068:	02030463          	beqz	t1,ffffffffc0208090 <get_device+0x3a>
ffffffffc020806c:	00150413          	addi	s0,a0,1
ffffffffc0208070:	86a2                	mv	a3,s0
ffffffffc0208072:	879a                	mv	a5,t1
ffffffffc0208074:	4701                	li	a4,0
ffffffffc0208076:	03a00813          	li	a6,58
ffffffffc020807a:	02f00893          	li	a7,47
ffffffffc020807e:	03078263          	beq	a5,a6,ffffffffc02080a2 <get_device+0x4c>
ffffffffc0208082:	05178963          	beq	a5,a7,ffffffffc02080d4 <get_device+0x7e>
ffffffffc0208086:	0006c783          	lbu	a5,0(a3)
ffffffffc020808a:	2705                	addiw	a4,a4,1
ffffffffc020808c:	0685                	addi	a3,a3,1
ffffffffc020808e:	fbe5                	bnez	a5,ffffffffc020807e <get_device+0x28>
ffffffffc0208090:	7402                	ld	s0,32(sp)
ffffffffc0208092:	00a93023          	sd	a0,0(s2)
ffffffffc0208096:	70a2                	ld	ra,40(sp)
ffffffffc0208098:	6942                	ld	s2,16(sp)
ffffffffc020809a:	8526                	mv	a0,s1
ffffffffc020809c:	64e2                	ld	s1,24(sp)
ffffffffc020809e:	6145                	addi	sp,sp,48
ffffffffc02080a0:	a279                	j	ffffffffc020822e <vfs_get_curdir>
ffffffffc02080a2:	cb15                	beqz	a4,ffffffffc02080d6 <get_device+0x80>
ffffffffc02080a4:	00e507b3          	add	a5,a0,a4
ffffffffc02080a8:	0705                	addi	a4,a4,1
ffffffffc02080aa:	00078023          	sb	zero,0(a5)
ffffffffc02080ae:	972a                	add	a4,a4,a0
ffffffffc02080b0:	02f00613          	li	a2,47
ffffffffc02080b4:	00074783          	lbu	a5,0(a4)
ffffffffc02080b8:	86ba                	mv	a3,a4
ffffffffc02080ba:	0705                	addi	a4,a4,1
ffffffffc02080bc:	fec78ce3          	beq	a5,a2,ffffffffc02080b4 <get_device+0x5e>
ffffffffc02080c0:	7402                	ld	s0,32(sp)
ffffffffc02080c2:	70a2                	ld	ra,40(sp)
ffffffffc02080c4:	00d93023          	sd	a3,0(s2)
ffffffffc02080c8:	85a6                	mv	a1,s1
ffffffffc02080ca:	6942                	ld	s2,16(sp)
ffffffffc02080cc:	64e2                	ld	s1,24(sp)
ffffffffc02080ce:	6145                	addi	sp,sp,48
ffffffffc02080d0:	ba9ff06f          	j	ffffffffc0207c78 <vfs_get_root>
ffffffffc02080d4:	ff55                	bnez	a4,ffffffffc0208090 <get_device+0x3a>
ffffffffc02080d6:	02f00793          	li	a5,47
ffffffffc02080da:	04f30563          	beq	t1,a5,ffffffffc0208124 <get_device+0xce>
ffffffffc02080de:	03a00793          	li	a5,58
ffffffffc02080e2:	06f31663          	bne	t1,a5,ffffffffc020814e <get_device+0xf8>
ffffffffc02080e6:	0028                	addi	a0,sp,8
ffffffffc02080e8:	146000ef          	jal	ra,ffffffffc020822e <vfs_get_curdir>
ffffffffc02080ec:	e515                	bnez	a0,ffffffffc0208118 <get_device+0xc2>
ffffffffc02080ee:	67a2                	ld	a5,8(sp)
ffffffffc02080f0:	77a8                	ld	a0,104(a5)
ffffffffc02080f2:	cd15                	beqz	a0,ffffffffc020812e <get_device+0xd8>
ffffffffc02080f4:	617c                	ld	a5,192(a0)
ffffffffc02080f6:	9782                	jalr	a5
ffffffffc02080f8:	87aa                	mv	a5,a0
ffffffffc02080fa:	6522                	ld	a0,8(sp)
ffffffffc02080fc:	e09c                	sd	a5,0(s1)
ffffffffc02080fe:	f68ff0ef          	jal	ra,ffffffffc0207866 <inode_ref_dec>
ffffffffc0208102:	02f00713          	li	a4,47
ffffffffc0208106:	a011                	j	ffffffffc020810a <get_device+0xb4>
ffffffffc0208108:	0405                	addi	s0,s0,1
ffffffffc020810a:	00044783          	lbu	a5,0(s0)
ffffffffc020810e:	fee78de3          	beq	a5,a4,ffffffffc0208108 <get_device+0xb2>
ffffffffc0208112:	00893023          	sd	s0,0(s2)
ffffffffc0208116:	4501                	li	a0,0
ffffffffc0208118:	70a2                	ld	ra,40(sp)
ffffffffc020811a:	7402                	ld	s0,32(sp)
ffffffffc020811c:	64e2                	ld	s1,24(sp)
ffffffffc020811e:	6942                	ld	s2,16(sp)
ffffffffc0208120:	6145                	addi	sp,sp,48
ffffffffc0208122:	8082                	ret
ffffffffc0208124:	8526                	mv	a0,s1
ffffffffc0208126:	93fff0ef          	jal	ra,ffffffffc0207a64 <vfs_get_bootfs>
ffffffffc020812a:	dd61                	beqz	a0,ffffffffc0208102 <get_device+0xac>
ffffffffc020812c:	b7f5                	j	ffffffffc0208118 <get_device+0xc2>
ffffffffc020812e:	00006697          	auipc	a3,0x6
ffffffffc0208132:	61a68693          	addi	a3,a3,1562 # ffffffffc020e748 <syscalls+0xcd8>
ffffffffc0208136:	00003617          	auipc	a2,0x3
ffffffffc020813a:	79260613          	addi	a2,a2,1938 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020813e:	03900593          	li	a1,57
ffffffffc0208142:	00006517          	auipc	a0,0x6
ffffffffc0208146:	5ee50513          	addi	a0,a0,1518 # ffffffffc020e730 <syscalls+0xcc0>
ffffffffc020814a:	b54f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020814e:	00006697          	auipc	a3,0x6
ffffffffc0208152:	5d268693          	addi	a3,a3,1490 # ffffffffc020e720 <syscalls+0xcb0>
ffffffffc0208156:	00003617          	auipc	a2,0x3
ffffffffc020815a:	77260613          	addi	a2,a2,1906 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020815e:	03300593          	li	a1,51
ffffffffc0208162:	00006517          	auipc	a0,0x6
ffffffffc0208166:	5ce50513          	addi	a0,a0,1486 # ffffffffc020e730 <syscalls+0xcc0>
ffffffffc020816a:	b34f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020816e <vfs_lookup>:
ffffffffc020816e:	7139                	addi	sp,sp,-64
ffffffffc0208170:	f426                	sd	s1,40(sp)
ffffffffc0208172:	0830                	addi	a2,sp,24
ffffffffc0208174:	84ae                	mv	s1,a1
ffffffffc0208176:	002c                	addi	a1,sp,8
ffffffffc0208178:	f822                	sd	s0,48(sp)
ffffffffc020817a:	fc06                	sd	ra,56(sp)
ffffffffc020817c:	f04a                	sd	s2,32(sp)
ffffffffc020817e:	e42a                	sd	a0,8(sp)
ffffffffc0208180:	ed7ff0ef          	jal	ra,ffffffffc0208056 <get_device>
ffffffffc0208184:	842a                	mv	s0,a0
ffffffffc0208186:	ed1d                	bnez	a0,ffffffffc02081c4 <vfs_lookup+0x56>
ffffffffc0208188:	67a2                	ld	a5,8(sp)
ffffffffc020818a:	6962                	ld	s2,24(sp)
ffffffffc020818c:	0007c783          	lbu	a5,0(a5)
ffffffffc0208190:	c3a9                	beqz	a5,ffffffffc02081d2 <vfs_lookup+0x64>
ffffffffc0208192:	04090963          	beqz	s2,ffffffffc02081e4 <vfs_lookup+0x76>
ffffffffc0208196:	07093783          	ld	a5,112(s2)
ffffffffc020819a:	c7a9                	beqz	a5,ffffffffc02081e4 <vfs_lookup+0x76>
ffffffffc020819c:	7bbc                	ld	a5,112(a5)
ffffffffc020819e:	c3b9                	beqz	a5,ffffffffc02081e4 <vfs_lookup+0x76>
ffffffffc02081a0:	854a                	mv	a0,s2
ffffffffc02081a2:	00006597          	auipc	a1,0x6
ffffffffc02081a6:	60e58593          	addi	a1,a1,1550 # ffffffffc020e7b0 <syscalls+0xd40>
ffffffffc02081aa:	e06ff0ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc02081ae:	07093783          	ld	a5,112(s2)
ffffffffc02081b2:	65a2                	ld	a1,8(sp)
ffffffffc02081b4:	6562                	ld	a0,24(sp)
ffffffffc02081b6:	7bbc                	ld	a5,112(a5)
ffffffffc02081b8:	8626                	mv	a2,s1
ffffffffc02081ba:	9782                	jalr	a5
ffffffffc02081bc:	842a                	mv	s0,a0
ffffffffc02081be:	6562                	ld	a0,24(sp)
ffffffffc02081c0:	ea6ff0ef          	jal	ra,ffffffffc0207866 <inode_ref_dec>
ffffffffc02081c4:	70e2                	ld	ra,56(sp)
ffffffffc02081c6:	8522                	mv	a0,s0
ffffffffc02081c8:	7442                	ld	s0,48(sp)
ffffffffc02081ca:	74a2                	ld	s1,40(sp)
ffffffffc02081cc:	7902                	ld	s2,32(sp)
ffffffffc02081ce:	6121                	addi	sp,sp,64
ffffffffc02081d0:	8082                	ret
ffffffffc02081d2:	70e2                	ld	ra,56(sp)
ffffffffc02081d4:	8522                	mv	a0,s0
ffffffffc02081d6:	7442                	ld	s0,48(sp)
ffffffffc02081d8:	0124b023          	sd	s2,0(s1)
ffffffffc02081dc:	74a2                	ld	s1,40(sp)
ffffffffc02081de:	7902                	ld	s2,32(sp)
ffffffffc02081e0:	6121                	addi	sp,sp,64
ffffffffc02081e2:	8082                	ret
ffffffffc02081e4:	00006697          	auipc	a3,0x6
ffffffffc02081e8:	57c68693          	addi	a3,a3,1404 # ffffffffc020e760 <syscalls+0xcf0>
ffffffffc02081ec:	00003617          	auipc	a2,0x3
ffffffffc02081f0:	6dc60613          	addi	a2,a2,1756 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02081f4:	04f00593          	li	a1,79
ffffffffc02081f8:	00006517          	auipc	a0,0x6
ffffffffc02081fc:	53850513          	addi	a0,a0,1336 # ffffffffc020e730 <syscalls+0xcc0>
ffffffffc0208200:	a9ef80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208204 <vfs_lookup_parent>:
ffffffffc0208204:	7139                	addi	sp,sp,-64
ffffffffc0208206:	f822                	sd	s0,48(sp)
ffffffffc0208208:	f426                	sd	s1,40(sp)
ffffffffc020820a:	842e                	mv	s0,a1
ffffffffc020820c:	84b2                	mv	s1,a2
ffffffffc020820e:	002c                	addi	a1,sp,8
ffffffffc0208210:	0830                	addi	a2,sp,24
ffffffffc0208212:	fc06                	sd	ra,56(sp)
ffffffffc0208214:	e42a                	sd	a0,8(sp)
ffffffffc0208216:	e41ff0ef          	jal	ra,ffffffffc0208056 <get_device>
ffffffffc020821a:	e509                	bnez	a0,ffffffffc0208224 <vfs_lookup_parent+0x20>
ffffffffc020821c:	67a2                	ld	a5,8(sp)
ffffffffc020821e:	e09c                	sd	a5,0(s1)
ffffffffc0208220:	67e2                	ld	a5,24(sp)
ffffffffc0208222:	e01c                	sd	a5,0(s0)
ffffffffc0208224:	70e2                	ld	ra,56(sp)
ffffffffc0208226:	7442                	ld	s0,48(sp)
ffffffffc0208228:	74a2                	ld	s1,40(sp)
ffffffffc020822a:	6121                	addi	sp,sp,64
ffffffffc020822c:	8082                	ret

ffffffffc020822e <vfs_get_curdir>:
ffffffffc020822e:	0008e797          	auipc	a5,0x8e
ffffffffc0208232:	6927b783          	ld	a5,1682(a5) # ffffffffc02968c0 <current>
ffffffffc0208236:	1487b783          	ld	a5,328(a5)
ffffffffc020823a:	1101                	addi	sp,sp,-32
ffffffffc020823c:	e426                	sd	s1,8(sp)
ffffffffc020823e:	6384                	ld	s1,0(a5)
ffffffffc0208240:	ec06                	sd	ra,24(sp)
ffffffffc0208242:	e822                	sd	s0,16(sp)
ffffffffc0208244:	cc81                	beqz	s1,ffffffffc020825c <vfs_get_curdir+0x2e>
ffffffffc0208246:	842a                	mv	s0,a0
ffffffffc0208248:	8526                	mv	a0,s1
ffffffffc020824a:	d4eff0ef          	jal	ra,ffffffffc0207798 <inode_ref_inc>
ffffffffc020824e:	4501                	li	a0,0
ffffffffc0208250:	e004                	sd	s1,0(s0)
ffffffffc0208252:	60e2                	ld	ra,24(sp)
ffffffffc0208254:	6442                	ld	s0,16(sp)
ffffffffc0208256:	64a2                	ld	s1,8(sp)
ffffffffc0208258:	6105                	addi	sp,sp,32
ffffffffc020825a:	8082                	ret
ffffffffc020825c:	5541                	li	a0,-16
ffffffffc020825e:	bfd5                	j	ffffffffc0208252 <vfs_get_curdir+0x24>

ffffffffc0208260 <vfs_set_curdir>:
ffffffffc0208260:	7139                	addi	sp,sp,-64
ffffffffc0208262:	f04a                	sd	s2,32(sp)
ffffffffc0208264:	0008e917          	auipc	s2,0x8e
ffffffffc0208268:	65c90913          	addi	s2,s2,1628 # ffffffffc02968c0 <current>
ffffffffc020826c:	00093783          	ld	a5,0(s2)
ffffffffc0208270:	f822                	sd	s0,48(sp)
ffffffffc0208272:	842a                	mv	s0,a0
ffffffffc0208274:	1487b503          	ld	a0,328(a5)
ffffffffc0208278:	ec4e                	sd	s3,24(sp)
ffffffffc020827a:	fc06                	sd	ra,56(sp)
ffffffffc020827c:	f426                	sd	s1,40(sp)
ffffffffc020827e:	ea3fc0ef          	jal	ra,ffffffffc0205120 <lock_files>
ffffffffc0208282:	00093783          	ld	a5,0(s2)
ffffffffc0208286:	1487b503          	ld	a0,328(a5)
ffffffffc020828a:	00053983          	ld	s3,0(a0)
ffffffffc020828e:	07340963          	beq	s0,s3,ffffffffc0208300 <vfs_set_curdir+0xa0>
ffffffffc0208292:	cc39                	beqz	s0,ffffffffc02082f0 <vfs_set_curdir+0x90>
ffffffffc0208294:	783c                	ld	a5,112(s0)
ffffffffc0208296:	c7bd                	beqz	a5,ffffffffc0208304 <vfs_set_curdir+0xa4>
ffffffffc0208298:	6bbc                	ld	a5,80(a5)
ffffffffc020829a:	c7ad                	beqz	a5,ffffffffc0208304 <vfs_set_curdir+0xa4>
ffffffffc020829c:	00006597          	auipc	a1,0x6
ffffffffc02082a0:	58458593          	addi	a1,a1,1412 # ffffffffc020e820 <syscalls+0xdb0>
ffffffffc02082a4:	8522                	mv	a0,s0
ffffffffc02082a6:	d0aff0ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc02082aa:	783c                	ld	a5,112(s0)
ffffffffc02082ac:	006c                	addi	a1,sp,12
ffffffffc02082ae:	8522                	mv	a0,s0
ffffffffc02082b0:	6bbc                	ld	a5,80(a5)
ffffffffc02082b2:	9782                	jalr	a5
ffffffffc02082b4:	84aa                	mv	s1,a0
ffffffffc02082b6:	e901                	bnez	a0,ffffffffc02082c6 <vfs_set_curdir+0x66>
ffffffffc02082b8:	47b2                	lw	a5,12(sp)
ffffffffc02082ba:	669d                	lui	a3,0x7
ffffffffc02082bc:	6709                	lui	a4,0x2
ffffffffc02082be:	8ff5                	and	a5,a5,a3
ffffffffc02082c0:	54b9                	li	s1,-18
ffffffffc02082c2:	02e78063          	beq	a5,a4,ffffffffc02082e2 <vfs_set_curdir+0x82>
ffffffffc02082c6:	00093783          	ld	a5,0(s2)
ffffffffc02082ca:	1487b503          	ld	a0,328(a5)
ffffffffc02082ce:	e59fc0ef          	jal	ra,ffffffffc0205126 <unlock_files>
ffffffffc02082d2:	70e2                	ld	ra,56(sp)
ffffffffc02082d4:	7442                	ld	s0,48(sp)
ffffffffc02082d6:	7902                	ld	s2,32(sp)
ffffffffc02082d8:	69e2                	ld	s3,24(sp)
ffffffffc02082da:	8526                	mv	a0,s1
ffffffffc02082dc:	74a2                	ld	s1,40(sp)
ffffffffc02082de:	6121                	addi	sp,sp,64
ffffffffc02082e0:	8082                	ret
ffffffffc02082e2:	8522                	mv	a0,s0
ffffffffc02082e4:	cb4ff0ef          	jal	ra,ffffffffc0207798 <inode_ref_inc>
ffffffffc02082e8:	00093783          	ld	a5,0(s2)
ffffffffc02082ec:	1487b503          	ld	a0,328(a5)
ffffffffc02082f0:	e100                	sd	s0,0(a0)
ffffffffc02082f2:	4481                	li	s1,0
ffffffffc02082f4:	fc098de3          	beqz	s3,ffffffffc02082ce <vfs_set_curdir+0x6e>
ffffffffc02082f8:	854e                	mv	a0,s3
ffffffffc02082fa:	d6cff0ef          	jal	ra,ffffffffc0207866 <inode_ref_dec>
ffffffffc02082fe:	b7e1                	j	ffffffffc02082c6 <vfs_set_curdir+0x66>
ffffffffc0208300:	4481                	li	s1,0
ffffffffc0208302:	b7f1                	j	ffffffffc02082ce <vfs_set_curdir+0x6e>
ffffffffc0208304:	00006697          	auipc	a3,0x6
ffffffffc0208308:	4b468693          	addi	a3,a3,1204 # ffffffffc020e7b8 <syscalls+0xd48>
ffffffffc020830c:	00003617          	auipc	a2,0x3
ffffffffc0208310:	5bc60613          	addi	a2,a2,1468 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0208314:	04300593          	li	a1,67
ffffffffc0208318:	00006517          	auipc	a0,0x6
ffffffffc020831c:	4f050513          	addi	a0,a0,1264 # ffffffffc020e808 <syscalls+0xd98>
ffffffffc0208320:	97ef80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208324 <vfs_chdir>:
ffffffffc0208324:	1101                	addi	sp,sp,-32
ffffffffc0208326:	002c                	addi	a1,sp,8
ffffffffc0208328:	e822                	sd	s0,16(sp)
ffffffffc020832a:	ec06                	sd	ra,24(sp)
ffffffffc020832c:	e43ff0ef          	jal	ra,ffffffffc020816e <vfs_lookup>
ffffffffc0208330:	842a                	mv	s0,a0
ffffffffc0208332:	c511                	beqz	a0,ffffffffc020833e <vfs_chdir+0x1a>
ffffffffc0208334:	60e2                	ld	ra,24(sp)
ffffffffc0208336:	8522                	mv	a0,s0
ffffffffc0208338:	6442                	ld	s0,16(sp)
ffffffffc020833a:	6105                	addi	sp,sp,32
ffffffffc020833c:	8082                	ret
ffffffffc020833e:	6522                	ld	a0,8(sp)
ffffffffc0208340:	f21ff0ef          	jal	ra,ffffffffc0208260 <vfs_set_curdir>
ffffffffc0208344:	842a                	mv	s0,a0
ffffffffc0208346:	6522                	ld	a0,8(sp)
ffffffffc0208348:	d1eff0ef          	jal	ra,ffffffffc0207866 <inode_ref_dec>
ffffffffc020834c:	60e2                	ld	ra,24(sp)
ffffffffc020834e:	8522                	mv	a0,s0
ffffffffc0208350:	6442                	ld	s0,16(sp)
ffffffffc0208352:	6105                	addi	sp,sp,32
ffffffffc0208354:	8082                	ret

ffffffffc0208356 <vfs_getcwd>:
ffffffffc0208356:	0008e797          	auipc	a5,0x8e
ffffffffc020835a:	56a7b783          	ld	a5,1386(a5) # ffffffffc02968c0 <current>
ffffffffc020835e:	1487b783          	ld	a5,328(a5)
ffffffffc0208362:	7179                	addi	sp,sp,-48
ffffffffc0208364:	ec26                	sd	s1,24(sp)
ffffffffc0208366:	6384                	ld	s1,0(a5)
ffffffffc0208368:	f406                	sd	ra,40(sp)
ffffffffc020836a:	f022                	sd	s0,32(sp)
ffffffffc020836c:	e84a                	sd	s2,16(sp)
ffffffffc020836e:	ccbd                	beqz	s1,ffffffffc02083ec <vfs_getcwd+0x96>
ffffffffc0208370:	892a                	mv	s2,a0
ffffffffc0208372:	8526                	mv	a0,s1
ffffffffc0208374:	c24ff0ef          	jal	ra,ffffffffc0207798 <inode_ref_inc>
ffffffffc0208378:	74a8                	ld	a0,104(s1)
ffffffffc020837a:	c93d                	beqz	a0,ffffffffc02083f0 <vfs_getcwd+0x9a>
ffffffffc020837c:	9b3ff0ef          	jal	ra,ffffffffc0207d2e <vfs_get_devname>
ffffffffc0208380:	842a                	mv	s0,a0
ffffffffc0208382:	7bd020ef          	jal	ra,ffffffffc020b33e <strlen>
ffffffffc0208386:	862a                	mv	a2,a0
ffffffffc0208388:	85a2                	mv	a1,s0
ffffffffc020838a:	4701                	li	a4,0
ffffffffc020838c:	4685                	li	a3,1
ffffffffc020838e:	854a                	mv	a0,s2
ffffffffc0208390:	fbbfc0ef          	jal	ra,ffffffffc020534a <iobuf_move>
ffffffffc0208394:	842a                	mv	s0,a0
ffffffffc0208396:	c919                	beqz	a0,ffffffffc02083ac <vfs_getcwd+0x56>
ffffffffc0208398:	8526                	mv	a0,s1
ffffffffc020839a:	cccff0ef          	jal	ra,ffffffffc0207866 <inode_ref_dec>
ffffffffc020839e:	70a2                	ld	ra,40(sp)
ffffffffc02083a0:	8522                	mv	a0,s0
ffffffffc02083a2:	7402                	ld	s0,32(sp)
ffffffffc02083a4:	64e2                	ld	s1,24(sp)
ffffffffc02083a6:	6942                	ld	s2,16(sp)
ffffffffc02083a8:	6145                	addi	sp,sp,48
ffffffffc02083aa:	8082                	ret
ffffffffc02083ac:	03a00793          	li	a5,58
ffffffffc02083b0:	4701                	li	a4,0
ffffffffc02083b2:	4685                	li	a3,1
ffffffffc02083b4:	4605                	li	a2,1
ffffffffc02083b6:	00f10593          	addi	a1,sp,15
ffffffffc02083ba:	854a                	mv	a0,s2
ffffffffc02083bc:	00f107a3          	sb	a5,15(sp)
ffffffffc02083c0:	f8bfc0ef          	jal	ra,ffffffffc020534a <iobuf_move>
ffffffffc02083c4:	842a                	mv	s0,a0
ffffffffc02083c6:	f969                	bnez	a0,ffffffffc0208398 <vfs_getcwd+0x42>
ffffffffc02083c8:	78bc                	ld	a5,112(s1)
ffffffffc02083ca:	c3b9                	beqz	a5,ffffffffc0208410 <vfs_getcwd+0xba>
ffffffffc02083cc:	7f9c                	ld	a5,56(a5)
ffffffffc02083ce:	c3a9                	beqz	a5,ffffffffc0208410 <vfs_getcwd+0xba>
ffffffffc02083d0:	00006597          	auipc	a1,0x6
ffffffffc02083d4:	4b058593          	addi	a1,a1,1200 # ffffffffc020e880 <syscalls+0xe10>
ffffffffc02083d8:	8526                	mv	a0,s1
ffffffffc02083da:	bd6ff0ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc02083de:	78bc                	ld	a5,112(s1)
ffffffffc02083e0:	85ca                	mv	a1,s2
ffffffffc02083e2:	8526                	mv	a0,s1
ffffffffc02083e4:	7f9c                	ld	a5,56(a5)
ffffffffc02083e6:	9782                	jalr	a5
ffffffffc02083e8:	842a                	mv	s0,a0
ffffffffc02083ea:	b77d                	j	ffffffffc0208398 <vfs_getcwd+0x42>
ffffffffc02083ec:	5441                	li	s0,-16
ffffffffc02083ee:	bf45                	j	ffffffffc020839e <vfs_getcwd+0x48>
ffffffffc02083f0:	00006697          	auipc	a3,0x6
ffffffffc02083f4:	35868693          	addi	a3,a3,856 # ffffffffc020e748 <syscalls+0xcd8>
ffffffffc02083f8:	00003617          	auipc	a2,0x3
ffffffffc02083fc:	4d060613          	addi	a2,a2,1232 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0208400:	06e00593          	li	a1,110
ffffffffc0208404:	00006517          	auipc	a0,0x6
ffffffffc0208408:	40450513          	addi	a0,a0,1028 # ffffffffc020e808 <syscalls+0xd98>
ffffffffc020840c:	892f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208410:	00006697          	auipc	a3,0x6
ffffffffc0208414:	41868693          	addi	a3,a3,1048 # ffffffffc020e828 <syscalls+0xdb8>
ffffffffc0208418:	00003617          	auipc	a2,0x3
ffffffffc020841c:	4b060613          	addi	a2,a2,1200 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0208420:	07800593          	li	a1,120
ffffffffc0208424:	00006517          	auipc	a0,0x6
ffffffffc0208428:	3e450513          	addi	a0,a0,996 # ffffffffc020e808 <syscalls+0xd98>
ffffffffc020842c:	872f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208430 <dev_lookup>:
ffffffffc0208430:	0005c783          	lbu	a5,0(a1)
ffffffffc0208434:	e385                	bnez	a5,ffffffffc0208454 <dev_lookup+0x24>
ffffffffc0208436:	1101                	addi	sp,sp,-32
ffffffffc0208438:	e822                	sd	s0,16(sp)
ffffffffc020843a:	e426                	sd	s1,8(sp)
ffffffffc020843c:	ec06                	sd	ra,24(sp)
ffffffffc020843e:	84aa                	mv	s1,a0
ffffffffc0208440:	8432                	mv	s0,a2
ffffffffc0208442:	b56ff0ef          	jal	ra,ffffffffc0207798 <inode_ref_inc>
ffffffffc0208446:	60e2                	ld	ra,24(sp)
ffffffffc0208448:	e004                	sd	s1,0(s0)
ffffffffc020844a:	6442                	ld	s0,16(sp)
ffffffffc020844c:	64a2                	ld	s1,8(sp)
ffffffffc020844e:	4501                	li	a0,0
ffffffffc0208450:	6105                	addi	sp,sp,32
ffffffffc0208452:	8082                	ret
ffffffffc0208454:	5541                	li	a0,-16
ffffffffc0208456:	8082                	ret

ffffffffc0208458 <dev_fstat>:
ffffffffc0208458:	1101                	addi	sp,sp,-32
ffffffffc020845a:	e426                	sd	s1,8(sp)
ffffffffc020845c:	84ae                	mv	s1,a1
ffffffffc020845e:	e822                	sd	s0,16(sp)
ffffffffc0208460:	02000613          	li	a2,32
ffffffffc0208464:	842a                	mv	s0,a0
ffffffffc0208466:	4581                	li	a1,0
ffffffffc0208468:	8526                	mv	a0,s1
ffffffffc020846a:	ec06                	sd	ra,24(sp)
ffffffffc020846c:	775020ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc0208470:	c429                	beqz	s0,ffffffffc02084ba <dev_fstat+0x62>
ffffffffc0208472:	783c                	ld	a5,112(s0)
ffffffffc0208474:	c3b9                	beqz	a5,ffffffffc02084ba <dev_fstat+0x62>
ffffffffc0208476:	6bbc                	ld	a5,80(a5)
ffffffffc0208478:	c3a9                	beqz	a5,ffffffffc02084ba <dev_fstat+0x62>
ffffffffc020847a:	00006597          	auipc	a1,0x6
ffffffffc020847e:	3a658593          	addi	a1,a1,934 # ffffffffc020e820 <syscalls+0xdb0>
ffffffffc0208482:	8522                	mv	a0,s0
ffffffffc0208484:	b2cff0ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc0208488:	783c                	ld	a5,112(s0)
ffffffffc020848a:	85a6                	mv	a1,s1
ffffffffc020848c:	8522                	mv	a0,s0
ffffffffc020848e:	6bbc                	ld	a5,80(a5)
ffffffffc0208490:	9782                	jalr	a5
ffffffffc0208492:	ed19                	bnez	a0,ffffffffc02084b0 <dev_fstat+0x58>
ffffffffc0208494:	4c38                	lw	a4,88(s0)
ffffffffc0208496:	6785                	lui	a5,0x1
ffffffffc0208498:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020849c:	02f71f63          	bne	a4,a5,ffffffffc02084da <dev_fstat+0x82>
ffffffffc02084a0:	6018                	ld	a4,0(s0)
ffffffffc02084a2:	641c                	ld	a5,8(s0)
ffffffffc02084a4:	4685                	li	a3,1
ffffffffc02084a6:	e494                	sd	a3,8(s1)
ffffffffc02084a8:	02e787b3          	mul	a5,a5,a4
ffffffffc02084ac:	e898                	sd	a4,16(s1)
ffffffffc02084ae:	ec9c                	sd	a5,24(s1)
ffffffffc02084b0:	60e2                	ld	ra,24(sp)
ffffffffc02084b2:	6442                	ld	s0,16(sp)
ffffffffc02084b4:	64a2                	ld	s1,8(sp)
ffffffffc02084b6:	6105                	addi	sp,sp,32
ffffffffc02084b8:	8082                	ret
ffffffffc02084ba:	00006697          	auipc	a3,0x6
ffffffffc02084be:	2fe68693          	addi	a3,a3,766 # ffffffffc020e7b8 <syscalls+0xd48>
ffffffffc02084c2:	00003617          	auipc	a2,0x3
ffffffffc02084c6:	40660613          	addi	a2,a2,1030 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02084ca:	04200593          	li	a1,66
ffffffffc02084ce:	00006517          	auipc	a0,0x6
ffffffffc02084d2:	3c250513          	addi	a0,a0,962 # ffffffffc020e890 <syscalls+0xe20>
ffffffffc02084d6:	fc9f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02084da:	00006697          	auipc	a3,0x6
ffffffffc02084de:	0a668693          	addi	a3,a3,166 # ffffffffc020e580 <syscalls+0xb10>
ffffffffc02084e2:	00003617          	auipc	a2,0x3
ffffffffc02084e6:	3e660613          	addi	a2,a2,998 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02084ea:	04500593          	li	a1,69
ffffffffc02084ee:	00006517          	auipc	a0,0x6
ffffffffc02084f2:	3a250513          	addi	a0,a0,930 # ffffffffc020e890 <syscalls+0xe20>
ffffffffc02084f6:	fa9f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02084fa <dev_ioctl>:
ffffffffc02084fa:	c909                	beqz	a0,ffffffffc020850c <dev_ioctl+0x12>
ffffffffc02084fc:	4d34                	lw	a3,88(a0)
ffffffffc02084fe:	6705                	lui	a4,0x1
ffffffffc0208500:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208504:	00e69463          	bne	a3,a4,ffffffffc020850c <dev_ioctl+0x12>
ffffffffc0208508:	751c                	ld	a5,40(a0)
ffffffffc020850a:	8782                	jr	a5
ffffffffc020850c:	1141                	addi	sp,sp,-16
ffffffffc020850e:	00006697          	auipc	a3,0x6
ffffffffc0208512:	07268693          	addi	a3,a3,114 # ffffffffc020e580 <syscalls+0xb10>
ffffffffc0208516:	00003617          	auipc	a2,0x3
ffffffffc020851a:	3b260613          	addi	a2,a2,946 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020851e:	03500593          	li	a1,53
ffffffffc0208522:	00006517          	auipc	a0,0x6
ffffffffc0208526:	36e50513          	addi	a0,a0,878 # ffffffffc020e890 <syscalls+0xe20>
ffffffffc020852a:	e406                	sd	ra,8(sp)
ffffffffc020852c:	f73f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208530 <dev_tryseek>:
ffffffffc0208530:	c51d                	beqz	a0,ffffffffc020855e <dev_tryseek+0x2e>
ffffffffc0208532:	4d38                	lw	a4,88(a0)
ffffffffc0208534:	6785                	lui	a5,0x1
ffffffffc0208536:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020853a:	02f71263          	bne	a4,a5,ffffffffc020855e <dev_tryseek+0x2e>
ffffffffc020853e:	611c                	ld	a5,0(a0)
ffffffffc0208540:	cf89                	beqz	a5,ffffffffc020855a <dev_tryseek+0x2a>
ffffffffc0208542:	6518                	ld	a4,8(a0)
ffffffffc0208544:	02e5f6b3          	remu	a3,a1,a4
ffffffffc0208548:	ea89                	bnez	a3,ffffffffc020855a <dev_tryseek+0x2a>
ffffffffc020854a:	0005c863          	bltz	a1,ffffffffc020855a <dev_tryseek+0x2a>
ffffffffc020854e:	02e787b3          	mul	a5,a5,a4
ffffffffc0208552:	00f5f463          	bgeu	a1,a5,ffffffffc020855a <dev_tryseek+0x2a>
ffffffffc0208556:	4501                	li	a0,0
ffffffffc0208558:	8082                	ret
ffffffffc020855a:	5575                	li	a0,-3
ffffffffc020855c:	8082                	ret
ffffffffc020855e:	1141                	addi	sp,sp,-16
ffffffffc0208560:	00006697          	auipc	a3,0x6
ffffffffc0208564:	02068693          	addi	a3,a3,32 # ffffffffc020e580 <syscalls+0xb10>
ffffffffc0208568:	00003617          	auipc	a2,0x3
ffffffffc020856c:	36060613          	addi	a2,a2,864 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0208570:	05f00593          	li	a1,95
ffffffffc0208574:	00006517          	auipc	a0,0x6
ffffffffc0208578:	31c50513          	addi	a0,a0,796 # ffffffffc020e890 <syscalls+0xe20>
ffffffffc020857c:	e406                	sd	ra,8(sp)
ffffffffc020857e:	f21f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208582 <dev_gettype>:
ffffffffc0208582:	c10d                	beqz	a0,ffffffffc02085a4 <dev_gettype+0x22>
ffffffffc0208584:	4d38                	lw	a4,88(a0)
ffffffffc0208586:	6785                	lui	a5,0x1
ffffffffc0208588:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020858c:	00f71c63          	bne	a4,a5,ffffffffc02085a4 <dev_gettype+0x22>
ffffffffc0208590:	6118                	ld	a4,0(a0)
ffffffffc0208592:	6795                	lui	a5,0x5
ffffffffc0208594:	c701                	beqz	a4,ffffffffc020859c <dev_gettype+0x1a>
ffffffffc0208596:	c19c                	sw	a5,0(a1)
ffffffffc0208598:	4501                	li	a0,0
ffffffffc020859a:	8082                	ret
ffffffffc020859c:	6791                	lui	a5,0x4
ffffffffc020859e:	c19c                	sw	a5,0(a1)
ffffffffc02085a0:	4501                	li	a0,0
ffffffffc02085a2:	8082                	ret
ffffffffc02085a4:	1141                	addi	sp,sp,-16
ffffffffc02085a6:	00006697          	auipc	a3,0x6
ffffffffc02085aa:	fda68693          	addi	a3,a3,-38 # ffffffffc020e580 <syscalls+0xb10>
ffffffffc02085ae:	00003617          	auipc	a2,0x3
ffffffffc02085b2:	31a60613          	addi	a2,a2,794 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02085b6:	05300593          	li	a1,83
ffffffffc02085ba:	00006517          	auipc	a0,0x6
ffffffffc02085be:	2d650513          	addi	a0,a0,726 # ffffffffc020e890 <syscalls+0xe20>
ffffffffc02085c2:	e406                	sd	ra,8(sp)
ffffffffc02085c4:	edbf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02085c8 <dev_write>:
ffffffffc02085c8:	c911                	beqz	a0,ffffffffc02085dc <dev_write+0x14>
ffffffffc02085ca:	4d34                	lw	a3,88(a0)
ffffffffc02085cc:	6705                	lui	a4,0x1
ffffffffc02085ce:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02085d2:	00e69563          	bne	a3,a4,ffffffffc02085dc <dev_write+0x14>
ffffffffc02085d6:	711c                	ld	a5,32(a0)
ffffffffc02085d8:	4605                	li	a2,1
ffffffffc02085da:	8782                	jr	a5
ffffffffc02085dc:	1141                	addi	sp,sp,-16
ffffffffc02085de:	00006697          	auipc	a3,0x6
ffffffffc02085e2:	fa268693          	addi	a3,a3,-94 # ffffffffc020e580 <syscalls+0xb10>
ffffffffc02085e6:	00003617          	auipc	a2,0x3
ffffffffc02085ea:	2e260613          	addi	a2,a2,738 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02085ee:	02c00593          	li	a1,44
ffffffffc02085f2:	00006517          	auipc	a0,0x6
ffffffffc02085f6:	29e50513          	addi	a0,a0,670 # ffffffffc020e890 <syscalls+0xe20>
ffffffffc02085fa:	e406                	sd	ra,8(sp)
ffffffffc02085fc:	ea3f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208600 <dev_read>:
ffffffffc0208600:	c911                	beqz	a0,ffffffffc0208614 <dev_read+0x14>
ffffffffc0208602:	4d34                	lw	a3,88(a0)
ffffffffc0208604:	6705                	lui	a4,0x1
ffffffffc0208606:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020860a:	00e69563          	bne	a3,a4,ffffffffc0208614 <dev_read+0x14>
ffffffffc020860e:	711c                	ld	a5,32(a0)
ffffffffc0208610:	4601                	li	a2,0
ffffffffc0208612:	8782                	jr	a5
ffffffffc0208614:	1141                	addi	sp,sp,-16
ffffffffc0208616:	00006697          	auipc	a3,0x6
ffffffffc020861a:	f6a68693          	addi	a3,a3,-150 # ffffffffc020e580 <syscalls+0xb10>
ffffffffc020861e:	00003617          	auipc	a2,0x3
ffffffffc0208622:	2aa60613          	addi	a2,a2,682 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0208626:	02300593          	li	a1,35
ffffffffc020862a:	00006517          	auipc	a0,0x6
ffffffffc020862e:	26650513          	addi	a0,a0,614 # ffffffffc020e890 <syscalls+0xe20>
ffffffffc0208632:	e406                	sd	ra,8(sp)
ffffffffc0208634:	e6bf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208638 <dev_close>:
ffffffffc0208638:	c909                	beqz	a0,ffffffffc020864a <dev_close+0x12>
ffffffffc020863a:	4d34                	lw	a3,88(a0)
ffffffffc020863c:	6705                	lui	a4,0x1
ffffffffc020863e:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208642:	00e69463          	bne	a3,a4,ffffffffc020864a <dev_close+0x12>
ffffffffc0208646:	6d1c                	ld	a5,24(a0)
ffffffffc0208648:	8782                	jr	a5
ffffffffc020864a:	1141                	addi	sp,sp,-16
ffffffffc020864c:	00006697          	auipc	a3,0x6
ffffffffc0208650:	f3468693          	addi	a3,a3,-204 # ffffffffc020e580 <syscalls+0xb10>
ffffffffc0208654:	00003617          	auipc	a2,0x3
ffffffffc0208658:	27460613          	addi	a2,a2,628 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020865c:	45e9                	li	a1,26
ffffffffc020865e:	00006517          	auipc	a0,0x6
ffffffffc0208662:	23250513          	addi	a0,a0,562 # ffffffffc020e890 <syscalls+0xe20>
ffffffffc0208666:	e406                	sd	ra,8(sp)
ffffffffc0208668:	e37f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020866c <dev_open>:
ffffffffc020866c:	03c5f713          	andi	a4,a1,60
ffffffffc0208670:	eb11                	bnez	a4,ffffffffc0208684 <dev_open+0x18>
ffffffffc0208672:	c919                	beqz	a0,ffffffffc0208688 <dev_open+0x1c>
ffffffffc0208674:	4d34                	lw	a3,88(a0)
ffffffffc0208676:	6705                	lui	a4,0x1
ffffffffc0208678:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020867c:	00e69663          	bne	a3,a4,ffffffffc0208688 <dev_open+0x1c>
ffffffffc0208680:	691c                	ld	a5,16(a0)
ffffffffc0208682:	8782                	jr	a5
ffffffffc0208684:	5575                	li	a0,-3
ffffffffc0208686:	8082                	ret
ffffffffc0208688:	1141                	addi	sp,sp,-16
ffffffffc020868a:	00006697          	auipc	a3,0x6
ffffffffc020868e:	ef668693          	addi	a3,a3,-266 # ffffffffc020e580 <syscalls+0xb10>
ffffffffc0208692:	00003617          	auipc	a2,0x3
ffffffffc0208696:	23660613          	addi	a2,a2,566 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020869a:	45c5                	li	a1,17
ffffffffc020869c:	00006517          	auipc	a0,0x6
ffffffffc02086a0:	1f450513          	addi	a0,a0,500 # ffffffffc020e890 <syscalls+0xe20>
ffffffffc02086a4:	e406                	sd	ra,8(sp)
ffffffffc02086a6:	df9f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02086aa <dev_init>:
ffffffffc02086aa:	1141                	addi	sp,sp,-16
ffffffffc02086ac:	e406                	sd	ra,8(sp)
ffffffffc02086ae:	542000ef          	jal	ra,ffffffffc0208bf0 <dev_init_stdin>
ffffffffc02086b2:	65a000ef          	jal	ra,ffffffffc0208d0c <dev_init_stdout>
ffffffffc02086b6:	60a2                	ld	ra,8(sp)
ffffffffc02086b8:	0141                	addi	sp,sp,16
ffffffffc02086ba:	a439                	j	ffffffffc02088c8 <dev_init_disk0>

ffffffffc02086bc <dev_create_inode>:
ffffffffc02086bc:	6505                	lui	a0,0x1
ffffffffc02086be:	1141                	addi	sp,sp,-16
ffffffffc02086c0:	23450513          	addi	a0,a0,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02086c4:	e022                	sd	s0,0(sp)
ffffffffc02086c6:	e406                	sd	ra,8(sp)
ffffffffc02086c8:	852ff0ef          	jal	ra,ffffffffc020771a <__alloc_inode>
ffffffffc02086cc:	842a                	mv	s0,a0
ffffffffc02086ce:	c901                	beqz	a0,ffffffffc02086de <dev_create_inode+0x22>
ffffffffc02086d0:	4601                	li	a2,0
ffffffffc02086d2:	00006597          	auipc	a1,0x6
ffffffffc02086d6:	1d658593          	addi	a1,a1,470 # ffffffffc020e8a8 <dev_node_ops>
ffffffffc02086da:	85cff0ef          	jal	ra,ffffffffc0207736 <inode_init>
ffffffffc02086de:	60a2                	ld	ra,8(sp)
ffffffffc02086e0:	8522                	mv	a0,s0
ffffffffc02086e2:	6402                	ld	s0,0(sp)
ffffffffc02086e4:	0141                	addi	sp,sp,16
ffffffffc02086e6:	8082                	ret

ffffffffc02086e8 <disk0_open>:
ffffffffc02086e8:	4501                	li	a0,0
ffffffffc02086ea:	8082                	ret

ffffffffc02086ec <disk0_close>:
ffffffffc02086ec:	4501                	li	a0,0
ffffffffc02086ee:	8082                	ret

ffffffffc02086f0 <disk0_ioctl>:
ffffffffc02086f0:	5531                	li	a0,-20
ffffffffc02086f2:	8082                	ret

ffffffffc02086f4 <disk0_io>:
ffffffffc02086f4:	659c                	ld	a5,8(a1)
ffffffffc02086f6:	7159                	addi	sp,sp,-112
ffffffffc02086f8:	eca6                	sd	s1,88(sp)
ffffffffc02086fa:	f45e                	sd	s7,40(sp)
ffffffffc02086fc:	6d84                	ld	s1,24(a1)
ffffffffc02086fe:	6b85                	lui	s7,0x1
ffffffffc0208700:	1bfd                	addi	s7,s7,-1
ffffffffc0208702:	e4ce                	sd	s3,72(sp)
ffffffffc0208704:	43f7d993          	srai	s3,a5,0x3f
ffffffffc0208708:	0179f9b3          	and	s3,s3,s7
ffffffffc020870c:	99be                	add	s3,s3,a5
ffffffffc020870e:	8fc5                	or	a5,a5,s1
ffffffffc0208710:	f486                	sd	ra,104(sp)
ffffffffc0208712:	f0a2                	sd	s0,96(sp)
ffffffffc0208714:	e8ca                	sd	s2,80(sp)
ffffffffc0208716:	e0d2                	sd	s4,64(sp)
ffffffffc0208718:	fc56                	sd	s5,56(sp)
ffffffffc020871a:	f85a                	sd	s6,48(sp)
ffffffffc020871c:	f062                	sd	s8,32(sp)
ffffffffc020871e:	ec66                	sd	s9,24(sp)
ffffffffc0208720:	e86a                	sd	s10,16(sp)
ffffffffc0208722:	0177f7b3          	and	a5,a5,s7
ffffffffc0208726:	10079d63          	bnez	a5,ffffffffc0208840 <disk0_io+0x14c>
ffffffffc020872a:	40c9d993          	srai	s3,s3,0xc
ffffffffc020872e:	00c4d713          	srli	a4,s1,0xc
ffffffffc0208732:	2981                	sext.w	s3,s3
ffffffffc0208734:	2701                	sext.w	a4,a4
ffffffffc0208736:	00e987bb          	addw	a5,s3,a4
ffffffffc020873a:	6114                	ld	a3,0(a0)
ffffffffc020873c:	1782                	slli	a5,a5,0x20
ffffffffc020873e:	9381                	srli	a5,a5,0x20
ffffffffc0208740:	10f6e063          	bltu	a3,a5,ffffffffc0208840 <disk0_io+0x14c>
ffffffffc0208744:	4501                	li	a0,0
ffffffffc0208746:	ef19                	bnez	a4,ffffffffc0208764 <disk0_io+0x70>
ffffffffc0208748:	70a6                	ld	ra,104(sp)
ffffffffc020874a:	7406                	ld	s0,96(sp)
ffffffffc020874c:	64e6                	ld	s1,88(sp)
ffffffffc020874e:	6946                	ld	s2,80(sp)
ffffffffc0208750:	69a6                	ld	s3,72(sp)
ffffffffc0208752:	6a06                	ld	s4,64(sp)
ffffffffc0208754:	7ae2                	ld	s5,56(sp)
ffffffffc0208756:	7b42                	ld	s6,48(sp)
ffffffffc0208758:	7ba2                	ld	s7,40(sp)
ffffffffc020875a:	7c02                	ld	s8,32(sp)
ffffffffc020875c:	6ce2                	ld	s9,24(sp)
ffffffffc020875e:	6d42                	ld	s10,16(sp)
ffffffffc0208760:	6165                	addi	sp,sp,112
ffffffffc0208762:	8082                	ret
ffffffffc0208764:	0008d517          	auipc	a0,0x8d
ffffffffc0208768:	0dc50513          	addi	a0,a0,220 # ffffffffc0295840 <disk0_sem>
ffffffffc020876c:	8b2e                	mv	s6,a1
ffffffffc020876e:	8c32                	mv	s8,a2
ffffffffc0208770:	0008ea97          	auipc	s5,0x8e
ffffffffc0208774:	188a8a93          	addi	s5,s5,392 # ffffffffc02968f8 <disk0_buffer>
ffffffffc0208778:	d4bfb0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc020877c:	6c91                	lui	s9,0x4
ffffffffc020877e:	e4b9                	bnez	s1,ffffffffc02087cc <disk0_io+0xd8>
ffffffffc0208780:	a845                	j	ffffffffc0208830 <disk0_io+0x13c>
ffffffffc0208782:	00c4d413          	srli	s0,s1,0xc
ffffffffc0208786:	0034169b          	slliw	a3,s0,0x3
ffffffffc020878a:	00068d1b          	sext.w	s10,a3
ffffffffc020878e:	1682                	slli	a3,a3,0x20
ffffffffc0208790:	2401                	sext.w	s0,s0
ffffffffc0208792:	9281                	srli	a3,a3,0x20
ffffffffc0208794:	8926                	mv	s2,s1
ffffffffc0208796:	00399a1b          	slliw	s4,s3,0x3
ffffffffc020879a:	862e                	mv	a2,a1
ffffffffc020879c:	4509                	li	a0,2
ffffffffc020879e:	85d2                	mv	a1,s4
ffffffffc02087a0:	ba0f80ef          	jal	ra,ffffffffc0200b40 <ide_read_secs>
ffffffffc02087a4:	e165                	bnez	a0,ffffffffc0208884 <disk0_io+0x190>
ffffffffc02087a6:	000ab583          	ld	a1,0(s5)
ffffffffc02087aa:	0038                	addi	a4,sp,8
ffffffffc02087ac:	4685                	li	a3,1
ffffffffc02087ae:	864a                	mv	a2,s2
ffffffffc02087b0:	855a                	mv	a0,s6
ffffffffc02087b2:	b99fc0ef          	jal	ra,ffffffffc020534a <iobuf_move>
ffffffffc02087b6:	67a2                	ld	a5,8(sp)
ffffffffc02087b8:	09279663          	bne	a5,s2,ffffffffc0208844 <disk0_io+0x150>
ffffffffc02087bc:	017977b3          	and	a5,s2,s7
ffffffffc02087c0:	e3d1                	bnez	a5,ffffffffc0208844 <disk0_io+0x150>
ffffffffc02087c2:	412484b3          	sub	s1,s1,s2
ffffffffc02087c6:	013409bb          	addw	s3,s0,s3
ffffffffc02087ca:	c0bd                	beqz	s1,ffffffffc0208830 <disk0_io+0x13c>
ffffffffc02087cc:	000ab583          	ld	a1,0(s5)
ffffffffc02087d0:	000c1b63          	bnez	s8,ffffffffc02087e6 <disk0_io+0xf2>
ffffffffc02087d4:	fb94e7e3          	bltu	s1,s9,ffffffffc0208782 <disk0_io+0x8e>
ffffffffc02087d8:	02000693          	li	a3,32
ffffffffc02087dc:	02000d13          	li	s10,32
ffffffffc02087e0:	4411                	li	s0,4
ffffffffc02087e2:	6911                	lui	s2,0x4
ffffffffc02087e4:	bf4d                	j	ffffffffc0208796 <disk0_io+0xa2>
ffffffffc02087e6:	0038                	addi	a4,sp,8
ffffffffc02087e8:	4681                	li	a3,0
ffffffffc02087ea:	6611                	lui	a2,0x4
ffffffffc02087ec:	855a                	mv	a0,s6
ffffffffc02087ee:	b5dfc0ef          	jal	ra,ffffffffc020534a <iobuf_move>
ffffffffc02087f2:	6422                	ld	s0,8(sp)
ffffffffc02087f4:	c825                	beqz	s0,ffffffffc0208864 <disk0_io+0x170>
ffffffffc02087f6:	0684e763          	bltu	s1,s0,ffffffffc0208864 <disk0_io+0x170>
ffffffffc02087fa:	017477b3          	and	a5,s0,s7
ffffffffc02087fe:	e3bd                	bnez	a5,ffffffffc0208864 <disk0_io+0x170>
ffffffffc0208800:	8031                	srli	s0,s0,0xc
ffffffffc0208802:	0034179b          	slliw	a5,s0,0x3
ffffffffc0208806:	000ab603          	ld	a2,0(s5)
ffffffffc020880a:	0039991b          	slliw	s2,s3,0x3
ffffffffc020880e:	02079693          	slli	a3,a5,0x20
ffffffffc0208812:	9281                	srli	a3,a3,0x20
ffffffffc0208814:	85ca                	mv	a1,s2
ffffffffc0208816:	4509                	li	a0,2
ffffffffc0208818:	2401                	sext.w	s0,s0
ffffffffc020881a:	00078a1b          	sext.w	s4,a5
ffffffffc020881e:	bb8f80ef          	jal	ra,ffffffffc0200bd6 <ide_write_secs>
ffffffffc0208822:	e151                	bnez	a0,ffffffffc02088a6 <disk0_io+0x1b2>
ffffffffc0208824:	6922                	ld	s2,8(sp)
ffffffffc0208826:	013409bb          	addw	s3,s0,s3
ffffffffc020882a:	412484b3          	sub	s1,s1,s2
ffffffffc020882e:	fcd9                	bnez	s1,ffffffffc02087cc <disk0_io+0xd8>
ffffffffc0208830:	0008d517          	auipc	a0,0x8d
ffffffffc0208834:	01050513          	addi	a0,a0,16 # ffffffffc0295840 <disk0_sem>
ffffffffc0208838:	c87fb0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020883c:	4501                	li	a0,0
ffffffffc020883e:	b729                	j	ffffffffc0208748 <disk0_io+0x54>
ffffffffc0208840:	5575                	li	a0,-3
ffffffffc0208842:	b719                	j	ffffffffc0208748 <disk0_io+0x54>
ffffffffc0208844:	00006697          	auipc	a3,0x6
ffffffffc0208848:	1dc68693          	addi	a3,a3,476 # ffffffffc020ea20 <dev_node_ops+0x178>
ffffffffc020884c:	00003617          	auipc	a2,0x3
ffffffffc0208850:	07c60613          	addi	a2,a2,124 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0208854:	06200593          	li	a1,98
ffffffffc0208858:	00006517          	auipc	a0,0x6
ffffffffc020885c:	11050513          	addi	a0,a0,272 # ffffffffc020e968 <dev_node_ops+0xc0>
ffffffffc0208860:	c3ff70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208864:	00006697          	auipc	a3,0x6
ffffffffc0208868:	0c468693          	addi	a3,a3,196 # ffffffffc020e928 <dev_node_ops+0x80>
ffffffffc020886c:	00003617          	auipc	a2,0x3
ffffffffc0208870:	05c60613          	addi	a2,a2,92 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0208874:	05700593          	li	a1,87
ffffffffc0208878:	00006517          	auipc	a0,0x6
ffffffffc020887c:	0f050513          	addi	a0,a0,240 # ffffffffc020e968 <dev_node_ops+0xc0>
ffffffffc0208880:	c1ff70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208884:	88aa                	mv	a7,a0
ffffffffc0208886:	886a                	mv	a6,s10
ffffffffc0208888:	87a2                	mv	a5,s0
ffffffffc020888a:	8752                	mv	a4,s4
ffffffffc020888c:	86ce                	mv	a3,s3
ffffffffc020888e:	00006617          	auipc	a2,0x6
ffffffffc0208892:	14a60613          	addi	a2,a2,330 # ffffffffc020e9d8 <dev_node_ops+0x130>
ffffffffc0208896:	02d00593          	li	a1,45
ffffffffc020889a:	00006517          	auipc	a0,0x6
ffffffffc020889e:	0ce50513          	addi	a0,a0,206 # ffffffffc020e968 <dev_node_ops+0xc0>
ffffffffc02088a2:	bfdf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02088a6:	88aa                	mv	a7,a0
ffffffffc02088a8:	8852                	mv	a6,s4
ffffffffc02088aa:	87a2                	mv	a5,s0
ffffffffc02088ac:	874a                	mv	a4,s2
ffffffffc02088ae:	86ce                	mv	a3,s3
ffffffffc02088b0:	00006617          	auipc	a2,0x6
ffffffffc02088b4:	0d860613          	addi	a2,a2,216 # ffffffffc020e988 <dev_node_ops+0xe0>
ffffffffc02088b8:	03700593          	li	a1,55
ffffffffc02088bc:	00006517          	auipc	a0,0x6
ffffffffc02088c0:	0ac50513          	addi	a0,a0,172 # ffffffffc020e968 <dev_node_ops+0xc0>
ffffffffc02088c4:	bdbf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02088c8 <dev_init_disk0>:
ffffffffc02088c8:	1101                	addi	sp,sp,-32
ffffffffc02088ca:	ec06                	sd	ra,24(sp)
ffffffffc02088cc:	e822                	sd	s0,16(sp)
ffffffffc02088ce:	e426                	sd	s1,8(sp)
ffffffffc02088d0:	dedff0ef          	jal	ra,ffffffffc02086bc <dev_create_inode>
ffffffffc02088d4:	c541                	beqz	a0,ffffffffc020895c <dev_init_disk0+0x94>
ffffffffc02088d6:	4d38                	lw	a4,88(a0)
ffffffffc02088d8:	6485                	lui	s1,0x1
ffffffffc02088da:	23448793          	addi	a5,s1,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02088de:	842a                	mv	s0,a0
ffffffffc02088e0:	0cf71f63          	bne	a4,a5,ffffffffc02089be <dev_init_disk0+0xf6>
ffffffffc02088e4:	4509                	li	a0,2
ffffffffc02088e6:	a0ef80ef          	jal	ra,ffffffffc0200af4 <ide_device_valid>
ffffffffc02088ea:	cd55                	beqz	a0,ffffffffc02089a6 <dev_init_disk0+0xde>
ffffffffc02088ec:	4509                	li	a0,2
ffffffffc02088ee:	a2af80ef          	jal	ra,ffffffffc0200b18 <ide_device_size>
ffffffffc02088f2:	00355793          	srli	a5,a0,0x3
ffffffffc02088f6:	e01c                	sd	a5,0(s0)
ffffffffc02088f8:	00000797          	auipc	a5,0x0
ffffffffc02088fc:	df078793          	addi	a5,a5,-528 # ffffffffc02086e8 <disk0_open>
ffffffffc0208900:	e81c                	sd	a5,16(s0)
ffffffffc0208902:	00000797          	auipc	a5,0x0
ffffffffc0208906:	dea78793          	addi	a5,a5,-534 # ffffffffc02086ec <disk0_close>
ffffffffc020890a:	ec1c                	sd	a5,24(s0)
ffffffffc020890c:	00000797          	auipc	a5,0x0
ffffffffc0208910:	de878793          	addi	a5,a5,-536 # ffffffffc02086f4 <disk0_io>
ffffffffc0208914:	f01c                	sd	a5,32(s0)
ffffffffc0208916:	00000797          	auipc	a5,0x0
ffffffffc020891a:	dda78793          	addi	a5,a5,-550 # ffffffffc02086f0 <disk0_ioctl>
ffffffffc020891e:	f41c                	sd	a5,40(s0)
ffffffffc0208920:	4585                	li	a1,1
ffffffffc0208922:	0008d517          	auipc	a0,0x8d
ffffffffc0208926:	f1e50513          	addi	a0,a0,-226 # ffffffffc0295840 <disk0_sem>
ffffffffc020892a:	e404                	sd	s1,8(s0)
ffffffffc020892c:	b8dfb0ef          	jal	ra,ffffffffc02044b8 <sem_init>
ffffffffc0208930:	6511                	lui	a0,0x4
ffffffffc0208932:	e5cf90ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0208936:	0008e797          	auipc	a5,0x8e
ffffffffc020893a:	fca7b123          	sd	a0,-62(a5) # ffffffffc02968f8 <disk0_buffer>
ffffffffc020893e:	c921                	beqz	a0,ffffffffc020898e <dev_init_disk0+0xc6>
ffffffffc0208940:	4605                	li	a2,1
ffffffffc0208942:	85a2                	mv	a1,s0
ffffffffc0208944:	00006517          	auipc	a0,0x6
ffffffffc0208948:	16c50513          	addi	a0,a0,364 # ffffffffc020eab0 <dev_node_ops+0x208>
ffffffffc020894c:	c2cff0ef          	jal	ra,ffffffffc0207d78 <vfs_add_dev>
ffffffffc0208950:	e115                	bnez	a0,ffffffffc0208974 <dev_init_disk0+0xac>
ffffffffc0208952:	60e2                	ld	ra,24(sp)
ffffffffc0208954:	6442                	ld	s0,16(sp)
ffffffffc0208956:	64a2                	ld	s1,8(sp)
ffffffffc0208958:	6105                	addi	sp,sp,32
ffffffffc020895a:	8082                	ret
ffffffffc020895c:	00006617          	auipc	a2,0x6
ffffffffc0208960:	0f460613          	addi	a2,a2,244 # ffffffffc020ea50 <dev_node_ops+0x1a8>
ffffffffc0208964:	08700593          	li	a1,135
ffffffffc0208968:	00006517          	auipc	a0,0x6
ffffffffc020896c:	00050513          	mv	a0,a0
ffffffffc0208970:	b2ff70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208974:	86aa                	mv	a3,a0
ffffffffc0208976:	00006617          	auipc	a2,0x6
ffffffffc020897a:	14260613          	addi	a2,a2,322 # ffffffffc020eab8 <dev_node_ops+0x210>
ffffffffc020897e:	08d00593          	li	a1,141
ffffffffc0208982:	00006517          	auipc	a0,0x6
ffffffffc0208986:	fe650513          	addi	a0,a0,-26 # ffffffffc020e968 <dev_node_ops+0xc0>
ffffffffc020898a:	b15f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020898e:	00006617          	auipc	a2,0x6
ffffffffc0208992:	10260613          	addi	a2,a2,258 # ffffffffc020ea90 <dev_node_ops+0x1e8>
ffffffffc0208996:	07f00593          	li	a1,127
ffffffffc020899a:	00006517          	auipc	a0,0x6
ffffffffc020899e:	fce50513          	addi	a0,a0,-50 # ffffffffc020e968 <dev_node_ops+0xc0>
ffffffffc02089a2:	afdf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02089a6:	00006617          	auipc	a2,0x6
ffffffffc02089aa:	0ca60613          	addi	a2,a2,202 # ffffffffc020ea70 <dev_node_ops+0x1c8>
ffffffffc02089ae:	07300593          	li	a1,115
ffffffffc02089b2:	00006517          	auipc	a0,0x6
ffffffffc02089b6:	fb650513          	addi	a0,a0,-74 # ffffffffc020e968 <dev_node_ops+0xc0>
ffffffffc02089ba:	ae5f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02089be:	00006697          	auipc	a3,0x6
ffffffffc02089c2:	bc268693          	addi	a3,a3,-1086 # ffffffffc020e580 <syscalls+0xb10>
ffffffffc02089c6:	00003617          	auipc	a2,0x3
ffffffffc02089ca:	f0260613          	addi	a2,a2,-254 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02089ce:	08900593          	li	a1,137
ffffffffc02089d2:	00006517          	auipc	a0,0x6
ffffffffc02089d6:	f9650513          	addi	a0,a0,-106 # ffffffffc020e968 <dev_node_ops+0xc0>
ffffffffc02089da:	ac5f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02089de <stdin_open>:
ffffffffc02089de:	4501                	li	a0,0
ffffffffc02089e0:	e191                	bnez	a1,ffffffffc02089e4 <stdin_open+0x6>
ffffffffc02089e2:	8082                	ret
ffffffffc02089e4:	5575                	li	a0,-3
ffffffffc02089e6:	8082                	ret

ffffffffc02089e8 <stdin_close>:
ffffffffc02089e8:	4501                	li	a0,0
ffffffffc02089ea:	8082                	ret

ffffffffc02089ec <stdin_ioctl>:
ffffffffc02089ec:	5575                	li	a0,-3
ffffffffc02089ee:	8082                	ret

ffffffffc02089f0 <stdin_io>:
ffffffffc02089f0:	7135                	addi	sp,sp,-160
ffffffffc02089f2:	ed06                	sd	ra,152(sp)
ffffffffc02089f4:	e922                	sd	s0,144(sp)
ffffffffc02089f6:	e526                	sd	s1,136(sp)
ffffffffc02089f8:	e14a                	sd	s2,128(sp)
ffffffffc02089fa:	fcce                	sd	s3,120(sp)
ffffffffc02089fc:	f8d2                	sd	s4,112(sp)
ffffffffc02089fe:	f4d6                	sd	s5,104(sp)
ffffffffc0208a00:	f0da                	sd	s6,96(sp)
ffffffffc0208a02:	ecde                	sd	s7,88(sp)
ffffffffc0208a04:	e8e2                	sd	s8,80(sp)
ffffffffc0208a06:	e4e6                	sd	s9,72(sp)
ffffffffc0208a08:	e0ea                	sd	s10,64(sp)
ffffffffc0208a0a:	fc6e                	sd	s11,56(sp)
ffffffffc0208a0c:	14061163          	bnez	a2,ffffffffc0208b4e <stdin_io+0x15e>
ffffffffc0208a10:	0005bd83          	ld	s11,0(a1)
ffffffffc0208a14:	0185bd03          	ld	s10,24(a1)
ffffffffc0208a18:	8b2e                	mv	s6,a1
ffffffffc0208a1a:	100027f3          	csrr	a5,sstatus
ffffffffc0208a1e:	8b89                	andi	a5,a5,2
ffffffffc0208a20:	10079e63          	bnez	a5,ffffffffc0208b3c <stdin_io+0x14c>
ffffffffc0208a24:	4401                	li	s0,0
ffffffffc0208a26:	100d0963          	beqz	s10,ffffffffc0208b38 <stdin_io+0x148>
ffffffffc0208a2a:	0008e997          	auipc	s3,0x8e
ffffffffc0208a2e:	ed698993          	addi	s3,s3,-298 # ffffffffc0296900 <p_rpos>
ffffffffc0208a32:	0009b783          	ld	a5,0(s3)
ffffffffc0208a36:	800004b7          	lui	s1,0x80000
ffffffffc0208a3a:	6c85                	lui	s9,0x1
ffffffffc0208a3c:	4a81                	li	s5,0
ffffffffc0208a3e:	0008ea17          	auipc	s4,0x8e
ffffffffc0208a42:	ecaa0a13          	addi	s4,s4,-310 # ffffffffc0296908 <p_wpos>
ffffffffc0208a46:	0491                	addi	s1,s1,4
ffffffffc0208a48:	0008d917          	auipc	s2,0x8d
ffffffffc0208a4c:	e1090913          	addi	s2,s2,-496 # ffffffffc0295858 <__wait_queue>
ffffffffc0208a50:	1cfd                	addi	s9,s9,-1
ffffffffc0208a52:	000a3703          	ld	a4,0(s4)
ffffffffc0208a56:	000a8c1b          	sext.w	s8,s5
ffffffffc0208a5a:	8be2                	mv	s7,s8
ffffffffc0208a5c:	02e7d763          	bge	a5,a4,ffffffffc0208a8a <stdin_io+0x9a>
ffffffffc0208a60:	a859                	j	ffffffffc0208af6 <stdin_io+0x106>
ffffffffc0208a62:	815fe0ef          	jal	ra,ffffffffc0207276 <schedule>
ffffffffc0208a66:	100027f3          	csrr	a5,sstatus
ffffffffc0208a6a:	8b89                	andi	a5,a5,2
ffffffffc0208a6c:	4401                	li	s0,0
ffffffffc0208a6e:	ef8d                	bnez	a5,ffffffffc0208aa8 <stdin_io+0xb8>
ffffffffc0208a70:	0028                	addi	a0,sp,8
ffffffffc0208a72:	ae3fb0ef          	jal	ra,ffffffffc0204554 <wait_in_queue>
ffffffffc0208a76:	e121                	bnez	a0,ffffffffc0208ab6 <stdin_io+0xc6>
ffffffffc0208a78:	47c2                	lw	a5,16(sp)
ffffffffc0208a7a:	04979563          	bne	a5,s1,ffffffffc0208ac4 <stdin_io+0xd4>
ffffffffc0208a7e:	0009b783          	ld	a5,0(s3)
ffffffffc0208a82:	000a3703          	ld	a4,0(s4)
ffffffffc0208a86:	06e7c863          	blt	a5,a4,ffffffffc0208af6 <stdin_io+0x106>
ffffffffc0208a8a:	8626                	mv	a2,s1
ffffffffc0208a8c:	002c                	addi	a1,sp,8
ffffffffc0208a8e:	854a                	mv	a0,s2
ffffffffc0208a90:	beffb0ef          	jal	ra,ffffffffc020467e <wait_current_set>
ffffffffc0208a94:	d479                	beqz	s0,ffffffffc0208a62 <stdin_io+0x72>
ffffffffc0208a96:	9d6f80ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208a9a:	fdcfe0ef          	jal	ra,ffffffffc0207276 <schedule>
ffffffffc0208a9e:	100027f3          	csrr	a5,sstatus
ffffffffc0208aa2:	8b89                	andi	a5,a5,2
ffffffffc0208aa4:	4401                	li	s0,0
ffffffffc0208aa6:	d7e9                	beqz	a5,ffffffffc0208a70 <stdin_io+0x80>
ffffffffc0208aa8:	9caf80ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208aac:	0028                	addi	a0,sp,8
ffffffffc0208aae:	4405                	li	s0,1
ffffffffc0208ab0:	aa5fb0ef          	jal	ra,ffffffffc0204554 <wait_in_queue>
ffffffffc0208ab4:	d171                	beqz	a0,ffffffffc0208a78 <stdin_io+0x88>
ffffffffc0208ab6:	002c                	addi	a1,sp,8
ffffffffc0208ab8:	854a                	mv	a0,s2
ffffffffc0208aba:	a41fb0ef          	jal	ra,ffffffffc02044fa <wait_queue_del>
ffffffffc0208abe:	47c2                	lw	a5,16(sp)
ffffffffc0208ac0:	fa978fe3          	beq	a5,s1,ffffffffc0208a7e <stdin_io+0x8e>
ffffffffc0208ac4:	e435                	bnez	s0,ffffffffc0208b30 <stdin_io+0x140>
ffffffffc0208ac6:	060b8963          	beqz	s7,ffffffffc0208b38 <stdin_io+0x148>
ffffffffc0208aca:	018b3783          	ld	a5,24(s6)
ffffffffc0208ace:	41578ab3          	sub	s5,a5,s5
ffffffffc0208ad2:	015b3c23          	sd	s5,24(s6)
ffffffffc0208ad6:	60ea                	ld	ra,152(sp)
ffffffffc0208ad8:	644a                	ld	s0,144(sp)
ffffffffc0208ada:	64aa                	ld	s1,136(sp)
ffffffffc0208adc:	690a                	ld	s2,128(sp)
ffffffffc0208ade:	79e6                	ld	s3,120(sp)
ffffffffc0208ae0:	7a46                	ld	s4,112(sp)
ffffffffc0208ae2:	7aa6                	ld	s5,104(sp)
ffffffffc0208ae4:	7b06                	ld	s6,96(sp)
ffffffffc0208ae6:	6c46                	ld	s8,80(sp)
ffffffffc0208ae8:	6ca6                	ld	s9,72(sp)
ffffffffc0208aea:	6d06                	ld	s10,64(sp)
ffffffffc0208aec:	7de2                	ld	s11,56(sp)
ffffffffc0208aee:	855e                	mv	a0,s7
ffffffffc0208af0:	6be6                	ld	s7,88(sp)
ffffffffc0208af2:	610d                	addi	sp,sp,160
ffffffffc0208af4:	8082                	ret
ffffffffc0208af6:	43f7d713          	srai	a4,a5,0x3f
ffffffffc0208afa:	03475693          	srli	a3,a4,0x34
ffffffffc0208afe:	00d78733          	add	a4,a5,a3
ffffffffc0208b02:	01977733          	and	a4,a4,s9
ffffffffc0208b06:	8f15                	sub	a4,a4,a3
ffffffffc0208b08:	0008d697          	auipc	a3,0x8d
ffffffffc0208b0c:	d6068693          	addi	a3,a3,-672 # ffffffffc0295868 <stdin_buffer>
ffffffffc0208b10:	9736                	add	a4,a4,a3
ffffffffc0208b12:	00074683          	lbu	a3,0(a4)
ffffffffc0208b16:	0785                	addi	a5,a5,1
ffffffffc0208b18:	015d8733          	add	a4,s11,s5
ffffffffc0208b1c:	00d70023          	sb	a3,0(a4)
ffffffffc0208b20:	00f9b023          	sd	a5,0(s3)
ffffffffc0208b24:	0a85                	addi	s5,s5,1
ffffffffc0208b26:	001c0b9b          	addiw	s7,s8,1
ffffffffc0208b2a:	f3aae4e3          	bltu	s5,s10,ffffffffc0208a52 <stdin_io+0x62>
ffffffffc0208b2e:	dc51                	beqz	s0,ffffffffc0208aca <stdin_io+0xda>
ffffffffc0208b30:	93cf80ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208b34:	f80b9be3          	bnez	s7,ffffffffc0208aca <stdin_io+0xda>
ffffffffc0208b38:	4b81                	li	s7,0
ffffffffc0208b3a:	bf71                	j	ffffffffc0208ad6 <stdin_io+0xe6>
ffffffffc0208b3c:	936f80ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208b40:	4405                	li	s0,1
ffffffffc0208b42:	ee0d14e3          	bnez	s10,ffffffffc0208a2a <stdin_io+0x3a>
ffffffffc0208b46:	926f80ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208b4a:	4b81                	li	s7,0
ffffffffc0208b4c:	b769                	j	ffffffffc0208ad6 <stdin_io+0xe6>
ffffffffc0208b4e:	5bf5                	li	s7,-3
ffffffffc0208b50:	b759                	j	ffffffffc0208ad6 <stdin_io+0xe6>

ffffffffc0208b52 <dev_stdin_write>:
ffffffffc0208b52:	e111                	bnez	a0,ffffffffc0208b56 <dev_stdin_write+0x4>
ffffffffc0208b54:	8082                	ret
ffffffffc0208b56:	1101                	addi	sp,sp,-32
ffffffffc0208b58:	e822                	sd	s0,16(sp)
ffffffffc0208b5a:	ec06                	sd	ra,24(sp)
ffffffffc0208b5c:	e426                	sd	s1,8(sp)
ffffffffc0208b5e:	842a                	mv	s0,a0
ffffffffc0208b60:	100027f3          	csrr	a5,sstatus
ffffffffc0208b64:	8b89                	andi	a5,a5,2
ffffffffc0208b66:	4481                	li	s1,0
ffffffffc0208b68:	e3c1                	bnez	a5,ffffffffc0208be8 <dev_stdin_write+0x96>
ffffffffc0208b6a:	0008e597          	auipc	a1,0x8e
ffffffffc0208b6e:	d9e58593          	addi	a1,a1,-610 # ffffffffc0296908 <p_wpos>
ffffffffc0208b72:	6198                	ld	a4,0(a1)
ffffffffc0208b74:	6605                	lui	a2,0x1
ffffffffc0208b76:	fff60513          	addi	a0,a2,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0208b7a:	43f75693          	srai	a3,a4,0x3f
ffffffffc0208b7e:	92d1                	srli	a3,a3,0x34
ffffffffc0208b80:	00d707b3          	add	a5,a4,a3
ffffffffc0208b84:	8fe9                	and	a5,a5,a0
ffffffffc0208b86:	8f95                	sub	a5,a5,a3
ffffffffc0208b88:	0008d697          	auipc	a3,0x8d
ffffffffc0208b8c:	ce068693          	addi	a3,a3,-800 # ffffffffc0295868 <stdin_buffer>
ffffffffc0208b90:	97b6                	add	a5,a5,a3
ffffffffc0208b92:	00878023          	sb	s0,0(a5)
ffffffffc0208b96:	0008e797          	auipc	a5,0x8e
ffffffffc0208b9a:	d6a7b783          	ld	a5,-662(a5) # ffffffffc0296900 <p_rpos>
ffffffffc0208b9e:	40f707b3          	sub	a5,a4,a5
ffffffffc0208ba2:	00c7d463          	bge	a5,a2,ffffffffc0208baa <dev_stdin_write+0x58>
ffffffffc0208ba6:	0705                	addi	a4,a4,1
ffffffffc0208ba8:	e198                	sd	a4,0(a1)
ffffffffc0208baa:	0008d517          	auipc	a0,0x8d
ffffffffc0208bae:	cae50513          	addi	a0,a0,-850 # ffffffffc0295858 <__wait_queue>
ffffffffc0208bb2:	997fb0ef          	jal	ra,ffffffffc0204548 <wait_queue_empty>
ffffffffc0208bb6:	cd09                	beqz	a0,ffffffffc0208bd0 <dev_stdin_write+0x7e>
ffffffffc0208bb8:	e491                	bnez	s1,ffffffffc0208bc4 <dev_stdin_write+0x72>
ffffffffc0208bba:	60e2                	ld	ra,24(sp)
ffffffffc0208bbc:	6442                	ld	s0,16(sp)
ffffffffc0208bbe:	64a2                	ld	s1,8(sp)
ffffffffc0208bc0:	6105                	addi	sp,sp,32
ffffffffc0208bc2:	8082                	ret
ffffffffc0208bc4:	6442                	ld	s0,16(sp)
ffffffffc0208bc6:	60e2                	ld	ra,24(sp)
ffffffffc0208bc8:	64a2                	ld	s1,8(sp)
ffffffffc0208bca:	6105                	addi	sp,sp,32
ffffffffc0208bcc:	8a0f806f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0208bd0:	800005b7          	lui	a1,0x80000
ffffffffc0208bd4:	4605                	li	a2,1
ffffffffc0208bd6:	0591                	addi	a1,a1,4
ffffffffc0208bd8:	0008d517          	auipc	a0,0x8d
ffffffffc0208bdc:	c8050513          	addi	a0,a0,-896 # ffffffffc0295858 <__wait_queue>
ffffffffc0208be0:	9d1fb0ef          	jal	ra,ffffffffc02045b0 <wakeup_queue>
ffffffffc0208be4:	d8f9                	beqz	s1,ffffffffc0208bba <dev_stdin_write+0x68>
ffffffffc0208be6:	bff9                	j	ffffffffc0208bc4 <dev_stdin_write+0x72>
ffffffffc0208be8:	88af80ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208bec:	4485                	li	s1,1
ffffffffc0208bee:	bfb5                	j	ffffffffc0208b6a <dev_stdin_write+0x18>

ffffffffc0208bf0 <dev_init_stdin>:
ffffffffc0208bf0:	1141                	addi	sp,sp,-16
ffffffffc0208bf2:	e406                	sd	ra,8(sp)
ffffffffc0208bf4:	e022                	sd	s0,0(sp)
ffffffffc0208bf6:	ac7ff0ef          	jal	ra,ffffffffc02086bc <dev_create_inode>
ffffffffc0208bfa:	c93d                	beqz	a0,ffffffffc0208c70 <dev_init_stdin+0x80>
ffffffffc0208bfc:	4d38                	lw	a4,88(a0)
ffffffffc0208bfe:	6785                	lui	a5,0x1
ffffffffc0208c00:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208c04:	842a                	mv	s0,a0
ffffffffc0208c06:	08f71e63          	bne	a4,a5,ffffffffc0208ca2 <dev_init_stdin+0xb2>
ffffffffc0208c0a:	4785                	li	a5,1
ffffffffc0208c0c:	e41c                	sd	a5,8(s0)
ffffffffc0208c0e:	00000797          	auipc	a5,0x0
ffffffffc0208c12:	dd078793          	addi	a5,a5,-560 # ffffffffc02089de <stdin_open>
ffffffffc0208c16:	e81c                	sd	a5,16(s0)
ffffffffc0208c18:	00000797          	auipc	a5,0x0
ffffffffc0208c1c:	dd078793          	addi	a5,a5,-560 # ffffffffc02089e8 <stdin_close>
ffffffffc0208c20:	ec1c                	sd	a5,24(s0)
ffffffffc0208c22:	00000797          	auipc	a5,0x0
ffffffffc0208c26:	dce78793          	addi	a5,a5,-562 # ffffffffc02089f0 <stdin_io>
ffffffffc0208c2a:	f01c                	sd	a5,32(s0)
ffffffffc0208c2c:	00000797          	auipc	a5,0x0
ffffffffc0208c30:	dc078793          	addi	a5,a5,-576 # ffffffffc02089ec <stdin_ioctl>
ffffffffc0208c34:	f41c                	sd	a5,40(s0)
ffffffffc0208c36:	0008d517          	auipc	a0,0x8d
ffffffffc0208c3a:	c2250513          	addi	a0,a0,-990 # ffffffffc0295858 <__wait_queue>
ffffffffc0208c3e:	00043023          	sd	zero,0(s0)
ffffffffc0208c42:	0008e797          	auipc	a5,0x8e
ffffffffc0208c46:	cc07b323          	sd	zero,-826(a5) # ffffffffc0296908 <p_wpos>
ffffffffc0208c4a:	0008e797          	auipc	a5,0x8e
ffffffffc0208c4e:	ca07bb23          	sd	zero,-842(a5) # ffffffffc0296900 <p_rpos>
ffffffffc0208c52:	8a3fb0ef          	jal	ra,ffffffffc02044f4 <wait_queue_init>
ffffffffc0208c56:	4601                	li	a2,0
ffffffffc0208c58:	85a2                	mv	a1,s0
ffffffffc0208c5a:	00006517          	auipc	a0,0x6
ffffffffc0208c5e:	ebe50513          	addi	a0,a0,-322 # ffffffffc020eb18 <dev_node_ops+0x270>
ffffffffc0208c62:	916ff0ef          	jal	ra,ffffffffc0207d78 <vfs_add_dev>
ffffffffc0208c66:	e10d                	bnez	a0,ffffffffc0208c88 <dev_init_stdin+0x98>
ffffffffc0208c68:	60a2                	ld	ra,8(sp)
ffffffffc0208c6a:	6402                	ld	s0,0(sp)
ffffffffc0208c6c:	0141                	addi	sp,sp,16
ffffffffc0208c6e:	8082                	ret
ffffffffc0208c70:	00006617          	auipc	a2,0x6
ffffffffc0208c74:	e6860613          	addi	a2,a2,-408 # ffffffffc020ead8 <dev_node_ops+0x230>
ffffffffc0208c78:	07500593          	li	a1,117
ffffffffc0208c7c:	00006517          	auipc	a0,0x6
ffffffffc0208c80:	e7c50513          	addi	a0,a0,-388 # ffffffffc020eaf8 <dev_node_ops+0x250>
ffffffffc0208c84:	81bf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208c88:	86aa                	mv	a3,a0
ffffffffc0208c8a:	00006617          	auipc	a2,0x6
ffffffffc0208c8e:	e9660613          	addi	a2,a2,-362 # ffffffffc020eb20 <dev_node_ops+0x278>
ffffffffc0208c92:	07b00593          	li	a1,123
ffffffffc0208c96:	00006517          	auipc	a0,0x6
ffffffffc0208c9a:	e6250513          	addi	a0,a0,-414 # ffffffffc020eaf8 <dev_node_ops+0x250>
ffffffffc0208c9e:	801f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208ca2:	00006697          	auipc	a3,0x6
ffffffffc0208ca6:	8de68693          	addi	a3,a3,-1826 # ffffffffc020e580 <syscalls+0xb10>
ffffffffc0208caa:	00003617          	auipc	a2,0x3
ffffffffc0208cae:	c1e60613          	addi	a2,a2,-994 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0208cb2:	07700593          	li	a1,119
ffffffffc0208cb6:	00006517          	auipc	a0,0x6
ffffffffc0208cba:	e4250513          	addi	a0,a0,-446 # ffffffffc020eaf8 <dev_node_ops+0x250>
ffffffffc0208cbe:	fe0f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208cc2 <stdout_open>:
ffffffffc0208cc2:	4785                	li	a5,1
ffffffffc0208cc4:	4501                	li	a0,0
ffffffffc0208cc6:	00f59363          	bne	a1,a5,ffffffffc0208ccc <stdout_open+0xa>
ffffffffc0208cca:	8082                	ret
ffffffffc0208ccc:	5575                	li	a0,-3
ffffffffc0208cce:	8082                	ret

ffffffffc0208cd0 <stdout_close>:
ffffffffc0208cd0:	4501                	li	a0,0
ffffffffc0208cd2:	8082                	ret

ffffffffc0208cd4 <stdout_ioctl>:
ffffffffc0208cd4:	5575                	li	a0,-3
ffffffffc0208cd6:	8082                	ret

ffffffffc0208cd8 <stdout_io>:
ffffffffc0208cd8:	ca05                	beqz	a2,ffffffffc0208d08 <stdout_io+0x30>
ffffffffc0208cda:	6d9c                	ld	a5,24(a1)
ffffffffc0208cdc:	1101                	addi	sp,sp,-32
ffffffffc0208cde:	e822                	sd	s0,16(sp)
ffffffffc0208ce0:	e426                	sd	s1,8(sp)
ffffffffc0208ce2:	ec06                	sd	ra,24(sp)
ffffffffc0208ce4:	6180                	ld	s0,0(a1)
ffffffffc0208ce6:	84ae                	mv	s1,a1
ffffffffc0208ce8:	cb91                	beqz	a5,ffffffffc0208cfc <stdout_io+0x24>
ffffffffc0208cea:	00044503          	lbu	a0,0(s0)
ffffffffc0208cee:	0405                	addi	s0,s0,1
ffffffffc0208cf0:	cf2f70ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0208cf4:	6c9c                	ld	a5,24(s1)
ffffffffc0208cf6:	17fd                	addi	a5,a5,-1
ffffffffc0208cf8:	ec9c                	sd	a5,24(s1)
ffffffffc0208cfa:	fbe5                	bnez	a5,ffffffffc0208cea <stdout_io+0x12>
ffffffffc0208cfc:	60e2                	ld	ra,24(sp)
ffffffffc0208cfe:	6442                	ld	s0,16(sp)
ffffffffc0208d00:	64a2                	ld	s1,8(sp)
ffffffffc0208d02:	4501                	li	a0,0
ffffffffc0208d04:	6105                	addi	sp,sp,32
ffffffffc0208d06:	8082                	ret
ffffffffc0208d08:	5575                	li	a0,-3
ffffffffc0208d0a:	8082                	ret

ffffffffc0208d0c <dev_init_stdout>:
ffffffffc0208d0c:	1141                	addi	sp,sp,-16
ffffffffc0208d0e:	e406                	sd	ra,8(sp)
ffffffffc0208d10:	9adff0ef          	jal	ra,ffffffffc02086bc <dev_create_inode>
ffffffffc0208d14:	c939                	beqz	a0,ffffffffc0208d6a <dev_init_stdout+0x5e>
ffffffffc0208d16:	4d38                	lw	a4,88(a0)
ffffffffc0208d18:	6785                	lui	a5,0x1
ffffffffc0208d1a:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208d1e:	85aa                	mv	a1,a0
ffffffffc0208d20:	06f71e63          	bne	a4,a5,ffffffffc0208d9c <dev_init_stdout+0x90>
ffffffffc0208d24:	4785                	li	a5,1
ffffffffc0208d26:	e51c                	sd	a5,8(a0)
ffffffffc0208d28:	00000797          	auipc	a5,0x0
ffffffffc0208d2c:	f9a78793          	addi	a5,a5,-102 # ffffffffc0208cc2 <stdout_open>
ffffffffc0208d30:	e91c                	sd	a5,16(a0)
ffffffffc0208d32:	00000797          	auipc	a5,0x0
ffffffffc0208d36:	f9e78793          	addi	a5,a5,-98 # ffffffffc0208cd0 <stdout_close>
ffffffffc0208d3a:	ed1c                	sd	a5,24(a0)
ffffffffc0208d3c:	00000797          	auipc	a5,0x0
ffffffffc0208d40:	f9c78793          	addi	a5,a5,-100 # ffffffffc0208cd8 <stdout_io>
ffffffffc0208d44:	f11c                	sd	a5,32(a0)
ffffffffc0208d46:	00000797          	auipc	a5,0x0
ffffffffc0208d4a:	f8e78793          	addi	a5,a5,-114 # ffffffffc0208cd4 <stdout_ioctl>
ffffffffc0208d4e:	00053023          	sd	zero,0(a0)
ffffffffc0208d52:	f51c                	sd	a5,40(a0)
ffffffffc0208d54:	4601                	li	a2,0
ffffffffc0208d56:	00006517          	auipc	a0,0x6
ffffffffc0208d5a:	e2a50513          	addi	a0,a0,-470 # ffffffffc020eb80 <dev_node_ops+0x2d8>
ffffffffc0208d5e:	81aff0ef          	jal	ra,ffffffffc0207d78 <vfs_add_dev>
ffffffffc0208d62:	e105                	bnez	a0,ffffffffc0208d82 <dev_init_stdout+0x76>
ffffffffc0208d64:	60a2                	ld	ra,8(sp)
ffffffffc0208d66:	0141                	addi	sp,sp,16
ffffffffc0208d68:	8082                	ret
ffffffffc0208d6a:	00006617          	auipc	a2,0x6
ffffffffc0208d6e:	dd660613          	addi	a2,a2,-554 # ffffffffc020eb40 <dev_node_ops+0x298>
ffffffffc0208d72:	03700593          	li	a1,55
ffffffffc0208d76:	00006517          	auipc	a0,0x6
ffffffffc0208d7a:	dea50513          	addi	a0,a0,-534 # ffffffffc020eb60 <dev_node_ops+0x2b8>
ffffffffc0208d7e:	f20f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208d82:	86aa                	mv	a3,a0
ffffffffc0208d84:	00006617          	auipc	a2,0x6
ffffffffc0208d88:	e0460613          	addi	a2,a2,-508 # ffffffffc020eb88 <dev_node_ops+0x2e0>
ffffffffc0208d8c:	03d00593          	li	a1,61
ffffffffc0208d90:	00006517          	auipc	a0,0x6
ffffffffc0208d94:	dd050513          	addi	a0,a0,-560 # ffffffffc020eb60 <dev_node_ops+0x2b8>
ffffffffc0208d98:	f06f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208d9c:	00005697          	auipc	a3,0x5
ffffffffc0208da0:	7e468693          	addi	a3,a3,2020 # ffffffffc020e580 <syscalls+0xb10>
ffffffffc0208da4:	00003617          	auipc	a2,0x3
ffffffffc0208da8:	b2460613          	addi	a2,a2,-1244 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0208dac:	03900593          	li	a1,57
ffffffffc0208db0:	00006517          	auipc	a0,0x6
ffffffffc0208db4:	db050513          	addi	a0,a0,-592 # ffffffffc020eb60 <dev_node_ops+0x2b8>
ffffffffc0208db8:	ee6f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208dbc <bitmap_translate.part.0>:
ffffffffc0208dbc:	1141                	addi	sp,sp,-16
ffffffffc0208dbe:	00006697          	auipc	a3,0x6
ffffffffc0208dc2:	dea68693          	addi	a3,a3,-534 # ffffffffc020eba8 <dev_node_ops+0x300>
ffffffffc0208dc6:	00003617          	auipc	a2,0x3
ffffffffc0208dca:	b0260613          	addi	a2,a2,-1278 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0208dce:	04c00593          	li	a1,76
ffffffffc0208dd2:	00006517          	auipc	a0,0x6
ffffffffc0208dd6:	dee50513          	addi	a0,a0,-530 # ffffffffc020ebc0 <dev_node_ops+0x318>
ffffffffc0208dda:	e406                	sd	ra,8(sp)
ffffffffc0208ddc:	ec2f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208de0 <bitmap_create>:
ffffffffc0208de0:	7139                	addi	sp,sp,-64
ffffffffc0208de2:	fc06                	sd	ra,56(sp)
ffffffffc0208de4:	f822                	sd	s0,48(sp)
ffffffffc0208de6:	f426                	sd	s1,40(sp)
ffffffffc0208de8:	f04a                	sd	s2,32(sp)
ffffffffc0208dea:	ec4e                	sd	s3,24(sp)
ffffffffc0208dec:	e852                	sd	s4,16(sp)
ffffffffc0208dee:	e456                	sd	s5,8(sp)
ffffffffc0208df0:	c14d                	beqz	a0,ffffffffc0208e92 <bitmap_create+0xb2>
ffffffffc0208df2:	842a                	mv	s0,a0
ffffffffc0208df4:	4541                	li	a0,16
ffffffffc0208df6:	998f90ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0208dfa:	84aa                	mv	s1,a0
ffffffffc0208dfc:	cd25                	beqz	a0,ffffffffc0208e74 <bitmap_create+0x94>
ffffffffc0208dfe:	02041a13          	slli	s4,s0,0x20
ffffffffc0208e02:	020a5a13          	srli	s4,s4,0x20
ffffffffc0208e06:	01fa0793          	addi	a5,s4,31
ffffffffc0208e0a:	0057d993          	srli	s3,a5,0x5
ffffffffc0208e0e:	00299a93          	slli	s5,s3,0x2
ffffffffc0208e12:	8556                	mv	a0,s5
ffffffffc0208e14:	894e                	mv	s2,s3
ffffffffc0208e16:	978f90ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0208e1a:	c53d                	beqz	a0,ffffffffc0208e88 <bitmap_create+0xa8>
ffffffffc0208e1c:	0134a223          	sw	s3,4(s1) # ffffffff80000004 <_binary_bin_sfs_img_size+0xffffffff7ff8ad04>
ffffffffc0208e20:	c080                	sw	s0,0(s1)
ffffffffc0208e22:	8656                	mv	a2,s5
ffffffffc0208e24:	0ff00593          	li	a1,255
ffffffffc0208e28:	5b8020ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc0208e2c:	e488                	sd	a0,8(s1)
ffffffffc0208e2e:	0996                	slli	s3,s3,0x5
ffffffffc0208e30:	053a0263          	beq	s4,s3,ffffffffc0208e74 <bitmap_create+0x94>
ffffffffc0208e34:	fff9079b          	addiw	a5,s2,-1
ffffffffc0208e38:	0057969b          	slliw	a3,a5,0x5
ffffffffc0208e3c:	0054561b          	srliw	a2,s0,0x5
ffffffffc0208e40:	40d4073b          	subw	a4,s0,a3
ffffffffc0208e44:	0054541b          	srliw	s0,s0,0x5
ffffffffc0208e48:	08f61463          	bne	a2,a5,ffffffffc0208ed0 <bitmap_create+0xf0>
ffffffffc0208e4c:	fff7069b          	addiw	a3,a4,-1
ffffffffc0208e50:	47f9                	li	a5,30
ffffffffc0208e52:	04d7ef63          	bltu	a5,a3,ffffffffc0208eb0 <bitmap_create+0xd0>
ffffffffc0208e56:	1402                	slli	s0,s0,0x20
ffffffffc0208e58:	8079                	srli	s0,s0,0x1e
ffffffffc0208e5a:	9522                	add	a0,a0,s0
ffffffffc0208e5c:	411c                	lw	a5,0(a0)
ffffffffc0208e5e:	4585                	li	a1,1
ffffffffc0208e60:	02000613          	li	a2,32
ffffffffc0208e64:	00e596bb          	sllw	a3,a1,a4
ffffffffc0208e68:	8fb5                	xor	a5,a5,a3
ffffffffc0208e6a:	2705                	addiw	a4,a4,1
ffffffffc0208e6c:	2781                	sext.w	a5,a5
ffffffffc0208e6e:	fec71be3          	bne	a4,a2,ffffffffc0208e64 <bitmap_create+0x84>
ffffffffc0208e72:	c11c                	sw	a5,0(a0)
ffffffffc0208e74:	70e2                	ld	ra,56(sp)
ffffffffc0208e76:	7442                	ld	s0,48(sp)
ffffffffc0208e78:	7902                	ld	s2,32(sp)
ffffffffc0208e7a:	69e2                	ld	s3,24(sp)
ffffffffc0208e7c:	6a42                	ld	s4,16(sp)
ffffffffc0208e7e:	6aa2                	ld	s5,8(sp)
ffffffffc0208e80:	8526                	mv	a0,s1
ffffffffc0208e82:	74a2                	ld	s1,40(sp)
ffffffffc0208e84:	6121                	addi	sp,sp,64
ffffffffc0208e86:	8082                	ret
ffffffffc0208e88:	8526                	mv	a0,s1
ffffffffc0208e8a:	9b4f90ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0208e8e:	4481                	li	s1,0
ffffffffc0208e90:	b7d5                	j	ffffffffc0208e74 <bitmap_create+0x94>
ffffffffc0208e92:	00006697          	auipc	a3,0x6
ffffffffc0208e96:	d4668693          	addi	a3,a3,-698 # ffffffffc020ebd8 <dev_node_ops+0x330>
ffffffffc0208e9a:	00003617          	auipc	a2,0x3
ffffffffc0208e9e:	a2e60613          	addi	a2,a2,-1490 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0208ea2:	45d5                	li	a1,21
ffffffffc0208ea4:	00006517          	auipc	a0,0x6
ffffffffc0208ea8:	d1c50513          	addi	a0,a0,-740 # ffffffffc020ebc0 <dev_node_ops+0x318>
ffffffffc0208eac:	df2f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208eb0:	00006697          	auipc	a3,0x6
ffffffffc0208eb4:	d6868693          	addi	a3,a3,-664 # ffffffffc020ec18 <dev_node_ops+0x370>
ffffffffc0208eb8:	00003617          	auipc	a2,0x3
ffffffffc0208ebc:	a1060613          	addi	a2,a2,-1520 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0208ec0:	02b00593          	li	a1,43
ffffffffc0208ec4:	00006517          	auipc	a0,0x6
ffffffffc0208ec8:	cfc50513          	addi	a0,a0,-772 # ffffffffc020ebc0 <dev_node_ops+0x318>
ffffffffc0208ecc:	dd2f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208ed0:	00006697          	auipc	a3,0x6
ffffffffc0208ed4:	d3068693          	addi	a3,a3,-720 # ffffffffc020ec00 <dev_node_ops+0x358>
ffffffffc0208ed8:	00003617          	auipc	a2,0x3
ffffffffc0208edc:	9f060613          	addi	a2,a2,-1552 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0208ee0:	02a00593          	li	a1,42
ffffffffc0208ee4:	00006517          	auipc	a0,0x6
ffffffffc0208ee8:	cdc50513          	addi	a0,a0,-804 # ffffffffc020ebc0 <dev_node_ops+0x318>
ffffffffc0208eec:	db2f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208ef0 <bitmap_alloc>:
ffffffffc0208ef0:	4150                	lw	a2,4(a0)
ffffffffc0208ef2:	651c                	ld	a5,8(a0)
ffffffffc0208ef4:	c231                	beqz	a2,ffffffffc0208f38 <bitmap_alloc+0x48>
ffffffffc0208ef6:	4701                	li	a4,0
ffffffffc0208ef8:	a029                	j	ffffffffc0208f02 <bitmap_alloc+0x12>
ffffffffc0208efa:	2705                	addiw	a4,a4,1
ffffffffc0208efc:	0791                	addi	a5,a5,4
ffffffffc0208efe:	02e60d63          	beq	a2,a4,ffffffffc0208f38 <bitmap_alloc+0x48>
ffffffffc0208f02:	4394                	lw	a3,0(a5)
ffffffffc0208f04:	dafd                	beqz	a3,ffffffffc0208efa <bitmap_alloc+0xa>
ffffffffc0208f06:	4501                	li	a0,0
ffffffffc0208f08:	4885                	li	a7,1
ffffffffc0208f0a:	8e36                	mv	t3,a3
ffffffffc0208f0c:	02000313          	li	t1,32
ffffffffc0208f10:	a021                	j	ffffffffc0208f18 <bitmap_alloc+0x28>
ffffffffc0208f12:	2505                	addiw	a0,a0,1
ffffffffc0208f14:	02650463          	beq	a0,t1,ffffffffc0208f3c <bitmap_alloc+0x4c>
ffffffffc0208f18:	00a8983b          	sllw	a6,a7,a0
ffffffffc0208f1c:	0106f633          	and	a2,a3,a6
ffffffffc0208f20:	2601                	sext.w	a2,a2
ffffffffc0208f22:	da65                	beqz	a2,ffffffffc0208f12 <bitmap_alloc+0x22>
ffffffffc0208f24:	010e4833          	xor	a6,t3,a6
ffffffffc0208f28:	0057171b          	slliw	a4,a4,0x5
ffffffffc0208f2c:	9f29                	addw	a4,a4,a0
ffffffffc0208f2e:	0107a023          	sw	a6,0(a5)
ffffffffc0208f32:	c198                	sw	a4,0(a1)
ffffffffc0208f34:	4501                	li	a0,0
ffffffffc0208f36:	8082                	ret
ffffffffc0208f38:	5571                	li	a0,-4
ffffffffc0208f3a:	8082                	ret
ffffffffc0208f3c:	1141                	addi	sp,sp,-16
ffffffffc0208f3e:	00004697          	auipc	a3,0x4
ffffffffc0208f42:	a2a68693          	addi	a3,a3,-1494 # ffffffffc020c968 <default_pmm_manager+0x5b8>
ffffffffc0208f46:	00003617          	auipc	a2,0x3
ffffffffc0208f4a:	98260613          	addi	a2,a2,-1662 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0208f4e:	04300593          	li	a1,67
ffffffffc0208f52:	00006517          	auipc	a0,0x6
ffffffffc0208f56:	c6e50513          	addi	a0,a0,-914 # ffffffffc020ebc0 <dev_node_ops+0x318>
ffffffffc0208f5a:	e406                	sd	ra,8(sp)
ffffffffc0208f5c:	d42f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208f60 <bitmap_test>:
ffffffffc0208f60:	411c                	lw	a5,0(a0)
ffffffffc0208f62:	00f5ff63          	bgeu	a1,a5,ffffffffc0208f80 <bitmap_test+0x20>
ffffffffc0208f66:	651c                	ld	a5,8(a0)
ffffffffc0208f68:	0055d71b          	srliw	a4,a1,0x5
ffffffffc0208f6c:	070a                	slli	a4,a4,0x2
ffffffffc0208f6e:	97ba                	add	a5,a5,a4
ffffffffc0208f70:	4388                	lw	a0,0(a5)
ffffffffc0208f72:	4785                	li	a5,1
ffffffffc0208f74:	00b795bb          	sllw	a1,a5,a1
ffffffffc0208f78:	8d6d                	and	a0,a0,a1
ffffffffc0208f7a:	1502                	slli	a0,a0,0x20
ffffffffc0208f7c:	9101                	srli	a0,a0,0x20
ffffffffc0208f7e:	8082                	ret
ffffffffc0208f80:	1141                	addi	sp,sp,-16
ffffffffc0208f82:	e406                	sd	ra,8(sp)
ffffffffc0208f84:	e39ff0ef          	jal	ra,ffffffffc0208dbc <bitmap_translate.part.0>

ffffffffc0208f88 <bitmap_free>:
ffffffffc0208f88:	411c                	lw	a5,0(a0)
ffffffffc0208f8a:	1141                	addi	sp,sp,-16
ffffffffc0208f8c:	e406                	sd	ra,8(sp)
ffffffffc0208f8e:	02f5f463          	bgeu	a1,a5,ffffffffc0208fb6 <bitmap_free+0x2e>
ffffffffc0208f92:	651c                	ld	a5,8(a0)
ffffffffc0208f94:	0055d71b          	srliw	a4,a1,0x5
ffffffffc0208f98:	070a                	slli	a4,a4,0x2
ffffffffc0208f9a:	97ba                	add	a5,a5,a4
ffffffffc0208f9c:	4398                	lw	a4,0(a5)
ffffffffc0208f9e:	4685                	li	a3,1
ffffffffc0208fa0:	00b695bb          	sllw	a1,a3,a1
ffffffffc0208fa4:	00b776b3          	and	a3,a4,a1
ffffffffc0208fa8:	2681                	sext.w	a3,a3
ffffffffc0208faa:	ea81                	bnez	a3,ffffffffc0208fba <bitmap_free+0x32>
ffffffffc0208fac:	60a2                	ld	ra,8(sp)
ffffffffc0208fae:	8f4d                	or	a4,a4,a1
ffffffffc0208fb0:	c398                	sw	a4,0(a5)
ffffffffc0208fb2:	0141                	addi	sp,sp,16
ffffffffc0208fb4:	8082                	ret
ffffffffc0208fb6:	e07ff0ef          	jal	ra,ffffffffc0208dbc <bitmap_translate.part.0>
ffffffffc0208fba:	00006697          	auipc	a3,0x6
ffffffffc0208fbe:	c8668693          	addi	a3,a3,-890 # ffffffffc020ec40 <dev_node_ops+0x398>
ffffffffc0208fc2:	00003617          	auipc	a2,0x3
ffffffffc0208fc6:	90660613          	addi	a2,a2,-1786 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0208fca:	05f00593          	li	a1,95
ffffffffc0208fce:	00006517          	auipc	a0,0x6
ffffffffc0208fd2:	bf250513          	addi	a0,a0,-1038 # ffffffffc020ebc0 <dev_node_ops+0x318>
ffffffffc0208fd6:	cc8f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208fda <bitmap_destroy>:
ffffffffc0208fda:	1141                	addi	sp,sp,-16
ffffffffc0208fdc:	e022                	sd	s0,0(sp)
ffffffffc0208fde:	842a                	mv	s0,a0
ffffffffc0208fe0:	6508                	ld	a0,8(a0)
ffffffffc0208fe2:	e406                	sd	ra,8(sp)
ffffffffc0208fe4:	85af90ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0208fe8:	8522                	mv	a0,s0
ffffffffc0208fea:	6402                	ld	s0,0(sp)
ffffffffc0208fec:	60a2                	ld	ra,8(sp)
ffffffffc0208fee:	0141                	addi	sp,sp,16
ffffffffc0208ff0:	84ef906f          	j	ffffffffc020203e <kfree>

ffffffffc0208ff4 <bitmap_getdata>:
ffffffffc0208ff4:	c589                	beqz	a1,ffffffffc0208ffe <bitmap_getdata+0xa>
ffffffffc0208ff6:	00456783          	lwu	a5,4(a0)
ffffffffc0208ffa:	078a                	slli	a5,a5,0x2
ffffffffc0208ffc:	e19c                	sd	a5,0(a1)
ffffffffc0208ffe:	6508                	ld	a0,8(a0)
ffffffffc0209000:	8082                	ret

ffffffffc0209002 <sfs_init>:
ffffffffc0209002:	1141                	addi	sp,sp,-16
ffffffffc0209004:	00006517          	auipc	a0,0x6
ffffffffc0209008:	aac50513          	addi	a0,a0,-1364 # ffffffffc020eab0 <dev_node_ops+0x208>
ffffffffc020900c:	e406                	sd	ra,8(sp)
ffffffffc020900e:	554000ef          	jal	ra,ffffffffc0209562 <sfs_mount>
ffffffffc0209012:	e501                	bnez	a0,ffffffffc020901a <sfs_init+0x18>
ffffffffc0209014:	60a2                	ld	ra,8(sp)
ffffffffc0209016:	0141                	addi	sp,sp,16
ffffffffc0209018:	8082                	ret
ffffffffc020901a:	86aa                	mv	a3,a0
ffffffffc020901c:	00006617          	auipc	a2,0x6
ffffffffc0209020:	c3460613          	addi	a2,a2,-972 # ffffffffc020ec50 <dev_node_ops+0x3a8>
ffffffffc0209024:	45c1                	li	a1,16
ffffffffc0209026:	00006517          	auipc	a0,0x6
ffffffffc020902a:	c4a50513          	addi	a0,a0,-950 # ffffffffc020ec70 <dev_node_ops+0x3c8>
ffffffffc020902e:	c70f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209032 <sfs_unmount>:
ffffffffc0209032:	1141                	addi	sp,sp,-16
ffffffffc0209034:	e406                	sd	ra,8(sp)
ffffffffc0209036:	e022                	sd	s0,0(sp)
ffffffffc0209038:	cd1d                	beqz	a0,ffffffffc0209076 <sfs_unmount+0x44>
ffffffffc020903a:	0b052783          	lw	a5,176(a0)
ffffffffc020903e:	842a                	mv	s0,a0
ffffffffc0209040:	eb9d                	bnez	a5,ffffffffc0209076 <sfs_unmount+0x44>
ffffffffc0209042:	7158                	ld	a4,160(a0)
ffffffffc0209044:	09850793          	addi	a5,a0,152
ffffffffc0209048:	02f71563          	bne	a4,a5,ffffffffc0209072 <sfs_unmount+0x40>
ffffffffc020904c:	613c                	ld	a5,64(a0)
ffffffffc020904e:	e7a1                	bnez	a5,ffffffffc0209096 <sfs_unmount+0x64>
ffffffffc0209050:	7d08                	ld	a0,56(a0)
ffffffffc0209052:	f89ff0ef          	jal	ra,ffffffffc0208fda <bitmap_destroy>
ffffffffc0209056:	6428                	ld	a0,72(s0)
ffffffffc0209058:	fe7f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020905c:	7448                	ld	a0,168(s0)
ffffffffc020905e:	fe1f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209062:	8522                	mv	a0,s0
ffffffffc0209064:	fdbf80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209068:	4501                	li	a0,0
ffffffffc020906a:	60a2                	ld	ra,8(sp)
ffffffffc020906c:	6402                	ld	s0,0(sp)
ffffffffc020906e:	0141                	addi	sp,sp,16
ffffffffc0209070:	8082                	ret
ffffffffc0209072:	5545                	li	a0,-15
ffffffffc0209074:	bfdd                	j	ffffffffc020906a <sfs_unmount+0x38>
ffffffffc0209076:	00006697          	auipc	a3,0x6
ffffffffc020907a:	c1268693          	addi	a3,a3,-1006 # ffffffffc020ec88 <dev_node_ops+0x3e0>
ffffffffc020907e:	00003617          	auipc	a2,0x3
ffffffffc0209082:	84a60613          	addi	a2,a2,-1974 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209086:	04100593          	li	a1,65
ffffffffc020908a:	00006517          	auipc	a0,0x6
ffffffffc020908e:	c2e50513          	addi	a0,a0,-978 # ffffffffc020ecb8 <dev_node_ops+0x410>
ffffffffc0209092:	c0cf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209096:	00006697          	auipc	a3,0x6
ffffffffc020909a:	c3a68693          	addi	a3,a3,-966 # ffffffffc020ecd0 <dev_node_ops+0x428>
ffffffffc020909e:	00003617          	auipc	a2,0x3
ffffffffc02090a2:	82a60613          	addi	a2,a2,-2006 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02090a6:	04500593          	li	a1,69
ffffffffc02090aa:	00006517          	auipc	a0,0x6
ffffffffc02090ae:	c0e50513          	addi	a0,a0,-1010 # ffffffffc020ecb8 <dev_node_ops+0x410>
ffffffffc02090b2:	becf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02090b6 <sfs_cleanup>:
ffffffffc02090b6:	1101                	addi	sp,sp,-32
ffffffffc02090b8:	ec06                	sd	ra,24(sp)
ffffffffc02090ba:	e822                	sd	s0,16(sp)
ffffffffc02090bc:	e426                	sd	s1,8(sp)
ffffffffc02090be:	e04a                	sd	s2,0(sp)
ffffffffc02090c0:	c525                	beqz	a0,ffffffffc0209128 <sfs_cleanup+0x72>
ffffffffc02090c2:	0b052783          	lw	a5,176(a0)
ffffffffc02090c6:	84aa                	mv	s1,a0
ffffffffc02090c8:	e3a5                	bnez	a5,ffffffffc0209128 <sfs_cleanup+0x72>
ffffffffc02090ca:	4158                	lw	a4,4(a0)
ffffffffc02090cc:	4514                	lw	a3,8(a0)
ffffffffc02090ce:	00c50913          	addi	s2,a0,12
ffffffffc02090d2:	85ca                	mv	a1,s2
ffffffffc02090d4:	40d7063b          	subw	a2,a4,a3
ffffffffc02090d8:	00006517          	auipc	a0,0x6
ffffffffc02090dc:	c1050513          	addi	a0,a0,-1008 # ffffffffc020ece8 <dev_node_ops+0x440>
ffffffffc02090e0:	8c6f70ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02090e4:	02000413          	li	s0,32
ffffffffc02090e8:	a019                	j	ffffffffc02090ee <sfs_cleanup+0x38>
ffffffffc02090ea:	347d                	addiw	s0,s0,-1
ffffffffc02090ec:	c819                	beqz	s0,ffffffffc0209102 <sfs_cleanup+0x4c>
ffffffffc02090ee:	7cdc                	ld	a5,184(s1)
ffffffffc02090f0:	8526                	mv	a0,s1
ffffffffc02090f2:	9782                	jalr	a5
ffffffffc02090f4:	f97d                	bnez	a0,ffffffffc02090ea <sfs_cleanup+0x34>
ffffffffc02090f6:	60e2                	ld	ra,24(sp)
ffffffffc02090f8:	6442                	ld	s0,16(sp)
ffffffffc02090fa:	64a2                	ld	s1,8(sp)
ffffffffc02090fc:	6902                	ld	s2,0(sp)
ffffffffc02090fe:	6105                	addi	sp,sp,32
ffffffffc0209100:	8082                	ret
ffffffffc0209102:	6442                	ld	s0,16(sp)
ffffffffc0209104:	60e2                	ld	ra,24(sp)
ffffffffc0209106:	64a2                	ld	s1,8(sp)
ffffffffc0209108:	86ca                	mv	a3,s2
ffffffffc020910a:	6902                	ld	s2,0(sp)
ffffffffc020910c:	872a                	mv	a4,a0
ffffffffc020910e:	00006617          	auipc	a2,0x6
ffffffffc0209112:	bfa60613          	addi	a2,a2,-1030 # ffffffffc020ed08 <dev_node_ops+0x460>
ffffffffc0209116:	05f00593          	li	a1,95
ffffffffc020911a:	00006517          	auipc	a0,0x6
ffffffffc020911e:	b9e50513          	addi	a0,a0,-1122 # ffffffffc020ecb8 <dev_node_ops+0x410>
ffffffffc0209122:	6105                	addi	sp,sp,32
ffffffffc0209124:	be2f706f          	j	ffffffffc0200506 <__warn>
ffffffffc0209128:	00006697          	auipc	a3,0x6
ffffffffc020912c:	b6068693          	addi	a3,a3,-1184 # ffffffffc020ec88 <dev_node_ops+0x3e0>
ffffffffc0209130:	00002617          	auipc	a2,0x2
ffffffffc0209134:	79860613          	addi	a2,a2,1944 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209138:	05400593          	li	a1,84
ffffffffc020913c:	00006517          	auipc	a0,0x6
ffffffffc0209140:	b7c50513          	addi	a0,a0,-1156 # ffffffffc020ecb8 <dev_node_ops+0x410>
ffffffffc0209144:	b5af70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209148 <sfs_sync>:
ffffffffc0209148:	7179                	addi	sp,sp,-48
ffffffffc020914a:	f406                	sd	ra,40(sp)
ffffffffc020914c:	f022                	sd	s0,32(sp)
ffffffffc020914e:	ec26                	sd	s1,24(sp)
ffffffffc0209150:	e84a                	sd	s2,16(sp)
ffffffffc0209152:	e44e                	sd	s3,8(sp)
ffffffffc0209154:	e052                	sd	s4,0(sp)
ffffffffc0209156:	cd4d                	beqz	a0,ffffffffc0209210 <sfs_sync+0xc8>
ffffffffc0209158:	0b052783          	lw	a5,176(a0)
ffffffffc020915c:	8a2a                	mv	s4,a0
ffffffffc020915e:	ebcd                	bnez	a5,ffffffffc0209210 <sfs_sync+0xc8>
ffffffffc0209160:	52d010ef          	jal	ra,ffffffffc020ae8c <lock_sfs_fs>
ffffffffc0209164:	0a0a3403          	ld	s0,160(s4)
ffffffffc0209168:	098a0913          	addi	s2,s4,152
ffffffffc020916c:	02890763          	beq	s2,s0,ffffffffc020919a <sfs_sync+0x52>
ffffffffc0209170:	00004997          	auipc	s3,0x4
ffffffffc0209174:	0d098993          	addi	s3,s3,208 # ffffffffc020d240 <default_pmm_manager+0xe90>
ffffffffc0209178:	7c1c                	ld	a5,56(s0)
ffffffffc020917a:	fc840493          	addi	s1,s0,-56
ffffffffc020917e:	cbb5                	beqz	a5,ffffffffc02091f2 <sfs_sync+0xaa>
ffffffffc0209180:	7b9c                	ld	a5,48(a5)
ffffffffc0209182:	cba5                	beqz	a5,ffffffffc02091f2 <sfs_sync+0xaa>
ffffffffc0209184:	85ce                	mv	a1,s3
ffffffffc0209186:	8526                	mv	a0,s1
ffffffffc0209188:	e28fe0ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc020918c:	7c1c                	ld	a5,56(s0)
ffffffffc020918e:	8526                	mv	a0,s1
ffffffffc0209190:	7b9c                	ld	a5,48(a5)
ffffffffc0209192:	9782                	jalr	a5
ffffffffc0209194:	6400                	ld	s0,8(s0)
ffffffffc0209196:	fe8911e3          	bne	s2,s0,ffffffffc0209178 <sfs_sync+0x30>
ffffffffc020919a:	8552                	mv	a0,s4
ffffffffc020919c:	501010ef          	jal	ra,ffffffffc020ae9c <unlock_sfs_fs>
ffffffffc02091a0:	040a3783          	ld	a5,64(s4)
ffffffffc02091a4:	4501                	li	a0,0
ffffffffc02091a6:	eb89                	bnez	a5,ffffffffc02091b8 <sfs_sync+0x70>
ffffffffc02091a8:	70a2                	ld	ra,40(sp)
ffffffffc02091aa:	7402                	ld	s0,32(sp)
ffffffffc02091ac:	64e2                	ld	s1,24(sp)
ffffffffc02091ae:	6942                	ld	s2,16(sp)
ffffffffc02091b0:	69a2                	ld	s3,8(sp)
ffffffffc02091b2:	6a02                	ld	s4,0(sp)
ffffffffc02091b4:	6145                	addi	sp,sp,48
ffffffffc02091b6:	8082                	ret
ffffffffc02091b8:	040a3023          	sd	zero,64(s4)
ffffffffc02091bc:	8552                	mv	a0,s4
ffffffffc02091be:	3b3010ef          	jal	ra,ffffffffc020ad70 <sfs_sync_super>
ffffffffc02091c2:	cd01                	beqz	a0,ffffffffc02091da <sfs_sync+0x92>
ffffffffc02091c4:	70a2                	ld	ra,40(sp)
ffffffffc02091c6:	7402                	ld	s0,32(sp)
ffffffffc02091c8:	4785                	li	a5,1
ffffffffc02091ca:	04fa3023          	sd	a5,64(s4)
ffffffffc02091ce:	64e2                	ld	s1,24(sp)
ffffffffc02091d0:	6942                	ld	s2,16(sp)
ffffffffc02091d2:	69a2                	ld	s3,8(sp)
ffffffffc02091d4:	6a02                	ld	s4,0(sp)
ffffffffc02091d6:	6145                	addi	sp,sp,48
ffffffffc02091d8:	8082                	ret
ffffffffc02091da:	8552                	mv	a0,s4
ffffffffc02091dc:	3db010ef          	jal	ra,ffffffffc020adb6 <sfs_sync_freemap>
ffffffffc02091e0:	f175                	bnez	a0,ffffffffc02091c4 <sfs_sync+0x7c>
ffffffffc02091e2:	70a2                	ld	ra,40(sp)
ffffffffc02091e4:	7402                	ld	s0,32(sp)
ffffffffc02091e6:	64e2                	ld	s1,24(sp)
ffffffffc02091e8:	6942                	ld	s2,16(sp)
ffffffffc02091ea:	69a2                	ld	s3,8(sp)
ffffffffc02091ec:	6a02                	ld	s4,0(sp)
ffffffffc02091ee:	6145                	addi	sp,sp,48
ffffffffc02091f0:	8082                	ret
ffffffffc02091f2:	00004697          	auipc	a3,0x4
ffffffffc02091f6:	ffe68693          	addi	a3,a3,-2 # ffffffffc020d1f0 <default_pmm_manager+0xe40>
ffffffffc02091fa:	00002617          	auipc	a2,0x2
ffffffffc02091fe:	6ce60613          	addi	a2,a2,1742 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209202:	45ed                	li	a1,27
ffffffffc0209204:	00006517          	auipc	a0,0x6
ffffffffc0209208:	ab450513          	addi	a0,a0,-1356 # ffffffffc020ecb8 <dev_node_ops+0x410>
ffffffffc020920c:	a92f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209210:	00006697          	auipc	a3,0x6
ffffffffc0209214:	a7868693          	addi	a3,a3,-1416 # ffffffffc020ec88 <dev_node_ops+0x3e0>
ffffffffc0209218:	00002617          	auipc	a2,0x2
ffffffffc020921c:	6b060613          	addi	a2,a2,1712 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209220:	45d5                	li	a1,21
ffffffffc0209222:	00006517          	auipc	a0,0x6
ffffffffc0209226:	a9650513          	addi	a0,a0,-1386 # ffffffffc020ecb8 <dev_node_ops+0x410>
ffffffffc020922a:	a74f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020922e <sfs_get_root>:
ffffffffc020922e:	1101                	addi	sp,sp,-32
ffffffffc0209230:	ec06                	sd	ra,24(sp)
ffffffffc0209232:	cd09                	beqz	a0,ffffffffc020924c <sfs_get_root+0x1e>
ffffffffc0209234:	0b052783          	lw	a5,176(a0)
ffffffffc0209238:	eb91                	bnez	a5,ffffffffc020924c <sfs_get_root+0x1e>
ffffffffc020923a:	4605                	li	a2,1
ffffffffc020923c:	002c                	addi	a1,sp,8
ffffffffc020923e:	364010ef          	jal	ra,ffffffffc020a5a2 <sfs_load_inode>
ffffffffc0209242:	e50d                	bnez	a0,ffffffffc020926c <sfs_get_root+0x3e>
ffffffffc0209244:	60e2                	ld	ra,24(sp)
ffffffffc0209246:	6522                	ld	a0,8(sp)
ffffffffc0209248:	6105                	addi	sp,sp,32
ffffffffc020924a:	8082                	ret
ffffffffc020924c:	00006697          	auipc	a3,0x6
ffffffffc0209250:	a3c68693          	addi	a3,a3,-1476 # ffffffffc020ec88 <dev_node_ops+0x3e0>
ffffffffc0209254:	00002617          	auipc	a2,0x2
ffffffffc0209258:	67460613          	addi	a2,a2,1652 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020925c:	03600593          	li	a1,54
ffffffffc0209260:	00006517          	auipc	a0,0x6
ffffffffc0209264:	a5850513          	addi	a0,a0,-1448 # ffffffffc020ecb8 <dev_node_ops+0x410>
ffffffffc0209268:	a36f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020926c:	86aa                	mv	a3,a0
ffffffffc020926e:	00006617          	auipc	a2,0x6
ffffffffc0209272:	aba60613          	addi	a2,a2,-1350 # ffffffffc020ed28 <dev_node_ops+0x480>
ffffffffc0209276:	03700593          	li	a1,55
ffffffffc020927a:	00006517          	auipc	a0,0x6
ffffffffc020927e:	a3e50513          	addi	a0,a0,-1474 # ffffffffc020ecb8 <dev_node_ops+0x410>
ffffffffc0209282:	a1cf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209286 <sfs_do_mount>:
ffffffffc0209286:	6518                	ld	a4,8(a0)
ffffffffc0209288:	7171                	addi	sp,sp,-176
ffffffffc020928a:	f506                	sd	ra,168(sp)
ffffffffc020928c:	f122                	sd	s0,160(sp)
ffffffffc020928e:	ed26                	sd	s1,152(sp)
ffffffffc0209290:	e94a                	sd	s2,144(sp)
ffffffffc0209292:	e54e                	sd	s3,136(sp)
ffffffffc0209294:	e152                	sd	s4,128(sp)
ffffffffc0209296:	fcd6                	sd	s5,120(sp)
ffffffffc0209298:	f8da                	sd	s6,112(sp)
ffffffffc020929a:	f4de                	sd	s7,104(sp)
ffffffffc020929c:	f0e2                	sd	s8,96(sp)
ffffffffc020929e:	ece6                	sd	s9,88(sp)
ffffffffc02092a0:	e8ea                	sd	s10,80(sp)
ffffffffc02092a2:	e4ee                	sd	s11,72(sp)
ffffffffc02092a4:	6785                	lui	a5,0x1
ffffffffc02092a6:	24f71663          	bne	a4,a5,ffffffffc02094f2 <sfs_do_mount+0x26c>
ffffffffc02092aa:	892a                	mv	s2,a0
ffffffffc02092ac:	4501                	li	a0,0
ffffffffc02092ae:	8aae                	mv	s5,a1
ffffffffc02092b0:	f00fe0ef          	jal	ra,ffffffffc02079b0 <__alloc_fs>
ffffffffc02092b4:	842a                	mv	s0,a0
ffffffffc02092b6:	24050463          	beqz	a0,ffffffffc02094fe <sfs_do_mount+0x278>
ffffffffc02092ba:	0b052b03          	lw	s6,176(a0)
ffffffffc02092be:	260b1263          	bnez	s6,ffffffffc0209522 <sfs_do_mount+0x29c>
ffffffffc02092c2:	03253823          	sd	s2,48(a0)
ffffffffc02092c6:	6505                	lui	a0,0x1
ffffffffc02092c8:	cc7f80ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02092cc:	e428                	sd	a0,72(s0)
ffffffffc02092ce:	84aa                	mv	s1,a0
ffffffffc02092d0:	16050363          	beqz	a0,ffffffffc0209436 <sfs_do_mount+0x1b0>
ffffffffc02092d4:	85aa                	mv	a1,a0
ffffffffc02092d6:	4681                	li	a3,0
ffffffffc02092d8:	6605                	lui	a2,0x1
ffffffffc02092da:	1008                	addi	a0,sp,32
ffffffffc02092dc:	864fc0ef          	jal	ra,ffffffffc0205340 <iobuf_init>
ffffffffc02092e0:	02093783          	ld	a5,32(s2)
ffffffffc02092e4:	85aa                	mv	a1,a0
ffffffffc02092e6:	4601                	li	a2,0
ffffffffc02092e8:	854a                	mv	a0,s2
ffffffffc02092ea:	9782                	jalr	a5
ffffffffc02092ec:	8a2a                	mv	s4,a0
ffffffffc02092ee:	10051e63          	bnez	a0,ffffffffc020940a <sfs_do_mount+0x184>
ffffffffc02092f2:	408c                	lw	a1,0(s1)
ffffffffc02092f4:	2f8dc637          	lui	a2,0x2f8dc
ffffffffc02092f8:	e2a60613          	addi	a2,a2,-470 # 2f8dbe2a <_binary_bin_sfs_img_size+0x2f866b2a>
ffffffffc02092fc:	14c59863          	bne	a1,a2,ffffffffc020944c <sfs_do_mount+0x1c6>
ffffffffc0209300:	40dc                	lw	a5,4(s1)
ffffffffc0209302:	00093603          	ld	a2,0(s2)
ffffffffc0209306:	02079713          	slli	a4,a5,0x20
ffffffffc020930a:	9301                	srli	a4,a4,0x20
ffffffffc020930c:	12e66763          	bltu	a2,a4,ffffffffc020943a <sfs_do_mount+0x1b4>
ffffffffc0209310:	020485a3          	sb	zero,43(s1)
ffffffffc0209314:	0084af03          	lw	t5,8(s1)
ffffffffc0209318:	00c4ae83          	lw	t4,12(s1)
ffffffffc020931c:	0104ae03          	lw	t3,16(s1)
ffffffffc0209320:	0144a303          	lw	t1,20(s1)
ffffffffc0209324:	0184a883          	lw	a7,24(s1)
ffffffffc0209328:	01c4a803          	lw	a6,28(s1)
ffffffffc020932c:	5090                	lw	a2,32(s1)
ffffffffc020932e:	50d4                	lw	a3,36(s1)
ffffffffc0209330:	5498                	lw	a4,40(s1)
ffffffffc0209332:	6511                	lui	a0,0x4
ffffffffc0209334:	c00c                	sw	a1,0(s0)
ffffffffc0209336:	c05c                	sw	a5,4(s0)
ffffffffc0209338:	01e42423          	sw	t5,8(s0)
ffffffffc020933c:	01d42623          	sw	t4,12(s0)
ffffffffc0209340:	01c42823          	sw	t3,16(s0)
ffffffffc0209344:	00642a23          	sw	t1,20(s0)
ffffffffc0209348:	01142c23          	sw	a7,24(s0)
ffffffffc020934c:	01042e23          	sw	a6,28(s0)
ffffffffc0209350:	d010                	sw	a2,32(s0)
ffffffffc0209352:	d054                	sw	a3,36(s0)
ffffffffc0209354:	d418                	sw	a4,40(s0)
ffffffffc0209356:	c39f80ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020935a:	f448                	sd	a0,168(s0)
ffffffffc020935c:	8c2a                	mv	s8,a0
ffffffffc020935e:	18050c63          	beqz	a0,ffffffffc02094f6 <sfs_do_mount+0x270>
ffffffffc0209362:	6711                	lui	a4,0x4
ffffffffc0209364:	87aa                	mv	a5,a0
ffffffffc0209366:	972a                	add	a4,a4,a0
ffffffffc0209368:	e79c                	sd	a5,8(a5)
ffffffffc020936a:	e39c                	sd	a5,0(a5)
ffffffffc020936c:	07c1                	addi	a5,a5,16
ffffffffc020936e:	fee79de3          	bne	a5,a4,ffffffffc0209368 <sfs_do_mount+0xe2>
ffffffffc0209372:	0044eb83          	lwu	s7,4(s1)
ffffffffc0209376:	67a1                	lui	a5,0x8
ffffffffc0209378:	fff78993          	addi	s3,a5,-1 # 7fff <_binary_bin_swap_img_size+0x2ff>
ffffffffc020937c:	9bce                	add	s7,s7,s3
ffffffffc020937e:	77e1                	lui	a5,0xffff8
ffffffffc0209380:	00fbfbb3          	and	s7,s7,a5
ffffffffc0209384:	2b81                	sext.w	s7,s7
ffffffffc0209386:	855e                	mv	a0,s7
ffffffffc0209388:	a59ff0ef          	jal	ra,ffffffffc0208de0 <bitmap_create>
ffffffffc020938c:	fc08                	sd	a0,56(s0)
ffffffffc020938e:	8d2a                	mv	s10,a0
ffffffffc0209390:	14050f63          	beqz	a0,ffffffffc02094ee <sfs_do_mount+0x268>
ffffffffc0209394:	0044e783          	lwu	a5,4(s1)
ffffffffc0209398:	082c                	addi	a1,sp,24
ffffffffc020939a:	97ce                	add	a5,a5,s3
ffffffffc020939c:	00f7d713          	srli	a4,a5,0xf
ffffffffc02093a0:	e43a                	sd	a4,8(sp)
ffffffffc02093a2:	40f7d993          	srai	s3,a5,0xf
ffffffffc02093a6:	c4fff0ef          	jal	ra,ffffffffc0208ff4 <bitmap_getdata>
ffffffffc02093aa:	14050c63          	beqz	a0,ffffffffc0209502 <sfs_do_mount+0x27c>
ffffffffc02093ae:	00c9979b          	slliw	a5,s3,0xc
ffffffffc02093b2:	66e2                	ld	a3,24(sp)
ffffffffc02093b4:	1782                	slli	a5,a5,0x20
ffffffffc02093b6:	9381                	srli	a5,a5,0x20
ffffffffc02093b8:	14d79563          	bne	a5,a3,ffffffffc0209502 <sfs_do_mount+0x27c>
ffffffffc02093bc:	6722                	ld	a4,8(sp)
ffffffffc02093be:	6d89                	lui	s11,0x2
ffffffffc02093c0:	89aa                	mv	s3,a0
ffffffffc02093c2:	00c71c93          	slli	s9,a4,0xc
ffffffffc02093c6:	9caa                	add	s9,s9,a0
ffffffffc02093c8:	40ad8dbb          	subw	s11,s11,a0
ffffffffc02093cc:	e711                	bnez	a4,ffffffffc02093d8 <sfs_do_mount+0x152>
ffffffffc02093ce:	a079                	j	ffffffffc020945c <sfs_do_mount+0x1d6>
ffffffffc02093d0:	6785                	lui	a5,0x1
ffffffffc02093d2:	99be                	add	s3,s3,a5
ffffffffc02093d4:	093c8463          	beq	s9,s3,ffffffffc020945c <sfs_do_mount+0x1d6>
ffffffffc02093d8:	013d86bb          	addw	a3,s11,s3
ffffffffc02093dc:	1682                	slli	a3,a3,0x20
ffffffffc02093de:	6605                	lui	a2,0x1
ffffffffc02093e0:	85ce                	mv	a1,s3
ffffffffc02093e2:	9281                	srli	a3,a3,0x20
ffffffffc02093e4:	1008                	addi	a0,sp,32
ffffffffc02093e6:	f5bfb0ef          	jal	ra,ffffffffc0205340 <iobuf_init>
ffffffffc02093ea:	02093783          	ld	a5,32(s2)
ffffffffc02093ee:	85aa                	mv	a1,a0
ffffffffc02093f0:	4601                	li	a2,0
ffffffffc02093f2:	854a                	mv	a0,s2
ffffffffc02093f4:	9782                	jalr	a5
ffffffffc02093f6:	dd69                	beqz	a0,ffffffffc02093d0 <sfs_do_mount+0x14a>
ffffffffc02093f8:	e42a                	sd	a0,8(sp)
ffffffffc02093fa:	856a                	mv	a0,s10
ffffffffc02093fc:	bdfff0ef          	jal	ra,ffffffffc0208fda <bitmap_destroy>
ffffffffc0209400:	67a2                	ld	a5,8(sp)
ffffffffc0209402:	8a3e                	mv	s4,a5
ffffffffc0209404:	8562                	mv	a0,s8
ffffffffc0209406:	c39f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020940a:	8526                	mv	a0,s1
ffffffffc020940c:	c33f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209410:	8522                	mv	a0,s0
ffffffffc0209412:	c2df80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209416:	70aa                	ld	ra,168(sp)
ffffffffc0209418:	740a                	ld	s0,160(sp)
ffffffffc020941a:	64ea                	ld	s1,152(sp)
ffffffffc020941c:	694a                	ld	s2,144(sp)
ffffffffc020941e:	69aa                	ld	s3,136(sp)
ffffffffc0209420:	7ae6                	ld	s5,120(sp)
ffffffffc0209422:	7b46                	ld	s6,112(sp)
ffffffffc0209424:	7ba6                	ld	s7,104(sp)
ffffffffc0209426:	7c06                	ld	s8,96(sp)
ffffffffc0209428:	6ce6                	ld	s9,88(sp)
ffffffffc020942a:	6d46                	ld	s10,80(sp)
ffffffffc020942c:	6da6                	ld	s11,72(sp)
ffffffffc020942e:	8552                	mv	a0,s4
ffffffffc0209430:	6a0a                	ld	s4,128(sp)
ffffffffc0209432:	614d                	addi	sp,sp,176
ffffffffc0209434:	8082                	ret
ffffffffc0209436:	5a71                	li	s4,-4
ffffffffc0209438:	bfe1                	j	ffffffffc0209410 <sfs_do_mount+0x18a>
ffffffffc020943a:	85be                	mv	a1,a5
ffffffffc020943c:	00006517          	auipc	a0,0x6
ffffffffc0209440:	94450513          	addi	a0,a0,-1724 # ffffffffc020ed80 <dev_node_ops+0x4d8>
ffffffffc0209444:	d63f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0209448:	5a75                	li	s4,-3
ffffffffc020944a:	b7c1                	j	ffffffffc020940a <sfs_do_mount+0x184>
ffffffffc020944c:	00006517          	auipc	a0,0x6
ffffffffc0209450:	8fc50513          	addi	a0,a0,-1796 # ffffffffc020ed48 <dev_node_ops+0x4a0>
ffffffffc0209454:	d53f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0209458:	5a75                	li	s4,-3
ffffffffc020945a:	bf45                	j	ffffffffc020940a <sfs_do_mount+0x184>
ffffffffc020945c:	00442903          	lw	s2,4(s0)
ffffffffc0209460:	4481                	li	s1,0
ffffffffc0209462:	080b8c63          	beqz	s7,ffffffffc02094fa <sfs_do_mount+0x274>
ffffffffc0209466:	85a6                	mv	a1,s1
ffffffffc0209468:	856a                	mv	a0,s10
ffffffffc020946a:	af7ff0ef          	jal	ra,ffffffffc0208f60 <bitmap_test>
ffffffffc020946e:	c111                	beqz	a0,ffffffffc0209472 <sfs_do_mount+0x1ec>
ffffffffc0209470:	2b05                	addiw	s6,s6,1
ffffffffc0209472:	2485                	addiw	s1,s1,1
ffffffffc0209474:	fe9b99e3          	bne	s7,s1,ffffffffc0209466 <sfs_do_mount+0x1e0>
ffffffffc0209478:	441c                	lw	a5,8(s0)
ffffffffc020947a:	0d679463          	bne	a5,s6,ffffffffc0209542 <sfs_do_mount+0x2bc>
ffffffffc020947e:	4585                	li	a1,1
ffffffffc0209480:	05040513          	addi	a0,s0,80
ffffffffc0209484:	04043023          	sd	zero,64(s0)
ffffffffc0209488:	830fb0ef          	jal	ra,ffffffffc02044b8 <sem_init>
ffffffffc020948c:	4585                	li	a1,1
ffffffffc020948e:	06840513          	addi	a0,s0,104
ffffffffc0209492:	826fb0ef          	jal	ra,ffffffffc02044b8 <sem_init>
ffffffffc0209496:	4585                	li	a1,1
ffffffffc0209498:	08040513          	addi	a0,s0,128
ffffffffc020949c:	81cfb0ef          	jal	ra,ffffffffc02044b8 <sem_init>
ffffffffc02094a0:	09840793          	addi	a5,s0,152
ffffffffc02094a4:	f05c                	sd	a5,160(s0)
ffffffffc02094a6:	ec5c                	sd	a5,152(s0)
ffffffffc02094a8:	874a                	mv	a4,s2
ffffffffc02094aa:	86da                	mv	a3,s6
ffffffffc02094ac:	4169063b          	subw	a2,s2,s6
ffffffffc02094b0:	00c40593          	addi	a1,s0,12
ffffffffc02094b4:	00006517          	auipc	a0,0x6
ffffffffc02094b8:	95c50513          	addi	a0,a0,-1700 # ffffffffc020ee10 <dev_node_ops+0x568>
ffffffffc02094bc:	cebf60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02094c0:	00000797          	auipc	a5,0x0
ffffffffc02094c4:	c8878793          	addi	a5,a5,-888 # ffffffffc0209148 <sfs_sync>
ffffffffc02094c8:	fc5c                	sd	a5,184(s0)
ffffffffc02094ca:	00000797          	auipc	a5,0x0
ffffffffc02094ce:	d6478793          	addi	a5,a5,-668 # ffffffffc020922e <sfs_get_root>
ffffffffc02094d2:	e07c                	sd	a5,192(s0)
ffffffffc02094d4:	00000797          	auipc	a5,0x0
ffffffffc02094d8:	b5e78793          	addi	a5,a5,-1186 # ffffffffc0209032 <sfs_unmount>
ffffffffc02094dc:	e47c                	sd	a5,200(s0)
ffffffffc02094de:	00000797          	auipc	a5,0x0
ffffffffc02094e2:	bd878793          	addi	a5,a5,-1064 # ffffffffc02090b6 <sfs_cleanup>
ffffffffc02094e6:	e87c                	sd	a5,208(s0)
ffffffffc02094e8:	008ab023          	sd	s0,0(s5)
ffffffffc02094ec:	b72d                	j	ffffffffc0209416 <sfs_do_mount+0x190>
ffffffffc02094ee:	5a71                	li	s4,-4
ffffffffc02094f0:	bf11                	j	ffffffffc0209404 <sfs_do_mount+0x17e>
ffffffffc02094f2:	5a49                	li	s4,-14
ffffffffc02094f4:	b70d                	j	ffffffffc0209416 <sfs_do_mount+0x190>
ffffffffc02094f6:	5a71                	li	s4,-4
ffffffffc02094f8:	bf09                	j	ffffffffc020940a <sfs_do_mount+0x184>
ffffffffc02094fa:	4b01                	li	s6,0
ffffffffc02094fc:	bfb5                	j	ffffffffc0209478 <sfs_do_mount+0x1f2>
ffffffffc02094fe:	5a71                	li	s4,-4
ffffffffc0209500:	bf19                	j	ffffffffc0209416 <sfs_do_mount+0x190>
ffffffffc0209502:	00006697          	auipc	a3,0x6
ffffffffc0209506:	8ae68693          	addi	a3,a3,-1874 # ffffffffc020edb0 <dev_node_ops+0x508>
ffffffffc020950a:	00002617          	auipc	a2,0x2
ffffffffc020950e:	3be60613          	addi	a2,a2,958 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209512:	08300593          	li	a1,131
ffffffffc0209516:	00005517          	auipc	a0,0x5
ffffffffc020951a:	7a250513          	addi	a0,a0,1954 # ffffffffc020ecb8 <dev_node_ops+0x410>
ffffffffc020951e:	f81f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209522:	00005697          	auipc	a3,0x5
ffffffffc0209526:	76668693          	addi	a3,a3,1894 # ffffffffc020ec88 <dev_node_ops+0x3e0>
ffffffffc020952a:	00002617          	auipc	a2,0x2
ffffffffc020952e:	39e60613          	addi	a2,a2,926 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209532:	0a300593          	li	a1,163
ffffffffc0209536:	00005517          	auipc	a0,0x5
ffffffffc020953a:	78250513          	addi	a0,a0,1922 # ffffffffc020ecb8 <dev_node_ops+0x410>
ffffffffc020953e:	f61f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209542:	00006697          	auipc	a3,0x6
ffffffffc0209546:	89e68693          	addi	a3,a3,-1890 # ffffffffc020ede0 <dev_node_ops+0x538>
ffffffffc020954a:	00002617          	auipc	a2,0x2
ffffffffc020954e:	37e60613          	addi	a2,a2,894 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209552:	0e000593          	li	a1,224
ffffffffc0209556:	00005517          	auipc	a0,0x5
ffffffffc020955a:	76250513          	addi	a0,a0,1890 # ffffffffc020ecb8 <dev_node_ops+0x410>
ffffffffc020955e:	f41f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209562 <sfs_mount>:
ffffffffc0209562:	00000597          	auipc	a1,0x0
ffffffffc0209566:	d2458593          	addi	a1,a1,-732 # ffffffffc0209286 <sfs_do_mount>
ffffffffc020956a:	817fe06f          	j	ffffffffc0207d80 <vfs_mount>

ffffffffc020956e <sfs_opendir>:
ffffffffc020956e:	0235f593          	andi	a1,a1,35
ffffffffc0209572:	4501                	li	a0,0
ffffffffc0209574:	e191                	bnez	a1,ffffffffc0209578 <sfs_opendir+0xa>
ffffffffc0209576:	8082                	ret
ffffffffc0209578:	553d                	li	a0,-17
ffffffffc020957a:	8082                	ret

ffffffffc020957c <sfs_openfile>:
ffffffffc020957c:	4501                	li	a0,0
ffffffffc020957e:	8082                	ret

ffffffffc0209580 <sfs_gettype>:
ffffffffc0209580:	1141                	addi	sp,sp,-16
ffffffffc0209582:	e406                	sd	ra,8(sp)
ffffffffc0209584:	c939                	beqz	a0,ffffffffc02095da <sfs_gettype+0x5a>
ffffffffc0209586:	4d34                	lw	a3,88(a0)
ffffffffc0209588:	6785                	lui	a5,0x1
ffffffffc020958a:	23578713          	addi	a4,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020958e:	04e69663          	bne	a3,a4,ffffffffc02095da <sfs_gettype+0x5a>
ffffffffc0209592:	6114                	ld	a3,0(a0)
ffffffffc0209594:	4709                	li	a4,2
ffffffffc0209596:	0046d683          	lhu	a3,4(a3)
ffffffffc020959a:	02e68a63          	beq	a3,a4,ffffffffc02095ce <sfs_gettype+0x4e>
ffffffffc020959e:	470d                	li	a4,3
ffffffffc02095a0:	02e68163          	beq	a3,a4,ffffffffc02095c2 <sfs_gettype+0x42>
ffffffffc02095a4:	4705                	li	a4,1
ffffffffc02095a6:	00e68f63          	beq	a3,a4,ffffffffc02095c4 <sfs_gettype+0x44>
ffffffffc02095aa:	00006617          	auipc	a2,0x6
ffffffffc02095ae:	8d660613          	addi	a2,a2,-1834 # ffffffffc020ee80 <dev_node_ops+0x5d8>
ffffffffc02095b2:	39800593          	li	a1,920
ffffffffc02095b6:	00006517          	auipc	a0,0x6
ffffffffc02095ba:	8b250513          	addi	a0,a0,-1870 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc02095be:	ee1f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02095c2:	678d                	lui	a5,0x3
ffffffffc02095c4:	60a2                	ld	ra,8(sp)
ffffffffc02095c6:	c19c                	sw	a5,0(a1)
ffffffffc02095c8:	4501                	li	a0,0
ffffffffc02095ca:	0141                	addi	sp,sp,16
ffffffffc02095cc:	8082                	ret
ffffffffc02095ce:	60a2                	ld	ra,8(sp)
ffffffffc02095d0:	6789                	lui	a5,0x2
ffffffffc02095d2:	c19c                	sw	a5,0(a1)
ffffffffc02095d4:	4501                	li	a0,0
ffffffffc02095d6:	0141                	addi	sp,sp,16
ffffffffc02095d8:	8082                	ret
ffffffffc02095da:	00006697          	auipc	a3,0x6
ffffffffc02095de:	85668693          	addi	a3,a3,-1962 # ffffffffc020ee30 <dev_node_ops+0x588>
ffffffffc02095e2:	00002617          	auipc	a2,0x2
ffffffffc02095e6:	2e660613          	addi	a2,a2,742 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02095ea:	38c00593          	li	a1,908
ffffffffc02095ee:	00006517          	auipc	a0,0x6
ffffffffc02095f2:	87a50513          	addi	a0,a0,-1926 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc02095f6:	ea9f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02095fa <sfs_fsync>:
ffffffffc02095fa:	7179                	addi	sp,sp,-48
ffffffffc02095fc:	ec26                	sd	s1,24(sp)
ffffffffc02095fe:	7524                	ld	s1,104(a0)
ffffffffc0209600:	f406                	sd	ra,40(sp)
ffffffffc0209602:	f022                	sd	s0,32(sp)
ffffffffc0209604:	e84a                	sd	s2,16(sp)
ffffffffc0209606:	e44e                	sd	s3,8(sp)
ffffffffc0209608:	c4bd                	beqz	s1,ffffffffc0209676 <sfs_fsync+0x7c>
ffffffffc020960a:	0b04a783          	lw	a5,176(s1)
ffffffffc020960e:	e7a5                	bnez	a5,ffffffffc0209676 <sfs_fsync+0x7c>
ffffffffc0209610:	4d38                	lw	a4,88(a0)
ffffffffc0209612:	6785                	lui	a5,0x1
ffffffffc0209614:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209618:	842a                	mv	s0,a0
ffffffffc020961a:	06f71e63          	bne	a4,a5,ffffffffc0209696 <sfs_fsync+0x9c>
ffffffffc020961e:	691c                	ld	a5,16(a0)
ffffffffc0209620:	4901                	li	s2,0
ffffffffc0209622:	eb89                	bnez	a5,ffffffffc0209634 <sfs_fsync+0x3a>
ffffffffc0209624:	70a2                	ld	ra,40(sp)
ffffffffc0209626:	7402                	ld	s0,32(sp)
ffffffffc0209628:	64e2                	ld	s1,24(sp)
ffffffffc020962a:	69a2                	ld	s3,8(sp)
ffffffffc020962c:	854a                	mv	a0,s2
ffffffffc020962e:	6942                	ld	s2,16(sp)
ffffffffc0209630:	6145                	addi	sp,sp,48
ffffffffc0209632:	8082                	ret
ffffffffc0209634:	02050993          	addi	s3,a0,32
ffffffffc0209638:	854e                	mv	a0,s3
ffffffffc020963a:	e89fa0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc020963e:	681c                	ld	a5,16(s0)
ffffffffc0209640:	ef81                	bnez	a5,ffffffffc0209658 <sfs_fsync+0x5e>
ffffffffc0209642:	854e                	mv	a0,s3
ffffffffc0209644:	e7bfa0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0209648:	70a2                	ld	ra,40(sp)
ffffffffc020964a:	7402                	ld	s0,32(sp)
ffffffffc020964c:	64e2                	ld	s1,24(sp)
ffffffffc020964e:	69a2                	ld	s3,8(sp)
ffffffffc0209650:	854a                	mv	a0,s2
ffffffffc0209652:	6942                	ld	s2,16(sp)
ffffffffc0209654:	6145                	addi	sp,sp,48
ffffffffc0209656:	8082                	ret
ffffffffc0209658:	4414                	lw	a3,8(s0)
ffffffffc020965a:	600c                	ld	a1,0(s0)
ffffffffc020965c:	00043823          	sd	zero,16(s0)
ffffffffc0209660:	4701                	li	a4,0
ffffffffc0209662:	04000613          	li	a2,64
ffffffffc0209666:	8526                	mv	a0,s1
ffffffffc0209668:	674010ef          	jal	ra,ffffffffc020acdc <sfs_wbuf>
ffffffffc020966c:	892a                	mv	s2,a0
ffffffffc020966e:	d971                	beqz	a0,ffffffffc0209642 <sfs_fsync+0x48>
ffffffffc0209670:	4785                	li	a5,1
ffffffffc0209672:	e81c                	sd	a5,16(s0)
ffffffffc0209674:	b7f9                	j	ffffffffc0209642 <sfs_fsync+0x48>
ffffffffc0209676:	00005697          	auipc	a3,0x5
ffffffffc020967a:	61268693          	addi	a3,a3,1554 # ffffffffc020ec88 <dev_node_ops+0x3e0>
ffffffffc020967e:	00002617          	auipc	a2,0x2
ffffffffc0209682:	24a60613          	addi	a2,a2,586 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209686:	2d000593          	li	a1,720
ffffffffc020968a:	00005517          	auipc	a0,0x5
ffffffffc020968e:	7de50513          	addi	a0,a0,2014 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209692:	e0df60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209696:	00005697          	auipc	a3,0x5
ffffffffc020969a:	79a68693          	addi	a3,a3,1946 # ffffffffc020ee30 <dev_node_ops+0x588>
ffffffffc020969e:	00002617          	auipc	a2,0x2
ffffffffc02096a2:	22a60613          	addi	a2,a2,554 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02096a6:	2d100593          	li	a1,721
ffffffffc02096aa:	00005517          	auipc	a0,0x5
ffffffffc02096ae:	7be50513          	addi	a0,a0,1982 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc02096b2:	dedf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02096b6 <sfs_fstat>:
ffffffffc02096b6:	1101                	addi	sp,sp,-32
ffffffffc02096b8:	e426                	sd	s1,8(sp)
ffffffffc02096ba:	84ae                	mv	s1,a1
ffffffffc02096bc:	e822                	sd	s0,16(sp)
ffffffffc02096be:	02000613          	li	a2,32
ffffffffc02096c2:	842a                	mv	s0,a0
ffffffffc02096c4:	4581                	li	a1,0
ffffffffc02096c6:	8526                	mv	a0,s1
ffffffffc02096c8:	ec06                	sd	ra,24(sp)
ffffffffc02096ca:	517010ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc02096ce:	c439                	beqz	s0,ffffffffc020971c <sfs_fstat+0x66>
ffffffffc02096d0:	783c                	ld	a5,112(s0)
ffffffffc02096d2:	c7a9                	beqz	a5,ffffffffc020971c <sfs_fstat+0x66>
ffffffffc02096d4:	6bbc                	ld	a5,80(a5)
ffffffffc02096d6:	c3b9                	beqz	a5,ffffffffc020971c <sfs_fstat+0x66>
ffffffffc02096d8:	00005597          	auipc	a1,0x5
ffffffffc02096dc:	14858593          	addi	a1,a1,328 # ffffffffc020e820 <syscalls+0xdb0>
ffffffffc02096e0:	8522                	mv	a0,s0
ffffffffc02096e2:	8cefe0ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc02096e6:	783c                	ld	a5,112(s0)
ffffffffc02096e8:	85a6                	mv	a1,s1
ffffffffc02096ea:	8522                	mv	a0,s0
ffffffffc02096ec:	6bbc                	ld	a5,80(a5)
ffffffffc02096ee:	9782                	jalr	a5
ffffffffc02096f0:	e10d                	bnez	a0,ffffffffc0209712 <sfs_fstat+0x5c>
ffffffffc02096f2:	4c38                	lw	a4,88(s0)
ffffffffc02096f4:	6785                	lui	a5,0x1
ffffffffc02096f6:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc02096fa:	04f71163          	bne	a4,a5,ffffffffc020973c <sfs_fstat+0x86>
ffffffffc02096fe:	601c                	ld	a5,0(s0)
ffffffffc0209700:	0067d683          	lhu	a3,6(a5)
ffffffffc0209704:	0087e703          	lwu	a4,8(a5)
ffffffffc0209708:	0007e783          	lwu	a5,0(a5)
ffffffffc020970c:	e494                	sd	a3,8(s1)
ffffffffc020970e:	e898                	sd	a4,16(s1)
ffffffffc0209710:	ec9c                	sd	a5,24(s1)
ffffffffc0209712:	60e2                	ld	ra,24(sp)
ffffffffc0209714:	6442                	ld	s0,16(sp)
ffffffffc0209716:	64a2                	ld	s1,8(sp)
ffffffffc0209718:	6105                	addi	sp,sp,32
ffffffffc020971a:	8082                	ret
ffffffffc020971c:	00005697          	auipc	a3,0x5
ffffffffc0209720:	09c68693          	addi	a3,a3,156 # ffffffffc020e7b8 <syscalls+0xd48>
ffffffffc0209724:	00002617          	auipc	a2,0x2
ffffffffc0209728:	1a460613          	addi	a2,a2,420 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020972c:	2c100593          	li	a1,705
ffffffffc0209730:	00005517          	auipc	a0,0x5
ffffffffc0209734:	73850513          	addi	a0,a0,1848 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209738:	d67f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020973c:	00005697          	auipc	a3,0x5
ffffffffc0209740:	6f468693          	addi	a3,a3,1780 # ffffffffc020ee30 <dev_node_ops+0x588>
ffffffffc0209744:	00002617          	auipc	a2,0x2
ffffffffc0209748:	18460613          	addi	a2,a2,388 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020974c:	2c400593          	li	a1,708
ffffffffc0209750:	00005517          	auipc	a0,0x5
ffffffffc0209754:	71850513          	addi	a0,a0,1816 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209758:	d47f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020975c <sfs_tryseek>:
ffffffffc020975c:	080007b7          	lui	a5,0x8000
ffffffffc0209760:	04f5fd63          	bgeu	a1,a5,ffffffffc02097ba <sfs_tryseek+0x5e>
ffffffffc0209764:	1101                	addi	sp,sp,-32
ffffffffc0209766:	e822                	sd	s0,16(sp)
ffffffffc0209768:	ec06                	sd	ra,24(sp)
ffffffffc020976a:	e426                	sd	s1,8(sp)
ffffffffc020976c:	842a                	mv	s0,a0
ffffffffc020976e:	c921                	beqz	a0,ffffffffc02097be <sfs_tryseek+0x62>
ffffffffc0209770:	4d38                	lw	a4,88(a0)
ffffffffc0209772:	6785                	lui	a5,0x1
ffffffffc0209774:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209778:	04f71363          	bne	a4,a5,ffffffffc02097be <sfs_tryseek+0x62>
ffffffffc020977c:	611c                	ld	a5,0(a0)
ffffffffc020977e:	84ae                	mv	s1,a1
ffffffffc0209780:	0007e783          	lwu	a5,0(a5)
ffffffffc0209784:	02b7d563          	bge	a5,a1,ffffffffc02097ae <sfs_tryseek+0x52>
ffffffffc0209788:	793c                	ld	a5,112(a0)
ffffffffc020978a:	cbb1                	beqz	a5,ffffffffc02097de <sfs_tryseek+0x82>
ffffffffc020978c:	73bc                	ld	a5,96(a5)
ffffffffc020978e:	cba1                	beqz	a5,ffffffffc02097de <sfs_tryseek+0x82>
ffffffffc0209790:	00005597          	auipc	a1,0x5
ffffffffc0209794:	f8058593          	addi	a1,a1,-128 # ffffffffc020e710 <syscalls+0xca0>
ffffffffc0209798:	818fe0ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc020979c:	783c                	ld	a5,112(s0)
ffffffffc020979e:	8522                	mv	a0,s0
ffffffffc02097a0:	6442                	ld	s0,16(sp)
ffffffffc02097a2:	60e2                	ld	ra,24(sp)
ffffffffc02097a4:	73bc                	ld	a5,96(a5)
ffffffffc02097a6:	85a6                	mv	a1,s1
ffffffffc02097a8:	64a2                	ld	s1,8(sp)
ffffffffc02097aa:	6105                	addi	sp,sp,32
ffffffffc02097ac:	8782                	jr	a5
ffffffffc02097ae:	60e2                	ld	ra,24(sp)
ffffffffc02097b0:	6442                	ld	s0,16(sp)
ffffffffc02097b2:	64a2                	ld	s1,8(sp)
ffffffffc02097b4:	4501                	li	a0,0
ffffffffc02097b6:	6105                	addi	sp,sp,32
ffffffffc02097b8:	8082                	ret
ffffffffc02097ba:	5575                	li	a0,-3
ffffffffc02097bc:	8082                	ret
ffffffffc02097be:	00005697          	auipc	a3,0x5
ffffffffc02097c2:	67268693          	addi	a3,a3,1650 # ffffffffc020ee30 <dev_node_ops+0x588>
ffffffffc02097c6:	00002617          	auipc	a2,0x2
ffffffffc02097ca:	10260613          	addi	a2,a2,258 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02097ce:	3a300593          	li	a1,931
ffffffffc02097d2:	00005517          	auipc	a0,0x5
ffffffffc02097d6:	69650513          	addi	a0,a0,1686 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc02097da:	cc5f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02097de:	00005697          	auipc	a3,0x5
ffffffffc02097e2:	eda68693          	addi	a3,a3,-294 # ffffffffc020e6b8 <syscalls+0xc48>
ffffffffc02097e6:	00002617          	auipc	a2,0x2
ffffffffc02097ea:	0e260613          	addi	a2,a2,226 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02097ee:	3a500593          	li	a1,933
ffffffffc02097f2:	00005517          	auipc	a0,0x5
ffffffffc02097f6:	67650513          	addi	a0,a0,1654 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc02097fa:	ca5f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02097fe <sfs_close>:
ffffffffc02097fe:	1141                	addi	sp,sp,-16
ffffffffc0209800:	e406                	sd	ra,8(sp)
ffffffffc0209802:	e022                	sd	s0,0(sp)
ffffffffc0209804:	c11d                	beqz	a0,ffffffffc020982a <sfs_close+0x2c>
ffffffffc0209806:	793c                	ld	a5,112(a0)
ffffffffc0209808:	842a                	mv	s0,a0
ffffffffc020980a:	c385                	beqz	a5,ffffffffc020982a <sfs_close+0x2c>
ffffffffc020980c:	7b9c                	ld	a5,48(a5)
ffffffffc020980e:	cf91                	beqz	a5,ffffffffc020982a <sfs_close+0x2c>
ffffffffc0209810:	00004597          	auipc	a1,0x4
ffffffffc0209814:	a3058593          	addi	a1,a1,-1488 # ffffffffc020d240 <default_pmm_manager+0xe90>
ffffffffc0209818:	f99fd0ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc020981c:	783c                	ld	a5,112(s0)
ffffffffc020981e:	8522                	mv	a0,s0
ffffffffc0209820:	6402                	ld	s0,0(sp)
ffffffffc0209822:	60a2                	ld	ra,8(sp)
ffffffffc0209824:	7b9c                	ld	a5,48(a5)
ffffffffc0209826:	0141                	addi	sp,sp,16
ffffffffc0209828:	8782                	jr	a5
ffffffffc020982a:	00004697          	auipc	a3,0x4
ffffffffc020982e:	9c668693          	addi	a3,a3,-1594 # ffffffffc020d1f0 <default_pmm_manager+0xe40>
ffffffffc0209832:	00002617          	auipc	a2,0x2
ffffffffc0209836:	09660613          	addi	a2,a2,150 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020983a:	21c00593          	li	a1,540
ffffffffc020983e:	00005517          	auipc	a0,0x5
ffffffffc0209842:	62a50513          	addi	a0,a0,1578 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209846:	c59f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020984a <sfs_io.part.0>:
ffffffffc020984a:	1141                	addi	sp,sp,-16
ffffffffc020984c:	00005697          	auipc	a3,0x5
ffffffffc0209850:	5e468693          	addi	a3,a3,1508 # ffffffffc020ee30 <dev_node_ops+0x588>
ffffffffc0209854:	00002617          	auipc	a2,0x2
ffffffffc0209858:	07460613          	addi	a2,a2,116 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020985c:	2a000593          	li	a1,672
ffffffffc0209860:	00005517          	auipc	a0,0x5
ffffffffc0209864:	60850513          	addi	a0,a0,1544 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209868:	e406                	sd	ra,8(sp)
ffffffffc020986a:	c35f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020986e <sfs_block_free>:
ffffffffc020986e:	1101                	addi	sp,sp,-32
ffffffffc0209870:	e426                	sd	s1,8(sp)
ffffffffc0209872:	ec06                	sd	ra,24(sp)
ffffffffc0209874:	e822                	sd	s0,16(sp)
ffffffffc0209876:	4154                	lw	a3,4(a0)
ffffffffc0209878:	84ae                	mv	s1,a1
ffffffffc020987a:	c595                	beqz	a1,ffffffffc02098a6 <sfs_block_free+0x38>
ffffffffc020987c:	02d5f563          	bgeu	a1,a3,ffffffffc02098a6 <sfs_block_free+0x38>
ffffffffc0209880:	842a                	mv	s0,a0
ffffffffc0209882:	7d08                	ld	a0,56(a0)
ffffffffc0209884:	edcff0ef          	jal	ra,ffffffffc0208f60 <bitmap_test>
ffffffffc0209888:	ed05                	bnez	a0,ffffffffc02098c0 <sfs_block_free+0x52>
ffffffffc020988a:	7c08                	ld	a0,56(s0)
ffffffffc020988c:	85a6                	mv	a1,s1
ffffffffc020988e:	efaff0ef          	jal	ra,ffffffffc0208f88 <bitmap_free>
ffffffffc0209892:	441c                	lw	a5,8(s0)
ffffffffc0209894:	4705                	li	a4,1
ffffffffc0209896:	60e2                	ld	ra,24(sp)
ffffffffc0209898:	2785                	addiw	a5,a5,1
ffffffffc020989a:	e038                	sd	a4,64(s0)
ffffffffc020989c:	c41c                	sw	a5,8(s0)
ffffffffc020989e:	6442                	ld	s0,16(sp)
ffffffffc02098a0:	64a2                	ld	s1,8(sp)
ffffffffc02098a2:	6105                	addi	sp,sp,32
ffffffffc02098a4:	8082                	ret
ffffffffc02098a6:	8726                	mv	a4,s1
ffffffffc02098a8:	00005617          	auipc	a2,0x5
ffffffffc02098ac:	5f060613          	addi	a2,a2,1520 # ffffffffc020ee98 <dev_node_ops+0x5f0>
ffffffffc02098b0:	05300593          	li	a1,83
ffffffffc02098b4:	00005517          	auipc	a0,0x5
ffffffffc02098b8:	5b450513          	addi	a0,a0,1460 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc02098bc:	be3f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02098c0:	00005697          	auipc	a3,0x5
ffffffffc02098c4:	61068693          	addi	a3,a3,1552 # ffffffffc020eed0 <dev_node_ops+0x628>
ffffffffc02098c8:	00002617          	auipc	a2,0x2
ffffffffc02098cc:	00060613          	mv	a2,a2
ffffffffc02098d0:	06a00593          	li	a1,106
ffffffffc02098d4:	00005517          	auipc	a0,0x5
ffffffffc02098d8:	59450513          	addi	a0,a0,1428 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc02098dc:	bc3f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02098e0 <sfs_reclaim>:
ffffffffc02098e0:	1101                	addi	sp,sp,-32
ffffffffc02098e2:	e426                	sd	s1,8(sp)
ffffffffc02098e4:	7524                	ld	s1,104(a0)
ffffffffc02098e6:	ec06                	sd	ra,24(sp)
ffffffffc02098e8:	e822                	sd	s0,16(sp)
ffffffffc02098ea:	e04a                	sd	s2,0(sp)
ffffffffc02098ec:	0e048a63          	beqz	s1,ffffffffc02099e0 <sfs_reclaim+0x100>
ffffffffc02098f0:	0b04a783          	lw	a5,176(s1)
ffffffffc02098f4:	0e079663          	bnez	a5,ffffffffc02099e0 <sfs_reclaim+0x100>
ffffffffc02098f8:	4d38                	lw	a4,88(a0)
ffffffffc02098fa:	6785                	lui	a5,0x1
ffffffffc02098fc:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209900:	842a                	mv	s0,a0
ffffffffc0209902:	10f71f63          	bne	a4,a5,ffffffffc0209a20 <sfs_reclaim+0x140>
ffffffffc0209906:	8526                	mv	a0,s1
ffffffffc0209908:	584010ef          	jal	ra,ffffffffc020ae8c <lock_sfs_fs>
ffffffffc020990c:	4c1c                	lw	a5,24(s0)
ffffffffc020990e:	0ef05963          	blez	a5,ffffffffc0209a00 <sfs_reclaim+0x120>
ffffffffc0209912:	fff7871b          	addiw	a4,a5,-1
ffffffffc0209916:	cc18                	sw	a4,24(s0)
ffffffffc0209918:	eb59                	bnez	a4,ffffffffc02099ae <sfs_reclaim+0xce>
ffffffffc020991a:	05c42903          	lw	s2,92(s0)
ffffffffc020991e:	08091863          	bnez	s2,ffffffffc02099ae <sfs_reclaim+0xce>
ffffffffc0209922:	601c                	ld	a5,0(s0)
ffffffffc0209924:	0067d783          	lhu	a5,6(a5)
ffffffffc0209928:	e785                	bnez	a5,ffffffffc0209950 <sfs_reclaim+0x70>
ffffffffc020992a:	783c                	ld	a5,112(s0)
ffffffffc020992c:	10078a63          	beqz	a5,ffffffffc0209a40 <sfs_reclaim+0x160>
ffffffffc0209930:	73bc                	ld	a5,96(a5)
ffffffffc0209932:	10078763          	beqz	a5,ffffffffc0209a40 <sfs_reclaim+0x160>
ffffffffc0209936:	00005597          	auipc	a1,0x5
ffffffffc020993a:	dda58593          	addi	a1,a1,-550 # ffffffffc020e710 <syscalls+0xca0>
ffffffffc020993e:	8522                	mv	a0,s0
ffffffffc0209940:	e71fd0ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc0209944:	783c                	ld	a5,112(s0)
ffffffffc0209946:	4581                	li	a1,0
ffffffffc0209948:	8522                	mv	a0,s0
ffffffffc020994a:	73bc                	ld	a5,96(a5)
ffffffffc020994c:	9782                	jalr	a5
ffffffffc020994e:	e559                	bnez	a0,ffffffffc02099dc <sfs_reclaim+0xfc>
ffffffffc0209950:	681c                	ld	a5,16(s0)
ffffffffc0209952:	c39d                	beqz	a5,ffffffffc0209978 <sfs_reclaim+0x98>
ffffffffc0209954:	783c                	ld	a5,112(s0)
ffffffffc0209956:	10078563          	beqz	a5,ffffffffc0209a60 <sfs_reclaim+0x180>
ffffffffc020995a:	7b9c                	ld	a5,48(a5)
ffffffffc020995c:	10078263          	beqz	a5,ffffffffc0209a60 <sfs_reclaim+0x180>
ffffffffc0209960:	8522                	mv	a0,s0
ffffffffc0209962:	00004597          	auipc	a1,0x4
ffffffffc0209966:	8de58593          	addi	a1,a1,-1826 # ffffffffc020d240 <default_pmm_manager+0xe90>
ffffffffc020996a:	e47fd0ef          	jal	ra,ffffffffc02077b0 <inode_check>
ffffffffc020996e:	783c                	ld	a5,112(s0)
ffffffffc0209970:	8522                	mv	a0,s0
ffffffffc0209972:	7b9c                	ld	a5,48(a5)
ffffffffc0209974:	9782                	jalr	a5
ffffffffc0209976:	e13d                	bnez	a0,ffffffffc02099dc <sfs_reclaim+0xfc>
ffffffffc0209978:	7c18                	ld	a4,56(s0)
ffffffffc020997a:	603c                	ld	a5,64(s0)
ffffffffc020997c:	8526                	mv	a0,s1
ffffffffc020997e:	e71c                	sd	a5,8(a4)
ffffffffc0209980:	e398                	sd	a4,0(a5)
ffffffffc0209982:	6438                	ld	a4,72(s0)
ffffffffc0209984:	683c                	ld	a5,80(s0)
ffffffffc0209986:	e71c                	sd	a5,8(a4)
ffffffffc0209988:	e398                	sd	a4,0(a5)
ffffffffc020998a:	512010ef          	jal	ra,ffffffffc020ae9c <unlock_sfs_fs>
ffffffffc020998e:	6008                	ld	a0,0(s0)
ffffffffc0209990:	00655783          	lhu	a5,6(a0)
ffffffffc0209994:	cb85                	beqz	a5,ffffffffc02099c4 <sfs_reclaim+0xe4>
ffffffffc0209996:	ea8f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020999a:	8522                	mv	a0,s0
ffffffffc020999c:	da9fd0ef          	jal	ra,ffffffffc0207744 <inode_kill>
ffffffffc02099a0:	60e2                	ld	ra,24(sp)
ffffffffc02099a2:	6442                	ld	s0,16(sp)
ffffffffc02099a4:	64a2                	ld	s1,8(sp)
ffffffffc02099a6:	854a                	mv	a0,s2
ffffffffc02099a8:	6902                	ld	s2,0(sp)
ffffffffc02099aa:	6105                	addi	sp,sp,32
ffffffffc02099ac:	8082                	ret
ffffffffc02099ae:	5945                	li	s2,-15
ffffffffc02099b0:	8526                	mv	a0,s1
ffffffffc02099b2:	4ea010ef          	jal	ra,ffffffffc020ae9c <unlock_sfs_fs>
ffffffffc02099b6:	60e2                	ld	ra,24(sp)
ffffffffc02099b8:	6442                	ld	s0,16(sp)
ffffffffc02099ba:	64a2                	ld	s1,8(sp)
ffffffffc02099bc:	854a                	mv	a0,s2
ffffffffc02099be:	6902                	ld	s2,0(sp)
ffffffffc02099c0:	6105                	addi	sp,sp,32
ffffffffc02099c2:	8082                	ret
ffffffffc02099c4:	440c                	lw	a1,8(s0)
ffffffffc02099c6:	8526                	mv	a0,s1
ffffffffc02099c8:	ea7ff0ef          	jal	ra,ffffffffc020986e <sfs_block_free>
ffffffffc02099cc:	6008                	ld	a0,0(s0)
ffffffffc02099ce:	5d4c                	lw	a1,60(a0)
ffffffffc02099d0:	d1f9                	beqz	a1,ffffffffc0209996 <sfs_reclaim+0xb6>
ffffffffc02099d2:	8526                	mv	a0,s1
ffffffffc02099d4:	e9bff0ef          	jal	ra,ffffffffc020986e <sfs_block_free>
ffffffffc02099d8:	6008                	ld	a0,0(s0)
ffffffffc02099da:	bf75                	j	ffffffffc0209996 <sfs_reclaim+0xb6>
ffffffffc02099dc:	892a                	mv	s2,a0
ffffffffc02099de:	bfc9                	j	ffffffffc02099b0 <sfs_reclaim+0xd0>
ffffffffc02099e0:	00005697          	auipc	a3,0x5
ffffffffc02099e4:	2a868693          	addi	a3,a3,680 # ffffffffc020ec88 <dev_node_ops+0x3e0>
ffffffffc02099e8:	00002617          	auipc	a2,0x2
ffffffffc02099ec:	ee060613          	addi	a2,a2,-288 # ffffffffc020b8c8 <commands+0x210>
ffffffffc02099f0:	36100593          	li	a1,865
ffffffffc02099f4:	00005517          	auipc	a0,0x5
ffffffffc02099f8:	47450513          	addi	a0,a0,1140 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc02099fc:	aa3f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209a00:	00005697          	auipc	a3,0x5
ffffffffc0209a04:	4f068693          	addi	a3,a3,1264 # ffffffffc020eef0 <dev_node_ops+0x648>
ffffffffc0209a08:	00002617          	auipc	a2,0x2
ffffffffc0209a0c:	ec060613          	addi	a2,a2,-320 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209a10:	36700593          	li	a1,871
ffffffffc0209a14:	00005517          	auipc	a0,0x5
ffffffffc0209a18:	45450513          	addi	a0,a0,1108 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209a1c:	a83f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209a20:	00005697          	auipc	a3,0x5
ffffffffc0209a24:	41068693          	addi	a3,a3,1040 # ffffffffc020ee30 <dev_node_ops+0x588>
ffffffffc0209a28:	00002617          	auipc	a2,0x2
ffffffffc0209a2c:	ea060613          	addi	a2,a2,-352 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209a30:	36200593          	li	a1,866
ffffffffc0209a34:	00005517          	auipc	a0,0x5
ffffffffc0209a38:	43450513          	addi	a0,a0,1076 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209a3c:	a63f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209a40:	00005697          	auipc	a3,0x5
ffffffffc0209a44:	c7868693          	addi	a3,a3,-904 # ffffffffc020e6b8 <syscalls+0xc48>
ffffffffc0209a48:	00002617          	auipc	a2,0x2
ffffffffc0209a4c:	e8060613          	addi	a2,a2,-384 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209a50:	36c00593          	li	a1,876
ffffffffc0209a54:	00005517          	auipc	a0,0x5
ffffffffc0209a58:	41450513          	addi	a0,a0,1044 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209a5c:	a43f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209a60:	00003697          	auipc	a3,0x3
ffffffffc0209a64:	79068693          	addi	a3,a3,1936 # ffffffffc020d1f0 <default_pmm_manager+0xe40>
ffffffffc0209a68:	00002617          	auipc	a2,0x2
ffffffffc0209a6c:	e6060613          	addi	a2,a2,-416 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209a70:	37100593          	li	a1,881
ffffffffc0209a74:	00005517          	auipc	a0,0x5
ffffffffc0209a78:	3f450513          	addi	a0,a0,1012 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209a7c:	a23f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209a80 <sfs_block_alloc>:
ffffffffc0209a80:	1101                	addi	sp,sp,-32
ffffffffc0209a82:	e822                	sd	s0,16(sp)
ffffffffc0209a84:	842a                	mv	s0,a0
ffffffffc0209a86:	7d08                	ld	a0,56(a0)
ffffffffc0209a88:	e426                	sd	s1,8(sp)
ffffffffc0209a8a:	ec06                	sd	ra,24(sp)
ffffffffc0209a8c:	84ae                	mv	s1,a1
ffffffffc0209a8e:	c62ff0ef          	jal	ra,ffffffffc0208ef0 <bitmap_alloc>
ffffffffc0209a92:	e90d                	bnez	a0,ffffffffc0209ac4 <sfs_block_alloc+0x44>
ffffffffc0209a94:	441c                	lw	a5,8(s0)
ffffffffc0209a96:	cbad                	beqz	a5,ffffffffc0209b08 <sfs_block_alloc+0x88>
ffffffffc0209a98:	37fd                	addiw	a5,a5,-1
ffffffffc0209a9a:	c41c                	sw	a5,8(s0)
ffffffffc0209a9c:	408c                	lw	a1,0(s1)
ffffffffc0209a9e:	4785                	li	a5,1
ffffffffc0209aa0:	e03c                	sd	a5,64(s0)
ffffffffc0209aa2:	4054                	lw	a3,4(s0)
ffffffffc0209aa4:	c58d                	beqz	a1,ffffffffc0209ace <sfs_block_alloc+0x4e>
ffffffffc0209aa6:	02d5f463          	bgeu	a1,a3,ffffffffc0209ace <sfs_block_alloc+0x4e>
ffffffffc0209aaa:	7c08                	ld	a0,56(s0)
ffffffffc0209aac:	cb4ff0ef          	jal	ra,ffffffffc0208f60 <bitmap_test>
ffffffffc0209ab0:	ed05                	bnez	a0,ffffffffc0209ae8 <sfs_block_alloc+0x68>
ffffffffc0209ab2:	8522                	mv	a0,s0
ffffffffc0209ab4:	6442                	ld	s0,16(sp)
ffffffffc0209ab6:	408c                	lw	a1,0(s1)
ffffffffc0209ab8:	60e2                	ld	ra,24(sp)
ffffffffc0209aba:	64a2                	ld	s1,8(sp)
ffffffffc0209abc:	4605                	li	a2,1
ffffffffc0209abe:	6105                	addi	sp,sp,32
ffffffffc0209ac0:	36c0106f          	j	ffffffffc020ae2c <sfs_clear_block>
ffffffffc0209ac4:	60e2                	ld	ra,24(sp)
ffffffffc0209ac6:	6442                	ld	s0,16(sp)
ffffffffc0209ac8:	64a2                	ld	s1,8(sp)
ffffffffc0209aca:	6105                	addi	sp,sp,32
ffffffffc0209acc:	8082                	ret
ffffffffc0209ace:	872e                	mv	a4,a1
ffffffffc0209ad0:	00005617          	auipc	a2,0x5
ffffffffc0209ad4:	3c860613          	addi	a2,a2,968 # ffffffffc020ee98 <dev_node_ops+0x5f0>
ffffffffc0209ad8:	05300593          	li	a1,83
ffffffffc0209adc:	00005517          	auipc	a0,0x5
ffffffffc0209ae0:	38c50513          	addi	a0,a0,908 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209ae4:	9bbf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209ae8:	00005697          	auipc	a3,0x5
ffffffffc0209aec:	44068693          	addi	a3,a3,1088 # ffffffffc020ef28 <dev_node_ops+0x680>
ffffffffc0209af0:	00002617          	auipc	a2,0x2
ffffffffc0209af4:	dd860613          	addi	a2,a2,-552 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209af8:	06100593          	li	a1,97
ffffffffc0209afc:	00005517          	auipc	a0,0x5
ffffffffc0209b00:	36c50513          	addi	a0,a0,876 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209b04:	99bf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209b08:	00005697          	auipc	a3,0x5
ffffffffc0209b0c:	40068693          	addi	a3,a3,1024 # ffffffffc020ef08 <dev_node_ops+0x660>
ffffffffc0209b10:	00002617          	auipc	a2,0x2
ffffffffc0209b14:	db860613          	addi	a2,a2,-584 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209b18:	05f00593          	li	a1,95
ffffffffc0209b1c:	00005517          	auipc	a0,0x5
ffffffffc0209b20:	34c50513          	addi	a0,a0,844 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209b24:	97bf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209b28 <sfs_bmap_load_nolock>:
ffffffffc0209b28:	7159                	addi	sp,sp,-112
ffffffffc0209b2a:	f85a                	sd	s6,48(sp)
ffffffffc0209b2c:	0005bb03          	ld	s6,0(a1)
ffffffffc0209b30:	f45e                	sd	s7,40(sp)
ffffffffc0209b32:	f486                	sd	ra,104(sp)
ffffffffc0209b34:	008b2b83          	lw	s7,8(s6)
ffffffffc0209b38:	f0a2                	sd	s0,96(sp)
ffffffffc0209b3a:	eca6                	sd	s1,88(sp)
ffffffffc0209b3c:	e8ca                	sd	s2,80(sp)
ffffffffc0209b3e:	e4ce                	sd	s3,72(sp)
ffffffffc0209b40:	e0d2                	sd	s4,64(sp)
ffffffffc0209b42:	fc56                	sd	s5,56(sp)
ffffffffc0209b44:	f062                	sd	s8,32(sp)
ffffffffc0209b46:	ec66                	sd	s9,24(sp)
ffffffffc0209b48:	18cbe363          	bltu	s7,a2,ffffffffc0209cce <sfs_bmap_load_nolock+0x1a6>
ffffffffc0209b4c:	47ad                	li	a5,11
ffffffffc0209b4e:	8aae                	mv	s5,a1
ffffffffc0209b50:	8432                	mv	s0,a2
ffffffffc0209b52:	84aa                	mv	s1,a0
ffffffffc0209b54:	89b6                	mv	s3,a3
ffffffffc0209b56:	04c7f563          	bgeu	a5,a2,ffffffffc0209ba0 <sfs_bmap_load_nolock+0x78>
ffffffffc0209b5a:	ff46071b          	addiw	a4,a2,-12
ffffffffc0209b5e:	0007069b          	sext.w	a3,a4
ffffffffc0209b62:	3ff00793          	li	a5,1023
ffffffffc0209b66:	1ad7e163          	bltu	a5,a3,ffffffffc0209d08 <sfs_bmap_load_nolock+0x1e0>
ffffffffc0209b6a:	03cb2a03          	lw	s4,60(s6)
ffffffffc0209b6e:	02071793          	slli	a5,a4,0x20
ffffffffc0209b72:	c602                	sw	zero,12(sp)
ffffffffc0209b74:	c452                	sw	s4,8(sp)
ffffffffc0209b76:	01e7dc13          	srli	s8,a5,0x1e
ffffffffc0209b7a:	0e0a1e63          	bnez	s4,ffffffffc0209c76 <sfs_bmap_load_nolock+0x14e>
ffffffffc0209b7e:	0acb8663          	beq	s7,a2,ffffffffc0209c2a <sfs_bmap_load_nolock+0x102>
ffffffffc0209b82:	4a01                	li	s4,0
ffffffffc0209b84:	40d4                	lw	a3,4(s1)
ffffffffc0209b86:	8752                	mv	a4,s4
ffffffffc0209b88:	00005617          	auipc	a2,0x5
ffffffffc0209b8c:	31060613          	addi	a2,a2,784 # ffffffffc020ee98 <dev_node_ops+0x5f0>
ffffffffc0209b90:	05300593          	li	a1,83
ffffffffc0209b94:	00005517          	auipc	a0,0x5
ffffffffc0209b98:	2d450513          	addi	a0,a0,724 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209b9c:	903f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209ba0:	02061793          	slli	a5,a2,0x20
ffffffffc0209ba4:	01e7da13          	srli	s4,a5,0x1e
ffffffffc0209ba8:	9a5a                	add	s4,s4,s6
ffffffffc0209baa:	00ca2583          	lw	a1,12(s4)
ffffffffc0209bae:	c22e                	sw	a1,4(sp)
ffffffffc0209bb0:	ed99                	bnez	a1,ffffffffc0209bce <sfs_bmap_load_nolock+0xa6>
ffffffffc0209bb2:	fccb98e3          	bne	s7,a2,ffffffffc0209b82 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209bb6:	004c                	addi	a1,sp,4
ffffffffc0209bb8:	ec9ff0ef          	jal	ra,ffffffffc0209a80 <sfs_block_alloc>
ffffffffc0209bbc:	892a                	mv	s2,a0
ffffffffc0209bbe:	e921                	bnez	a0,ffffffffc0209c0e <sfs_bmap_load_nolock+0xe6>
ffffffffc0209bc0:	4592                	lw	a1,4(sp)
ffffffffc0209bc2:	4705                	li	a4,1
ffffffffc0209bc4:	00ba2623          	sw	a1,12(s4)
ffffffffc0209bc8:	00eab823          	sd	a4,16(s5)
ffffffffc0209bcc:	d9dd                	beqz	a1,ffffffffc0209b82 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209bce:	40d4                	lw	a3,4(s1)
ffffffffc0209bd0:	10d5ff63          	bgeu	a1,a3,ffffffffc0209cee <sfs_bmap_load_nolock+0x1c6>
ffffffffc0209bd4:	7c88                	ld	a0,56(s1)
ffffffffc0209bd6:	b8aff0ef          	jal	ra,ffffffffc0208f60 <bitmap_test>
ffffffffc0209bda:	18051363          	bnez	a0,ffffffffc0209d60 <sfs_bmap_load_nolock+0x238>
ffffffffc0209bde:	4a12                	lw	s4,4(sp)
ffffffffc0209be0:	fa0a02e3          	beqz	s4,ffffffffc0209b84 <sfs_bmap_load_nolock+0x5c>
ffffffffc0209be4:	40dc                	lw	a5,4(s1)
ffffffffc0209be6:	f8fa7fe3          	bgeu	s4,a5,ffffffffc0209b84 <sfs_bmap_load_nolock+0x5c>
ffffffffc0209bea:	7c88                	ld	a0,56(s1)
ffffffffc0209bec:	85d2                	mv	a1,s4
ffffffffc0209bee:	b72ff0ef          	jal	ra,ffffffffc0208f60 <bitmap_test>
ffffffffc0209bf2:	12051763          	bnez	a0,ffffffffc0209d20 <sfs_bmap_load_nolock+0x1f8>
ffffffffc0209bf6:	008b9763          	bne	s7,s0,ffffffffc0209c04 <sfs_bmap_load_nolock+0xdc>
ffffffffc0209bfa:	008b2783          	lw	a5,8(s6)
ffffffffc0209bfe:	2785                	addiw	a5,a5,1
ffffffffc0209c00:	00fb2423          	sw	a5,8(s6)
ffffffffc0209c04:	4901                	li	s2,0
ffffffffc0209c06:	00098463          	beqz	s3,ffffffffc0209c0e <sfs_bmap_load_nolock+0xe6>
ffffffffc0209c0a:	0149a023          	sw	s4,0(s3)
ffffffffc0209c0e:	70a6                	ld	ra,104(sp)
ffffffffc0209c10:	7406                	ld	s0,96(sp)
ffffffffc0209c12:	64e6                	ld	s1,88(sp)
ffffffffc0209c14:	69a6                	ld	s3,72(sp)
ffffffffc0209c16:	6a06                	ld	s4,64(sp)
ffffffffc0209c18:	7ae2                	ld	s5,56(sp)
ffffffffc0209c1a:	7b42                	ld	s6,48(sp)
ffffffffc0209c1c:	7ba2                	ld	s7,40(sp)
ffffffffc0209c1e:	7c02                	ld	s8,32(sp)
ffffffffc0209c20:	6ce2                	ld	s9,24(sp)
ffffffffc0209c22:	854a                	mv	a0,s2
ffffffffc0209c24:	6946                	ld	s2,80(sp)
ffffffffc0209c26:	6165                	addi	sp,sp,112
ffffffffc0209c28:	8082                	ret
ffffffffc0209c2a:	002c                	addi	a1,sp,8
ffffffffc0209c2c:	e55ff0ef          	jal	ra,ffffffffc0209a80 <sfs_block_alloc>
ffffffffc0209c30:	892a                	mv	s2,a0
ffffffffc0209c32:	00c10c93          	addi	s9,sp,12
ffffffffc0209c36:	fd61                	bnez	a0,ffffffffc0209c0e <sfs_bmap_load_nolock+0xe6>
ffffffffc0209c38:	85e6                	mv	a1,s9
ffffffffc0209c3a:	8526                	mv	a0,s1
ffffffffc0209c3c:	e45ff0ef          	jal	ra,ffffffffc0209a80 <sfs_block_alloc>
ffffffffc0209c40:	892a                	mv	s2,a0
ffffffffc0209c42:	e925                	bnez	a0,ffffffffc0209cb2 <sfs_bmap_load_nolock+0x18a>
ffffffffc0209c44:	46a2                	lw	a3,8(sp)
ffffffffc0209c46:	85e6                	mv	a1,s9
ffffffffc0209c48:	8762                	mv	a4,s8
ffffffffc0209c4a:	4611                	li	a2,4
ffffffffc0209c4c:	8526                	mv	a0,s1
ffffffffc0209c4e:	08e010ef          	jal	ra,ffffffffc020acdc <sfs_wbuf>
ffffffffc0209c52:	45b2                	lw	a1,12(sp)
ffffffffc0209c54:	892a                	mv	s2,a0
ffffffffc0209c56:	e939                	bnez	a0,ffffffffc0209cac <sfs_bmap_load_nolock+0x184>
ffffffffc0209c58:	03cb2683          	lw	a3,60(s6)
ffffffffc0209c5c:	4722                	lw	a4,8(sp)
ffffffffc0209c5e:	c22e                	sw	a1,4(sp)
ffffffffc0209c60:	f6d706e3          	beq	a4,a3,ffffffffc0209bcc <sfs_bmap_load_nolock+0xa4>
ffffffffc0209c64:	eef1                	bnez	a3,ffffffffc0209d40 <sfs_bmap_load_nolock+0x218>
ffffffffc0209c66:	02eb2e23          	sw	a4,60(s6)
ffffffffc0209c6a:	4705                	li	a4,1
ffffffffc0209c6c:	00eab823          	sd	a4,16(s5)
ffffffffc0209c70:	f00589e3          	beqz	a1,ffffffffc0209b82 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209c74:	bfa9                	j	ffffffffc0209bce <sfs_bmap_load_nolock+0xa6>
ffffffffc0209c76:	00c10c93          	addi	s9,sp,12
ffffffffc0209c7a:	8762                	mv	a4,s8
ffffffffc0209c7c:	86d2                	mv	a3,s4
ffffffffc0209c7e:	4611                	li	a2,4
ffffffffc0209c80:	85e6                	mv	a1,s9
ffffffffc0209c82:	7db000ef          	jal	ra,ffffffffc020ac5c <sfs_rbuf>
ffffffffc0209c86:	892a                	mv	s2,a0
ffffffffc0209c88:	f159                	bnez	a0,ffffffffc0209c0e <sfs_bmap_load_nolock+0xe6>
ffffffffc0209c8a:	45b2                	lw	a1,12(sp)
ffffffffc0209c8c:	e995                	bnez	a1,ffffffffc0209cc0 <sfs_bmap_load_nolock+0x198>
ffffffffc0209c8e:	fa8b85e3          	beq	s7,s0,ffffffffc0209c38 <sfs_bmap_load_nolock+0x110>
ffffffffc0209c92:	03cb2703          	lw	a4,60(s6)
ffffffffc0209c96:	47a2                	lw	a5,8(sp)
ffffffffc0209c98:	c202                	sw	zero,4(sp)
ffffffffc0209c9a:	eee784e3          	beq	a5,a4,ffffffffc0209b82 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209c9e:	e34d                	bnez	a4,ffffffffc0209d40 <sfs_bmap_load_nolock+0x218>
ffffffffc0209ca0:	02fb2e23          	sw	a5,60(s6)
ffffffffc0209ca4:	4785                	li	a5,1
ffffffffc0209ca6:	00fab823          	sd	a5,16(s5)
ffffffffc0209caa:	bde1                	j	ffffffffc0209b82 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209cac:	8526                	mv	a0,s1
ffffffffc0209cae:	bc1ff0ef          	jal	ra,ffffffffc020986e <sfs_block_free>
ffffffffc0209cb2:	45a2                	lw	a1,8(sp)
ffffffffc0209cb4:	f4ba0de3          	beq	s4,a1,ffffffffc0209c0e <sfs_bmap_load_nolock+0xe6>
ffffffffc0209cb8:	8526                	mv	a0,s1
ffffffffc0209cba:	bb5ff0ef          	jal	ra,ffffffffc020986e <sfs_block_free>
ffffffffc0209cbe:	bf81                	j	ffffffffc0209c0e <sfs_bmap_load_nolock+0xe6>
ffffffffc0209cc0:	03cb2683          	lw	a3,60(s6)
ffffffffc0209cc4:	4722                	lw	a4,8(sp)
ffffffffc0209cc6:	c22e                	sw	a1,4(sp)
ffffffffc0209cc8:	f8e69ee3          	bne	a3,a4,ffffffffc0209c64 <sfs_bmap_load_nolock+0x13c>
ffffffffc0209ccc:	b709                	j	ffffffffc0209bce <sfs_bmap_load_nolock+0xa6>
ffffffffc0209cce:	00005697          	auipc	a3,0x5
ffffffffc0209cd2:	28268693          	addi	a3,a3,642 # ffffffffc020ef50 <dev_node_ops+0x6a8>
ffffffffc0209cd6:	00002617          	auipc	a2,0x2
ffffffffc0209cda:	bf260613          	addi	a2,a2,-1038 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209cde:	16400593          	li	a1,356
ffffffffc0209ce2:	00005517          	auipc	a0,0x5
ffffffffc0209ce6:	18650513          	addi	a0,a0,390 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209cea:	fb4f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209cee:	872e                	mv	a4,a1
ffffffffc0209cf0:	00005617          	auipc	a2,0x5
ffffffffc0209cf4:	1a860613          	addi	a2,a2,424 # ffffffffc020ee98 <dev_node_ops+0x5f0>
ffffffffc0209cf8:	05300593          	li	a1,83
ffffffffc0209cfc:	00005517          	auipc	a0,0x5
ffffffffc0209d00:	16c50513          	addi	a0,a0,364 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209d04:	f9af60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209d08:	00005617          	auipc	a2,0x5
ffffffffc0209d0c:	27860613          	addi	a2,a2,632 # ffffffffc020ef80 <dev_node_ops+0x6d8>
ffffffffc0209d10:	11e00593          	li	a1,286
ffffffffc0209d14:	00005517          	auipc	a0,0x5
ffffffffc0209d18:	15450513          	addi	a0,a0,340 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209d1c:	f82f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209d20:	00005697          	auipc	a3,0x5
ffffffffc0209d24:	1b068693          	addi	a3,a3,432 # ffffffffc020eed0 <dev_node_ops+0x628>
ffffffffc0209d28:	00002617          	auipc	a2,0x2
ffffffffc0209d2c:	ba060613          	addi	a2,a2,-1120 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209d30:	16b00593          	li	a1,363
ffffffffc0209d34:	00005517          	auipc	a0,0x5
ffffffffc0209d38:	13450513          	addi	a0,a0,308 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209d3c:	f62f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209d40:	00005697          	auipc	a3,0x5
ffffffffc0209d44:	22868693          	addi	a3,a3,552 # ffffffffc020ef68 <dev_node_ops+0x6c0>
ffffffffc0209d48:	00002617          	auipc	a2,0x2
ffffffffc0209d4c:	b8060613          	addi	a2,a2,-1152 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209d50:	11800593          	li	a1,280
ffffffffc0209d54:	00005517          	auipc	a0,0x5
ffffffffc0209d58:	11450513          	addi	a0,a0,276 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209d5c:	f42f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209d60:	00005697          	auipc	a3,0x5
ffffffffc0209d64:	25068693          	addi	a3,a3,592 # ffffffffc020efb0 <dev_node_ops+0x708>
ffffffffc0209d68:	00002617          	auipc	a2,0x2
ffffffffc0209d6c:	b6060613          	addi	a2,a2,-1184 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209d70:	12100593          	li	a1,289
ffffffffc0209d74:	00005517          	auipc	a0,0x5
ffffffffc0209d78:	0f450513          	addi	a0,a0,244 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209d7c:	f22f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209d80 <sfs_io_nolock>:
ffffffffc0209d80:	7175                	addi	sp,sp,-144
ffffffffc0209d82:	f0d2                	sd	s4,96(sp)
ffffffffc0209d84:	8a2e                	mv	s4,a1
ffffffffc0209d86:	618c                	ld	a1,0(a1)
ffffffffc0209d88:	e506                	sd	ra,136(sp)
ffffffffc0209d8a:	e122                	sd	s0,128(sp)
ffffffffc0209d8c:	0045d883          	lhu	a7,4(a1)
ffffffffc0209d90:	fca6                	sd	s1,120(sp)
ffffffffc0209d92:	f8ca                	sd	s2,112(sp)
ffffffffc0209d94:	f4ce                	sd	s3,104(sp)
ffffffffc0209d96:	ecd6                	sd	s5,88(sp)
ffffffffc0209d98:	e8da                	sd	s6,80(sp)
ffffffffc0209d9a:	e4de                	sd	s7,72(sp)
ffffffffc0209d9c:	e0e2                	sd	s8,64(sp)
ffffffffc0209d9e:	fc66                	sd	s9,56(sp)
ffffffffc0209da0:	f86a                	sd	s10,48(sp)
ffffffffc0209da2:	f46e                	sd	s11,40(sp)
ffffffffc0209da4:	4809                	li	a6,2
ffffffffc0209da6:	19088663          	beq	a7,a6,ffffffffc0209f32 <sfs_io_nolock+0x1b2>
ffffffffc0209daa:	00073903          	ld	s2,0(a4) # 4000 <_binary_bin_swap_img_size-0x3d00>
ffffffffc0209dae:	8aba                	mv	s5,a4
ffffffffc0209db0:	000ab023          	sd	zero,0(s5)
ffffffffc0209db4:	08000737          	lui	a4,0x8000
ffffffffc0209db8:	8436                	mv	s0,a3
ffffffffc0209dba:	8836                	mv	a6,a3
ffffffffc0209dbc:	9936                	add	s2,s2,a3
ffffffffc0209dbe:	16e6f863          	bgeu	a3,a4,ffffffffc0209f2e <sfs_io_nolock+0x1ae>
ffffffffc0209dc2:	16d94663          	blt	s2,a3,ffffffffc0209f2e <sfs_io_nolock+0x1ae>
ffffffffc0209dc6:	89aa                	mv	s3,a0
ffffffffc0209dc8:	4501                	li	a0,0
ffffffffc0209dca:	0d268f63          	beq	a3,s2,ffffffffc0209ea8 <sfs_io_nolock+0x128>
ffffffffc0209dce:	84b2                	mv	s1,a2
ffffffffc0209dd0:	01277463          	bgeu	a4,s2,ffffffffc0209dd8 <sfs_io_nolock+0x58>
ffffffffc0209dd4:	08000937          	lui	s2,0x8000
ffffffffc0209dd8:	c7fd                	beqz	a5,ffffffffc0209ec6 <sfs_io_nolock+0x146>
ffffffffc0209dda:	00001797          	auipc	a5,0x1
ffffffffc0209dde:	f0278793          	addi	a5,a5,-254 # ffffffffc020acdc <sfs_wbuf>
ffffffffc0209de2:	00001b97          	auipc	s7,0x1
ffffffffc0209de6:	e1ab8b93          	addi	s7,s7,-486 # ffffffffc020abfc <sfs_wblock>
ffffffffc0209dea:	e03e                	sd	a5,0(sp)
ffffffffc0209dec:	6705                	lui	a4,0x1
ffffffffc0209dee:	40c45793          	srai	a5,s0,0xc
ffffffffc0209df2:	40c95c93          	srai	s9,s2,0xc
ffffffffc0209df6:	fff70d13          	addi	s10,a4,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0209dfa:	40fc8c3b          	subw	s8,s9,a5
ffffffffc0209dfe:	01a47d33          	and	s10,s0,s10
ffffffffc0209e02:	8ce2                	mv	s9,s8
ffffffffc0209e04:	00078d9b          	sext.w	s11,a5
ffffffffc0209e08:	8b6a                	mv	s6,s10
ffffffffc0209e0a:	020d0d63          	beqz	s10,ffffffffc0209e44 <sfs_io_nolock+0xc4>
ffffffffc0209e0e:	40890b33          	sub	s6,s2,s0
ffffffffc0209e12:	0e0c1e63          	bnez	s8,ffffffffc0209f0e <sfs_io_nolock+0x18e>
ffffffffc0209e16:	0874                	addi	a3,sp,28
ffffffffc0209e18:	866e                	mv	a2,s11
ffffffffc0209e1a:	85d2                	mv	a1,s4
ffffffffc0209e1c:	854e                	mv	a0,s3
ffffffffc0209e1e:	e442                	sd	a6,8(sp)
ffffffffc0209e20:	d09ff0ef          	jal	ra,ffffffffc0209b28 <sfs_bmap_load_nolock>
ffffffffc0209e24:	6822                	ld	a6,8(sp)
ffffffffc0209e26:	10051263          	bnez	a0,ffffffffc0209f2a <sfs_io_nolock+0x1aa>
ffffffffc0209e2a:	46f2                	lw	a3,28(sp)
ffffffffc0209e2c:	6782                	ld	a5,0(sp)
ffffffffc0209e2e:	876a                	mv	a4,s10
ffffffffc0209e30:	865a                	mv	a2,s6
ffffffffc0209e32:	85a6                	mv	a1,s1
ffffffffc0209e34:	854e                	mv	a0,s3
ffffffffc0209e36:	9782                	jalr	a5
ffffffffc0209e38:	6822                	ld	a6,8(sp)
ffffffffc0209e3a:	e965                	bnez	a0,ffffffffc0209f2a <sfs_io_nolock+0x1aa>
ffffffffc0209e3c:	94da                	add	s1,s1,s6
ffffffffc0209e3e:	2d85                	addiw	s11,s11,1
ffffffffc0209e40:	fffc8c1b          	addiw	s8,s9,-1
ffffffffc0209e44:	020c0c63          	beqz	s8,ffffffffc0209e7c <sfs_io_nolock+0xfc>
ffffffffc0209e48:	018d8d3b          	addw	s10,s11,s8
ffffffffc0209e4c:	6c85                	lui	s9,0x1
ffffffffc0209e4e:	0874                	addi	a3,sp,28
ffffffffc0209e50:	866e                	mv	a2,s11
ffffffffc0209e52:	85d2                	mv	a1,s4
ffffffffc0209e54:	854e                	mv	a0,s3
ffffffffc0209e56:	cd3ff0ef          	jal	ra,ffffffffc0209b28 <sfs_bmap_load_nolock>
ffffffffc0209e5a:	e55d                	bnez	a0,ffffffffc0209f08 <sfs_io_nolock+0x188>
ffffffffc0209e5c:	4672                	lw	a2,28(sp)
ffffffffc0209e5e:	4685                	li	a3,1
ffffffffc0209e60:	85a6                	mv	a1,s1
ffffffffc0209e62:	854e                	mv	a0,s3
ffffffffc0209e64:	9b82                	jalr	s7
ffffffffc0209e66:	e14d                	bnez	a0,ffffffffc0209f08 <sfs_io_nolock+0x188>
ffffffffc0209e68:	2d85                	addiw	s11,s11,1
ffffffffc0209e6a:	94e6                	add	s1,s1,s9
ffffffffc0209e6c:	ffad91e3          	bne	s11,s10,ffffffffc0209e4e <sfs_io_nolock+0xce>
ffffffffc0209e70:	00cc1c1b          	slliw	s8,s8,0xc
ffffffffc0209e74:	1c02                	slli	s8,s8,0x20
ffffffffc0209e76:	020c5c13          	srli	s8,s8,0x20
ffffffffc0209e7a:	9b62                	add	s6,s6,s8
ffffffffc0209e7c:	1952                	slli	s2,s2,0x34
ffffffffc0209e7e:	03495b93          	srli	s7,s2,0x34
ffffffffc0209e82:	06091363          	bnez	s2,ffffffffc0209ee8 <sfs_io_nolock+0x168>
ffffffffc0209e86:	01640833          	add	a6,s0,s6
ffffffffc0209e8a:	4501                	li	a0,0
ffffffffc0209e8c:	000a3783          	ld	a5,0(s4)
ffffffffc0209e90:	016ab023          	sd	s6,0(s5)
ffffffffc0209e94:	0007e703          	lwu	a4,0(a5)
ffffffffc0209e98:	01077863          	bgeu	a4,a6,ffffffffc0209ea8 <sfs_io_nolock+0x128>
ffffffffc0209e9c:	0164043b          	addw	s0,s0,s6
ffffffffc0209ea0:	c380                	sw	s0,0(a5)
ffffffffc0209ea2:	4785                	li	a5,1
ffffffffc0209ea4:	00fa3823          	sd	a5,16(s4)
ffffffffc0209ea8:	60aa                	ld	ra,136(sp)
ffffffffc0209eaa:	640a                	ld	s0,128(sp)
ffffffffc0209eac:	74e6                	ld	s1,120(sp)
ffffffffc0209eae:	7946                	ld	s2,112(sp)
ffffffffc0209eb0:	79a6                	ld	s3,104(sp)
ffffffffc0209eb2:	7a06                	ld	s4,96(sp)
ffffffffc0209eb4:	6ae6                	ld	s5,88(sp)
ffffffffc0209eb6:	6b46                	ld	s6,80(sp)
ffffffffc0209eb8:	6ba6                	ld	s7,72(sp)
ffffffffc0209eba:	6c06                	ld	s8,64(sp)
ffffffffc0209ebc:	7ce2                	ld	s9,56(sp)
ffffffffc0209ebe:	7d42                	ld	s10,48(sp)
ffffffffc0209ec0:	7da2                	ld	s11,40(sp)
ffffffffc0209ec2:	6149                	addi	sp,sp,144
ffffffffc0209ec4:	8082                	ret
ffffffffc0209ec6:	0005e783          	lwu	a5,0(a1)
ffffffffc0209eca:	4501                	li	a0,0
ffffffffc0209ecc:	fcf45ee3          	bge	s0,a5,ffffffffc0209ea8 <sfs_io_nolock+0x128>
ffffffffc0209ed0:	0527c263          	blt	a5,s2,ffffffffc0209f14 <sfs_io_nolock+0x194>
ffffffffc0209ed4:	00001797          	auipc	a5,0x1
ffffffffc0209ed8:	d8878793          	addi	a5,a5,-632 # ffffffffc020ac5c <sfs_rbuf>
ffffffffc0209edc:	00001b97          	auipc	s7,0x1
ffffffffc0209ee0:	cc0b8b93          	addi	s7,s7,-832 # ffffffffc020ab9c <sfs_rblock>
ffffffffc0209ee4:	e03e                	sd	a5,0(sp)
ffffffffc0209ee6:	b719                	j	ffffffffc0209dec <sfs_io_nolock+0x6c>
ffffffffc0209ee8:	0874                	addi	a3,sp,28
ffffffffc0209eea:	866e                	mv	a2,s11
ffffffffc0209eec:	85d2                	mv	a1,s4
ffffffffc0209eee:	854e                	mv	a0,s3
ffffffffc0209ef0:	c39ff0ef          	jal	ra,ffffffffc0209b28 <sfs_bmap_load_nolock>
ffffffffc0209ef4:	e911                	bnez	a0,ffffffffc0209f08 <sfs_io_nolock+0x188>
ffffffffc0209ef6:	46f2                	lw	a3,28(sp)
ffffffffc0209ef8:	6782                	ld	a5,0(sp)
ffffffffc0209efa:	4701                	li	a4,0
ffffffffc0209efc:	865e                	mv	a2,s7
ffffffffc0209efe:	85a6                	mv	a1,s1
ffffffffc0209f00:	854e                	mv	a0,s3
ffffffffc0209f02:	9782                	jalr	a5
ffffffffc0209f04:	e111                	bnez	a0,ffffffffc0209f08 <sfs_io_nolock+0x188>
ffffffffc0209f06:	9b5e                	add	s6,s6,s7
ffffffffc0209f08:	01640833          	add	a6,s0,s6
ffffffffc0209f0c:	b741                	j	ffffffffc0209e8c <sfs_io_nolock+0x10c>
ffffffffc0209f0e:	41a70b33          	sub	s6,a4,s10
ffffffffc0209f12:	b711                	j	ffffffffc0209e16 <sfs_io_nolock+0x96>
ffffffffc0209f14:	893e                	mv	s2,a5
ffffffffc0209f16:	00001797          	auipc	a5,0x1
ffffffffc0209f1a:	d4678793          	addi	a5,a5,-698 # ffffffffc020ac5c <sfs_rbuf>
ffffffffc0209f1e:	00001b97          	auipc	s7,0x1
ffffffffc0209f22:	c7eb8b93          	addi	s7,s7,-898 # ffffffffc020ab9c <sfs_rblock>
ffffffffc0209f26:	e03e                	sd	a5,0(sp)
ffffffffc0209f28:	b5d1                	j	ffffffffc0209dec <sfs_io_nolock+0x6c>
ffffffffc0209f2a:	4b01                	li	s6,0
ffffffffc0209f2c:	b785                	j	ffffffffc0209e8c <sfs_io_nolock+0x10c>
ffffffffc0209f2e:	5575                	li	a0,-3
ffffffffc0209f30:	bfa5                	j	ffffffffc0209ea8 <sfs_io_nolock+0x128>
ffffffffc0209f32:	00005697          	auipc	a3,0x5
ffffffffc0209f36:	0a668693          	addi	a3,a3,166 # ffffffffc020efd8 <dev_node_ops+0x730>
ffffffffc0209f3a:	00002617          	auipc	a2,0x2
ffffffffc0209f3e:	98e60613          	addi	a2,a2,-1650 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209f42:	22b00593          	li	a1,555
ffffffffc0209f46:	00005517          	auipc	a0,0x5
ffffffffc0209f4a:	f2250513          	addi	a0,a0,-222 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209f4e:	d50f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209f52 <sfs_read>:
ffffffffc0209f52:	7139                	addi	sp,sp,-64
ffffffffc0209f54:	f04a                	sd	s2,32(sp)
ffffffffc0209f56:	06853903          	ld	s2,104(a0)
ffffffffc0209f5a:	fc06                	sd	ra,56(sp)
ffffffffc0209f5c:	f822                	sd	s0,48(sp)
ffffffffc0209f5e:	f426                	sd	s1,40(sp)
ffffffffc0209f60:	ec4e                	sd	s3,24(sp)
ffffffffc0209f62:	04090f63          	beqz	s2,ffffffffc0209fc0 <sfs_read+0x6e>
ffffffffc0209f66:	0b092783          	lw	a5,176(s2) # 80000b0 <_binary_bin_sfs_img_size+0x7f8adb0>
ffffffffc0209f6a:	ebb9                	bnez	a5,ffffffffc0209fc0 <sfs_read+0x6e>
ffffffffc0209f6c:	4d38                	lw	a4,88(a0)
ffffffffc0209f6e:	6785                	lui	a5,0x1
ffffffffc0209f70:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209f74:	842a                	mv	s0,a0
ffffffffc0209f76:	06f71563          	bne	a4,a5,ffffffffc0209fe0 <sfs_read+0x8e>
ffffffffc0209f7a:	02050993          	addi	s3,a0,32
ffffffffc0209f7e:	854e                	mv	a0,s3
ffffffffc0209f80:	84ae                	mv	s1,a1
ffffffffc0209f82:	d40fa0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc0209f86:	0184b803          	ld	a6,24(s1)
ffffffffc0209f8a:	6494                	ld	a3,8(s1)
ffffffffc0209f8c:	6090                	ld	a2,0(s1)
ffffffffc0209f8e:	85a2                	mv	a1,s0
ffffffffc0209f90:	4781                	li	a5,0
ffffffffc0209f92:	0038                	addi	a4,sp,8
ffffffffc0209f94:	854a                	mv	a0,s2
ffffffffc0209f96:	e442                	sd	a6,8(sp)
ffffffffc0209f98:	de9ff0ef          	jal	ra,ffffffffc0209d80 <sfs_io_nolock>
ffffffffc0209f9c:	65a2                	ld	a1,8(sp)
ffffffffc0209f9e:	842a                	mv	s0,a0
ffffffffc0209fa0:	ed81                	bnez	a1,ffffffffc0209fb8 <sfs_read+0x66>
ffffffffc0209fa2:	854e                	mv	a0,s3
ffffffffc0209fa4:	d1afa0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc0209fa8:	70e2                	ld	ra,56(sp)
ffffffffc0209faa:	8522                	mv	a0,s0
ffffffffc0209fac:	7442                	ld	s0,48(sp)
ffffffffc0209fae:	74a2                	ld	s1,40(sp)
ffffffffc0209fb0:	7902                	ld	s2,32(sp)
ffffffffc0209fb2:	69e2                	ld	s3,24(sp)
ffffffffc0209fb4:	6121                	addi	sp,sp,64
ffffffffc0209fb6:	8082                	ret
ffffffffc0209fb8:	8526                	mv	a0,s1
ffffffffc0209fba:	bfcfb0ef          	jal	ra,ffffffffc02053b6 <iobuf_skip>
ffffffffc0209fbe:	b7d5                	j	ffffffffc0209fa2 <sfs_read+0x50>
ffffffffc0209fc0:	00005697          	auipc	a3,0x5
ffffffffc0209fc4:	cc868693          	addi	a3,a3,-824 # ffffffffc020ec88 <dev_node_ops+0x3e0>
ffffffffc0209fc8:	00002617          	auipc	a2,0x2
ffffffffc0209fcc:	90060613          	addi	a2,a2,-1792 # ffffffffc020b8c8 <commands+0x210>
ffffffffc0209fd0:	29f00593          	li	a1,671
ffffffffc0209fd4:	00005517          	auipc	a0,0x5
ffffffffc0209fd8:	e9450513          	addi	a0,a0,-364 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc0209fdc:	cc2f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209fe0:	86bff0ef          	jal	ra,ffffffffc020984a <sfs_io.part.0>

ffffffffc0209fe4 <sfs_write>:
ffffffffc0209fe4:	7139                	addi	sp,sp,-64
ffffffffc0209fe6:	f04a                	sd	s2,32(sp)
ffffffffc0209fe8:	06853903          	ld	s2,104(a0)
ffffffffc0209fec:	fc06                	sd	ra,56(sp)
ffffffffc0209fee:	f822                	sd	s0,48(sp)
ffffffffc0209ff0:	f426                	sd	s1,40(sp)
ffffffffc0209ff2:	ec4e                	sd	s3,24(sp)
ffffffffc0209ff4:	04090f63          	beqz	s2,ffffffffc020a052 <sfs_write+0x6e>
ffffffffc0209ff8:	0b092783          	lw	a5,176(s2)
ffffffffc0209ffc:	ebb9                	bnez	a5,ffffffffc020a052 <sfs_write+0x6e>
ffffffffc0209ffe:	4d38                	lw	a4,88(a0)
ffffffffc020a000:	6785                	lui	a5,0x1
ffffffffc020a002:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a006:	842a                	mv	s0,a0
ffffffffc020a008:	06f71563          	bne	a4,a5,ffffffffc020a072 <sfs_write+0x8e>
ffffffffc020a00c:	02050993          	addi	s3,a0,32
ffffffffc020a010:	854e                	mv	a0,s3
ffffffffc020a012:	84ae                	mv	s1,a1
ffffffffc020a014:	caefa0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc020a018:	0184b803          	ld	a6,24(s1)
ffffffffc020a01c:	6494                	ld	a3,8(s1)
ffffffffc020a01e:	6090                	ld	a2,0(s1)
ffffffffc020a020:	85a2                	mv	a1,s0
ffffffffc020a022:	4785                	li	a5,1
ffffffffc020a024:	0038                	addi	a4,sp,8
ffffffffc020a026:	854a                	mv	a0,s2
ffffffffc020a028:	e442                	sd	a6,8(sp)
ffffffffc020a02a:	d57ff0ef          	jal	ra,ffffffffc0209d80 <sfs_io_nolock>
ffffffffc020a02e:	65a2                	ld	a1,8(sp)
ffffffffc020a030:	842a                	mv	s0,a0
ffffffffc020a032:	ed81                	bnez	a1,ffffffffc020a04a <sfs_write+0x66>
ffffffffc020a034:	854e                	mv	a0,s3
ffffffffc020a036:	c88fa0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020a03a:	70e2                	ld	ra,56(sp)
ffffffffc020a03c:	8522                	mv	a0,s0
ffffffffc020a03e:	7442                	ld	s0,48(sp)
ffffffffc020a040:	74a2                	ld	s1,40(sp)
ffffffffc020a042:	7902                	ld	s2,32(sp)
ffffffffc020a044:	69e2                	ld	s3,24(sp)
ffffffffc020a046:	6121                	addi	sp,sp,64
ffffffffc020a048:	8082                	ret
ffffffffc020a04a:	8526                	mv	a0,s1
ffffffffc020a04c:	b6afb0ef          	jal	ra,ffffffffc02053b6 <iobuf_skip>
ffffffffc020a050:	b7d5                	j	ffffffffc020a034 <sfs_write+0x50>
ffffffffc020a052:	00005697          	auipc	a3,0x5
ffffffffc020a056:	c3668693          	addi	a3,a3,-970 # ffffffffc020ec88 <dev_node_ops+0x3e0>
ffffffffc020a05a:	00002617          	auipc	a2,0x2
ffffffffc020a05e:	86e60613          	addi	a2,a2,-1938 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020a062:	29f00593          	li	a1,671
ffffffffc020a066:	00005517          	auipc	a0,0x5
ffffffffc020a06a:	e0250513          	addi	a0,a0,-510 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a06e:	c30f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a072:	fd8ff0ef          	jal	ra,ffffffffc020984a <sfs_io.part.0>

ffffffffc020a076 <sfs_dirent_read_nolock>:
ffffffffc020a076:	6198                	ld	a4,0(a1)
ffffffffc020a078:	7179                	addi	sp,sp,-48
ffffffffc020a07a:	f406                	sd	ra,40(sp)
ffffffffc020a07c:	00475883          	lhu	a7,4(a4)
ffffffffc020a080:	f022                	sd	s0,32(sp)
ffffffffc020a082:	ec26                	sd	s1,24(sp)
ffffffffc020a084:	4809                	li	a6,2
ffffffffc020a086:	05089b63          	bne	a7,a6,ffffffffc020a0dc <sfs_dirent_read_nolock+0x66>
ffffffffc020a08a:	4718                	lw	a4,8(a4)
ffffffffc020a08c:	87b2                	mv	a5,a2
ffffffffc020a08e:	2601                	sext.w	a2,a2
ffffffffc020a090:	04e7f663          	bgeu	a5,a4,ffffffffc020a0dc <sfs_dirent_read_nolock+0x66>
ffffffffc020a094:	84b6                	mv	s1,a3
ffffffffc020a096:	0074                	addi	a3,sp,12
ffffffffc020a098:	842a                	mv	s0,a0
ffffffffc020a09a:	a8fff0ef          	jal	ra,ffffffffc0209b28 <sfs_bmap_load_nolock>
ffffffffc020a09e:	c511                	beqz	a0,ffffffffc020a0aa <sfs_dirent_read_nolock+0x34>
ffffffffc020a0a0:	70a2                	ld	ra,40(sp)
ffffffffc020a0a2:	7402                	ld	s0,32(sp)
ffffffffc020a0a4:	64e2                	ld	s1,24(sp)
ffffffffc020a0a6:	6145                	addi	sp,sp,48
ffffffffc020a0a8:	8082                	ret
ffffffffc020a0aa:	45b2                	lw	a1,12(sp)
ffffffffc020a0ac:	4054                	lw	a3,4(s0)
ffffffffc020a0ae:	c5b9                	beqz	a1,ffffffffc020a0fc <sfs_dirent_read_nolock+0x86>
ffffffffc020a0b0:	04d5f663          	bgeu	a1,a3,ffffffffc020a0fc <sfs_dirent_read_nolock+0x86>
ffffffffc020a0b4:	7c08                	ld	a0,56(s0)
ffffffffc020a0b6:	eabfe0ef          	jal	ra,ffffffffc0208f60 <bitmap_test>
ffffffffc020a0ba:	ed31                	bnez	a0,ffffffffc020a116 <sfs_dirent_read_nolock+0xa0>
ffffffffc020a0bc:	46b2                	lw	a3,12(sp)
ffffffffc020a0be:	4701                	li	a4,0
ffffffffc020a0c0:	10400613          	li	a2,260
ffffffffc020a0c4:	85a6                	mv	a1,s1
ffffffffc020a0c6:	8522                	mv	a0,s0
ffffffffc020a0c8:	395000ef          	jal	ra,ffffffffc020ac5c <sfs_rbuf>
ffffffffc020a0cc:	f971                	bnez	a0,ffffffffc020a0a0 <sfs_dirent_read_nolock+0x2a>
ffffffffc020a0ce:	100481a3          	sb	zero,259(s1)
ffffffffc020a0d2:	70a2                	ld	ra,40(sp)
ffffffffc020a0d4:	7402                	ld	s0,32(sp)
ffffffffc020a0d6:	64e2                	ld	s1,24(sp)
ffffffffc020a0d8:	6145                	addi	sp,sp,48
ffffffffc020a0da:	8082                	ret
ffffffffc020a0dc:	00005697          	auipc	a3,0x5
ffffffffc020a0e0:	f1c68693          	addi	a3,a3,-228 # ffffffffc020eff8 <dev_node_ops+0x750>
ffffffffc020a0e4:	00001617          	auipc	a2,0x1
ffffffffc020a0e8:	7e460613          	addi	a2,a2,2020 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020a0ec:	18e00593          	li	a1,398
ffffffffc020a0f0:	00005517          	auipc	a0,0x5
ffffffffc020a0f4:	d7850513          	addi	a0,a0,-648 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a0f8:	ba6f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a0fc:	872e                	mv	a4,a1
ffffffffc020a0fe:	00005617          	auipc	a2,0x5
ffffffffc020a102:	d9a60613          	addi	a2,a2,-614 # ffffffffc020ee98 <dev_node_ops+0x5f0>
ffffffffc020a106:	05300593          	li	a1,83
ffffffffc020a10a:	00005517          	auipc	a0,0x5
ffffffffc020a10e:	d5e50513          	addi	a0,a0,-674 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a112:	b8cf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a116:	00005697          	auipc	a3,0x5
ffffffffc020a11a:	dba68693          	addi	a3,a3,-582 # ffffffffc020eed0 <dev_node_ops+0x628>
ffffffffc020a11e:	00001617          	auipc	a2,0x1
ffffffffc020a122:	7aa60613          	addi	a2,a2,1962 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020a126:	19500593          	li	a1,405
ffffffffc020a12a:	00005517          	auipc	a0,0x5
ffffffffc020a12e:	d3e50513          	addi	a0,a0,-706 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a132:	b6cf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a136 <sfs_getdirentry>:
ffffffffc020a136:	715d                	addi	sp,sp,-80
ffffffffc020a138:	ec56                	sd	s5,24(sp)
ffffffffc020a13a:	8aaa                	mv	s5,a0
ffffffffc020a13c:	10400513          	li	a0,260
ffffffffc020a140:	e85a                	sd	s6,16(sp)
ffffffffc020a142:	e486                	sd	ra,72(sp)
ffffffffc020a144:	e0a2                	sd	s0,64(sp)
ffffffffc020a146:	fc26                	sd	s1,56(sp)
ffffffffc020a148:	f84a                	sd	s2,48(sp)
ffffffffc020a14a:	f44e                	sd	s3,40(sp)
ffffffffc020a14c:	f052                	sd	s4,32(sp)
ffffffffc020a14e:	e45e                	sd	s7,8(sp)
ffffffffc020a150:	e062                	sd	s8,0(sp)
ffffffffc020a152:	8b2e                	mv	s6,a1
ffffffffc020a154:	e3bf70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a158:	cd61                	beqz	a0,ffffffffc020a230 <sfs_getdirentry+0xfa>
ffffffffc020a15a:	068abb83          	ld	s7,104(s5)
ffffffffc020a15e:	0c0b8b63          	beqz	s7,ffffffffc020a234 <sfs_getdirentry+0xfe>
ffffffffc020a162:	0b0ba783          	lw	a5,176(s7)
ffffffffc020a166:	e7f9                	bnez	a5,ffffffffc020a234 <sfs_getdirentry+0xfe>
ffffffffc020a168:	058aa703          	lw	a4,88(s5)
ffffffffc020a16c:	6785                	lui	a5,0x1
ffffffffc020a16e:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a172:	0ef71163          	bne	a4,a5,ffffffffc020a254 <sfs_getdirentry+0x11e>
ffffffffc020a176:	008b3983          	ld	s3,8(s6)
ffffffffc020a17a:	892a                	mv	s2,a0
ffffffffc020a17c:	0a09c163          	bltz	s3,ffffffffc020a21e <sfs_getdirentry+0xe8>
ffffffffc020a180:	0ff9f793          	zext.b	a5,s3
ffffffffc020a184:	efc9                	bnez	a5,ffffffffc020a21e <sfs_getdirentry+0xe8>
ffffffffc020a186:	000ab783          	ld	a5,0(s5)
ffffffffc020a18a:	0089d993          	srli	s3,s3,0x8
ffffffffc020a18e:	2981                	sext.w	s3,s3
ffffffffc020a190:	479c                	lw	a5,8(a5)
ffffffffc020a192:	0937eb63          	bltu	a5,s3,ffffffffc020a228 <sfs_getdirentry+0xf2>
ffffffffc020a196:	020a8c13          	addi	s8,s5,32
ffffffffc020a19a:	8562                	mv	a0,s8
ffffffffc020a19c:	b26fa0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc020a1a0:	000ab783          	ld	a5,0(s5)
ffffffffc020a1a4:	0087aa03          	lw	s4,8(a5)
ffffffffc020a1a8:	07405663          	blez	s4,ffffffffc020a214 <sfs_getdirentry+0xde>
ffffffffc020a1ac:	4481                	li	s1,0
ffffffffc020a1ae:	a811                	j	ffffffffc020a1c2 <sfs_getdirentry+0x8c>
ffffffffc020a1b0:	00092783          	lw	a5,0(s2)
ffffffffc020a1b4:	c781                	beqz	a5,ffffffffc020a1bc <sfs_getdirentry+0x86>
ffffffffc020a1b6:	02098263          	beqz	s3,ffffffffc020a1da <sfs_getdirentry+0xa4>
ffffffffc020a1ba:	39fd                	addiw	s3,s3,-1
ffffffffc020a1bc:	2485                	addiw	s1,s1,1
ffffffffc020a1be:	049a0b63          	beq	s4,s1,ffffffffc020a214 <sfs_getdirentry+0xde>
ffffffffc020a1c2:	86ca                	mv	a3,s2
ffffffffc020a1c4:	8626                	mv	a2,s1
ffffffffc020a1c6:	85d6                	mv	a1,s5
ffffffffc020a1c8:	855e                	mv	a0,s7
ffffffffc020a1ca:	eadff0ef          	jal	ra,ffffffffc020a076 <sfs_dirent_read_nolock>
ffffffffc020a1ce:	842a                	mv	s0,a0
ffffffffc020a1d0:	d165                	beqz	a0,ffffffffc020a1b0 <sfs_getdirentry+0x7a>
ffffffffc020a1d2:	8562                	mv	a0,s8
ffffffffc020a1d4:	aeafa0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020a1d8:	a831                	j	ffffffffc020a1f4 <sfs_getdirentry+0xbe>
ffffffffc020a1da:	8562                	mv	a0,s8
ffffffffc020a1dc:	ae2fa0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020a1e0:	4701                	li	a4,0
ffffffffc020a1e2:	4685                	li	a3,1
ffffffffc020a1e4:	10000613          	li	a2,256
ffffffffc020a1e8:	00490593          	addi	a1,s2,4
ffffffffc020a1ec:	855a                	mv	a0,s6
ffffffffc020a1ee:	95cfb0ef          	jal	ra,ffffffffc020534a <iobuf_move>
ffffffffc020a1f2:	842a                	mv	s0,a0
ffffffffc020a1f4:	854a                	mv	a0,s2
ffffffffc020a1f6:	e49f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a1fa:	60a6                	ld	ra,72(sp)
ffffffffc020a1fc:	8522                	mv	a0,s0
ffffffffc020a1fe:	6406                	ld	s0,64(sp)
ffffffffc020a200:	74e2                	ld	s1,56(sp)
ffffffffc020a202:	7942                	ld	s2,48(sp)
ffffffffc020a204:	79a2                	ld	s3,40(sp)
ffffffffc020a206:	7a02                	ld	s4,32(sp)
ffffffffc020a208:	6ae2                	ld	s5,24(sp)
ffffffffc020a20a:	6b42                	ld	s6,16(sp)
ffffffffc020a20c:	6ba2                	ld	s7,8(sp)
ffffffffc020a20e:	6c02                	ld	s8,0(sp)
ffffffffc020a210:	6161                	addi	sp,sp,80
ffffffffc020a212:	8082                	ret
ffffffffc020a214:	8562                	mv	a0,s8
ffffffffc020a216:	5441                	li	s0,-16
ffffffffc020a218:	aa6fa0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020a21c:	bfe1                	j	ffffffffc020a1f4 <sfs_getdirentry+0xbe>
ffffffffc020a21e:	854a                	mv	a0,s2
ffffffffc020a220:	e1ff70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a224:	5475                	li	s0,-3
ffffffffc020a226:	bfd1                	j	ffffffffc020a1fa <sfs_getdirentry+0xc4>
ffffffffc020a228:	e17f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a22c:	5441                	li	s0,-16
ffffffffc020a22e:	b7f1                	j	ffffffffc020a1fa <sfs_getdirentry+0xc4>
ffffffffc020a230:	5471                	li	s0,-4
ffffffffc020a232:	b7e1                	j	ffffffffc020a1fa <sfs_getdirentry+0xc4>
ffffffffc020a234:	00005697          	auipc	a3,0x5
ffffffffc020a238:	a5468693          	addi	a3,a3,-1452 # ffffffffc020ec88 <dev_node_ops+0x3e0>
ffffffffc020a23c:	00001617          	auipc	a2,0x1
ffffffffc020a240:	68c60613          	addi	a2,a2,1676 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020a244:	34300593          	li	a1,835
ffffffffc020a248:	00005517          	auipc	a0,0x5
ffffffffc020a24c:	c2050513          	addi	a0,a0,-992 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a250:	a4ef60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a254:	00005697          	auipc	a3,0x5
ffffffffc020a258:	bdc68693          	addi	a3,a3,-1060 # ffffffffc020ee30 <dev_node_ops+0x588>
ffffffffc020a25c:	00001617          	auipc	a2,0x1
ffffffffc020a260:	66c60613          	addi	a2,a2,1644 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020a264:	34400593          	li	a1,836
ffffffffc020a268:	00005517          	auipc	a0,0x5
ffffffffc020a26c:	c0050513          	addi	a0,a0,-1024 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a270:	a2ef60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a274 <sfs_dirent_search_nolock.constprop.0>:
ffffffffc020a274:	715d                	addi	sp,sp,-80
ffffffffc020a276:	f052                	sd	s4,32(sp)
ffffffffc020a278:	8a2a                	mv	s4,a0
ffffffffc020a27a:	8532                	mv	a0,a2
ffffffffc020a27c:	f44e                	sd	s3,40(sp)
ffffffffc020a27e:	e85a                	sd	s6,16(sp)
ffffffffc020a280:	e45e                	sd	s7,8(sp)
ffffffffc020a282:	e486                	sd	ra,72(sp)
ffffffffc020a284:	e0a2                	sd	s0,64(sp)
ffffffffc020a286:	fc26                	sd	s1,56(sp)
ffffffffc020a288:	f84a                	sd	s2,48(sp)
ffffffffc020a28a:	ec56                	sd	s5,24(sp)
ffffffffc020a28c:	e062                	sd	s8,0(sp)
ffffffffc020a28e:	8b32                	mv	s6,a2
ffffffffc020a290:	89ae                	mv	s3,a1
ffffffffc020a292:	8bb6                	mv	s7,a3
ffffffffc020a294:	0aa010ef          	jal	ra,ffffffffc020b33e <strlen>
ffffffffc020a298:	0ff00793          	li	a5,255
ffffffffc020a29c:	06a7ef63          	bltu	a5,a0,ffffffffc020a31a <sfs_dirent_search_nolock.constprop.0+0xa6>
ffffffffc020a2a0:	10400513          	li	a0,260
ffffffffc020a2a4:	cebf70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a2a8:	892a                	mv	s2,a0
ffffffffc020a2aa:	c535                	beqz	a0,ffffffffc020a316 <sfs_dirent_search_nolock.constprop.0+0xa2>
ffffffffc020a2ac:	0009b783          	ld	a5,0(s3)
ffffffffc020a2b0:	0087aa83          	lw	s5,8(a5)
ffffffffc020a2b4:	05505a63          	blez	s5,ffffffffc020a308 <sfs_dirent_search_nolock.constprop.0+0x94>
ffffffffc020a2b8:	4481                	li	s1,0
ffffffffc020a2ba:	00450c13          	addi	s8,a0,4
ffffffffc020a2be:	a829                	j	ffffffffc020a2d8 <sfs_dirent_search_nolock.constprop.0+0x64>
ffffffffc020a2c0:	00092783          	lw	a5,0(s2)
ffffffffc020a2c4:	c799                	beqz	a5,ffffffffc020a2d2 <sfs_dirent_search_nolock.constprop.0+0x5e>
ffffffffc020a2c6:	85e2                	mv	a1,s8
ffffffffc020a2c8:	855a                	mv	a0,s6
ffffffffc020a2ca:	0bc010ef          	jal	ra,ffffffffc020b386 <strcmp>
ffffffffc020a2ce:	842a                	mv	s0,a0
ffffffffc020a2d0:	cd15                	beqz	a0,ffffffffc020a30c <sfs_dirent_search_nolock.constprop.0+0x98>
ffffffffc020a2d2:	2485                	addiw	s1,s1,1
ffffffffc020a2d4:	029a8a63          	beq	s5,s1,ffffffffc020a308 <sfs_dirent_search_nolock.constprop.0+0x94>
ffffffffc020a2d8:	86ca                	mv	a3,s2
ffffffffc020a2da:	8626                	mv	a2,s1
ffffffffc020a2dc:	85ce                	mv	a1,s3
ffffffffc020a2de:	8552                	mv	a0,s4
ffffffffc020a2e0:	d97ff0ef          	jal	ra,ffffffffc020a076 <sfs_dirent_read_nolock>
ffffffffc020a2e4:	842a                	mv	s0,a0
ffffffffc020a2e6:	dd69                	beqz	a0,ffffffffc020a2c0 <sfs_dirent_search_nolock.constprop.0+0x4c>
ffffffffc020a2e8:	854a                	mv	a0,s2
ffffffffc020a2ea:	d55f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a2ee:	60a6                	ld	ra,72(sp)
ffffffffc020a2f0:	8522                	mv	a0,s0
ffffffffc020a2f2:	6406                	ld	s0,64(sp)
ffffffffc020a2f4:	74e2                	ld	s1,56(sp)
ffffffffc020a2f6:	7942                	ld	s2,48(sp)
ffffffffc020a2f8:	79a2                	ld	s3,40(sp)
ffffffffc020a2fa:	7a02                	ld	s4,32(sp)
ffffffffc020a2fc:	6ae2                	ld	s5,24(sp)
ffffffffc020a2fe:	6b42                	ld	s6,16(sp)
ffffffffc020a300:	6ba2                	ld	s7,8(sp)
ffffffffc020a302:	6c02                	ld	s8,0(sp)
ffffffffc020a304:	6161                	addi	sp,sp,80
ffffffffc020a306:	8082                	ret
ffffffffc020a308:	5441                	li	s0,-16
ffffffffc020a30a:	bff9                	j	ffffffffc020a2e8 <sfs_dirent_search_nolock.constprop.0+0x74>
ffffffffc020a30c:	00092783          	lw	a5,0(s2)
ffffffffc020a310:	00fba023          	sw	a5,0(s7)
ffffffffc020a314:	bfd1                	j	ffffffffc020a2e8 <sfs_dirent_search_nolock.constprop.0+0x74>
ffffffffc020a316:	5471                	li	s0,-4
ffffffffc020a318:	bfd9                	j	ffffffffc020a2ee <sfs_dirent_search_nolock.constprop.0+0x7a>
ffffffffc020a31a:	00005697          	auipc	a3,0x5
ffffffffc020a31e:	d2e68693          	addi	a3,a3,-722 # ffffffffc020f048 <dev_node_ops+0x7a0>
ffffffffc020a322:	00001617          	auipc	a2,0x1
ffffffffc020a326:	5a660613          	addi	a2,a2,1446 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020a32a:	1ba00593          	li	a1,442
ffffffffc020a32e:	00005517          	auipc	a0,0x5
ffffffffc020a332:	b3a50513          	addi	a0,a0,-1222 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a336:	968f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a33a <sfs_truncfile>:
ffffffffc020a33a:	7175                	addi	sp,sp,-144
ffffffffc020a33c:	e506                	sd	ra,136(sp)
ffffffffc020a33e:	e122                	sd	s0,128(sp)
ffffffffc020a340:	fca6                	sd	s1,120(sp)
ffffffffc020a342:	f8ca                	sd	s2,112(sp)
ffffffffc020a344:	f4ce                	sd	s3,104(sp)
ffffffffc020a346:	f0d2                	sd	s4,96(sp)
ffffffffc020a348:	ecd6                	sd	s5,88(sp)
ffffffffc020a34a:	e8da                	sd	s6,80(sp)
ffffffffc020a34c:	e4de                	sd	s7,72(sp)
ffffffffc020a34e:	e0e2                	sd	s8,64(sp)
ffffffffc020a350:	fc66                	sd	s9,56(sp)
ffffffffc020a352:	f86a                	sd	s10,48(sp)
ffffffffc020a354:	f46e                	sd	s11,40(sp)
ffffffffc020a356:	080007b7          	lui	a5,0x8000
ffffffffc020a35a:	16b7e463          	bltu	a5,a1,ffffffffc020a4c2 <sfs_truncfile+0x188>
ffffffffc020a35e:	06853c83          	ld	s9,104(a0)
ffffffffc020a362:	89aa                	mv	s3,a0
ffffffffc020a364:	160c8163          	beqz	s9,ffffffffc020a4c6 <sfs_truncfile+0x18c>
ffffffffc020a368:	0b0ca783          	lw	a5,176(s9) # 10b0 <_binary_bin_swap_img_size-0x6c50>
ffffffffc020a36c:	14079d63          	bnez	a5,ffffffffc020a4c6 <sfs_truncfile+0x18c>
ffffffffc020a370:	4d38                	lw	a4,88(a0)
ffffffffc020a372:	6405                	lui	s0,0x1
ffffffffc020a374:	23540793          	addi	a5,s0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a378:	16f71763          	bne	a4,a5,ffffffffc020a4e6 <sfs_truncfile+0x1ac>
ffffffffc020a37c:	00053a83          	ld	s5,0(a0)
ffffffffc020a380:	147d                	addi	s0,s0,-1
ffffffffc020a382:	942e                	add	s0,s0,a1
ffffffffc020a384:	000ae783          	lwu	a5,0(s5)
ffffffffc020a388:	8031                	srli	s0,s0,0xc
ffffffffc020a38a:	8a2e                	mv	s4,a1
ffffffffc020a38c:	2401                	sext.w	s0,s0
ffffffffc020a38e:	02b79763          	bne	a5,a1,ffffffffc020a3bc <sfs_truncfile+0x82>
ffffffffc020a392:	008aa783          	lw	a5,8(s5)
ffffffffc020a396:	4901                	li	s2,0
ffffffffc020a398:	18879763          	bne	a5,s0,ffffffffc020a526 <sfs_truncfile+0x1ec>
ffffffffc020a39c:	60aa                	ld	ra,136(sp)
ffffffffc020a39e:	640a                	ld	s0,128(sp)
ffffffffc020a3a0:	74e6                	ld	s1,120(sp)
ffffffffc020a3a2:	79a6                	ld	s3,104(sp)
ffffffffc020a3a4:	7a06                	ld	s4,96(sp)
ffffffffc020a3a6:	6ae6                	ld	s5,88(sp)
ffffffffc020a3a8:	6b46                	ld	s6,80(sp)
ffffffffc020a3aa:	6ba6                	ld	s7,72(sp)
ffffffffc020a3ac:	6c06                	ld	s8,64(sp)
ffffffffc020a3ae:	7ce2                	ld	s9,56(sp)
ffffffffc020a3b0:	7d42                	ld	s10,48(sp)
ffffffffc020a3b2:	7da2                	ld	s11,40(sp)
ffffffffc020a3b4:	854a                	mv	a0,s2
ffffffffc020a3b6:	7946                	ld	s2,112(sp)
ffffffffc020a3b8:	6149                	addi	sp,sp,144
ffffffffc020a3ba:	8082                	ret
ffffffffc020a3bc:	02050b13          	addi	s6,a0,32
ffffffffc020a3c0:	855a                	mv	a0,s6
ffffffffc020a3c2:	900fa0ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc020a3c6:	008aa483          	lw	s1,8(s5)
ffffffffc020a3ca:	0a84e663          	bltu	s1,s0,ffffffffc020a476 <sfs_truncfile+0x13c>
ffffffffc020a3ce:	0c947163          	bgeu	s0,s1,ffffffffc020a490 <sfs_truncfile+0x156>
ffffffffc020a3d2:	4dad                	li	s11,11
ffffffffc020a3d4:	4b85                	li	s7,1
ffffffffc020a3d6:	a09d                	j	ffffffffc020a43c <sfs_truncfile+0x102>
ffffffffc020a3d8:	ff37091b          	addiw	s2,a4,-13
ffffffffc020a3dc:	0009079b          	sext.w	a5,s2
ffffffffc020a3e0:	3ff00713          	li	a4,1023
ffffffffc020a3e4:	04f76563          	bltu	a4,a5,ffffffffc020a42e <sfs_truncfile+0xf4>
ffffffffc020a3e8:	03cd2c03          	lw	s8,60(s10)
ffffffffc020a3ec:	040c0163          	beqz	s8,ffffffffc020a42e <sfs_truncfile+0xf4>
ffffffffc020a3f0:	004ca783          	lw	a5,4(s9)
ffffffffc020a3f4:	18fc7963          	bgeu	s8,a5,ffffffffc020a586 <sfs_truncfile+0x24c>
ffffffffc020a3f8:	038cb503          	ld	a0,56(s9)
ffffffffc020a3fc:	85e2                	mv	a1,s8
ffffffffc020a3fe:	b63fe0ef          	jal	ra,ffffffffc0208f60 <bitmap_test>
ffffffffc020a402:	16051263          	bnez	a0,ffffffffc020a566 <sfs_truncfile+0x22c>
ffffffffc020a406:	02091793          	slli	a5,s2,0x20
ffffffffc020a40a:	01e7d713          	srli	a4,a5,0x1e
ffffffffc020a40e:	86e2                	mv	a3,s8
ffffffffc020a410:	4611                	li	a2,4
ffffffffc020a412:	082c                	addi	a1,sp,24
ffffffffc020a414:	8566                	mv	a0,s9
ffffffffc020a416:	e43a                	sd	a4,8(sp)
ffffffffc020a418:	ce02                	sw	zero,28(sp)
ffffffffc020a41a:	043000ef          	jal	ra,ffffffffc020ac5c <sfs_rbuf>
ffffffffc020a41e:	892a                	mv	s2,a0
ffffffffc020a420:	e141                	bnez	a0,ffffffffc020a4a0 <sfs_truncfile+0x166>
ffffffffc020a422:	47e2                	lw	a5,24(sp)
ffffffffc020a424:	6722                	ld	a4,8(sp)
ffffffffc020a426:	e3c9                	bnez	a5,ffffffffc020a4a8 <sfs_truncfile+0x16e>
ffffffffc020a428:	008d2603          	lw	a2,8(s10)
ffffffffc020a42c:	367d                	addiw	a2,a2,-1
ffffffffc020a42e:	00cd2423          	sw	a2,8(s10)
ffffffffc020a432:	0179b823          	sd	s7,16(s3)
ffffffffc020a436:	34fd                	addiw	s1,s1,-1
ffffffffc020a438:	04940a63          	beq	s0,s1,ffffffffc020a48c <sfs_truncfile+0x152>
ffffffffc020a43c:	0009bd03          	ld	s10,0(s3)
ffffffffc020a440:	008d2703          	lw	a4,8(s10)
ffffffffc020a444:	c369                	beqz	a4,ffffffffc020a506 <sfs_truncfile+0x1cc>
ffffffffc020a446:	fff7079b          	addiw	a5,a4,-1
ffffffffc020a44a:	0007861b          	sext.w	a2,a5
ffffffffc020a44e:	f8cde5e3          	bltu	s11,a2,ffffffffc020a3d8 <sfs_truncfile+0x9e>
ffffffffc020a452:	02079713          	slli	a4,a5,0x20
ffffffffc020a456:	01e75793          	srli	a5,a4,0x1e
ffffffffc020a45a:	00fd0933          	add	s2,s10,a5
ffffffffc020a45e:	00c92583          	lw	a1,12(s2)
ffffffffc020a462:	d5f1                	beqz	a1,ffffffffc020a42e <sfs_truncfile+0xf4>
ffffffffc020a464:	8566                	mv	a0,s9
ffffffffc020a466:	c08ff0ef          	jal	ra,ffffffffc020986e <sfs_block_free>
ffffffffc020a46a:	00092623          	sw	zero,12(s2)
ffffffffc020a46e:	008d2603          	lw	a2,8(s10)
ffffffffc020a472:	367d                	addiw	a2,a2,-1
ffffffffc020a474:	bf6d                	j	ffffffffc020a42e <sfs_truncfile+0xf4>
ffffffffc020a476:	4681                	li	a3,0
ffffffffc020a478:	8626                	mv	a2,s1
ffffffffc020a47a:	85ce                	mv	a1,s3
ffffffffc020a47c:	8566                	mv	a0,s9
ffffffffc020a47e:	eaaff0ef          	jal	ra,ffffffffc0209b28 <sfs_bmap_load_nolock>
ffffffffc020a482:	892a                	mv	s2,a0
ffffffffc020a484:	ed11                	bnez	a0,ffffffffc020a4a0 <sfs_truncfile+0x166>
ffffffffc020a486:	2485                	addiw	s1,s1,1
ffffffffc020a488:	fe9417e3          	bne	s0,s1,ffffffffc020a476 <sfs_truncfile+0x13c>
ffffffffc020a48c:	008aa483          	lw	s1,8(s5)
ffffffffc020a490:	0a941b63          	bne	s0,s1,ffffffffc020a546 <sfs_truncfile+0x20c>
ffffffffc020a494:	014aa023          	sw	s4,0(s5)
ffffffffc020a498:	4785                	li	a5,1
ffffffffc020a49a:	00f9b823          	sd	a5,16(s3)
ffffffffc020a49e:	4901                	li	s2,0
ffffffffc020a4a0:	855a                	mv	a0,s6
ffffffffc020a4a2:	81cfa0ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020a4a6:	bddd                	j	ffffffffc020a39c <sfs_truncfile+0x62>
ffffffffc020a4a8:	86e2                	mv	a3,s8
ffffffffc020a4aa:	4611                	li	a2,4
ffffffffc020a4ac:	086c                	addi	a1,sp,28
ffffffffc020a4ae:	8566                	mv	a0,s9
ffffffffc020a4b0:	02d000ef          	jal	ra,ffffffffc020acdc <sfs_wbuf>
ffffffffc020a4b4:	892a                	mv	s2,a0
ffffffffc020a4b6:	f56d                	bnez	a0,ffffffffc020a4a0 <sfs_truncfile+0x166>
ffffffffc020a4b8:	45e2                	lw	a1,24(sp)
ffffffffc020a4ba:	8566                	mv	a0,s9
ffffffffc020a4bc:	bb2ff0ef          	jal	ra,ffffffffc020986e <sfs_block_free>
ffffffffc020a4c0:	b7a5                	j	ffffffffc020a428 <sfs_truncfile+0xee>
ffffffffc020a4c2:	5975                	li	s2,-3
ffffffffc020a4c4:	bde1                	j	ffffffffc020a39c <sfs_truncfile+0x62>
ffffffffc020a4c6:	00004697          	auipc	a3,0x4
ffffffffc020a4ca:	7c268693          	addi	a3,a3,1986 # ffffffffc020ec88 <dev_node_ops+0x3e0>
ffffffffc020a4ce:	00001617          	auipc	a2,0x1
ffffffffc020a4d2:	3fa60613          	addi	a2,a2,1018 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020a4d6:	3b200593          	li	a1,946
ffffffffc020a4da:	00005517          	auipc	a0,0x5
ffffffffc020a4de:	98e50513          	addi	a0,a0,-1650 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a4e2:	fbdf50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a4e6:	00005697          	auipc	a3,0x5
ffffffffc020a4ea:	94a68693          	addi	a3,a3,-1718 # ffffffffc020ee30 <dev_node_ops+0x588>
ffffffffc020a4ee:	00001617          	auipc	a2,0x1
ffffffffc020a4f2:	3da60613          	addi	a2,a2,986 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020a4f6:	3b300593          	li	a1,947
ffffffffc020a4fa:	00005517          	auipc	a0,0x5
ffffffffc020a4fe:	96e50513          	addi	a0,a0,-1682 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a502:	f9df50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a506:	00005697          	auipc	a3,0x5
ffffffffc020a50a:	b8268693          	addi	a3,a3,-1150 # ffffffffc020f088 <dev_node_ops+0x7e0>
ffffffffc020a50e:	00001617          	auipc	a2,0x1
ffffffffc020a512:	3ba60613          	addi	a2,a2,954 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020a516:	17b00593          	li	a1,379
ffffffffc020a51a:	00005517          	auipc	a0,0x5
ffffffffc020a51e:	94e50513          	addi	a0,a0,-1714 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a522:	f7df50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a526:	00005697          	auipc	a3,0x5
ffffffffc020a52a:	b4a68693          	addi	a3,a3,-1206 # ffffffffc020f070 <dev_node_ops+0x7c8>
ffffffffc020a52e:	00001617          	auipc	a2,0x1
ffffffffc020a532:	39a60613          	addi	a2,a2,922 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020a536:	3ba00593          	li	a1,954
ffffffffc020a53a:	00005517          	auipc	a0,0x5
ffffffffc020a53e:	92e50513          	addi	a0,a0,-1746 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a542:	f5df50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a546:	00005697          	auipc	a3,0x5
ffffffffc020a54a:	b9268693          	addi	a3,a3,-1134 # ffffffffc020f0d8 <dev_node_ops+0x830>
ffffffffc020a54e:	00001617          	auipc	a2,0x1
ffffffffc020a552:	37a60613          	addi	a2,a2,890 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020a556:	3d300593          	li	a1,979
ffffffffc020a55a:	00005517          	auipc	a0,0x5
ffffffffc020a55e:	90e50513          	addi	a0,a0,-1778 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a562:	f3df50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a566:	00005697          	auipc	a3,0x5
ffffffffc020a56a:	b3a68693          	addi	a3,a3,-1222 # ffffffffc020f0a0 <dev_node_ops+0x7f8>
ffffffffc020a56e:	00001617          	auipc	a2,0x1
ffffffffc020a572:	35a60613          	addi	a2,a2,858 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020a576:	12b00593          	li	a1,299
ffffffffc020a57a:	00005517          	auipc	a0,0x5
ffffffffc020a57e:	8ee50513          	addi	a0,a0,-1810 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a582:	f1df50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a586:	8762                	mv	a4,s8
ffffffffc020a588:	86be                	mv	a3,a5
ffffffffc020a58a:	00005617          	auipc	a2,0x5
ffffffffc020a58e:	90e60613          	addi	a2,a2,-1778 # ffffffffc020ee98 <dev_node_ops+0x5f0>
ffffffffc020a592:	05300593          	li	a1,83
ffffffffc020a596:	00005517          	auipc	a0,0x5
ffffffffc020a59a:	8d250513          	addi	a0,a0,-1838 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a59e:	f01f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a5a2 <sfs_load_inode>:
ffffffffc020a5a2:	7139                	addi	sp,sp,-64
ffffffffc020a5a4:	fc06                	sd	ra,56(sp)
ffffffffc020a5a6:	f822                	sd	s0,48(sp)
ffffffffc020a5a8:	f426                	sd	s1,40(sp)
ffffffffc020a5aa:	f04a                	sd	s2,32(sp)
ffffffffc020a5ac:	84b2                	mv	s1,a2
ffffffffc020a5ae:	892a                	mv	s2,a0
ffffffffc020a5b0:	ec4e                	sd	s3,24(sp)
ffffffffc020a5b2:	e852                	sd	s4,16(sp)
ffffffffc020a5b4:	89ae                	mv	s3,a1
ffffffffc020a5b6:	e456                	sd	s5,8(sp)
ffffffffc020a5b8:	0d5000ef          	jal	ra,ffffffffc020ae8c <lock_sfs_fs>
ffffffffc020a5bc:	45a9                	li	a1,10
ffffffffc020a5be:	8526                	mv	a0,s1
ffffffffc020a5c0:	0a893403          	ld	s0,168(s2)
ffffffffc020a5c4:	0e9000ef          	jal	ra,ffffffffc020aeac <hash32>
ffffffffc020a5c8:	02051793          	slli	a5,a0,0x20
ffffffffc020a5cc:	01c7d713          	srli	a4,a5,0x1c
ffffffffc020a5d0:	9722                	add	a4,a4,s0
ffffffffc020a5d2:	843a                	mv	s0,a4
ffffffffc020a5d4:	a029                	j	ffffffffc020a5de <sfs_load_inode+0x3c>
ffffffffc020a5d6:	fc042783          	lw	a5,-64(s0)
ffffffffc020a5da:	10978863          	beq	a5,s1,ffffffffc020a6ea <sfs_load_inode+0x148>
ffffffffc020a5de:	6400                	ld	s0,8(s0)
ffffffffc020a5e0:	fe871be3          	bne	a4,s0,ffffffffc020a5d6 <sfs_load_inode+0x34>
ffffffffc020a5e4:	04000513          	li	a0,64
ffffffffc020a5e8:	9a7f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a5ec:	8aaa                	mv	s5,a0
ffffffffc020a5ee:	16050563          	beqz	a0,ffffffffc020a758 <sfs_load_inode+0x1b6>
ffffffffc020a5f2:	00492683          	lw	a3,4(s2)
ffffffffc020a5f6:	18048363          	beqz	s1,ffffffffc020a77c <sfs_load_inode+0x1da>
ffffffffc020a5fa:	18d4f163          	bgeu	s1,a3,ffffffffc020a77c <sfs_load_inode+0x1da>
ffffffffc020a5fe:	03893503          	ld	a0,56(s2)
ffffffffc020a602:	85a6                	mv	a1,s1
ffffffffc020a604:	95dfe0ef          	jal	ra,ffffffffc0208f60 <bitmap_test>
ffffffffc020a608:	18051763          	bnez	a0,ffffffffc020a796 <sfs_load_inode+0x1f4>
ffffffffc020a60c:	4701                	li	a4,0
ffffffffc020a60e:	86a6                	mv	a3,s1
ffffffffc020a610:	04000613          	li	a2,64
ffffffffc020a614:	85d6                	mv	a1,s5
ffffffffc020a616:	854a                	mv	a0,s2
ffffffffc020a618:	644000ef          	jal	ra,ffffffffc020ac5c <sfs_rbuf>
ffffffffc020a61c:	842a                	mv	s0,a0
ffffffffc020a61e:	0e051563          	bnez	a0,ffffffffc020a708 <sfs_load_inode+0x166>
ffffffffc020a622:	006ad783          	lhu	a5,6(s5)
ffffffffc020a626:	12078b63          	beqz	a5,ffffffffc020a75c <sfs_load_inode+0x1ba>
ffffffffc020a62a:	6405                	lui	s0,0x1
ffffffffc020a62c:	23540513          	addi	a0,s0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a630:	8eafd0ef          	jal	ra,ffffffffc020771a <__alloc_inode>
ffffffffc020a634:	8a2a                	mv	s4,a0
ffffffffc020a636:	c961                	beqz	a0,ffffffffc020a706 <sfs_load_inode+0x164>
ffffffffc020a638:	004ad683          	lhu	a3,4(s5)
ffffffffc020a63c:	4785                	li	a5,1
ffffffffc020a63e:	0cf69c63          	bne	a3,a5,ffffffffc020a716 <sfs_load_inode+0x174>
ffffffffc020a642:	864a                	mv	a2,s2
ffffffffc020a644:	00005597          	auipc	a1,0x5
ffffffffc020a648:	ba458593          	addi	a1,a1,-1116 # ffffffffc020f1e8 <sfs_node_fileops>
ffffffffc020a64c:	8eafd0ef          	jal	ra,ffffffffc0207736 <inode_init>
ffffffffc020a650:	058a2783          	lw	a5,88(s4)
ffffffffc020a654:	23540413          	addi	s0,s0,565
ffffffffc020a658:	0e879063          	bne	a5,s0,ffffffffc020a738 <sfs_load_inode+0x196>
ffffffffc020a65c:	4785                	li	a5,1
ffffffffc020a65e:	00fa2c23          	sw	a5,24(s4)
ffffffffc020a662:	015a3023          	sd	s5,0(s4)
ffffffffc020a666:	009a2423          	sw	s1,8(s4)
ffffffffc020a66a:	000a3823          	sd	zero,16(s4)
ffffffffc020a66e:	4585                	li	a1,1
ffffffffc020a670:	020a0513          	addi	a0,s4,32
ffffffffc020a674:	e45f90ef          	jal	ra,ffffffffc02044b8 <sem_init>
ffffffffc020a678:	058a2703          	lw	a4,88(s4)
ffffffffc020a67c:	6785                	lui	a5,0x1
ffffffffc020a67e:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a682:	14f71663          	bne	a4,a5,ffffffffc020a7ce <sfs_load_inode+0x22c>
ffffffffc020a686:	0a093703          	ld	a4,160(s2)
ffffffffc020a68a:	038a0793          	addi	a5,s4,56
ffffffffc020a68e:	008a2503          	lw	a0,8(s4)
ffffffffc020a692:	e31c                	sd	a5,0(a4)
ffffffffc020a694:	0af93023          	sd	a5,160(s2)
ffffffffc020a698:	09890793          	addi	a5,s2,152
ffffffffc020a69c:	0a893403          	ld	s0,168(s2)
ffffffffc020a6a0:	45a9                	li	a1,10
ffffffffc020a6a2:	04ea3023          	sd	a4,64(s4)
ffffffffc020a6a6:	02fa3c23          	sd	a5,56(s4)
ffffffffc020a6aa:	003000ef          	jal	ra,ffffffffc020aeac <hash32>
ffffffffc020a6ae:	02051713          	slli	a4,a0,0x20
ffffffffc020a6b2:	01c75793          	srli	a5,a4,0x1c
ffffffffc020a6b6:	97a2                	add	a5,a5,s0
ffffffffc020a6b8:	6798                	ld	a4,8(a5)
ffffffffc020a6ba:	048a0693          	addi	a3,s4,72
ffffffffc020a6be:	e314                	sd	a3,0(a4)
ffffffffc020a6c0:	e794                	sd	a3,8(a5)
ffffffffc020a6c2:	04ea3823          	sd	a4,80(s4)
ffffffffc020a6c6:	04fa3423          	sd	a5,72(s4)
ffffffffc020a6ca:	854a                	mv	a0,s2
ffffffffc020a6cc:	7d0000ef          	jal	ra,ffffffffc020ae9c <unlock_sfs_fs>
ffffffffc020a6d0:	4401                	li	s0,0
ffffffffc020a6d2:	0149b023          	sd	s4,0(s3)
ffffffffc020a6d6:	70e2                	ld	ra,56(sp)
ffffffffc020a6d8:	8522                	mv	a0,s0
ffffffffc020a6da:	7442                	ld	s0,48(sp)
ffffffffc020a6dc:	74a2                	ld	s1,40(sp)
ffffffffc020a6de:	7902                	ld	s2,32(sp)
ffffffffc020a6e0:	69e2                	ld	s3,24(sp)
ffffffffc020a6e2:	6a42                	ld	s4,16(sp)
ffffffffc020a6e4:	6aa2                	ld	s5,8(sp)
ffffffffc020a6e6:	6121                	addi	sp,sp,64
ffffffffc020a6e8:	8082                	ret
ffffffffc020a6ea:	fb840a13          	addi	s4,s0,-72
ffffffffc020a6ee:	8552                	mv	a0,s4
ffffffffc020a6f0:	8a8fd0ef          	jal	ra,ffffffffc0207798 <inode_ref_inc>
ffffffffc020a6f4:	4785                	li	a5,1
ffffffffc020a6f6:	fcf51ae3          	bne	a0,a5,ffffffffc020a6ca <sfs_load_inode+0x128>
ffffffffc020a6fa:	fd042783          	lw	a5,-48(s0)
ffffffffc020a6fe:	2785                	addiw	a5,a5,1
ffffffffc020a700:	fcf42823          	sw	a5,-48(s0)
ffffffffc020a704:	b7d9                	j	ffffffffc020a6ca <sfs_load_inode+0x128>
ffffffffc020a706:	5471                	li	s0,-4
ffffffffc020a708:	8556                	mv	a0,s5
ffffffffc020a70a:	935f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a70e:	854a                	mv	a0,s2
ffffffffc020a710:	78c000ef          	jal	ra,ffffffffc020ae9c <unlock_sfs_fs>
ffffffffc020a714:	b7c9                	j	ffffffffc020a6d6 <sfs_load_inode+0x134>
ffffffffc020a716:	4789                	li	a5,2
ffffffffc020a718:	08f69f63          	bne	a3,a5,ffffffffc020a7b6 <sfs_load_inode+0x214>
ffffffffc020a71c:	864a                	mv	a2,s2
ffffffffc020a71e:	00005597          	auipc	a1,0x5
ffffffffc020a722:	a4a58593          	addi	a1,a1,-1462 # ffffffffc020f168 <sfs_node_dirops>
ffffffffc020a726:	810fd0ef          	jal	ra,ffffffffc0207736 <inode_init>
ffffffffc020a72a:	058a2703          	lw	a4,88(s4)
ffffffffc020a72e:	6785                	lui	a5,0x1
ffffffffc020a730:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a734:	f2f704e3          	beq	a4,a5,ffffffffc020a65c <sfs_load_inode+0xba>
ffffffffc020a738:	00004697          	auipc	a3,0x4
ffffffffc020a73c:	6f868693          	addi	a3,a3,1784 # ffffffffc020ee30 <dev_node_ops+0x588>
ffffffffc020a740:	00001617          	auipc	a2,0x1
ffffffffc020a744:	18860613          	addi	a2,a2,392 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020a748:	07700593          	li	a1,119
ffffffffc020a74c:	00004517          	auipc	a0,0x4
ffffffffc020a750:	71c50513          	addi	a0,a0,1820 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a754:	d4bf50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a758:	5471                	li	s0,-4
ffffffffc020a75a:	bf55                	j	ffffffffc020a70e <sfs_load_inode+0x16c>
ffffffffc020a75c:	00005697          	auipc	a3,0x5
ffffffffc020a760:	99468693          	addi	a3,a3,-1644 # ffffffffc020f0f0 <dev_node_ops+0x848>
ffffffffc020a764:	00001617          	auipc	a2,0x1
ffffffffc020a768:	16460613          	addi	a2,a2,356 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020a76c:	0ad00593          	li	a1,173
ffffffffc020a770:	00004517          	auipc	a0,0x4
ffffffffc020a774:	6f850513          	addi	a0,a0,1784 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a778:	d27f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a77c:	8726                	mv	a4,s1
ffffffffc020a77e:	00004617          	auipc	a2,0x4
ffffffffc020a782:	71a60613          	addi	a2,a2,1818 # ffffffffc020ee98 <dev_node_ops+0x5f0>
ffffffffc020a786:	05300593          	li	a1,83
ffffffffc020a78a:	00004517          	auipc	a0,0x4
ffffffffc020a78e:	6de50513          	addi	a0,a0,1758 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a792:	d0df50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a796:	00004697          	auipc	a3,0x4
ffffffffc020a79a:	73a68693          	addi	a3,a3,1850 # ffffffffc020eed0 <dev_node_ops+0x628>
ffffffffc020a79e:	00001617          	auipc	a2,0x1
ffffffffc020a7a2:	12a60613          	addi	a2,a2,298 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020a7a6:	0a800593          	li	a1,168
ffffffffc020a7aa:	00004517          	auipc	a0,0x4
ffffffffc020a7ae:	6be50513          	addi	a0,a0,1726 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a7b2:	cedf50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a7b6:	00004617          	auipc	a2,0x4
ffffffffc020a7ba:	6ca60613          	addi	a2,a2,1738 # ffffffffc020ee80 <dev_node_ops+0x5d8>
ffffffffc020a7be:	02e00593          	li	a1,46
ffffffffc020a7c2:	00004517          	auipc	a0,0x4
ffffffffc020a7c6:	6a650513          	addi	a0,a0,1702 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a7ca:	cd5f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a7ce:	00004697          	auipc	a3,0x4
ffffffffc020a7d2:	66268693          	addi	a3,a3,1634 # ffffffffc020ee30 <dev_node_ops+0x588>
ffffffffc020a7d6:	00001617          	auipc	a2,0x1
ffffffffc020a7da:	0f260613          	addi	a2,a2,242 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020a7de:	0b100593          	li	a1,177
ffffffffc020a7e2:	00004517          	auipc	a0,0x4
ffffffffc020a7e6:	68650513          	addi	a0,a0,1670 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a7ea:	cb5f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a7ee <sfs_lookup>:
ffffffffc020a7ee:	7139                	addi	sp,sp,-64
ffffffffc020a7f0:	ec4e                	sd	s3,24(sp)
ffffffffc020a7f2:	06853983          	ld	s3,104(a0)
ffffffffc020a7f6:	fc06                	sd	ra,56(sp)
ffffffffc020a7f8:	f822                	sd	s0,48(sp)
ffffffffc020a7fa:	f426                	sd	s1,40(sp)
ffffffffc020a7fc:	f04a                	sd	s2,32(sp)
ffffffffc020a7fe:	e852                	sd	s4,16(sp)
ffffffffc020a800:	0a098c63          	beqz	s3,ffffffffc020a8b8 <sfs_lookup+0xca>
ffffffffc020a804:	0b09a783          	lw	a5,176(s3)
ffffffffc020a808:	ebc5                	bnez	a5,ffffffffc020a8b8 <sfs_lookup+0xca>
ffffffffc020a80a:	0005c783          	lbu	a5,0(a1)
ffffffffc020a80e:	84ae                	mv	s1,a1
ffffffffc020a810:	c7c1                	beqz	a5,ffffffffc020a898 <sfs_lookup+0xaa>
ffffffffc020a812:	02f00713          	li	a4,47
ffffffffc020a816:	08e78163          	beq	a5,a4,ffffffffc020a898 <sfs_lookup+0xaa>
ffffffffc020a81a:	842a                	mv	s0,a0
ffffffffc020a81c:	8a32                	mv	s4,a2
ffffffffc020a81e:	f7bfc0ef          	jal	ra,ffffffffc0207798 <inode_ref_inc>
ffffffffc020a822:	4c38                	lw	a4,88(s0)
ffffffffc020a824:	6785                	lui	a5,0x1
ffffffffc020a826:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a82a:	0af71763          	bne	a4,a5,ffffffffc020a8d8 <sfs_lookup+0xea>
ffffffffc020a82e:	6018                	ld	a4,0(s0)
ffffffffc020a830:	4789                	li	a5,2
ffffffffc020a832:	00475703          	lhu	a4,4(a4)
ffffffffc020a836:	04f71c63          	bne	a4,a5,ffffffffc020a88e <sfs_lookup+0xa0>
ffffffffc020a83a:	02040913          	addi	s2,s0,32
ffffffffc020a83e:	854a                	mv	a0,s2
ffffffffc020a840:	c83f90ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc020a844:	8626                	mv	a2,s1
ffffffffc020a846:	0054                	addi	a3,sp,4
ffffffffc020a848:	85a2                	mv	a1,s0
ffffffffc020a84a:	854e                	mv	a0,s3
ffffffffc020a84c:	a29ff0ef          	jal	ra,ffffffffc020a274 <sfs_dirent_search_nolock.constprop.0>
ffffffffc020a850:	84aa                	mv	s1,a0
ffffffffc020a852:	854a                	mv	a0,s2
ffffffffc020a854:	c6bf90ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020a858:	cc89                	beqz	s1,ffffffffc020a872 <sfs_lookup+0x84>
ffffffffc020a85a:	8522                	mv	a0,s0
ffffffffc020a85c:	80afd0ef          	jal	ra,ffffffffc0207866 <inode_ref_dec>
ffffffffc020a860:	70e2                	ld	ra,56(sp)
ffffffffc020a862:	7442                	ld	s0,48(sp)
ffffffffc020a864:	7902                	ld	s2,32(sp)
ffffffffc020a866:	69e2                	ld	s3,24(sp)
ffffffffc020a868:	6a42                	ld	s4,16(sp)
ffffffffc020a86a:	8526                	mv	a0,s1
ffffffffc020a86c:	74a2                	ld	s1,40(sp)
ffffffffc020a86e:	6121                	addi	sp,sp,64
ffffffffc020a870:	8082                	ret
ffffffffc020a872:	4612                	lw	a2,4(sp)
ffffffffc020a874:	002c                	addi	a1,sp,8
ffffffffc020a876:	854e                	mv	a0,s3
ffffffffc020a878:	d2bff0ef          	jal	ra,ffffffffc020a5a2 <sfs_load_inode>
ffffffffc020a87c:	84aa                	mv	s1,a0
ffffffffc020a87e:	8522                	mv	a0,s0
ffffffffc020a880:	fe7fc0ef          	jal	ra,ffffffffc0207866 <inode_ref_dec>
ffffffffc020a884:	fcf1                	bnez	s1,ffffffffc020a860 <sfs_lookup+0x72>
ffffffffc020a886:	67a2                	ld	a5,8(sp)
ffffffffc020a888:	00fa3023          	sd	a5,0(s4)
ffffffffc020a88c:	bfd1                	j	ffffffffc020a860 <sfs_lookup+0x72>
ffffffffc020a88e:	8522                	mv	a0,s0
ffffffffc020a890:	fd7fc0ef          	jal	ra,ffffffffc0207866 <inode_ref_dec>
ffffffffc020a894:	54b9                	li	s1,-18
ffffffffc020a896:	b7e9                	j	ffffffffc020a860 <sfs_lookup+0x72>
ffffffffc020a898:	00005697          	auipc	a3,0x5
ffffffffc020a89c:	87068693          	addi	a3,a3,-1936 # ffffffffc020f108 <dev_node_ops+0x860>
ffffffffc020a8a0:	00001617          	auipc	a2,0x1
ffffffffc020a8a4:	02860613          	addi	a2,a2,40 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020a8a8:	3e400593          	li	a1,996
ffffffffc020a8ac:	00004517          	auipc	a0,0x4
ffffffffc020a8b0:	5bc50513          	addi	a0,a0,1468 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a8b4:	bebf50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a8b8:	00004697          	auipc	a3,0x4
ffffffffc020a8bc:	3d068693          	addi	a3,a3,976 # ffffffffc020ec88 <dev_node_ops+0x3e0>
ffffffffc020a8c0:	00001617          	auipc	a2,0x1
ffffffffc020a8c4:	00860613          	addi	a2,a2,8 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020a8c8:	3e300593          	li	a1,995
ffffffffc020a8cc:	00004517          	auipc	a0,0x4
ffffffffc020a8d0:	59c50513          	addi	a0,a0,1436 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a8d4:	bcbf50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a8d8:	00004697          	auipc	a3,0x4
ffffffffc020a8dc:	55868693          	addi	a3,a3,1368 # ffffffffc020ee30 <dev_node_ops+0x588>
ffffffffc020a8e0:	00001617          	auipc	a2,0x1
ffffffffc020a8e4:	fe860613          	addi	a2,a2,-24 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020a8e8:	3e600593          	li	a1,998
ffffffffc020a8ec:	00004517          	auipc	a0,0x4
ffffffffc020a8f0:	57c50513          	addi	a0,a0,1404 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020a8f4:	babf50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a8f8 <sfs_namefile>:
ffffffffc020a8f8:	6d98                	ld	a4,24(a1)
ffffffffc020a8fa:	7175                	addi	sp,sp,-144
ffffffffc020a8fc:	e506                	sd	ra,136(sp)
ffffffffc020a8fe:	e122                	sd	s0,128(sp)
ffffffffc020a900:	fca6                	sd	s1,120(sp)
ffffffffc020a902:	f8ca                	sd	s2,112(sp)
ffffffffc020a904:	f4ce                	sd	s3,104(sp)
ffffffffc020a906:	f0d2                	sd	s4,96(sp)
ffffffffc020a908:	ecd6                	sd	s5,88(sp)
ffffffffc020a90a:	e8da                	sd	s6,80(sp)
ffffffffc020a90c:	e4de                	sd	s7,72(sp)
ffffffffc020a90e:	e0e2                	sd	s8,64(sp)
ffffffffc020a910:	fc66                	sd	s9,56(sp)
ffffffffc020a912:	f86a                	sd	s10,48(sp)
ffffffffc020a914:	f46e                	sd	s11,40(sp)
ffffffffc020a916:	e42e                	sd	a1,8(sp)
ffffffffc020a918:	4789                	li	a5,2
ffffffffc020a91a:	1ae7f363          	bgeu	a5,a4,ffffffffc020aac0 <sfs_namefile+0x1c8>
ffffffffc020a91e:	89aa                	mv	s3,a0
ffffffffc020a920:	10400513          	li	a0,260
ffffffffc020a924:	e6af70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a928:	842a                	mv	s0,a0
ffffffffc020a92a:	18050b63          	beqz	a0,ffffffffc020aac0 <sfs_namefile+0x1c8>
ffffffffc020a92e:	0689b483          	ld	s1,104(s3)
ffffffffc020a932:	1e048963          	beqz	s1,ffffffffc020ab24 <sfs_namefile+0x22c>
ffffffffc020a936:	0b04a783          	lw	a5,176(s1)
ffffffffc020a93a:	1e079563          	bnez	a5,ffffffffc020ab24 <sfs_namefile+0x22c>
ffffffffc020a93e:	0589ac83          	lw	s9,88(s3)
ffffffffc020a942:	6785                	lui	a5,0x1
ffffffffc020a944:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a948:	1afc9e63          	bne	s9,a5,ffffffffc020ab04 <sfs_namefile+0x20c>
ffffffffc020a94c:	6722                	ld	a4,8(sp)
ffffffffc020a94e:	854e                	mv	a0,s3
ffffffffc020a950:	8ace                	mv	s5,s3
ffffffffc020a952:	6f1c                	ld	a5,24(a4)
ffffffffc020a954:	00073b03          	ld	s6,0(a4)
ffffffffc020a958:	02098a13          	addi	s4,s3,32
ffffffffc020a95c:	ffe78b93          	addi	s7,a5,-2
ffffffffc020a960:	9b3e                	add	s6,s6,a5
ffffffffc020a962:	00004d17          	auipc	s10,0x4
ffffffffc020a966:	7c6d0d13          	addi	s10,s10,1990 # ffffffffc020f128 <dev_node_ops+0x880>
ffffffffc020a96a:	e2ffc0ef          	jal	ra,ffffffffc0207798 <inode_ref_inc>
ffffffffc020a96e:	00440c13          	addi	s8,s0,4
ffffffffc020a972:	e066                	sd	s9,0(sp)
ffffffffc020a974:	8552                	mv	a0,s4
ffffffffc020a976:	b4df90ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc020a97a:	0854                	addi	a3,sp,20
ffffffffc020a97c:	866a                	mv	a2,s10
ffffffffc020a97e:	85d6                	mv	a1,s5
ffffffffc020a980:	8526                	mv	a0,s1
ffffffffc020a982:	8f3ff0ef          	jal	ra,ffffffffc020a274 <sfs_dirent_search_nolock.constprop.0>
ffffffffc020a986:	8daa                	mv	s11,a0
ffffffffc020a988:	8552                	mv	a0,s4
ffffffffc020a98a:	b35f90ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020a98e:	020d8863          	beqz	s11,ffffffffc020a9be <sfs_namefile+0xc6>
ffffffffc020a992:	854e                	mv	a0,s3
ffffffffc020a994:	ed3fc0ef          	jal	ra,ffffffffc0207866 <inode_ref_dec>
ffffffffc020a998:	8522                	mv	a0,s0
ffffffffc020a99a:	ea4f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a99e:	60aa                	ld	ra,136(sp)
ffffffffc020a9a0:	640a                	ld	s0,128(sp)
ffffffffc020a9a2:	74e6                	ld	s1,120(sp)
ffffffffc020a9a4:	7946                	ld	s2,112(sp)
ffffffffc020a9a6:	79a6                	ld	s3,104(sp)
ffffffffc020a9a8:	7a06                	ld	s4,96(sp)
ffffffffc020a9aa:	6ae6                	ld	s5,88(sp)
ffffffffc020a9ac:	6b46                	ld	s6,80(sp)
ffffffffc020a9ae:	6ba6                	ld	s7,72(sp)
ffffffffc020a9b0:	6c06                	ld	s8,64(sp)
ffffffffc020a9b2:	7ce2                	ld	s9,56(sp)
ffffffffc020a9b4:	7d42                	ld	s10,48(sp)
ffffffffc020a9b6:	856e                	mv	a0,s11
ffffffffc020a9b8:	7da2                	ld	s11,40(sp)
ffffffffc020a9ba:	6149                	addi	sp,sp,144
ffffffffc020a9bc:	8082                	ret
ffffffffc020a9be:	4652                	lw	a2,20(sp)
ffffffffc020a9c0:	082c                	addi	a1,sp,24
ffffffffc020a9c2:	8526                	mv	a0,s1
ffffffffc020a9c4:	bdfff0ef          	jal	ra,ffffffffc020a5a2 <sfs_load_inode>
ffffffffc020a9c8:	8daa                	mv	s11,a0
ffffffffc020a9ca:	f561                	bnez	a0,ffffffffc020a992 <sfs_namefile+0x9a>
ffffffffc020a9cc:	854e                	mv	a0,s3
ffffffffc020a9ce:	008aa903          	lw	s2,8(s5)
ffffffffc020a9d2:	e95fc0ef          	jal	ra,ffffffffc0207866 <inode_ref_dec>
ffffffffc020a9d6:	6ce2                	ld	s9,24(sp)
ffffffffc020a9d8:	0b3c8463          	beq	s9,s3,ffffffffc020aa80 <sfs_namefile+0x188>
ffffffffc020a9dc:	100c8463          	beqz	s9,ffffffffc020aae4 <sfs_namefile+0x1ec>
ffffffffc020a9e0:	058ca703          	lw	a4,88(s9)
ffffffffc020a9e4:	6782                	ld	a5,0(sp)
ffffffffc020a9e6:	0ef71f63          	bne	a4,a5,ffffffffc020aae4 <sfs_namefile+0x1ec>
ffffffffc020a9ea:	008ca703          	lw	a4,8(s9)
ffffffffc020a9ee:	8ae6                	mv	s5,s9
ffffffffc020a9f0:	0d270a63          	beq	a4,s2,ffffffffc020aac4 <sfs_namefile+0x1cc>
ffffffffc020a9f4:	000cb703          	ld	a4,0(s9)
ffffffffc020a9f8:	4789                	li	a5,2
ffffffffc020a9fa:	00475703          	lhu	a4,4(a4)
ffffffffc020a9fe:	0cf71363          	bne	a4,a5,ffffffffc020aac4 <sfs_namefile+0x1cc>
ffffffffc020aa02:	020c8a13          	addi	s4,s9,32
ffffffffc020aa06:	8552                	mv	a0,s4
ffffffffc020aa08:	abbf90ef          	jal	ra,ffffffffc02044c2 <down>
ffffffffc020aa0c:	000cb703          	ld	a4,0(s9)
ffffffffc020aa10:	00872983          	lw	s3,8(a4)
ffffffffc020aa14:	01304963          	bgtz	s3,ffffffffc020aa26 <sfs_namefile+0x12e>
ffffffffc020aa18:	a899                	j	ffffffffc020aa6e <sfs_namefile+0x176>
ffffffffc020aa1a:	4018                	lw	a4,0(s0)
ffffffffc020aa1c:	01270e63          	beq	a4,s2,ffffffffc020aa38 <sfs_namefile+0x140>
ffffffffc020aa20:	2d85                	addiw	s11,s11,1
ffffffffc020aa22:	05b98663          	beq	s3,s11,ffffffffc020aa6e <sfs_namefile+0x176>
ffffffffc020aa26:	86a2                	mv	a3,s0
ffffffffc020aa28:	866e                	mv	a2,s11
ffffffffc020aa2a:	85e6                	mv	a1,s9
ffffffffc020aa2c:	8526                	mv	a0,s1
ffffffffc020aa2e:	e48ff0ef          	jal	ra,ffffffffc020a076 <sfs_dirent_read_nolock>
ffffffffc020aa32:	872a                	mv	a4,a0
ffffffffc020aa34:	d17d                	beqz	a0,ffffffffc020aa1a <sfs_namefile+0x122>
ffffffffc020aa36:	a82d                	j	ffffffffc020aa70 <sfs_namefile+0x178>
ffffffffc020aa38:	8552                	mv	a0,s4
ffffffffc020aa3a:	a85f90ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020aa3e:	8562                	mv	a0,s8
ffffffffc020aa40:	0ff000ef          	jal	ra,ffffffffc020b33e <strlen>
ffffffffc020aa44:	00150793          	addi	a5,a0,1
ffffffffc020aa48:	862a                	mv	a2,a0
ffffffffc020aa4a:	06fbe863          	bltu	s7,a5,ffffffffc020aaba <sfs_namefile+0x1c2>
ffffffffc020aa4e:	fff64913          	not	s2,a2
ffffffffc020aa52:	995a                	add	s2,s2,s6
ffffffffc020aa54:	85e2                	mv	a1,s8
ffffffffc020aa56:	854a                	mv	a0,s2
ffffffffc020aa58:	40fb8bb3          	sub	s7,s7,a5
ffffffffc020aa5c:	1d7000ef          	jal	ra,ffffffffc020b432 <memcpy>
ffffffffc020aa60:	02f00793          	li	a5,47
ffffffffc020aa64:	fefb0fa3          	sb	a5,-1(s6)
ffffffffc020aa68:	89e6                	mv	s3,s9
ffffffffc020aa6a:	8b4a                	mv	s6,s2
ffffffffc020aa6c:	b721                	j	ffffffffc020a974 <sfs_namefile+0x7c>
ffffffffc020aa6e:	5741                	li	a4,-16
ffffffffc020aa70:	8552                	mv	a0,s4
ffffffffc020aa72:	e03a                	sd	a4,0(sp)
ffffffffc020aa74:	a4bf90ef          	jal	ra,ffffffffc02044be <up>
ffffffffc020aa78:	6702                	ld	a4,0(sp)
ffffffffc020aa7a:	89e6                	mv	s3,s9
ffffffffc020aa7c:	8dba                	mv	s11,a4
ffffffffc020aa7e:	bf11                	j	ffffffffc020a992 <sfs_namefile+0x9a>
ffffffffc020aa80:	854e                	mv	a0,s3
ffffffffc020aa82:	de5fc0ef          	jal	ra,ffffffffc0207866 <inode_ref_dec>
ffffffffc020aa86:	64a2                	ld	s1,8(sp)
ffffffffc020aa88:	85da                	mv	a1,s6
ffffffffc020aa8a:	6c98                	ld	a4,24(s1)
ffffffffc020aa8c:	6088                	ld	a0,0(s1)
ffffffffc020aa8e:	1779                	addi	a4,a4,-2
ffffffffc020aa90:	41770bb3          	sub	s7,a4,s7
ffffffffc020aa94:	865e                	mv	a2,s7
ffffffffc020aa96:	0505                	addi	a0,a0,1
ffffffffc020aa98:	15b000ef          	jal	ra,ffffffffc020b3f2 <memmove>
ffffffffc020aa9c:	02f00713          	li	a4,47
ffffffffc020aaa0:	fee50fa3          	sb	a4,-1(a0)
ffffffffc020aaa4:	955e                	add	a0,a0,s7
ffffffffc020aaa6:	00050023          	sb	zero,0(a0)
ffffffffc020aaaa:	85de                	mv	a1,s7
ffffffffc020aaac:	8526                	mv	a0,s1
ffffffffc020aaae:	909fa0ef          	jal	ra,ffffffffc02053b6 <iobuf_skip>
ffffffffc020aab2:	8522                	mv	a0,s0
ffffffffc020aab4:	d8af70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020aab8:	b5dd                	j	ffffffffc020a99e <sfs_namefile+0xa6>
ffffffffc020aaba:	89e6                	mv	s3,s9
ffffffffc020aabc:	5df1                	li	s11,-4
ffffffffc020aabe:	bdd1                	j	ffffffffc020a992 <sfs_namefile+0x9a>
ffffffffc020aac0:	5df1                	li	s11,-4
ffffffffc020aac2:	bdf1                	j	ffffffffc020a99e <sfs_namefile+0xa6>
ffffffffc020aac4:	00004697          	auipc	a3,0x4
ffffffffc020aac8:	66c68693          	addi	a3,a3,1644 # ffffffffc020f130 <dev_node_ops+0x888>
ffffffffc020aacc:	00001617          	auipc	a2,0x1
ffffffffc020aad0:	dfc60613          	addi	a2,a2,-516 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020aad4:	30200593          	li	a1,770
ffffffffc020aad8:	00004517          	auipc	a0,0x4
ffffffffc020aadc:	39050513          	addi	a0,a0,912 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020aae0:	9bff50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020aae4:	00004697          	auipc	a3,0x4
ffffffffc020aae8:	34c68693          	addi	a3,a3,844 # ffffffffc020ee30 <dev_node_ops+0x588>
ffffffffc020aaec:	00001617          	auipc	a2,0x1
ffffffffc020aaf0:	ddc60613          	addi	a2,a2,-548 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020aaf4:	30100593          	li	a1,769
ffffffffc020aaf8:	00004517          	auipc	a0,0x4
ffffffffc020aafc:	37050513          	addi	a0,a0,880 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020ab00:	99ff50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ab04:	00004697          	auipc	a3,0x4
ffffffffc020ab08:	32c68693          	addi	a3,a3,812 # ffffffffc020ee30 <dev_node_ops+0x588>
ffffffffc020ab0c:	00001617          	auipc	a2,0x1
ffffffffc020ab10:	dbc60613          	addi	a2,a2,-580 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020ab14:	2ee00593          	li	a1,750
ffffffffc020ab18:	00004517          	auipc	a0,0x4
ffffffffc020ab1c:	35050513          	addi	a0,a0,848 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020ab20:	97ff50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ab24:	00004697          	auipc	a3,0x4
ffffffffc020ab28:	16468693          	addi	a3,a3,356 # ffffffffc020ec88 <dev_node_ops+0x3e0>
ffffffffc020ab2c:	00001617          	auipc	a2,0x1
ffffffffc020ab30:	d9c60613          	addi	a2,a2,-612 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020ab34:	2ed00593          	li	a1,749
ffffffffc020ab38:	00004517          	auipc	a0,0x4
ffffffffc020ab3c:	33050513          	addi	a0,a0,816 # ffffffffc020ee68 <dev_node_ops+0x5c0>
ffffffffc020ab40:	95ff50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020ab44 <sfs_rwblock_nolock>:
ffffffffc020ab44:	7139                	addi	sp,sp,-64
ffffffffc020ab46:	f822                	sd	s0,48(sp)
ffffffffc020ab48:	f426                	sd	s1,40(sp)
ffffffffc020ab4a:	fc06                	sd	ra,56(sp)
ffffffffc020ab4c:	842a                	mv	s0,a0
ffffffffc020ab4e:	84b6                	mv	s1,a3
ffffffffc020ab50:	e211                	bnez	a2,ffffffffc020ab54 <sfs_rwblock_nolock+0x10>
ffffffffc020ab52:	e715                	bnez	a4,ffffffffc020ab7e <sfs_rwblock_nolock+0x3a>
ffffffffc020ab54:	405c                	lw	a5,4(s0)
ffffffffc020ab56:	02f67463          	bgeu	a2,a5,ffffffffc020ab7e <sfs_rwblock_nolock+0x3a>
ffffffffc020ab5a:	00c6169b          	slliw	a3,a2,0xc
ffffffffc020ab5e:	1682                	slli	a3,a3,0x20
ffffffffc020ab60:	6605                	lui	a2,0x1
ffffffffc020ab62:	9281                	srli	a3,a3,0x20
ffffffffc020ab64:	850a                	mv	a0,sp
ffffffffc020ab66:	fdafa0ef          	jal	ra,ffffffffc0205340 <iobuf_init>
ffffffffc020ab6a:	85aa                	mv	a1,a0
ffffffffc020ab6c:	7808                	ld	a0,48(s0)
ffffffffc020ab6e:	8626                	mv	a2,s1
ffffffffc020ab70:	7118                	ld	a4,32(a0)
ffffffffc020ab72:	9702                	jalr	a4
ffffffffc020ab74:	70e2                	ld	ra,56(sp)
ffffffffc020ab76:	7442                	ld	s0,48(sp)
ffffffffc020ab78:	74a2                	ld	s1,40(sp)
ffffffffc020ab7a:	6121                	addi	sp,sp,64
ffffffffc020ab7c:	8082                	ret
ffffffffc020ab7e:	00004697          	auipc	a3,0x4
ffffffffc020ab82:	6ea68693          	addi	a3,a3,1770 # ffffffffc020f268 <sfs_node_fileops+0x80>
ffffffffc020ab86:	00001617          	auipc	a2,0x1
ffffffffc020ab8a:	d4260613          	addi	a2,a2,-702 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020ab8e:	45d5                	li	a1,21
ffffffffc020ab90:	00004517          	auipc	a0,0x4
ffffffffc020ab94:	71050513          	addi	a0,a0,1808 # ffffffffc020f2a0 <sfs_node_fileops+0xb8>
ffffffffc020ab98:	907f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020ab9c <sfs_rblock>:
ffffffffc020ab9c:	7139                	addi	sp,sp,-64
ffffffffc020ab9e:	ec4e                	sd	s3,24(sp)
ffffffffc020aba0:	89b6                	mv	s3,a3
ffffffffc020aba2:	f822                	sd	s0,48(sp)
ffffffffc020aba4:	f04a                	sd	s2,32(sp)
ffffffffc020aba6:	e852                	sd	s4,16(sp)
ffffffffc020aba8:	fc06                	sd	ra,56(sp)
ffffffffc020abaa:	f426                	sd	s1,40(sp)
ffffffffc020abac:	e456                	sd	s5,8(sp)
ffffffffc020abae:	8a2a                	mv	s4,a0
ffffffffc020abb0:	892e                	mv	s2,a1
ffffffffc020abb2:	8432                	mv	s0,a2
ffffffffc020abb4:	2e0000ef          	jal	ra,ffffffffc020ae94 <lock_sfs_io>
ffffffffc020abb8:	04098063          	beqz	s3,ffffffffc020abf8 <sfs_rblock+0x5c>
ffffffffc020abbc:	013409bb          	addw	s3,s0,s3
ffffffffc020abc0:	6a85                	lui	s5,0x1
ffffffffc020abc2:	a021                	j	ffffffffc020abca <sfs_rblock+0x2e>
ffffffffc020abc4:	9956                	add	s2,s2,s5
ffffffffc020abc6:	02898963          	beq	s3,s0,ffffffffc020abf8 <sfs_rblock+0x5c>
ffffffffc020abca:	8622                	mv	a2,s0
ffffffffc020abcc:	85ca                	mv	a1,s2
ffffffffc020abce:	4705                	li	a4,1
ffffffffc020abd0:	4681                	li	a3,0
ffffffffc020abd2:	8552                	mv	a0,s4
ffffffffc020abd4:	f71ff0ef          	jal	ra,ffffffffc020ab44 <sfs_rwblock_nolock>
ffffffffc020abd8:	84aa                	mv	s1,a0
ffffffffc020abda:	2405                	addiw	s0,s0,1
ffffffffc020abdc:	d565                	beqz	a0,ffffffffc020abc4 <sfs_rblock+0x28>
ffffffffc020abde:	8552                	mv	a0,s4
ffffffffc020abe0:	2c4000ef          	jal	ra,ffffffffc020aea4 <unlock_sfs_io>
ffffffffc020abe4:	70e2                	ld	ra,56(sp)
ffffffffc020abe6:	7442                	ld	s0,48(sp)
ffffffffc020abe8:	7902                	ld	s2,32(sp)
ffffffffc020abea:	69e2                	ld	s3,24(sp)
ffffffffc020abec:	6a42                	ld	s4,16(sp)
ffffffffc020abee:	6aa2                	ld	s5,8(sp)
ffffffffc020abf0:	8526                	mv	a0,s1
ffffffffc020abf2:	74a2                	ld	s1,40(sp)
ffffffffc020abf4:	6121                	addi	sp,sp,64
ffffffffc020abf6:	8082                	ret
ffffffffc020abf8:	4481                	li	s1,0
ffffffffc020abfa:	b7d5                	j	ffffffffc020abde <sfs_rblock+0x42>

ffffffffc020abfc <sfs_wblock>:
ffffffffc020abfc:	7139                	addi	sp,sp,-64
ffffffffc020abfe:	ec4e                	sd	s3,24(sp)
ffffffffc020ac00:	89b6                	mv	s3,a3
ffffffffc020ac02:	f822                	sd	s0,48(sp)
ffffffffc020ac04:	f04a                	sd	s2,32(sp)
ffffffffc020ac06:	e852                	sd	s4,16(sp)
ffffffffc020ac08:	fc06                	sd	ra,56(sp)
ffffffffc020ac0a:	f426                	sd	s1,40(sp)
ffffffffc020ac0c:	e456                	sd	s5,8(sp)
ffffffffc020ac0e:	8a2a                	mv	s4,a0
ffffffffc020ac10:	892e                	mv	s2,a1
ffffffffc020ac12:	8432                	mv	s0,a2
ffffffffc020ac14:	280000ef          	jal	ra,ffffffffc020ae94 <lock_sfs_io>
ffffffffc020ac18:	04098063          	beqz	s3,ffffffffc020ac58 <sfs_wblock+0x5c>
ffffffffc020ac1c:	013409bb          	addw	s3,s0,s3
ffffffffc020ac20:	6a85                	lui	s5,0x1
ffffffffc020ac22:	a021                	j	ffffffffc020ac2a <sfs_wblock+0x2e>
ffffffffc020ac24:	9956                	add	s2,s2,s5
ffffffffc020ac26:	02898963          	beq	s3,s0,ffffffffc020ac58 <sfs_wblock+0x5c>
ffffffffc020ac2a:	8622                	mv	a2,s0
ffffffffc020ac2c:	85ca                	mv	a1,s2
ffffffffc020ac2e:	4705                	li	a4,1
ffffffffc020ac30:	4685                	li	a3,1
ffffffffc020ac32:	8552                	mv	a0,s4
ffffffffc020ac34:	f11ff0ef          	jal	ra,ffffffffc020ab44 <sfs_rwblock_nolock>
ffffffffc020ac38:	84aa                	mv	s1,a0
ffffffffc020ac3a:	2405                	addiw	s0,s0,1
ffffffffc020ac3c:	d565                	beqz	a0,ffffffffc020ac24 <sfs_wblock+0x28>
ffffffffc020ac3e:	8552                	mv	a0,s4
ffffffffc020ac40:	264000ef          	jal	ra,ffffffffc020aea4 <unlock_sfs_io>
ffffffffc020ac44:	70e2                	ld	ra,56(sp)
ffffffffc020ac46:	7442                	ld	s0,48(sp)
ffffffffc020ac48:	7902                	ld	s2,32(sp)
ffffffffc020ac4a:	69e2                	ld	s3,24(sp)
ffffffffc020ac4c:	6a42                	ld	s4,16(sp)
ffffffffc020ac4e:	6aa2                	ld	s5,8(sp)
ffffffffc020ac50:	8526                	mv	a0,s1
ffffffffc020ac52:	74a2                	ld	s1,40(sp)
ffffffffc020ac54:	6121                	addi	sp,sp,64
ffffffffc020ac56:	8082                	ret
ffffffffc020ac58:	4481                	li	s1,0
ffffffffc020ac5a:	b7d5                	j	ffffffffc020ac3e <sfs_wblock+0x42>

ffffffffc020ac5c <sfs_rbuf>:
ffffffffc020ac5c:	7179                	addi	sp,sp,-48
ffffffffc020ac5e:	f406                	sd	ra,40(sp)
ffffffffc020ac60:	f022                	sd	s0,32(sp)
ffffffffc020ac62:	ec26                	sd	s1,24(sp)
ffffffffc020ac64:	e84a                	sd	s2,16(sp)
ffffffffc020ac66:	e44e                	sd	s3,8(sp)
ffffffffc020ac68:	e052                	sd	s4,0(sp)
ffffffffc020ac6a:	6785                	lui	a5,0x1
ffffffffc020ac6c:	04f77863          	bgeu	a4,a5,ffffffffc020acbc <sfs_rbuf+0x60>
ffffffffc020ac70:	84ba                	mv	s1,a4
ffffffffc020ac72:	9732                	add	a4,a4,a2
ffffffffc020ac74:	89b2                	mv	s3,a2
ffffffffc020ac76:	04e7e363          	bltu	a5,a4,ffffffffc020acbc <sfs_rbuf+0x60>
ffffffffc020ac7a:	8936                	mv	s2,a3
ffffffffc020ac7c:	842a                	mv	s0,a0
ffffffffc020ac7e:	8a2e                	mv	s4,a1
ffffffffc020ac80:	214000ef          	jal	ra,ffffffffc020ae94 <lock_sfs_io>
ffffffffc020ac84:	642c                	ld	a1,72(s0)
ffffffffc020ac86:	864a                	mv	a2,s2
ffffffffc020ac88:	4705                	li	a4,1
ffffffffc020ac8a:	4681                	li	a3,0
ffffffffc020ac8c:	8522                	mv	a0,s0
ffffffffc020ac8e:	eb7ff0ef          	jal	ra,ffffffffc020ab44 <sfs_rwblock_nolock>
ffffffffc020ac92:	892a                	mv	s2,a0
ffffffffc020ac94:	cd09                	beqz	a0,ffffffffc020acae <sfs_rbuf+0x52>
ffffffffc020ac96:	8522                	mv	a0,s0
ffffffffc020ac98:	20c000ef          	jal	ra,ffffffffc020aea4 <unlock_sfs_io>
ffffffffc020ac9c:	70a2                	ld	ra,40(sp)
ffffffffc020ac9e:	7402                	ld	s0,32(sp)
ffffffffc020aca0:	64e2                	ld	s1,24(sp)
ffffffffc020aca2:	69a2                	ld	s3,8(sp)
ffffffffc020aca4:	6a02                	ld	s4,0(sp)
ffffffffc020aca6:	854a                	mv	a0,s2
ffffffffc020aca8:	6942                	ld	s2,16(sp)
ffffffffc020acaa:	6145                	addi	sp,sp,48
ffffffffc020acac:	8082                	ret
ffffffffc020acae:	642c                	ld	a1,72(s0)
ffffffffc020acb0:	864e                	mv	a2,s3
ffffffffc020acb2:	8552                	mv	a0,s4
ffffffffc020acb4:	95a6                	add	a1,a1,s1
ffffffffc020acb6:	77c000ef          	jal	ra,ffffffffc020b432 <memcpy>
ffffffffc020acba:	bff1                	j	ffffffffc020ac96 <sfs_rbuf+0x3a>
ffffffffc020acbc:	00004697          	auipc	a3,0x4
ffffffffc020acc0:	5fc68693          	addi	a3,a3,1532 # ffffffffc020f2b8 <sfs_node_fileops+0xd0>
ffffffffc020acc4:	00001617          	auipc	a2,0x1
ffffffffc020acc8:	c0460613          	addi	a2,a2,-1020 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020accc:	05500593          	li	a1,85
ffffffffc020acd0:	00004517          	auipc	a0,0x4
ffffffffc020acd4:	5d050513          	addi	a0,a0,1488 # ffffffffc020f2a0 <sfs_node_fileops+0xb8>
ffffffffc020acd8:	fc6f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020acdc <sfs_wbuf>:
ffffffffc020acdc:	7139                	addi	sp,sp,-64
ffffffffc020acde:	fc06                	sd	ra,56(sp)
ffffffffc020ace0:	f822                	sd	s0,48(sp)
ffffffffc020ace2:	f426                	sd	s1,40(sp)
ffffffffc020ace4:	f04a                	sd	s2,32(sp)
ffffffffc020ace6:	ec4e                	sd	s3,24(sp)
ffffffffc020ace8:	e852                	sd	s4,16(sp)
ffffffffc020acea:	e456                	sd	s5,8(sp)
ffffffffc020acec:	6785                	lui	a5,0x1
ffffffffc020acee:	06f77163          	bgeu	a4,a5,ffffffffc020ad50 <sfs_wbuf+0x74>
ffffffffc020acf2:	893a                	mv	s2,a4
ffffffffc020acf4:	9732                	add	a4,a4,a2
ffffffffc020acf6:	8a32                	mv	s4,a2
ffffffffc020acf8:	04e7ec63          	bltu	a5,a4,ffffffffc020ad50 <sfs_wbuf+0x74>
ffffffffc020acfc:	842a                	mv	s0,a0
ffffffffc020acfe:	89b6                	mv	s3,a3
ffffffffc020ad00:	8aae                	mv	s5,a1
ffffffffc020ad02:	192000ef          	jal	ra,ffffffffc020ae94 <lock_sfs_io>
ffffffffc020ad06:	642c                	ld	a1,72(s0)
ffffffffc020ad08:	4705                	li	a4,1
ffffffffc020ad0a:	4681                	li	a3,0
ffffffffc020ad0c:	864e                	mv	a2,s3
ffffffffc020ad0e:	8522                	mv	a0,s0
ffffffffc020ad10:	e35ff0ef          	jal	ra,ffffffffc020ab44 <sfs_rwblock_nolock>
ffffffffc020ad14:	84aa                	mv	s1,a0
ffffffffc020ad16:	cd11                	beqz	a0,ffffffffc020ad32 <sfs_wbuf+0x56>
ffffffffc020ad18:	8522                	mv	a0,s0
ffffffffc020ad1a:	18a000ef          	jal	ra,ffffffffc020aea4 <unlock_sfs_io>
ffffffffc020ad1e:	70e2                	ld	ra,56(sp)
ffffffffc020ad20:	7442                	ld	s0,48(sp)
ffffffffc020ad22:	7902                	ld	s2,32(sp)
ffffffffc020ad24:	69e2                	ld	s3,24(sp)
ffffffffc020ad26:	6a42                	ld	s4,16(sp)
ffffffffc020ad28:	6aa2                	ld	s5,8(sp)
ffffffffc020ad2a:	8526                	mv	a0,s1
ffffffffc020ad2c:	74a2                	ld	s1,40(sp)
ffffffffc020ad2e:	6121                	addi	sp,sp,64
ffffffffc020ad30:	8082                	ret
ffffffffc020ad32:	6428                	ld	a0,72(s0)
ffffffffc020ad34:	8652                	mv	a2,s4
ffffffffc020ad36:	85d6                	mv	a1,s5
ffffffffc020ad38:	954a                	add	a0,a0,s2
ffffffffc020ad3a:	6f8000ef          	jal	ra,ffffffffc020b432 <memcpy>
ffffffffc020ad3e:	642c                	ld	a1,72(s0)
ffffffffc020ad40:	4705                	li	a4,1
ffffffffc020ad42:	4685                	li	a3,1
ffffffffc020ad44:	864e                	mv	a2,s3
ffffffffc020ad46:	8522                	mv	a0,s0
ffffffffc020ad48:	dfdff0ef          	jal	ra,ffffffffc020ab44 <sfs_rwblock_nolock>
ffffffffc020ad4c:	84aa                	mv	s1,a0
ffffffffc020ad4e:	b7e9                	j	ffffffffc020ad18 <sfs_wbuf+0x3c>
ffffffffc020ad50:	00004697          	auipc	a3,0x4
ffffffffc020ad54:	56868693          	addi	a3,a3,1384 # ffffffffc020f2b8 <sfs_node_fileops+0xd0>
ffffffffc020ad58:	00001617          	auipc	a2,0x1
ffffffffc020ad5c:	b7060613          	addi	a2,a2,-1168 # ffffffffc020b8c8 <commands+0x210>
ffffffffc020ad60:	06b00593          	li	a1,107
ffffffffc020ad64:	00004517          	auipc	a0,0x4
ffffffffc020ad68:	53c50513          	addi	a0,a0,1340 # ffffffffc020f2a0 <sfs_node_fileops+0xb8>
ffffffffc020ad6c:	f32f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020ad70 <sfs_sync_super>:
ffffffffc020ad70:	1101                	addi	sp,sp,-32
ffffffffc020ad72:	ec06                	sd	ra,24(sp)
ffffffffc020ad74:	e822                	sd	s0,16(sp)
ffffffffc020ad76:	e426                	sd	s1,8(sp)
ffffffffc020ad78:	842a                	mv	s0,a0
ffffffffc020ad7a:	11a000ef          	jal	ra,ffffffffc020ae94 <lock_sfs_io>
ffffffffc020ad7e:	6428                	ld	a0,72(s0)
ffffffffc020ad80:	6605                	lui	a2,0x1
ffffffffc020ad82:	4581                	li	a1,0
ffffffffc020ad84:	65c000ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc020ad88:	6428                	ld	a0,72(s0)
ffffffffc020ad8a:	85a2                	mv	a1,s0
ffffffffc020ad8c:	02c00613          	li	a2,44
ffffffffc020ad90:	6a2000ef          	jal	ra,ffffffffc020b432 <memcpy>
ffffffffc020ad94:	642c                	ld	a1,72(s0)
ffffffffc020ad96:	4701                	li	a4,0
ffffffffc020ad98:	4685                	li	a3,1
ffffffffc020ad9a:	4601                	li	a2,0
ffffffffc020ad9c:	8522                	mv	a0,s0
ffffffffc020ad9e:	da7ff0ef          	jal	ra,ffffffffc020ab44 <sfs_rwblock_nolock>
ffffffffc020ada2:	84aa                	mv	s1,a0
ffffffffc020ada4:	8522                	mv	a0,s0
ffffffffc020ada6:	0fe000ef          	jal	ra,ffffffffc020aea4 <unlock_sfs_io>
ffffffffc020adaa:	60e2                	ld	ra,24(sp)
ffffffffc020adac:	6442                	ld	s0,16(sp)
ffffffffc020adae:	8526                	mv	a0,s1
ffffffffc020adb0:	64a2                	ld	s1,8(sp)
ffffffffc020adb2:	6105                	addi	sp,sp,32
ffffffffc020adb4:	8082                	ret

ffffffffc020adb6 <sfs_sync_freemap>:
ffffffffc020adb6:	7139                	addi	sp,sp,-64
ffffffffc020adb8:	ec4e                	sd	s3,24(sp)
ffffffffc020adba:	e852                	sd	s4,16(sp)
ffffffffc020adbc:	00456983          	lwu	s3,4(a0)
ffffffffc020adc0:	8a2a                	mv	s4,a0
ffffffffc020adc2:	7d08                	ld	a0,56(a0)
ffffffffc020adc4:	67a1                	lui	a5,0x8
ffffffffc020adc6:	17fd                	addi	a5,a5,-1
ffffffffc020adc8:	4581                	li	a1,0
ffffffffc020adca:	f822                	sd	s0,48(sp)
ffffffffc020adcc:	fc06                	sd	ra,56(sp)
ffffffffc020adce:	f426                	sd	s1,40(sp)
ffffffffc020add0:	f04a                	sd	s2,32(sp)
ffffffffc020add2:	e456                	sd	s5,8(sp)
ffffffffc020add4:	99be                	add	s3,s3,a5
ffffffffc020add6:	a1efe0ef          	jal	ra,ffffffffc0208ff4 <bitmap_getdata>
ffffffffc020adda:	00f9d993          	srli	s3,s3,0xf
ffffffffc020adde:	842a                	mv	s0,a0
ffffffffc020ade0:	8552                	mv	a0,s4
ffffffffc020ade2:	0b2000ef          	jal	ra,ffffffffc020ae94 <lock_sfs_io>
ffffffffc020ade6:	04098163          	beqz	s3,ffffffffc020ae28 <sfs_sync_freemap+0x72>
ffffffffc020adea:	09b2                	slli	s3,s3,0xc
ffffffffc020adec:	99a2                	add	s3,s3,s0
ffffffffc020adee:	4909                	li	s2,2
ffffffffc020adf0:	6a85                	lui	s5,0x1
ffffffffc020adf2:	a021                	j	ffffffffc020adfa <sfs_sync_freemap+0x44>
ffffffffc020adf4:	2905                	addiw	s2,s2,1
ffffffffc020adf6:	02898963          	beq	s3,s0,ffffffffc020ae28 <sfs_sync_freemap+0x72>
ffffffffc020adfa:	85a2                	mv	a1,s0
ffffffffc020adfc:	864a                	mv	a2,s2
ffffffffc020adfe:	4705                	li	a4,1
ffffffffc020ae00:	4685                	li	a3,1
ffffffffc020ae02:	8552                	mv	a0,s4
ffffffffc020ae04:	d41ff0ef          	jal	ra,ffffffffc020ab44 <sfs_rwblock_nolock>
ffffffffc020ae08:	84aa                	mv	s1,a0
ffffffffc020ae0a:	9456                	add	s0,s0,s5
ffffffffc020ae0c:	d565                	beqz	a0,ffffffffc020adf4 <sfs_sync_freemap+0x3e>
ffffffffc020ae0e:	8552                	mv	a0,s4
ffffffffc020ae10:	094000ef          	jal	ra,ffffffffc020aea4 <unlock_sfs_io>
ffffffffc020ae14:	70e2                	ld	ra,56(sp)
ffffffffc020ae16:	7442                	ld	s0,48(sp)
ffffffffc020ae18:	7902                	ld	s2,32(sp)
ffffffffc020ae1a:	69e2                	ld	s3,24(sp)
ffffffffc020ae1c:	6a42                	ld	s4,16(sp)
ffffffffc020ae1e:	6aa2                	ld	s5,8(sp)
ffffffffc020ae20:	8526                	mv	a0,s1
ffffffffc020ae22:	74a2                	ld	s1,40(sp)
ffffffffc020ae24:	6121                	addi	sp,sp,64
ffffffffc020ae26:	8082                	ret
ffffffffc020ae28:	4481                	li	s1,0
ffffffffc020ae2a:	b7d5                	j	ffffffffc020ae0e <sfs_sync_freemap+0x58>

ffffffffc020ae2c <sfs_clear_block>:
ffffffffc020ae2c:	7179                	addi	sp,sp,-48
ffffffffc020ae2e:	f022                	sd	s0,32(sp)
ffffffffc020ae30:	e84a                	sd	s2,16(sp)
ffffffffc020ae32:	e44e                	sd	s3,8(sp)
ffffffffc020ae34:	f406                	sd	ra,40(sp)
ffffffffc020ae36:	89b2                	mv	s3,a2
ffffffffc020ae38:	ec26                	sd	s1,24(sp)
ffffffffc020ae3a:	892a                	mv	s2,a0
ffffffffc020ae3c:	842e                	mv	s0,a1
ffffffffc020ae3e:	056000ef          	jal	ra,ffffffffc020ae94 <lock_sfs_io>
ffffffffc020ae42:	04893503          	ld	a0,72(s2)
ffffffffc020ae46:	6605                	lui	a2,0x1
ffffffffc020ae48:	4581                	li	a1,0
ffffffffc020ae4a:	596000ef          	jal	ra,ffffffffc020b3e0 <memset>
ffffffffc020ae4e:	02098d63          	beqz	s3,ffffffffc020ae88 <sfs_clear_block+0x5c>
ffffffffc020ae52:	013409bb          	addw	s3,s0,s3
ffffffffc020ae56:	a019                	j	ffffffffc020ae5c <sfs_clear_block+0x30>
ffffffffc020ae58:	02898863          	beq	s3,s0,ffffffffc020ae88 <sfs_clear_block+0x5c>
ffffffffc020ae5c:	04893583          	ld	a1,72(s2)
ffffffffc020ae60:	8622                	mv	a2,s0
ffffffffc020ae62:	4705                	li	a4,1
ffffffffc020ae64:	4685                	li	a3,1
ffffffffc020ae66:	854a                	mv	a0,s2
ffffffffc020ae68:	cddff0ef          	jal	ra,ffffffffc020ab44 <sfs_rwblock_nolock>
ffffffffc020ae6c:	84aa                	mv	s1,a0
ffffffffc020ae6e:	2405                	addiw	s0,s0,1
ffffffffc020ae70:	d565                	beqz	a0,ffffffffc020ae58 <sfs_clear_block+0x2c>
ffffffffc020ae72:	854a                	mv	a0,s2
ffffffffc020ae74:	030000ef          	jal	ra,ffffffffc020aea4 <unlock_sfs_io>
ffffffffc020ae78:	70a2                	ld	ra,40(sp)
ffffffffc020ae7a:	7402                	ld	s0,32(sp)
ffffffffc020ae7c:	6942                	ld	s2,16(sp)
ffffffffc020ae7e:	69a2                	ld	s3,8(sp)
ffffffffc020ae80:	8526                	mv	a0,s1
ffffffffc020ae82:	64e2                	ld	s1,24(sp)
ffffffffc020ae84:	6145                	addi	sp,sp,48
ffffffffc020ae86:	8082                	ret
ffffffffc020ae88:	4481                	li	s1,0
ffffffffc020ae8a:	b7e5                	j	ffffffffc020ae72 <sfs_clear_block+0x46>

ffffffffc020ae8c <lock_sfs_fs>:
ffffffffc020ae8c:	05050513          	addi	a0,a0,80
ffffffffc020ae90:	e32f906f          	j	ffffffffc02044c2 <down>

ffffffffc020ae94 <lock_sfs_io>:
ffffffffc020ae94:	06850513          	addi	a0,a0,104
ffffffffc020ae98:	e2af906f          	j	ffffffffc02044c2 <down>

ffffffffc020ae9c <unlock_sfs_fs>:
ffffffffc020ae9c:	05050513          	addi	a0,a0,80
ffffffffc020aea0:	e1ef906f          	j	ffffffffc02044be <up>

ffffffffc020aea4 <unlock_sfs_io>:
ffffffffc020aea4:	06850513          	addi	a0,a0,104
ffffffffc020aea8:	e16f906f          	j	ffffffffc02044be <up>

ffffffffc020aeac <hash32>:
ffffffffc020aeac:	9e3707b7          	lui	a5,0x9e370
ffffffffc020aeb0:	2785                	addiw	a5,a5,1
ffffffffc020aeb2:	02a7853b          	mulw	a0,a5,a0
ffffffffc020aeb6:	02000793          	li	a5,32
ffffffffc020aeba:	9f8d                	subw	a5,a5,a1
ffffffffc020aebc:	00f5553b          	srlw	a0,a0,a5
ffffffffc020aec0:	8082                	ret

ffffffffc020aec2 <printnum>:
ffffffffc020aec2:	02071893          	slli	a7,a4,0x20
ffffffffc020aec6:	7139                	addi	sp,sp,-64
ffffffffc020aec8:	0208d893          	srli	a7,a7,0x20
ffffffffc020aecc:	e456                	sd	s5,8(sp)
ffffffffc020aece:	0316fab3          	remu	s5,a3,a7
ffffffffc020aed2:	f822                	sd	s0,48(sp)
ffffffffc020aed4:	f426                	sd	s1,40(sp)
ffffffffc020aed6:	f04a                	sd	s2,32(sp)
ffffffffc020aed8:	ec4e                	sd	s3,24(sp)
ffffffffc020aeda:	fc06                	sd	ra,56(sp)
ffffffffc020aedc:	e852                	sd	s4,16(sp)
ffffffffc020aede:	84aa                	mv	s1,a0
ffffffffc020aee0:	89ae                	mv	s3,a1
ffffffffc020aee2:	8932                	mv	s2,a2
ffffffffc020aee4:	fff7841b          	addiw	s0,a5,-1
ffffffffc020aee8:	2a81                	sext.w	s5,s5
ffffffffc020aeea:	0516f163          	bgeu	a3,a7,ffffffffc020af2c <printnum+0x6a>
ffffffffc020aeee:	8a42                	mv	s4,a6
ffffffffc020aef0:	00805863          	blez	s0,ffffffffc020af00 <printnum+0x3e>
ffffffffc020aef4:	347d                	addiw	s0,s0,-1
ffffffffc020aef6:	864e                	mv	a2,s3
ffffffffc020aef8:	85ca                	mv	a1,s2
ffffffffc020aefa:	8552                	mv	a0,s4
ffffffffc020aefc:	9482                	jalr	s1
ffffffffc020aefe:	f87d                	bnez	s0,ffffffffc020aef4 <printnum+0x32>
ffffffffc020af00:	1a82                	slli	s5,s5,0x20
ffffffffc020af02:	00004797          	auipc	a5,0x4
ffffffffc020af06:	3fe78793          	addi	a5,a5,1022 # ffffffffc020f300 <sfs_node_fileops+0x118>
ffffffffc020af0a:	020ada93          	srli	s5,s5,0x20
ffffffffc020af0e:	9abe                	add	s5,s5,a5
ffffffffc020af10:	7442                	ld	s0,48(sp)
ffffffffc020af12:	000ac503          	lbu	a0,0(s5) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc020af16:	70e2                	ld	ra,56(sp)
ffffffffc020af18:	6a42                	ld	s4,16(sp)
ffffffffc020af1a:	6aa2                	ld	s5,8(sp)
ffffffffc020af1c:	864e                	mv	a2,s3
ffffffffc020af1e:	85ca                	mv	a1,s2
ffffffffc020af20:	69e2                	ld	s3,24(sp)
ffffffffc020af22:	7902                	ld	s2,32(sp)
ffffffffc020af24:	87a6                	mv	a5,s1
ffffffffc020af26:	74a2                	ld	s1,40(sp)
ffffffffc020af28:	6121                	addi	sp,sp,64
ffffffffc020af2a:	8782                	jr	a5
ffffffffc020af2c:	0316d6b3          	divu	a3,a3,a7
ffffffffc020af30:	87a2                	mv	a5,s0
ffffffffc020af32:	f91ff0ef          	jal	ra,ffffffffc020aec2 <printnum>
ffffffffc020af36:	b7e9                	j	ffffffffc020af00 <printnum+0x3e>

ffffffffc020af38 <sprintputch>:
ffffffffc020af38:	499c                	lw	a5,16(a1)
ffffffffc020af3a:	6198                	ld	a4,0(a1)
ffffffffc020af3c:	6594                	ld	a3,8(a1)
ffffffffc020af3e:	2785                	addiw	a5,a5,1
ffffffffc020af40:	c99c                	sw	a5,16(a1)
ffffffffc020af42:	00d77763          	bgeu	a4,a3,ffffffffc020af50 <sprintputch+0x18>
ffffffffc020af46:	00170793          	addi	a5,a4,1
ffffffffc020af4a:	e19c                	sd	a5,0(a1)
ffffffffc020af4c:	00a70023          	sb	a0,0(a4)
ffffffffc020af50:	8082                	ret

ffffffffc020af52 <vprintfmt>:
ffffffffc020af52:	7119                	addi	sp,sp,-128
ffffffffc020af54:	f4a6                	sd	s1,104(sp)
ffffffffc020af56:	f0ca                	sd	s2,96(sp)
ffffffffc020af58:	ecce                	sd	s3,88(sp)
ffffffffc020af5a:	e8d2                	sd	s4,80(sp)
ffffffffc020af5c:	e4d6                	sd	s5,72(sp)
ffffffffc020af5e:	e0da                	sd	s6,64(sp)
ffffffffc020af60:	fc5e                	sd	s7,56(sp)
ffffffffc020af62:	ec6e                	sd	s11,24(sp)
ffffffffc020af64:	fc86                	sd	ra,120(sp)
ffffffffc020af66:	f8a2                	sd	s0,112(sp)
ffffffffc020af68:	f862                	sd	s8,48(sp)
ffffffffc020af6a:	f466                	sd	s9,40(sp)
ffffffffc020af6c:	f06a                	sd	s10,32(sp)
ffffffffc020af6e:	89aa                	mv	s3,a0
ffffffffc020af70:	892e                	mv	s2,a1
ffffffffc020af72:	84b2                	mv	s1,a2
ffffffffc020af74:	8db6                	mv	s11,a3
ffffffffc020af76:	8aba                	mv	s5,a4
ffffffffc020af78:	02500a13          	li	s4,37
ffffffffc020af7c:	5bfd                	li	s7,-1
ffffffffc020af7e:	00004b17          	auipc	s6,0x4
ffffffffc020af82:	3aeb0b13          	addi	s6,s6,942 # ffffffffc020f32c <sfs_node_fileops+0x144>
ffffffffc020af86:	000dc503          	lbu	a0,0(s11) # 2000 <_binary_bin_swap_img_size-0x5d00>
ffffffffc020af8a:	001d8413          	addi	s0,s11,1
ffffffffc020af8e:	01450b63          	beq	a0,s4,ffffffffc020afa4 <vprintfmt+0x52>
ffffffffc020af92:	c129                	beqz	a0,ffffffffc020afd4 <vprintfmt+0x82>
ffffffffc020af94:	864a                	mv	a2,s2
ffffffffc020af96:	85a6                	mv	a1,s1
ffffffffc020af98:	0405                	addi	s0,s0,1
ffffffffc020af9a:	9982                	jalr	s3
ffffffffc020af9c:	fff44503          	lbu	a0,-1(s0)
ffffffffc020afa0:	ff4519e3          	bne	a0,s4,ffffffffc020af92 <vprintfmt+0x40>
ffffffffc020afa4:	00044583          	lbu	a1,0(s0)
ffffffffc020afa8:	02000813          	li	a6,32
ffffffffc020afac:	4d01                	li	s10,0
ffffffffc020afae:	4301                	li	t1,0
ffffffffc020afb0:	5cfd                	li	s9,-1
ffffffffc020afb2:	5c7d                	li	s8,-1
ffffffffc020afb4:	05500513          	li	a0,85
ffffffffc020afb8:	48a5                	li	a7,9
ffffffffc020afba:	fdd5861b          	addiw	a2,a1,-35
ffffffffc020afbe:	0ff67613          	zext.b	a2,a2
ffffffffc020afc2:	00140d93          	addi	s11,s0,1
ffffffffc020afc6:	04c56263          	bltu	a0,a2,ffffffffc020b00a <vprintfmt+0xb8>
ffffffffc020afca:	060a                	slli	a2,a2,0x2
ffffffffc020afcc:	965a                	add	a2,a2,s6
ffffffffc020afce:	4214                	lw	a3,0(a2)
ffffffffc020afd0:	96da                	add	a3,a3,s6
ffffffffc020afd2:	8682                	jr	a3
ffffffffc020afd4:	70e6                	ld	ra,120(sp)
ffffffffc020afd6:	7446                	ld	s0,112(sp)
ffffffffc020afd8:	74a6                	ld	s1,104(sp)
ffffffffc020afda:	7906                	ld	s2,96(sp)
ffffffffc020afdc:	69e6                	ld	s3,88(sp)
ffffffffc020afde:	6a46                	ld	s4,80(sp)
ffffffffc020afe0:	6aa6                	ld	s5,72(sp)
ffffffffc020afe2:	6b06                	ld	s6,64(sp)
ffffffffc020afe4:	7be2                	ld	s7,56(sp)
ffffffffc020afe6:	7c42                	ld	s8,48(sp)
ffffffffc020afe8:	7ca2                	ld	s9,40(sp)
ffffffffc020afea:	7d02                	ld	s10,32(sp)
ffffffffc020afec:	6de2                	ld	s11,24(sp)
ffffffffc020afee:	6109                	addi	sp,sp,128
ffffffffc020aff0:	8082                	ret
ffffffffc020aff2:	882e                	mv	a6,a1
ffffffffc020aff4:	00144583          	lbu	a1,1(s0)
ffffffffc020aff8:	846e                	mv	s0,s11
ffffffffc020affa:	00140d93          	addi	s11,s0,1
ffffffffc020affe:	fdd5861b          	addiw	a2,a1,-35
ffffffffc020b002:	0ff67613          	zext.b	a2,a2
ffffffffc020b006:	fcc572e3          	bgeu	a0,a2,ffffffffc020afca <vprintfmt+0x78>
ffffffffc020b00a:	864a                	mv	a2,s2
ffffffffc020b00c:	85a6                	mv	a1,s1
ffffffffc020b00e:	02500513          	li	a0,37
ffffffffc020b012:	9982                	jalr	s3
ffffffffc020b014:	fff44783          	lbu	a5,-1(s0)
ffffffffc020b018:	8da2                	mv	s11,s0
ffffffffc020b01a:	f74786e3          	beq	a5,s4,ffffffffc020af86 <vprintfmt+0x34>
ffffffffc020b01e:	ffedc783          	lbu	a5,-2(s11)
ffffffffc020b022:	1dfd                	addi	s11,s11,-1
ffffffffc020b024:	ff479de3          	bne	a5,s4,ffffffffc020b01e <vprintfmt+0xcc>
ffffffffc020b028:	bfb9                	j	ffffffffc020af86 <vprintfmt+0x34>
ffffffffc020b02a:	fd058c9b          	addiw	s9,a1,-48
ffffffffc020b02e:	00144583          	lbu	a1,1(s0)
ffffffffc020b032:	846e                	mv	s0,s11
ffffffffc020b034:	fd05869b          	addiw	a3,a1,-48
ffffffffc020b038:	0005861b          	sext.w	a2,a1
ffffffffc020b03c:	02d8e463          	bltu	a7,a3,ffffffffc020b064 <vprintfmt+0x112>
ffffffffc020b040:	00144583          	lbu	a1,1(s0)
ffffffffc020b044:	002c969b          	slliw	a3,s9,0x2
ffffffffc020b048:	0196873b          	addw	a4,a3,s9
ffffffffc020b04c:	0017171b          	slliw	a4,a4,0x1
ffffffffc020b050:	9f31                	addw	a4,a4,a2
ffffffffc020b052:	fd05869b          	addiw	a3,a1,-48
ffffffffc020b056:	0405                	addi	s0,s0,1
ffffffffc020b058:	fd070c9b          	addiw	s9,a4,-48
ffffffffc020b05c:	0005861b          	sext.w	a2,a1
ffffffffc020b060:	fed8f0e3          	bgeu	a7,a3,ffffffffc020b040 <vprintfmt+0xee>
ffffffffc020b064:	f40c5be3          	bgez	s8,ffffffffc020afba <vprintfmt+0x68>
ffffffffc020b068:	8c66                	mv	s8,s9
ffffffffc020b06a:	5cfd                	li	s9,-1
ffffffffc020b06c:	b7b9                	j	ffffffffc020afba <vprintfmt+0x68>
ffffffffc020b06e:	fffc4693          	not	a3,s8
ffffffffc020b072:	96fd                	srai	a3,a3,0x3f
ffffffffc020b074:	00dc77b3          	and	a5,s8,a3
ffffffffc020b078:	00144583          	lbu	a1,1(s0)
ffffffffc020b07c:	00078c1b          	sext.w	s8,a5
ffffffffc020b080:	846e                	mv	s0,s11
ffffffffc020b082:	bf25                	j	ffffffffc020afba <vprintfmt+0x68>
ffffffffc020b084:	000aac83          	lw	s9,0(s5)
ffffffffc020b088:	00144583          	lbu	a1,1(s0)
ffffffffc020b08c:	0aa1                	addi	s5,s5,8
ffffffffc020b08e:	846e                	mv	s0,s11
ffffffffc020b090:	bfd1                	j	ffffffffc020b064 <vprintfmt+0x112>
ffffffffc020b092:	4705                	li	a4,1
ffffffffc020b094:	008a8613          	addi	a2,s5,8
ffffffffc020b098:	00674463          	blt	a4,t1,ffffffffc020b0a0 <vprintfmt+0x14e>
ffffffffc020b09c:	1c030c63          	beqz	t1,ffffffffc020b274 <vprintfmt+0x322>
ffffffffc020b0a0:	000ab683          	ld	a3,0(s5)
ffffffffc020b0a4:	4741                	li	a4,16
ffffffffc020b0a6:	8ab2                	mv	s5,a2
ffffffffc020b0a8:	2801                	sext.w	a6,a6
ffffffffc020b0aa:	87e2                	mv	a5,s8
ffffffffc020b0ac:	8626                	mv	a2,s1
ffffffffc020b0ae:	85ca                	mv	a1,s2
ffffffffc020b0b0:	854e                	mv	a0,s3
ffffffffc020b0b2:	e11ff0ef          	jal	ra,ffffffffc020aec2 <printnum>
ffffffffc020b0b6:	bdc1                	j	ffffffffc020af86 <vprintfmt+0x34>
ffffffffc020b0b8:	000aa503          	lw	a0,0(s5)
ffffffffc020b0bc:	864a                	mv	a2,s2
ffffffffc020b0be:	85a6                	mv	a1,s1
ffffffffc020b0c0:	0aa1                	addi	s5,s5,8
ffffffffc020b0c2:	9982                	jalr	s3
ffffffffc020b0c4:	b5c9                	j	ffffffffc020af86 <vprintfmt+0x34>
ffffffffc020b0c6:	4705                	li	a4,1
ffffffffc020b0c8:	008a8613          	addi	a2,s5,8
ffffffffc020b0cc:	00674463          	blt	a4,t1,ffffffffc020b0d4 <vprintfmt+0x182>
ffffffffc020b0d0:	18030d63          	beqz	t1,ffffffffc020b26a <vprintfmt+0x318>
ffffffffc020b0d4:	000ab683          	ld	a3,0(s5)
ffffffffc020b0d8:	4729                	li	a4,10
ffffffffc020b0da:	8ab2                	mv	s5,a2
ffffffffc020b0dc:	b7f1                	j	ffffffffc020b0a8 <vprintfmt+0x156>
ffffffffc020b0de:	00144583          	lbu	a1,1(s0)
ffffffffc020b0e2:	4d05                	li	s10,1
ffffffffc020b0e4:	846e                	mv	s0,s11
ffffffffc020b0e6:	bdd1                	j	ffffffffc020afba <vprintfmt+0x68>
ffffffffc020b0e8:	864a                	mv	a2,s2
ffffffffc020b0ea:	85a6                	mv	a1,s1
ffffffffc020b0ec:	02500513          	li	a0,37
ffffffffc020b0f0:	9982                	jalr	s3
ffffffffc020b0f2:	bd51                	j	ffffffffc020af86 <vprintfmt+0x34>
ffffffffc020b0f4:	00144583          	lbu	a1,1(s0)
ffffffffc020b0f8:	2305                	addiw	t1,t1,1
ffffffffc020b0fa:	846e                	mv	s0,s11
ffffffffc020b0fc:	bd7d                	j	ffffffffc020afba <vprintfmt+0x68>
ffffffffc020b0fe:	4705                	li	a4,1
ffffffffc020b100:	008a8613          	addi	a2,s5,8
ffffffffc020b104:	00674463          	blt	a4,t1,ffffffffc020b10c <vprintfmt+0x1ba>
ffffffffc020b108:	14030c63          	beqz	t1,ffffffffc020b260 <vprintfmt+0x30e>
ffffffffc020b10c:	000ab683          	ld	a3,0(s5)
ffffffffc020b110:	4721                	li	a4,8
ffffffffc020b112:	8ab2                	mv	s5,a2
ffffffffc020b114:	bf51                	j	ffffffffc020b0a8 <vprintfmt+0x156>
ffffffffc020b116:	03000513          	li	a0,48
ffffffffc020b11a:	864a                	mv	a2,s2
ffffffffc020b11c:	85a6                	mv	a1,s1
ffffffffc020b11e:	e042                	sd	a6,0(sp)
ffffffffc020b120:	9982                	jalr	s3
ffffffffc020b122:	864a                	mv	a2,s2
ffffffffc020b124:	85a6                	mv	a1,s1
ffffffffc020b126:	07800513          	li	a0,120
ffffffffc020b12a:	9982                	jalr	s3
ffffffffc020b12c:	0aa1                	addi	s5,s5,8
ffffffffc020b12e:	6802                	ld	a6,0(sp)
ffffffffc020b130:	4741                	li	a4,16
ffffffffc020b132:	ff8ab683          	ld	a3,-8(s5)
ffffffffc020b136:	bf8d                	j	ffffffffc020b0a8 <vprintfmt+0x156>
ffffffffc020b138:	000ab403          	ld	s0,0(s5)
ffffffffc020b13c:	008a8793          	addi	a5,s5,8
ffffffffc020b140:	e03e                	sd	a5,0(sp)
ffffffffc020b142:	14040c63          	beqz	s0,ffffffffc020b29a <vprintfmt+0x348>
ffffffffc020b146:	11805063          	blez	s8,ffffffffc020b246 <vprintfmt+0x2f4>
ffffffffc020b14a:	02d00693          	li	a3,45
ffffffffc020b14e:	0cd81963          	bne	a6,a3,ffffffffc020b220 <vprintfmt+0x2ce>
ffffffffc020b152:	00044683          	lbu	a3,0(s0)
ffffffffc020b156:	0006851b          	sext.w	a0,a3
ffffffffc020b15a:	ce8d                	beqz	a3,ffffffffc020b194 <vprintfmt+0x242>
ffffffffc020b15c:	00140a93          	addi	s5,s0,1
ffffffffc020b160:	05e00413          	li	s0,94
ffffffffc020b164:	000cc563          	bltz	s9,ffffffffc020b16e <vprintfmt+0x21c>
ffffffffc020b168:	3cfd                	addiw	s9,s9,-1
ffffffffc020b16a:	037c8363          	beq	s9,s7,ffffffffc020b190 <vprintfmt+0x23e>
ffffffffc020b16e:	864a                	mv	a2,s2
ffffffffc020b170:	85a6                	mv	a1,s1
ffffffffc020b172:	100d0663          	beqz	s10,ffffffffc020b27e <vprintfmt+0x32c>
ffffffffc020b176:	3681                	addiw	a3,a3,-32
ffffffffc020b178:	10d47363          	bgeu	s0,a3,ffffffffc020b27e <vprintfmt+0x32c>
ffffffffc020b17c:	03f00513          	li	a0,63
ffffffffc020b180:	9982                	jalr	s3
ffffffffc020b182:	000ac683          	lbu	a3,0(s5)
ffffffffc020b186:	3c7d                	addiw	s8,s8,-1
ffffffffc020b188:	0a85                	addi	s5,s5,1
ffffffffc020b18a:	0006851b          	sext.w	a0,a3
ffffffffc020b18e:	faf9                	bnez	a3,ffffffffc020b164 <vprintfmt+0x212>
ffffffffc020b190:	01805a63          	blez	s8,ffffffffc020b1a4 <vprintfmt+0x252>
ffffffffc020b194:	3c7d                	addiw	s8,s8,-1
ffffffffc020b196:	864a                	mv	a2,s2
ffffffffc020b198:	85a6                	mv	a1,s1
ffffffffc020b19a:	02000513          	li	a0,32
ffffffffc020b19e:	9982                	jalr	s3
ffffffffc020b1a0:	fe0c1ae3          	bnez	s8,ffffffffc020b194 <vprintfmt+0x242>
ffffffffc020b1a4:	6a82                	ld	s5,0(sp)
ffffffffc020b1a6:	b3c5                	j	ffffffffc020af86 <vprintfmt+0x34>
ffffffffc020b1a8:	4705                	li	a4,1
ffffffffc020b1aa:	008a8d13          	addi	s10,s5,8
ffffffffc020b1ae:	00674463          	blt	a4,t1,ffffffffc020b1b6 <vprintfmt+0x264>
ffffffffc020b1b2:	0a030463          	beqz	t1,ffffffffc020b25a <vprintfmt+0x308>
ffffffffc020b1b6:	000ab403          	ld	s0,0(s5)
ffffffffc020b1ba:	0c044463          	bltz	s0,ffffffffc020b282 <vprintfmt+0x330>
ffffffffc020b1be:	86a2                	mv	a3,s0
ffffffffc020b1c0:	8aea                	mv	s5,s10
ffffffffc020b1c2:	4729                	li	a4,10
ffffffffc020b1c4:	b5d5                	j	ffffffffc020b0a8 <vprintfmt+0x156>
ffffffffc020b1c6:	000aa783          	lw	a5,0(s5)
ffffffffc020b1ca:	46e1                	li	a3,24
ffffffffc020b1cc:	0aa1                	addi	s5,s5,8
ffffffffc020b1ce:	41f7d71b          	sraiw	a4,a5,0x1f
ffffffffc020b1d2:	8fb9                	xor	a5,a5,a4
ffffffffc020b1d4:	40e7873b          	subw	a4,a5,a4
ffffffffc020b1d8:	02e6c663          	blt	a3,a4,ffffffffc020b204 <vprintfmt+0x2b2>
ffffffffc020b1dc:	00371793          	slli	a5,a4,0x3
ffffffffc020b1e0:	00004697          	auipc	a3,0x4
ffffffffc020b1e4:	48068693          	addi	a3,a3,1152 # ffffffffc020f660 <error_string>
ffffffffc020b1e8:	97b6                	add	a5,a5,a3
ffffffffc020b1ea:	639c                	ld	a5,0(a5)
ffffffffc020b1ec:	cf81                	beqz	a5,ffffffffc020b204 <vprintfmt+0x2b2>
ffffffffc020b1ee:	873e                	mv	a4,a5
ffffffffc020b1f0:	00000697          	auipc	a3,0x0
ffffffffc020b1f4:	28868693          	addi	a3,a3,648 # ffffffffc020b478 <etext+0x2e>
ffffffffc020b1f8:	8626                	mv	a2,s1
ffffffffc020b1fa:	85ca                	mv	a1,s2
ffffffffc020b1fc:	854e                	mv	a0,s3
ffffffffc020b1fe:	0d4000ef          	jal	ra,ffffffffc020b2d2 <printfmt>
ffffffffc020b202:	b351                	j	ffffffffc020af86 <vprintfmt+0x34>
ffffffffc020b204:	00004697          	auipc	a3,0x4
ffffffffc020b208:	11c68693          	addi	a3,a3,284 # ffffffffc020f320 <sfs_node_fileops+0x138>
ffffffffc020b20c:	8626                	mv	a2,s1
ffffffffc020b20e:	85ca                	mv	a1,s2
ffffffffc020b210:	854e                	mv	a0,s3
ffffffffc020b212:	0c0000ef          	jal	ra,ffffffffc020b2d2 <printfmt>
ffffffffc020b216:	bb85                	j	ffffffffc020af86 <vprintfmt+0x34>
ffffffffc020b218:	00004417          	auipc	s0,0x4
ffffffffc020b21c:	10040413          	addi	s0,s0,256 # ffffffffc020f318 <sfs_node_fileops+0x130>
ffffffffc020b220:	85e6                	mv	a1,s9
ffffffffc020b222:	8522                	mv	a0,s0
ffffffffc020b224:	e442                	sd	a6,8(sp)
ffffffffc020b226:	132000ef          	jal	ra,ffffffffc020b358 <strnlen>
ffffffffc020b22a:	40ac0c3b          	subw	s8,s8,a0
ffffffffc020b22e:	01805c63          	blez	s8,ffffffffc020b246 <vprintfmt+0x2f4>
ffffffffc020b232:	6822                	ld	a6,8(sp)
ffffffffc020b234:	00080a9b          	sext.w	s5,a6
ffffffffc020b238:	3c7d                	addiw	s8,s8,-1
ffffffffc020b23a:	864a                	mv	a2,s2
ffffffffc020b23c:	85a6                	mv	a1,s1
ffffffffc020b23e:	8556                	mv	a0,s5
ffffffffc020b240:	9982                	jalr	s3
ffffffffc020b242:	fe0c1be3          	bnez	s8,ffffffffc020b238 <vprintfmt+0x2e6>
ffffffffc020b246:	00044683          	lbu	a3,0(s0)
ffffffffc020b24a:	00140a93          	addi	s5,s0,1
ffffffffc020b24e:	0006851b          	sext.w	a0,a3
ffffffffc020b252:	daa9                	beqz	a3,ffffffffc020b1a4 <vprintfmt+0x252>
ffffffffc020b254:	05e00413          	li	s0,94
ffffffffc020b258:	b731                	j	ffffffffc020b164 <vprintfmt+0x212>
ffffffffc020b25a:	000aa403          	lw	s0,0(s5)
ffffffffc020b25e:	bfb1                	j	ffffffffc020b1ba <vprintfmt+0x268>
ffffffffc020b260:	000ae683          	lwu	a3,0(s5)
ffffffffc020b264:	4721                	li	a4,8
ffffffffc020b266:	8ab2                	mv	s5,a2
ffffffffc020b268:	b581                	j	ffffffffc020b0a8 <vprintfmt+0x156>
ffffffffc020b26a:	000ae683          	lwu	a3,0(s5)
ffffffffc020b26e:	4729                	li	a4,10
ffffffffc020b270:	8ab2                	mv	s5,a2
ffffffffc020b272:	bd1d                	j	ffffffffc020b0a8 <vprintfmt+0x156>
ffffffffc020b274:	000ae683          	lwu	a3,0(s5)
ffffffffc020b278:	4741                	li	a4,16
ffffffffc020b27a:	8ab2                	mv	s5,a2
ffffffffc020b27c:	b535                	j	ffffffffc020b0a8 <vprintfmt+0x156>
ffffffffc020b27e:	9982                	jalr	s3
ffffffffc020b280:	b709                	j	ffffffffc020b182 <vprintfmt+0x230>
ffffffffc020b282:	864a                	mv	a2,s2
ffffffffc020b284:	85a6                	mv	a1,s1
ffffffffc020b286:	02d00513          	li	a0,45
ffffffffc020b28a:	e042                	sd	a6,0(sp)
ffffffffc020b28c:	9982                	jalr	s3
ffffffffc020b28e:	6802                	ld	a6,0(sp)
ffffffffc020b290:	8aea                	mv	s5,s10
ffffffffc020b292:	408006b3          	neg	a3,s0
ffffffffc020b296:	4729                	li	a4,10
ffffffffc020b298:	bd01                	j	ffffffffc020b0a8 <vprintfmt+0x156>
ffffffffc020b29a:	03805163          	blez	s8,ffffffffc020b2bc <vprintfmt+0x36a>
ffffffffc020b29e:	02d00693          	li	a3,45
ffffffffc020b2a2:	f6d81be3          	bne	a6,a3,ffffffffc020b218 <vprintfmt+0x2c6>
ffffffffc020b2a6:	00004417          	auipc	s0,0x4
ffffffffc020b2aa:	07240413          	addi	s0,s0,114 # ffffffffc020f318 <sfs_node_fileops+0x130>
ffffffffc020b2ae:	02800693          	li	a3,40
ffffffffc020b2b2:	02800513          	li	a0,40
ffffffffc020b2b6:	00140a93          	addi	s5,s0,1
ffffffffc020b2ba:	b55d                	j	ffffffffc020b160 <vprintfmt+0x20e>
ffffffffc020b2bc:	00004a97          	auipc	s5,0x4
ffffffffc020b2c0:	05da8a93          	addi	s5,s5,93 # ffffffffc020f319 <sfs_node_fileops+0x131>
ffffffffc020b2c4:	02800513          	li	a0,40
ffffffffc020b2c8:	02800693          	li	a3,40
ffffffffc020b2cc:	05e00413          	li	s0,94
ffffffffc020b2d0:	bd51                	j	ffffffffc020b164 <vprintfmt+0x212>

ffffffffc020b2d2 <printfmt>:
ffffffffc020b2d2:	7139                	addi	sp,sp,-64
ffffffffc020b2d4:	02010313          	addi	t1,sp,32
ffffffffc020b2d8:	f03a                	sd	a4,32(sp)
ffffffffc020b2da:	871a                	mv	a4,t1
ffffffffc020b2dc:	ec06                	sd	ra,24(sp)
ffffffffc020b2de:	f43e                	sd	a5,40(sp)
ffffffffc020b2e0:	f842                	sd	a6,48(sp)
ffffffffc020b2e2:	fc46                	sd	a7,56(sp)
ffffffffc020b2e4:	e41a                	sd	t1,8(sp)
ffffffffc020b2e6:	c6dff0ef          	jal	ra,ffffffffc020af52 <vprintfmt>
ffffffffc020b2ea:	60e2                	ld	ra,24(sp)
ffffffffc020b2ec:	6121                	addi	sp,sp,64
ffffffffc020b2ee:	8082                	ret

ffffffffc020b2f0 <snprintf>:
ffffffffc020b2f0:	711d                	addi	sp,sp,-96
ffffffffc020b2f2:	15fd                	addi	a1,a1,-1
ffffffffc020b2f4:	03810313          	addi	t1,sp,56
ffffffffc020b2f8:	95aa                	add	a1,a1,a0
ffffffffc020b2fa:	f406                	sd	ra,40(sp)
ffffffffc020b2fc:	fc36                	sd	a3,56(sp)
ffffffffc020b2fe:	e0ba                	sd	a4,64(sp)
ffffffffc020b300:	e4be                	sd	a5,72(sp)
ffffffffc020b302:	e8c2                	sd	a6,80(sp)
ffffffffc020b304:	ecc6                	sd	a7,88(sp)
ffffffffc020b306:	e01a                	sd	t1,0(sp)
ffffffffc020b308:	e42a                	sd	a0,8(sp)
ffffffffc020b30a:	e82e                	sd	a1,16(sp)
ffffffffc020b30c:	cc02                	sw	zero,24(sp)
ffffffffc020b30e:	c515                	beqz	a0,ffffffffc020b33a <snprintf+0x4a>
ffffffffc020b310:	02a5e563          	bltu	a1,a0,ffffffffc020b33a <snprintf+0x4a>
ffffffffc020b314:	75dd                	lui	a1,0xffff7
ffffffffc020b316:	86b2                	mv	a3,a2
ffffffffc020b318:	00000517          	auipc	a0,0x0
ffffffffc020b31c:	c2050513          	addi	a0,a0,-992 # ffffffffc020af38 <sprintputch>
ffffffffc020b320:	871a                	mv	a4,t1
ffffffffc020b322:	0030                	addi	a2,sp,8
ffffffffc020b324:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc020b328:	c2bff0ef          	jal	ra,ffffffffc020af52 <vprintfmt>
ffffffffc020b32c:	67a2                	ld	a5,8(sp)
ffffffffc020b32e:	00078023          	sb	zero,0(a5)
ffffffffc020b332:	4562                	lw	a0,24(sp)
ffffffffc020b334:	70a2                	ld	ra,40(sp)
ffffffffc020b336:	6125                	addi	sp,sp,96
ffffffffc020b338:	8082                	ret
ffffffffc020b33a:	5575                	li	a0,-3
ffffffffc020b33c:	bfe5                	j	ffffffffc020b334 <snprintf+0x44>

ffffffffc020b33e <strlen>:
ffffffffc020b33e:	00054783          	lbu	a5,0(a0)
ffffffffc020b342:	872a                	mv	a4,a0
ffffffffc020b344:	4501                	li	a0,0
ffffffffc020b346:	cb81                	beqz	a5,ffffffffc020b356 <strlen+0x18>
ffffffffc020b348:	0505                	addi	a0,a0,1
ffffffffc020b34a:	00a707b3          	add	a5,a4,a0
ffffffffc020b34e:	0007c783          	lbu	a5,0(a5)
ffffffffc020b352:	fbfd                	bnez	a5,ffffffffc020b348 <strlen+0xa>
ffffffffc020b354:	8082                	ret
ffffffffc020b356:	8082                	ret

ffffffffc020b358 <strnlen>:
ffffffffc020b358:	4781                	li	a5,0
ffffffffc020b35a:	e589                	bnez	a1,ffffffffc020b364 <strnlen+0xc>
ffffffffc020b35c:	a811                	j	ffffffffc020b370 <strnlen+0x18>
ffffffffc020b35e:	0785                	addi	a5,a5,1
ffffffffc020b360:	00f58863          	beq	a1,a5,ffffffffc020b370 <strnlen+0x18>
ffffffffc020b364:	00f50733          	add	a4,a0,a5
ffffffffc020b368:	00074703          	lbu	a4,0(a4)
ffffffffc020b36c:	fb6d                	bnez	a4,ffffffffc020b35e <strnlen+0x6>
ffffffffc020b36e:	85be                	mv	a1,a5
ffffffffc020b370:	852e                	mv	a0,a1
ffffffffc020b372:	8082                	ret

ffffffffc020b374 <strcpy>:
ffffffffc020b374:	87aa                	mv	a5,a0
ffffffffc020b376:	0005c703          	lbu	a4,0(a1)
ffffffffc020b37a:	0785                	addi	a5,a5,1
ffffffffc020b37c:	0585                	addi	a1,a1,1
ffffffffc020b37e:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b382:	fb75                	bnez	a4,ffffffffc020b376 <strcpy+0x2>
ffffffffc020b384:	8082                	ret

ffffffffc020b386 <strcmp>:
ffffffffc020b386:	00054783          	lbu	a5,0(a0)
ffffffffc020b38a:	0005c703          	lbu	a4,0(a1)
ffffffffc020b38e:	cb89                	beqz	a5,ffffffffc020b3a0 <strcmp+0x1a>
ffffffffc020b390:	0505                	addi	a0,a0,1
ffffffffc020b392:	0585                	addi	a1,a1,1
ffffffffc020b394:	fee789e3          	beq	a5,a4,ffffffffc020b386 <strcmp>
ffffffffc020b398:	0007851b          	sext.w	a0,a5
ffffffffc020b39c:	9d19                	subw	a0,a0,a4
ffffffffc020b39e:	8082                	ret
ffffffffc020b3a0:	4501                	li	a0,0
ffffffffc020b3a2:	bfed                	j	ffffffffc020b39c <strcmp+0x16>

ffffffffc020b3a4 <strncmp>:
ffffffffc020b3a4:	c20d                	beqz	a2,ffffffffc020b3c6 <strncmp+0x22>
ffffffffc020b3a6:	962e                	add	a2,a2,a1
ffffffffc020b3a8:	a031                	j	ffffffffc020b3b4 <strncmp+0x10>
ffffffffc020b3aa:	0505                	addi	a0,a0,1
ffffffffc020b3ac:	00e79a63          	bne	a5,a4,ffffffffc020b3c0 <strncmp+0x1c>
ffffffffc020b3b0:	00b60b63          	beq	a2,a1,ffffffffc020b3c6 <strncmp+0x22>
ffffffffc020b3b4:	00054783          	lbu	a5,0(a0)
ffffffffc020b3b8:	0585                	addi	a1,a1,1
ffffffffc020b3ba:	fff5c703          	lbu	a4,-1(a1)
ffffffffc020b3be:	f7f5                	bnez	a5,ffffffffc020b3aa <strncmp+0x6>
ffffffffc020b3c0:	40e7853b          	subw	a0,a5,a4
ffffffffc020b3c4:	8082                	ret
ffffffffc020b3c6:	4501                	li	a0,0
ffffffffc020b3c8:	8082                	ret

ffffffffc020b3ca <strchr>:
ffffffffc020b3ca:	00054783          	lbu	a5,0(a0)
ffffffffc020b3ce:	c799                	beqz	a5,ffffffffc020b3dc <strchr+0x12>
ffffffffc020b3d0:	00f58763          	beq	a1,a5,ffffffffc020b3de <strchr+0x14>
ffffffffc020b3d4:	00154783          	lbu	a5,1(a0)
ffffffffc020b3d8:	0505                	addi	a0,a0,1
ffffffffc020b3da:	fbfd                	bnez	a5,ffffffffc020b3d0 <strchr+0x6>
ffffffffc020b3dc:	4501                	li	a0,0
ffffffffc020b3de:	8082                	ret

ffffffffc020b3e0 <memset>:
ffffffffc020b3e0:	ca01                	beqz	a2,ffffffffc020b3f0 <memset+0x10>
ffffffffc020b3e2:	962a                	add	a2,a2,a0
ffffffffc020b3e4:	87aa                	mv	a5,a0
ffffffffc020b3e6:	0785                	addi	a5,a5,1
ffffffffc020b3e8:	feb78fa3          	sb	a1,-1(a5)
ffffffffc020b3ec:	fec79de3          	bne	a5,a2,ffffffffc020b3e6 <memset+0x6>
ffffffffc020b3f0:	8082                	ret

ffffffffc020b3f2 <memmove>:
ffffffffc020b3f2:	02a5f263          	bgeu	a1,a0,ffffffffc020b416 <memmove+0x24>
ffffffffc020b3f6:	00c587b3          	add	a5,a1,a2
ffffffffc020b3fa:	00f57e63          	bgeu	a0,a5,ffffffffc020b416 <memmove+0x24>
ffffffffc020b3fe:	00c50733          	add	a4,a0,a2
ffffffffc020b402:	c615                	beqz	a2,ffffffffc020b42e <memmove+0x3c>
ffffffffc020b404:	fff7c683          	lbu	a3,-1(a5)
ffffffffc020b408:	17fd                	addi	a5,a5,-1
ffffffffc020b40a:	177d                	addi	a4,a4,-1
ffffffffc020b40c:	00d70023          	sb	a3,0(a4)
ffffffffc020b410:	fef59ae3          	bne	a1,a5,ffffffffc020b404 <memmove+0x12>
ffffffffc020b414:	8082                	ret
ffffffffc020b416:	00c586b3          	add	a3,a1,a2
ffffffffc020b41a:	87aa                	mv	a5,a0
ffffffffc020b41c:	ca11                	beqz	a2,ffffffffc020b430 <memmove+0x3e>
ffffffffc020b41e:	0005c703          	lbu	a4,0(a1)
ffffffffc020b422:	0585                	addi	a1,a1,1
ffffffffc020b424:	0785                	addi	a5,a5,1
ffffffffc020b426:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b42a:	fed59ae3          	bne	a1,a3,ffffffffc020b41e <memmove+0x2c>
ffffffffc020b42e:	8082                	ret
ffffffffc020b430:	8082                	ret

ffffffffc020b432 <memcpy>:
ffffffffc020b432:	ca19                	beqz	a2,ffffffffc020b448 <memcpy+0x16>
ffffffffc020b434:	962e                	add	a2,a2,a1
ffffffffc020b436:	87aa                	mv	a5,a0
ffffffffc020b438:	0005c703          	lbu	a4,0(a1)
ffffffffc020b43c:	0585                	addi	a1,a1,1
ffffffffc020b43e:	0785                	addi	a5,a5,1
ffffffffc020b440:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b444:	fec59ae3          	bne	a1,a2,ffffffffc020b438 <memcpy+0x6>
ffffffffc020b448:	8082                	ret
