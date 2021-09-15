/* Copyright (c) 1997 The NetBSD Foundation, Inc.
 * All rights reserved.
 *
 * author: deneschen@foxmail.com
 */

unsigned long int chenjun_data = 0xAB;
unsigned int chenjun_bss;

void main(void)
{
	chenjun_data = 0x12;
	chenjun_bss = 0x34;
	while(1);
}