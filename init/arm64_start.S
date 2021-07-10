/* Copyright (c) 1997 The NetBSD Foundation, Inc.
 * All rights reserved.
 *
 * author: deneschen@foxmail.com
 */
.section ".text.entry"

.global _start

_start:
	mrs x1, mpidr_el1
	and x1, x1, #3
	cbz x1, 2f

1:
	wfe
	b 1b

2: 	// main core boot
	/* set stack */
	ldr x1, =_start
	mov sp, x1

	// clear BSS section
	ldr x1, =__bss_start
	ldr w2, =__bss_size
3:
	cbz w2, 4f
	str xzr, [x1], #8
	sub w2, w2, #1
	cbnz w2, 3b

4:
	bl main

	// never return to here
deadloop:
	wfe
	b deadloop
