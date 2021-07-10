/* Copyright (c) 1997 The NetBSD Foundation, Inc.
 * All rights reserved.
 *
 * author: deneschen@foxmail.com
 */
#ifndef RISCV_CSR_ENCODING_H
#define RISCV_CSR_ENCODING_H

// User Trap Setup
#define CSR_USTATUS                0x000U
#define CSR_UIE                    0x004U
#define CSR_UTVEC                  0x005U
// User Trap Handling
#define CSR_USCRATCH               0x040U
#define CSR_UEPC                   0x041U
#define CSR_UCAUSE                 0x042U
#define CSR_UBADADDR               0x043U
#define CSR_UIP                    0x044U
// User Floating-Point CSRs
#define CSR_FFLAGS                 0x001U
#define CSR_FRM                    0x002U
#define CSR_FCSR                   0x003U
// User Counter/Timers
#define CSR_CYCLE                  0xc00U
#define CSR_TIME                   0xc01U
#define CSR_INSTRET                0xc02U
#define CSR_HPMCOUNTER3            0xc03U
#define CSR_HPMCOUNTER4            0xc04U
#define CSR_HPMCOUNTER5            0xc05U
#define CSR_HPMCOUNTER6            0xc06U
#define CSR_HPMCOUNTER7            0xc07U
#define CSR_HPMCOUNTER8            0xc08U
#define CSR_HPMCOUNTER9            0xc09U
#define CSR_HPMCOUNTER10           0xc0aU
#define CSR_HPMCOUNTER11           0xc0bU
#define CSR_HPMCOUNTER12           0xc0cU
#define CSR_HPMCOUNTER13           0xc0dU
#define CSR_HPMCOUNTER14           0xc0eU
#define CSR_HPMCOUNTER15           0xc0fU
#define CSR_HPMCOUNTER16           0xc10U
#define CSR_HPMCOUNTER17           0xc11U
#define CSR_HPMCOUNTER18           0xc12U
#define CSR_HPMCOUNTER19           0xc13U
#define CSR_HPMCOUNTER20           0xc14U
#define CSR_HPMCOUNTER21           0xc15U
#define CSR_HPMCOUNTER22           0xc16U
#define CSR_HPMCOUNTER23           0xc17U
#define CSR_HPMCOUNTER24           0xc18U
#define CSR_HPMCOUNTER25           0xc19U
#define CSR_HPMCOUNTER26           0xc1aU
#define CSR_HPMCOUNTER27           0xc1bU
#define CSR_HPMCOUNTER28           0xc1cU
#define CSR_HPMCOUNTER29           0xc1dU
#define CSR_HPMCOUNTER30           0xc1eU
#define CSR_HPMCOUNTER31           0xc1fU
#define CSR_CYCLEH                 0xc80U
#define CSR_TIMEH                  0xc81U
#define CSR_INSTRETH               0xc82U
#define CSR_HPMCOUNTER3H           0xc83U
#define CSR_HPMCOUNTER4H           0xc84U
#define CSR_HPMCOUNTER5H           0xc85U
#define CSR_HPMCOUNTER6H           0xc86U
#define CSR_HPMCOUNTER7H           0xc87U
#define CSR_HPMCOUNTER8H           0xc88U
#define CSR_HPMCOUNTER9H           0xc89U
#define CSR_HPMCOUNTER10H          0xc8aU
#define CSR_HPMCOUNTER11H          0xc8bU
#define CSR_HPMCOUNTER12H          0xc8cU
#define CSR_HPMCOUNTER13H          0xc8dU
#define CSR_HPMCOUNTER14H          0xc8eU
#define CSR_HPMCOUNTER15H          0xc8fU
#define CSR_HPMCOUNTER16H          0xc90U
#define CSR_HPMCOUNTER17H          0xc91U
#define CSR_HPMCOUNTER18H          0xc92U
#define CSR_HPMCOUNTER19H          0xc93U
#define CSR_HPMCOUNTER20H          0xc94U
#define CSR_HPMCOUNTER21H          0xc95U
#define CSR_HPMCOUNTER22H          0xc96U
#define CSR_HPMCOUNTER23H          0xc97U
#define CSR_HPMCOUNTER24H          0xc98U
#define CSR_HPMCOUNTER25H          0xc99U
#define CSR_HPMCOUNTER26H          0xc9aU
#define CSR_HPMCOUNTER27H          0xc9bU
#define CSR_HPMCOUNTER28H          0xc9cU
#define CSR_HPMCOUNTER29H          0xc9dU
#define CSR_HPMCOUNTER30H          0xc9eU
#define CSR_HPMCOUNTER31H          0xc9fU
// Supervisor Trap Setup
#define CSR_SSTATUS                0x100U
#define CSR_SEDELEG                0x102U
#define CSR_SIDELEG                0x103U
#define CSR_SIE                    0x104U
#define CSR_STVEC                  0x105U
// Supervisor Trap Handling
#define CSR_SSCRATCH               0x140U
#define CSR_SEPC                   0x141U
#define CSR_SCAUSE                 0x142U
#define CSR_SBADADDR               0x143U
#define CSR_SIP                    0x144U
// Supervisor Protection and Translation
#define CSR_SPTBR                  0x180U
// Hypervisor Trap Setup
#define CSR_HSTATUS                0x200U
#define CSR_HEDELEG                0x202U
#define CSR_HIDELEG                0x203U
#define CSR_HIE                    0x204U
#define CSR_HTVEC                  0x205U
// Hypervisor Trap Handling
#define CSR_HSCRATCH               0x240U
#define CSR_HEPC                   0x241U
#define CSR_HCAUSE                 0x242U
#define CSR_HBADADDR               0x243U
#define CSR_HIP                    0x244U
// Hypervisor Protection and Translation
// Machine Information Registers
#define CSR_MVENDORID              0xf11U
#define CSR_MARCHID                0xf12U
#define CSR_MIMPID                 0xf13U
#define CSR_MHARTID                0xf14U
// Machine Trap Setup
#define CSR_MSTATUS                0x300U
#define CSR_MISA                   0x301U
#define CSR_MEDELEG                0x302U
#define CSR_MIDELEG                0x303U
#define CSR_MIE                    0x304U
#define CSR_MTVEC                  0x305U
// Machine Trap Handling
#define CSR_MSCRATCH               0x340U
#define CSR_MEPC                   0x341U
#define CSR_MCAUSE                 0x342U
#define CSR_MBADADDR               0x343U
#define CSR_MIP                    0x344U
// Machine Protection and Translation
#define CSR_MBASE                  0x380U
#define CSR_MBOUND                 0x381U
#define CSR_MIBASE                 0x382U
#define CSR_MIBOUND                0x383U
#define CSR_MDBASE                 0x384U
#define CSR_MDBOUND                0x385U
// Machine Counter/Timers
#define CSR_MCYCLE                 0xb00U
#define CSR_MINSTRET               0xb02U
#define CSR_MHPMCOUNTER3           0xb03U
#define CSR_MHPMCOUNTER4           0xb04U
#define CSR_MHPMCOUNTER5           0xb05U
#define CSR_MHPMCOUNTER6           0xb06U
#define CSR_MHPMCOUNTER7           0xb07U
#define CSR_MHPMCOUNTER8           0xb08U
#define CSR_MHPMCOUNTER9           0xb09U
#define CSR_MHPMCOUNTER10          0xb0aU
#define CSR_MHPMCOUNTER11          0xb0bU
#define CSR_MHPMCOUNTER12          0xb0cU
#define CSR_MHPMCOUNTER13          0xb0dU
#define CSR_MHPMCOUNTER14          0xb0eU
#define CSR_MHPMCOUNTER15          0xb0fU
#define CSR_MHPMCOUNTER16          0xb10U
#define CSR_MHPMCOUNTER17          0xb11U
#define CSR_MHPMCOUNTER18          0xb12U
#define CSR_MHPMCOUNTER19          0xb13U
#define CSR_MHPMCOUNTER20          0xb14U
#define CSR_MHPMCOUNTER21          0xb15U
#define CSR_MHPMCOUNTER22          0xb16U
#define CSR_MHPMCOUNTER23          0xb17U
#define CSR_MHPMCOUNTER24          0xb18U
#define CSR_MHPMCOUNTER25          0xb19U
#define CSR_MHPMCOUNTER26          0xb1aU
#define CSR_MHPMCOUNTER27          0xb1bU
#define CSR_MHPMCOUNTER28          0xb1cU
#define CSR_MHPMCOUNTER29          0xb1dU
#define CSR_MHPMCOUNTER30          0xb1eU
#define CSR_MHPMCOUNTER31          0xb1fU
#define CSR_MCYCLEH                0xb80U
#define CSR_MINSTRETH              0xb82U
#define CSR_MHPMCOUNTER3H          0xb83U
#define CSR_MHPMCOUNTER4H          0xb84U
#define CSR_MHPMCOUNTER5H          0xb85U
#define CSR_MHPMCOUNTER6H          0xb86U
#define CSR_MHPMCOUNTER7H          0xb87U
#define CSR_MHPMCOUNTER8H          0xb88U
#define CSR_MHPMCOUNTER9H          0xb89U
#define CSR_MHPMCOUNTER10H         0xb8aU
#define CSR_MHPMCOUNTER11H         0xb8bU
#define CSR_MHPMCOUNTER12H         0xb8cU
#define CSR_MHPMCOUNTER13H         0xb8dU
#define CSR_MHPMCOUNTER14H         0xb8eU
#define CSR_MHPMCOUNTER15H         0xb8fU
#define CSR_MHPMCOUNTER16H         0xb90U
#define CSR_MHPMCOUNTER17H         0xb91U
#define CSR_MHPMCOUNTER18H         0xb92U
#define CSR_MHPMCOUNTER19H         0xb93U
#define CSR_MHPMCOUNTER20H         0xb94U
#define CSR_MHPMCOUNTER21H         0xb95U
#define CSR_MHPMCOUNTER22H         0xb96U
#define CSR_MHPMCOUNTER23H         0xb97U
#define CSR_MHPMCOUNTER24H         0xb98U
#define CSR_MHPMCOUNTER25H         0xb99U
#define CSR_MHPMCOUNTER26H         0xb9aU
#define CSR_MHPMCOUNTER27H         0xb9bU
#define CSR_MHPMCOUNTER28H         0xb9cU
#define CSR_MHPMCOUNTER29H         0xb9dU
#define CSR_MHPMCOUNTER30H         0xb9eU
#define CSR_MHPMCOUNTER31H         0xb9fU
// Machine Counter Setup
#define CSR_MUCOUNTEREN            0x320U
#define CSR_MSCOUNTEREN            0x321U
#define CSR_MHPMEVENT3             0x323U
#define CSR_MHPMEVENT4             0x324U
#define CSR_MHPMEVENT5             0x325U
#define CSR_MHPMEVENT6             0x326U
#define CSR_MHPMEVENT7             0x327U
#define CSR_MHPMEVENT8             0x328U
#define CSR_MHPMEVENT9             0x329U
#define CSR_MHPMEVENT10            0x32aU
#define CSR_MHPMEVENT11            0x32bU
#define CSR_MHPMEVENT12            0x32cU
#define CSR_MHPMEVENT13            0x32dU
#define CSR_MHPMEVENT14            0x32eU
#define CSR_MHPMEVENT15            0x32fU
#define CSR_MHPMEVENT16            0x330U
#define CSR_MHPMEVENT17            0x331U
#define CSR_MHPMEVENT18            0x332U
#define CSR_MHPMEVENT19            0x333U
#define CSR_MHPMEVENT20            0x334U
#define CSR_MHPMEVENT21            0x335U
#define CSR_MHPMEVENT22            0x336U
#define CSR_MHPMEVENT23            0x337U
#define CSR_MHPMEVENT24            0x338U
#define CSR_MHPMEVENT25            0x339U
#define CSR_MHPMEVENT26            0x33aU
#define CSR_MHPMEVENT27            0x33bU
#define CSR_MHPMEVENT28            0x33cU
#define CSR_MHPMEVENT29            0x33dU
#define CSR_MHPMEVENT30            0x33eU
#define CSR_MHPMEVENT31            0x33fU
// Debug/Trace Registers(shared with Debug Mode)
#define CSR_TSELECT                0x7a0U
#define CSR_TDATA1                 0x7a1U
#define CSR_TDATA2                 0x7a2U
#define CSR_TDATA3                 0x7a3U
// Debug Mode Registers
#define CSR_DCSR                   0x7b0U
#define CSR_DPC                    0x7b1U
#define CSR_DSCRATCH               0x7b2U

#define ISA_F (1 << ('F' - 'A'))
#define ISA_D (1 << ('D' - 'A'))

#define SR_FS (0b11 << 13)

#endif // RISCV_CSR_ENCODING_H
