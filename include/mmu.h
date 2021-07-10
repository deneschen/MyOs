#ifndef _MMU_H_
#define _MMU_H_

#include <stdint.h>

/*
 * Sv39 page table entry struct
 * see detail: riscv-privileged-v1.9.1.pdf
 *  ______________________________________________
 *  | X | W | R | Meaning
 *  | 0 | 0 | 0 | Pointer to next level of page table.
 *  | 0 | 0 | 1 | Read-only page.
 *  | 0 | 1 | 0 | Reserved for future use.
 *  | 0 | 1 | 1 | Read-write page.
 *  | 1 | 0 | 0 | Execute-only page.
 *  | 1 | 0 | 1 | Read-execute page.
 *  | 1 | 1 | 0 | Reserved for future use.
 *  | 1 | 1 | 1 | Read-write-execute page.
 *  ______________________________________________
Table 4.2: Encoding of PTE R/W/X fields.
 */
typedef struct page_table_entry {
	uint64_t V : 1;        // whether the PTE is valid
	uint64_t R : 1;        // read-only
	uint64_t W : 1;        // write-only
	uint64_t X : 1;        // execute-only
	uint64_t U : 1;        // whether the page is accessible to user mode
	uint64_t G : 1;        // global mapping
	uint64_t A : 1;        // accessed
	uint64_t D : 1;        // dirty
	uint64_t Reserved : 2;
	uint64_t PPN0 : 9;     // PPN[0]
	uint64_t PPN1 : 9;     // PPN[1]
	uint64_t PPN2 : 20;    // PPN[2]
	uint64_t Reserved : 16;
} __attribute__((packed, aligned(4))) pte_t;

#define PAGE_SIZE (4096)

static inline int pte_is_valid(pte_t entry)
{
	return (entry.V == 1);
}

static inline int pte_is_leaf(pte_t entry)
{
	return !((entry.X == 0) && (entry.W == 0) && (entry.R == 0));
}

#endif
