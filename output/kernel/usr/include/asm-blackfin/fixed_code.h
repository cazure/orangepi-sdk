/*
 * This file defines the fixed addresses where userspace programs
 * can find atomic code sequences.
 *
 * Copyright 2007-2008 Analog Devices Inc.
 *
 * Licensed under the GPL-2 or later.
 */

#ifndef __BFIN_ASM_FIXED_CODE_H__
#define __BFIN_ASM_FIXED_CODE_H__


#define FIXED_CODE_START	0x400

#define SIGRETURN_STUB		0x400

#define ATOMIC_SEQS_START	0x410

#define ATOMIC_XCHG32		0x410
#define ATOMIC_CAS32		0x420
#define ATOMIC_ADD32		0x430
#define ATOMIC_SUB32		0x440
#define ATOMIC_IOR32		0x450
#define ATOMIC_AND32		0x460
#define ATOMIC_XOR32		0x470

#define ATOMIC_SEQS_END		0x480

#define SAFE_USER_INSTRUCTION   0x480

#define FIXED_CODE_END		0x490

#endif
