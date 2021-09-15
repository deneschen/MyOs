/* Copyright (c) 1997 The NetBSD Foundation, Inc.
 * All rights reserved.
 *
 * author: deneschen@foxmail.com
 */
OUTPUT_FORMAT("elf64-littleaarch64", "elf64-littleaarch64", "elf64-littleaarch64")
OUTPUT_ARCH("aarch64")

PHDRS
{
  headers PT_PHDR PHDRS;
  text PT_LOAD FILEHDR PHDRS;
  data PT_LOAD;
  bss PT_NULL;
}

ENTRY(_start)
SECTIONS
{
	. = SIZEOF_HEADERS;

	.text : {
		. = ALIGN(8);
		KEEP(*(.text.entry))
		*(.text)
		*(.text*)
	} :text

	.data : {
		. = ALIGN(8);
		*(.data)
		*(.data*)
	} :data

	.bss : {
		. = ALIGN(8);
		PROVIDE(__bss_start = .);
		*(.bss)
		*(.bss*)
		*(COMMON)
		PROVIDE(__bss_end = .);
	} :bss

	/DISCARD/ : {
		*(.comment)
		*(.gnu*)
		*(.note*)
		*(.eh_frame*)
	}
}

PROVIDE(__bss_size = (__bss_end - __bss_start) >> 3);