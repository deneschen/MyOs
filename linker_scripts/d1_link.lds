/* Copyright (c) 1997 The NetBSD Foundation, Inc.
 * All rights reserved.
 *
 * author: deneschen@foxmail.com
 */
MEMORY
{
  ram (rwx) : ORIGIN = 0x80000000, LENGTH = (6 * 1024 * 1024)
  ram_nocache (rwx) : ORIGIN = 0x40000000, LENGTH = (6 * 1024 * 1024)
}

OUTPUT_ARCH("riscv")
ENTRY(_start)

SECTIONS
{
  .text :
  {
    _start = .;
    . = ALIGN(8);
    *(.start.entry)
    *(.text)
    . = ALIGN(8);
  } > ram

  .data :
  {
    . = ALIGN(8);
    *(.data)
    . = ALIGN(8);
  } > ram

  .bss :
  {
    . = ALIGN(8);
    PROVIDE(__bss_start = .);
    *(.bss)
    . = ALIGN(8);
    PROVIDE(__bss_end = .);
  } > ram
}
