/* Copyright (c) 1997 The NetBSD Foundation, Inc.
 * All rights reserved.
 *
 * author: deneschen@foxmail.com
 */
#include <encoding.h>

.global _start
.section .start.entry
_start:
	// disable interrupt
	csrw CSR_MIE, zero
	csrw CSR_MIP, zero

	// flush the instruction cache
	fence.i

	// reset all registers except ra
	call reset_regs

	# Any hardware threads (hart) that are not bootstrapping need to wait for an IPI
	csrr t0, CSR_MHARTID
	bnez t0, wfi_loop

	la a3, __bss_start
	la a4, __bss_end
clear_bss:
	sd zero, (a3)
	add a3, a3, 8
	blt a3, a4, clear_bss

	li sp, 0x40600000
	jal start_boot
	j .

wfi_loop:
	wfi
	j wfi_loop

reset_regs:
	li sp, 0
	li gp, 0
	li tp, 0
	li t0, 0
	li t1, 0
	li t2, 0
	li s0, 0
	li s1, 0
	li a0, 0
	li a1, 0
	li a2, 0
	li a3, 0
	li a4, 0
	li a5, 0
	li a6, 0
	li a7, 0
	li s2, 0
	li s3, 0
	li s4, 0
	li s5, 0
	li s6, 0
	li s7, 0
	li s8, 0
	li s9, 0
	li s10, 0
	li s11, 0
	li t3, 0
	li t4, 0
	li t5, 0
	li t6, 0
	csrw CSR_MSCRATCH, 0

	csrr t0, CSR_MISA
	andi t0, t0, ISA_F | ISA_D
	beqz t0, done

	li t1, SR_FS
	csrs CSR_MSTATUS, t1
	fmv.d.x f0, zero
	fmv.d.x f1, zero
	fmv.d.x f2, zero
	fmv.d.x f3, zero
	fmv.d.x f4, zero
	fmv.d.x f5, zero
	fmv.d.x f6, zero
	fmv.d.x f7, zero
	fmv.d.x f8, zero
	fmv.d.x f9, zero
	fmv.d.x f10, zero
	fmv.d.x f11, zero
	fmv.d.x f12, zero
	fmv.d.x f13, zero
	fmv.d.x f14, zero
	fmv.d.x f15, zero
	fmv.d.x f16, zero
	fmv.d.x f17, zero
	fmv.d.x f18, zero
	fmv.d.x f19, zero
	fmv.d.x f20, zero
	fmv.d.x f21, zero
	fmv.d.x f22, zero
	fmv.d.x f23, zero
	fmv.d.x f24, zero
	fmv.d.x f25, zero
	fmv.d.x f26, zero
	fmv.d.x f27, zero
	fmv.d.x f28, zero
	fmv.d.x f29, zero
	fmv.d.x f30, zero
	fmv.d.x f31, zero
	csrw fcsr, 0
	li t0, SR_FS
	csrc CSR_MSTATUS, t0
done:
	ret
