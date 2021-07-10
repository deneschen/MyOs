/* Copyright (c) 1997 The NetBSD Foundation, Inc.
 * All rights reserved.
 *
 * author: deneschen@foxmail.com
 */
OUTPUT_FORMAT("elf64-littleaarch64", "elf64-littleaarch64", "elf64-littleaarch64")
OUTPUT_ARCH("aarch64")

ENTRY(_start)
SECTIONS
{
	. = 0x0;

	.text : {
		. = ALIGN(8);
		KEEP(*(.text.entry))
		*(.text)
		*(.text*)
	}

	.data : {
		. = ALIGN(8);
		*(.data)
		*(.data*)
	}

	.bss : {
		. = ALIGN(8);
		PROVIDE(__bss_start = .);
		*(.bss)
		*(.bss*)
		*(COMMON)
		PROVIDE(__bss_end = .);
	}

	/DISCARD/ : {
		*(.comment)
		*(.gnu*)
		*(.note*)
		*(.eh_frame*)
	}
}

PROVIDE(__bss_size = (__bss_end - __bss_start) >> 3);