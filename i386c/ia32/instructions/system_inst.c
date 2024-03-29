/*	$Id: system_inst.c,v 1.32 2008/01/25 18:02:18 monaka Exp $	*/

/*
 * Copyright (c) 2003 NONAKA Kimihiro
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "compiler.h"
#include "cpu.h"
#include "ia32.mcr"

#include "system_inst.h"


void
LGDT_Ms(UINT32 op)
{
	UINT32 madr;
	UINT32 base;
	UINT16 limit;

	if (op < 0xc0) {
		if (!CPU_STAT_PM || !CPU_STAT_VM86 || CPU_STAT_CPL == 0) {
			CPU_WORKCLOCK(11);
			madr = calc_ea_dst(op);
			limit = cpu_vmemoryread_w(CPU_INST_SEGREG_INDEX, madr);
			base = cpu_vmemoryread_d(CPU_INST_SEGREG_INDEX, madr + 2);
			if (!CPU_INST_OP32) {
				base &= 0x00ffffff;
			}

#if defined(MORE_DEBUG)
			gdtr_dump(base, limit);
#endif

			CPU_GDTR_BASE = base;
			CPU_GDTR_LIMIT = limit;
			return;
		}
		VERBOSE(("LGDT: VM86(%s) or CPL(%d) != 0", CPU_STAT_VM86 ? "true" : "false", CPU_STAT_CPL));
		EXCEPTION(GP_EXCEPTION, 0);
	}
	EXCEPTION(UD_EXCEPTION, 0);
}

void
SGDT_Ms(UINT32 op)
{
	UINT32 madr;
	UINT32 base;
	UINT16 limit;

	if (op < 0xc0) {
		CPU_WORKCLOCK(11);
		limit = CPU_GDTR_LIMIT;
		base = CPU_GDTR_BASE;
		if (!CPU_INST_OP32) {
			base &= 0x00ffffff;
		}
		madr = calc_ea_dst(op);
		cpu_vmemorywrite_w(CPU_INST_SEGREG_INDEX, madr, limit);
		cpu_vmemorywrite_d(CPU_INST_SEGREG_INDEX, madr + 2, base);
		return;
	}
	EXCEPTION(UD_EXCEPTION, 0);
}

void
LLDT_Ew(UINT32 op)
{
	UINT32 madr;
	UINT16 src;

	if (CPU_STAT_PM && !CPU_STAT_VM86) {
		if (CPU_STAT_CPL == 0) {
			if (op >= 0xc0) {
				CPU_WORKCLOCK(5);
				src = *(reg16_b20[op]);
			} else {
				CPU_WORKCLOCK(11);
				madr = calc_ea_dst(op);
				src = cpu_vmemoryread_w(CPU_INST_SEGREG_INDEX, madr);
			}
			load_ldtr(src, GP_EXCEPTION);
			return;
		}
		VERBOSE(("LLDT: CPL(%d) != 0", CPU_STAT_CPL));
		EXCEPTION(GP_EXCEPTION, 0);
	}
	VERBOSE(("LLDT: VM86"));
	EXCEPTION(UD_EXCEPTION, 0);
}

void
SLDT_Ew(UINT32 op)
{
	UINT32 madr;
	UINT16 ldtr;

	if (CPU_STAT_PM && !CPU_STAT_VM86) {
		ldtr = CPU_LDTR;
		if (op >= 0xc0) {
			CPU_WORKCLOCK(5);
			if (CPU_INST_OP32) {
				*(reg32_b20[op]) = ldtr;
			} else {
				*(reg16_b20[op]) = ldtr;
			}
		} else {
			CPU_WORKCLOCK(11);
			madr = calc_ea_dst(op);
			cpu_vmemorywrite_w(CPU_INST_SEGREG_INDEX, madr, ldtr);
		}
		return;
	}
	VERBOSE(("SLDT: VM86"));
	EXCEPTION(UD_EXCEPTION, 0);
}

void
LTR_Ew(UINT32 op)
{
	UINT32 madr;
	UINT16 src;

	if (CPU_STAT_PM && !CPU_STAT_VM86) {
		if (CPU_STAT_CPL == 0) {
			if (op >= 0xc0) {
				CPU_WORKCLOCK(5);
				src = *(reg16_b20[op]);
			} else {
				CPU_WORKCLOCK(11);
				madr = calc_ea_dst(op);
				src = cpu_vmemoryread_w(CPU_INST_SEGREG_INDEX, madr);
			}
			load_tr(src);
			return;
		}
		VERBOSE(("LTR: CPL(%d) != 0", CPU_STAT_CPL));
		EXCEPTION(GP_EXCEPTION, 0);
	}
	VERBOSE(("LTR: VM86"));
	EXCEPTION(UD_EXCEPTION, 0);
}

void
STR_Ew(UINT32 op)
{
	UINT32 madr;
	UINT16 tr;

	if (CPU_STAT_PM && !CPU_STAT_VM86) {
		tr = CPU_TR;
		if (op >= 0xc0) {
			CPU_WORKCLOCK(5);
			if (CPU_INST_OP32) {
				*(reg32_b20[op]) = tr;
			} else {
				*(reg16_b20[op]) = tr;
			}
		} else {
			CPU_WORKCLOCK(11);
			madr = calc_ea_dst(op);
			cpu_vmemorywrite_w(CPU_INST_SEGREG_INDEX, madr, tr);
		}
		return;
	}
	VERBOSE(("STR: VM86"));
	EXCEPTION(UD_EXCEPTION, 0);
}

void
LIDT_Ms(UINT32 op)
{
	UINT32 madr;
	UINT32 base;
	UINT16 limit;

	if (op < 0xc0) {
		if (!CPU_STAT_PM || !CPU_STAT_VM86 || CPU_STAT_CPL == 0) {
			CPU_WORKCLOCK(11);
			madr = calc_ea_dst(op);
			limit = cpu_vmemoryread_w(CPU_INST_SEGREG_INDEX, madr);
			base = cpu_vmemoryread_d(CPU_INST_SEGREG_INDEX, madr + 2);
			if (!CPU_INST_OP32) {
				base &= 0x00ffffff;
			}

#if defined(MORE_DEBUG)
			idtr_dump(base, limit);
#endif

			CPU_IDTR_BASE = base;
			CPU_IDTR_LIMIT = limit;
			return;
		}
		VERBOSE(("LIDT: VM86(%s) or CPL(%d) != 0", CPU_STAT_VM86 ? "true" : "false", CPU_STAT_CPL));
		EXCEPTION(GP_EXCEPTION, 0);
	}
	EXCEPTION(UD_EXCEPTION, 0);
}

void
SIDT_Ms(UINT32 op)
{
	UINT32 madr;
	UINT32 base;
	UINT16 limit;

	if (op < 0xc0) {
		CPU_WORKCLOCK(11);
		limit = CPU_IDTR_LIMIT;
		base = CPU_IDTR_BASE;
		if (!CPU_INST_OP32) {
			base &= 0x00ffffff;
		}
		madr = calc_ea_dst(op);
		cpu_vmemorywrite_w(CPU_INST_SEGREG_INDEX, madr, limit);
		cpu_vmemorywrite_d(CPU_INST_SEGREG_INDEX, madr + 2, base);
		return;
	}
	EXCEPTION(UD_EXCEPTION, 0);
}

void
MOV_CdRd(void)
{
	UINT32 op, src;
	UINT32 reg;
	int idx;

	CPU_WORKCLOCK(11);
	GET_PCBYTE(op);
	if (op >= 0xc0) {
		if (CPU_STAT_PM && (CPU_STAT_VM86 || CPU_STAT_CPL != 0)) {
			VERBOSE(("MOV_CdRd: VM86(%s) or CPL(%d) != 0", CPU_STAT_VM86 ? "true" : "false", CPU_STAT_CPL));
			EXCEPTION(GP_EXCEPTION, 0);
		}

		src = *(reg32_b20[op]);
		idx = (op >> 3) & 7;

		switch (idx) {
		case 0: /* CR0 */
			/*
			 * 0 = PE (protect enable)
			 * 1 = MP (monitor coprocesser)
			 * 2 = EM (emulation)
			 * 3 = TS (task switch)
			 * 4 = ET (extend type, FPU present = 1)
			 * 5 = NE (numeric error)
			 * 16 = WP (write protect)
			 * 18 = AM (alignment mask)
			 * 29 = NW (not write-through)
			 * 30 = CD (cache diable)
			 * 31 = PG (pageing)
			 */

			/* 下巻 p.182 割り込み 13 - 一般保護例外 */
			if ((src & (CPU_CR0_PE|CPU_CR0_PG)) == (UINT32)CPU_CR0_PG) {
				EXCEPTION(GP_EXCEPTION, 0);
			}
			if ((src & (CPU_CR0_NW|CPU_CR0_CD)) == CPU_CR0_NW) {
				EXCEPTION(GP_EXCEPTION, 0);
			}

			reg = CPU_CR0;
			src &= CPU_CR0_ALL;
#if defined(USE_FPU)
			src |= CPU_CR0_ET;	/* FPU present */
#else
			src |= CPU_CR0_EM | CPU_CR0_NE;
			src &= ~(CPU_CR0_MP | CPU_CR0_ET);
#endif
			CPU_CR0 = src;
			VERBOSE(("MOV_CdRd: %04x:%08x: cr0: 0x%08x <- 0x%08x(%s)", CPU_CS, CPU_PREV_EIP, reg, CPU_CR0, reg32_str[op & 7]));

			if ((reg ^ CPU_CR0) & (CPU_CR0_PE|CPU_CR0_PG)) {
				tlb_flush(TRUE);
			}
			if ((reg ^ CPU_CR0) & CPU_CR0_PE) {
				if (CPU_CR0 & CPU_CR0_PE) {
					change_pm(1);
				}
			}
			if ((reg ^ CPU_CR0) & CPU_CR0_PG) {
				if (CPU_CR0 & CPU_CR0_PG) {
					change_pg(1);
				} else {
					change_pg(0);
				}
			}
			if ((reg ^ CPU_CR0) & CPU_CR0_PE) {
				if (!(CPU_CR0 & CPU_CR0_PE)) {
					change_pm(0);
				}
			}

			CPU_STAT_WP = (CPU_CR0 & CPU_CR0_WP) ? 0x10 : 0;
			break;

		case 2: /* CR2 */
			reg = CPU_CR2;
			CPU_CR2 = src;	/* page fault linear address */
			VERBOSE(("MOV_CdRd: %04x:%08x: cr2: 0x%08x <- 0x%08x(%s)", CPU_CS, CPU_PREV_EIP, reg, CPU_CR2, reg32_str[op & 7]));
			break;

		case 3: /* CR3 */
			/*
			 * 31-12 = page directory base
			 * 4 = PCD (page level cache diable)
			 * 3 = PWT (page level write throgh)
			 */
			reg = CPU_CR3;
			set_CR3(src);
			VERBOSE(("MOV_CdRd: %04x:%08x: cr3: 0x%08x <- 0x%08x(%s)", CPU_CS, CPU_PREV_EIP, reg, CPU_CR3, reg32_str[op & 7]));
			break;

		case 4: /* CR4 */
			/*
			 * 10 = OSXMMEXCPT (support non masking exception by OS)
			 * 9 = OSFXSR (support FXSAVE, FXRSTOR by OS)
			 * 8 = PCE (performance monitoring counter enable)
			 * 7 = PGE (page global enable)
			 * 6 = MCE (machine check enable)
			 * 5 = PAE (physical address extention)
			 * 4 = PSE (page size extention)
			 * 3 = DE (debug extention)
			 * 2 = TSD (time stamp diable)
			 * 1 = PVI (protected mode virtual interrupt)
			 * 0 = VME (VM8086 mode extention)
			 */
			reg = 0		/* allow bit */
#if (CPU_FEATURES & CPU_FEATURE_PGE) == CPU_FEATURE_PGE
			    | CPU_CR4_PGE
#endif
			;
			if (src & ~reg) {
				if (src & 0xfffffc00) {
					EXCEPTION(GP_EXCEPTION, 0);
				}
				ia32_warning("MOV_CdRd: CR4 <- 0x%08x", src);
			}

			reg = CPU_CR4;
			CPU_CR4 = src;
			VERBOSE(("MOV_CdRd: %04x:%08x: cr4: 0x%08x <- 0x%08x(%s)", CPU_CS, CPU_PREV_EIP, reg, CPU_CR4, reg32_str[op & 7]));

			if ((reg ^ CPU_CR4) & (CPU_CR4_PSE|CPU_CR4_PGE|CPU_CR4_PAE)) {
				tlb_flush(TRUE);
			}
			break;

		default:
			ia32_panic("MOV_CdRd: CR reg index (%d)", idx);
			/*NOTREACHED*/
			break;
		}
		return;
	}
	EXCEPTION(UD_EXCEPTION, 0);
}

void
MOV_RdCd(void)
{
	UINT32 *out;
	UINT32 op;
	int idx;

	CPU_WORKCLOCK(11);
	GET_PCBYTE(op);
	if (op >= 0xc0) {
		if (CPU_STAT_PM && (CPU_STAT_VM86 || CPU_STAT_CPL != 0)) {
			VERBOSE(("MOV_RdCd: VM86(%s) or CPL(%d) != 0", CPU_STAT_VM86 ? "true" : "false", CPU_STAT_CPL));
			EXCEPTION(GP_EXCEPTION, 0);
		}

		out = reg32_b20[op];
		idx = (op >> 3) & 7;

		switch (idx) {
		case 0:
			*out = CPU_CR0;
			break;

		case 2:
			*out = CPU_CR2;
			break;

		case 3:
			*out = CPU_CR3;
			break;

		case 4:
			*out = CPU_CR4;
			break;

		default:
			ia32_panic("MOV_RdCd: CR reg index (%d)", idx);
			/*NOTREACHED*/
			break;
		}
		VERBOSE(("MOV_RdCd: %04x:%08x: cr%d: 0x%08x -> %s", CPU_CS, CPU_PREV_EIP, idx, *out, reg32_str[op & 7]));
		return;
	}
	EXCEPTION(UD_EXCEPTION, 0);
}

void
LMSW_Ew(UINT32 op)
{
	UINT32 src, madr;
	UINT32 cr0;

	if (!CPU_STAT_PM || CPU_STAT_CPL == 0) {
		if (op >= 0xc0) {
			CPU_WORKCLOCK(2);
			src = *(reg16_b20[op]);
		} else {
			CPU_WORKCLOCK(3);
			madr = calc_ea_dst(op);
			src = cpu_vmemoryread_w(CPU_INST_SEGREG_INDEX, madr);
		}

		cr0 = CPU_CR0;
		CPU_CR0 &= ~0xe; /* can't switch back from protected mode */
		CPU_CR0 |= (src & 0xf);	/* TS, EM, MP, PE */
		if (!(cr0 & CPU_CR0_PE) && (src & CPU_CR0_PE)) {
			change_pm(1);	/* switch to protected mode */
		}
		return;
	}
	VERBOSE(("LMSW: CPL(%d) != 0", CPU_STAT_CPL));
	EXCEPTION(GP_EXCEPTION, 0);
}

void
SMSW_Ew(UINT32 op)
{
	UINT32 madr;

	if (op >= 0xc0) {
		CPU_WORKCLOCK(2);
		*(reg16_b20[op]) = (UINT16)CPU_CR0;
	} else {
		CPU_WORKCLOCK(3);
		madr = calc_ea_dst(op);
		cpu_vmemorywrite_w(CPU_INST_SEGREG_INDEX, madr, (UINT16)CPU_CR0);
	}
}

void
CLTS(void)
{

	CPU_WORKCLOCK(5);
	if (CPU_STAT_PM && (CPU_STAT_VM86 || (CPU_STAT_CPL != 0))) {
		VERBOSE(("CLTS: VM86(%s) or CPL(%d) != 0", CPU_STAT_VM86 ? "true" : "false", CPU_STAT_CPL));
		EXCEPTION(GP_EXCEPTION, 0);
	}
	CPU_CR0 &= ~CPU_CR0_TS;
}

void
ARPL_EwGw(void)
{
	UINT32 op, madr;
	UINT src, dst;

	if (CPU_STAT_PM && !CPU_STAT_VM86) {
		PREPART_EA_REG16(op, src);
		if (op >= 0xc0) {
			CPU_WORKCLOCK(2);
			dst = *(reg16_b20[op]);
			if ((dst & 3) < (src & 3)) {
				CPU_FLAGL |= Z_FLAG;
				dst &= ~3;
				dst |= (src & 3);
				*(reg16_b20[op]) = (UINT16)dst;
			} else {
				CPU_FLAGL &= ~Z_FLAG;
			}
		} else {
			CPU_WORKCLOCK(3);
			madr = calc_ea_dst(op);
			dst = cpu_vmemoryread_w(CPU_INST_SEGREG_INDEX, madr);
			if ((dst & 3) < (src & 3)) {
				CPU_FLAGL |= Z_FLAG;
				dst &= ~3;
				dst |= (src & 3);
				cpu_vmemorywrite_w(CPU_INST_SEGREG_INDEX, madr, (UINT16)dst);
			} else {
				CPU_FLAGL &= ~Z_FLAG;
			}
		}
		return;
	}
	VERBOSE(("ARPL: VM86"));
	EXCEPTION(UD_EXCEPTION, 0);
}

/*
 * DPL
 */
void
LAR_GwEw(void)
{
	selector_t sel;
	UINT16 *out;
	UINT32 op;
	UINT32 h;
	int rv;
	UINT16 selector;

	if (CPU_STAT_PM && !CPU_STAT_VM86) {
		PREPART_REG16_EA(op, selector, out, 5, 11);

		rv = parse_selector(&sel, selector);
		if (rv < 0) {
			CPU_FLAGL &= ~Z_FLAG;
			return;
		}

		if (sel.desc.s) {
			/* code or data segment */
			if (!(sel.desc.u.seg.c && sel.desc.u.seg.ec)) {
				/* not conforming code segment */
				if ((sel.desc.dpl < CPU_STAT_CPL)
				 || (sel.desc.dpl < sel.rpl)) {
					CPU_FLAGL &= ~Z_FLAG;
					return;
				}
			}
		} else {
			/* system segment */
			switch (sel.desc.type) {
			case CPU_SYSDESC_TYPE_TSS_16:
			case CPU_SYSDESC_TYPE_LDT:
			case CPU_SYSDESC_TYPE_TSS_BUSY_16:
			case CPU_SYSDESC_TYPE_CALL_16:
			case CPU_SYSDESC_TYPE_TASK:
			case CPU_SYSDESC_TYPE_TSS_32:
			case CPU_SYSDESC_TYPE_TSS_BUSY_32:
			case CPU_SYSDESC_TYPE_CALL_32:
				break;

			default:
				CPU_FLAGL &= ~Z_FLAG;
				return;
			}
		}

		h = cpu_kmemoryread_d(sel.addr + 4);
		*out = (UINT16)(h & 0xff00);
		CPU_FLAGL |= Z_FLAG;
		return;
	}
	VERBOSE(("LAR: VM86"));
	EXCEPTION(UD_EXCEPTION, 0);
}

void
LAR_GdEw(void)
{
	selector_t sel;
	UINT32 *out;
	UINT32 op;
	UINT32 h;
	int rv;
	UINT32 selector;

	if (CPU_STAT_PM && !CPU_STAT_VM86) {
		PREPART_REG32_EA(op, selector, out, 5, 11);

		rv = parse_selector(&sel, (UINT16)selector);
		if (rv < 0) {
			CPU_FLAGL &= ~Z_FLAG;
			return;
		}

		if (sel.desc.s) {
			/* code or data segment */
			if (!(sel.desc.u.seg.c && sel.desc.u.seg.ec)) {
				/* not conforming code segment */
				if ((sel.desc.dpl < CPU_STAT_CPL)
				 || (sel.desc.dpl < sel.rpl)) {
					CPU_FLAGL &= ~Z_FLAG;
					return;
				}
			}
		} else {
			/* system segment */
			switch (sel.desc.type) {
			case CPU_SYSDESC_TYPE_TSS_16:
			case CPU_SYSDESC_TYPE_LDT:
			case CPU_SYSDESC_TYPE_TSS_BUSY_16:
			case CPU_SYSDESC_TYPE_CALL_16:
			case CPU_SYSDESC_TYPE_TASK:
			case CPU_SYSDESC_TYPE_TSS_32:
			case CPU_SYSDESC_TYPE_TSS_BUSY_32:
			case CPU_SYSDESC_TYPE_CALL_32:
				break;

			default:
				CPU_FLAGL &= ~Z_FLAG;
				return;
			}
		}

		h = cpu_kmemoryread_d(sel.addr + 4);
		*out = h & 0x00ffff00;	/* 0x00fxff00, x? */
		CPU_FLAGL |= Z_FLAG;
		return;
	}
	VERBOSE(("LAR: VM86"));
	EXCEPTION(UD_EXCEPTION, 0);
}

void
LSL_GwEw(void)
{
	selector_t sel;
	UINT16 *out;
	UINT32 op;
	int rv;
	UINT16 selector;

	if (CPU_STAT_PM && !CPU_STAT_VM86) {
		PREPART_REG16_EA(op, selector, out, 5, 11);

		rv = parse_selector(&sel, selector);
		if (rv < 0) {
			CPU_FLAGL &= ~Z_FLAG;
			return;
		}

		if (sel.desc.s) {
			/* code or data segment */
			if (!(sel.desc.u.seg.c && sel.desc.u.seg.ec)) {
				/* not conforming code segment */
				if ((sel.desc.dpl < CPU_STAT_CPL)
				 || (sel.desc.dpl < sel.rpl)) {
					CPU_FLAGL &= ~Z_FLAG;
					return;
				}
			}
		} else {
			/* system segment */
			switch (sel.desc.type) {
			case CPU_SYSDESC_TYPE_TSS_16:
			case CPU_SYSDESC_TYPE_LDT:
			case CPU_SYSDESC_TYPE_TSS_BUSY_16:
			case CPU_SYSDESC_TYPE_TSS_32:
			case CPU_SYSDESC_TYPE_TSS_BUSY_32:
				break;

			default:
				CPU_FLAGL &= ~Z_FLAG;
				return;
			}
		}

		*out = (UINT16)sel.desc.u.seg.limit;
		CPU_FLAGL |= Z_FLAG;
		return;
	}
	VERBOSE(("LSL: VM86"));
	EXCEPTION(UD_EXCEPTION, 0);
}

void
LSL_GdEw(void)
{
	selector_t sel;
	UINT32 *out;
	UINT32 op;
	int rv;
	UINT32 selector;

	if (CPU_STAT_PM && !CPU_STAT_VM86) {
		PREPART_REG32_EA(op, selector, out, 5, 11);

		rv = parse_selector(&sel, (UINT16)selector);
		if (rv < 0) {
			CPU_FLAGL &= ~Z_FLAG;
			return;
		}

		if (sel.desc.s) {
			/* code or data segment */
			if (!(sel.desc.u.seg.c && sel.desc.u.seg.ec)) {
				/* not conforming code segment */
				if ((sel.desc.dpl < CPU_STAT_CPL)
				 || (sel.desc.dpl < sel.rpl)) {
					CPU_FLAGL &= ~Z_FLAG;
					return;
				}
			}
		} else {
			/* system segment */
			switch (sel.desc.type) {
			case CPU_SYSDESC_TYPE_TSS_16:
			case CPU_SYSDESC_TYPE_LDT:
			case CPU_SYSDESC_TYPE_TSS_BUSY_16:
			case CPU_SYSDESC_TYPE_TSS_32:
			case CPU_SYSDESC_TYPE_TSS_BUSY_32:
				break;

			default:
				CPU_FLAGL &= ~Z_FLAG;
				return;
			}
		}

		*out = sel.desc.u.seg.limit;
		CPU_FLAGL |= Z_FLAG;
		return;
	}
	VERBOSE(("LSL: VM86"));
	EXCEPTION(UD_EXCEPTION, 0);
}

void
VERR_Ew(UINT32 op)
{
	selector_t sel;
	UINT32 madr;
	int rv;
	UINT16 selector;

	if (CPU_STAT_PM && !CPU_STAT_VM86) {
		if (op >= 0xc0) {
			CPU_WORKCLOCK(5);
			selector = *(reg16_b20[op]);
		} else {
			CPU_WORKCLOCK(11);
			madr = calc_ea_dst(op);
			selector = cpu_vmemoryread_w(CPU_INST_SEGREG_INDEX, madr);
		}

		rv = parse_selector(&sel, selector);
		if (rv < 0) {
			CPU_FLAGL &= ~Z_FLAG;
			return;
		}

		/* system segment */
		if (!sel.desc.s) {
			CPU_FLAGL &= ~Z_FLAG;
			return;
		}
		/* not conforming code segment && (CPL > DPL || RPL > DPL) */
		if (!(sel.desc.u.seg.c && sel.desc.u.seg.ec)) {
			/* not conforming code segment */
			if ((sel.desc.dpl < CPU_STAT_CPL)
			 || (sel.desc.dpl < sel.rpl)) {
				CPU_FLAGL &= ~Z_FLAG;
				return;
			}
		}
		/* code segment is not readable */
		if (sel.desc.u.seg.c && !sel.desc.u.seg.wr) {
			CPU_FLAGL &= ~Z_FLAG;
			return;
		}

		CPU_FLAGL |= Z_FLAG;
		return;
	}
	VERBOSE(("VERR: VM86"));
	EXCEPTION(UD_EXCEPTION, 0);
}

void
VERW_Ew(UINT32 op)
{
	selector_t sel;
	UINT32 madr;
	int rv;
	UINT16 selector;

	if (CPU_STAT_PM && !CPU_STAT_VM86) {
		if (op >= 0xc0) {
			CPU_WORKCLOCK(5);
			selector = *(reg16_b20[op]);
		} else {
			CPU_WORKCLOCK(11);
			madr = calc_ea_dst(op);
			selector = cpu_vmemoryread_w(CPU_INST_SEGREG_INDEX, madr);
		}

		rv = parse_selector(&sel, selector);
		if (rv < 0) {
			CPU_FLAGL &= ~Z_FLAG;
			return;
		}

		/* system segment || code segment */
		if (!sel.desc.s || sel.desc.u.seg.c) {
			CPU_FLAGL &= ~Z_FLAG;
			return;
		}
		/* data segment is not writable */
		if (!sel.desc.u.seg.wr) {
			CPU_FLAGL &= ~Z_FLAG;
			return;
		}
		/* privilege level */
		if ((CPU_STAT_CPL > sel.desc.dpl) || (sel.rpl > sel.desc.dpl)) {
			CPU_FLAGL &= ~Z_FLAG;
			return;
		}

		CPU_FLAGL |= Z_FLAG;
		return;
	}
	VERBOSE(("VERW: VM86"));
	EXCEPTION(UD_EXCEPTION, 0);
}

void
MOV_DdRd(void)
{
	UINT32 src;
	UINT op;
	int idx;
#if defined(IA32_SUPPORT_DEBUG_REGISTER)
	int i;
#endif

	CPU_WORKCLOCK(11);
	GET_PCBYTE(op);
	if (op >= 0xc0) {
		if (CPU_STAT_PM && (CPU_STAT_VM86 || CPU_STAT_CPL != 0)) {
			VERBOSE(("MOV_DdRd: VM86(%s) or CPL(%d) != 0", CPU_STAT_VM86 ? "true" : "false", CPU_STAT_CPL));
			EXCEPTION(GP_EXCEPTION, 0);
		}

		if (CPU_DR7 & CPU_DR7_GD) {
			CPU_DR6 |= CPU_DR6_BD;
			CPU_DR7 &= ~CPU_DR7_GD;
			EXCEPTION(DB_EXCEPTION, 0);
		}

		src = *(reg32_b20[op]);
		idx = (op >> 3) & 7;

		CPU_DR(idx) = src;
		switch (idx) {
		case 0:
		case 1:
		case 2:
		case 3:
			CPU_DR(idx) = src;
			break;

#if CPU_FAMILY >= 5
		case 4:
			if (CPU_CR4 & CPU_CR4_DE) {
				EXCEPTION(UD_EXCEPTION, 0);
			}
#endif
		case 6:
			CPU_DR6 = src;
			break;

#if CPU_FAMILY >= 5
		case 5:
			if (CPU_CR4 & CPU_CR4_DE) {
				EXCEPTION(UD_EXCEPTION, 0);
			}
#endif
		case 7:
			CPU_DR7 = src;
			CPU_STAT_BP = 0;
#if defined(IA32_SUPPORT_DEBUG_REGISTER)
			for (i = 0; i < CPU_DEBUG_REG_INDEX_NUM; i++) {
				if (CPU_DR7 & (CPU_DR7_L(i)|CPU_DR7_G(i))) {
					CPU_STAT_BP |= (1 << i);
				}
			}
#endif	/* IA32_SUPPORT_DEBUG_REGISTER */
			break;

		default:
			ia32_panic("MOV_DdRd: DR reg index (%d)", idx);
			/*NOTREACHED*/
			break;
		}

		return;
	}
	EXCEPTION(UD_EXCEPTION, 0);
}

void
MOV_RdDd(void)
{
	UINT32 *out;
	UINT op;
	int idx;

	CPU_WORKCLOCK(11);
	GET_PCBYTE(op);
	if (op >= 0xc0) {
		if (CPU_STAT_PM && (CPU_STAT_VM86 || CPU_STAT_CPL != 0)) {
			VERBOSE(("MOV_RdDd: VM86(%s) or CPL(%d) != 0", CPU_STAT_VM86 ? "true" : "false", CPU_STAT_CPL));
			EXCEPTION(GP_EXCEPTION, 0);
		}

		if (CPU_DR7 & CPU_DR7_GD) {
			CPU_DR6 |= CPU_DR6_BD;
			CPU_DR7 &= ~CPU_DR7_GD;
			EXCEPTION(DB_EXCEPTION, 0);
		}

		out = reg32_b20[op];
		idx = (op >> 3) & 7;

		switch (idx) {
		case 0:
		case 1:
		case 2:
		case 3:
			*out = CPU_DR(idx);
			break;

		case 4:
#if CPU_FAMILY >= 5
			if (CPU_CR4 & CPU_CR4_DE) {
				EXCEPTION(UD_EXCEPTION, 0);
			}
#endif
		case 6:
#if CPU_FAMILY == 4
			*out = (CPU_DR6 & 0x0000f00f) | 0xffff0ff0;
#elif CPU_FAMILY >= 5
			*out = (CPU_DR6 & 0x0000e00f) | 0xffff0ff0;
#endif
			break;

#if CPU_FAMILY >= 5
		case 5:
			if (CPU_CR4 & CPU_CR4_DE) {
				EXCEPTION(UD_EXCEPTION, 0);
			}
#endif
		case 7:
			*out = CPU_DR7;
			break;

		default:
			ia32_panic("MOV_RdDd: DR reg index (%d)", idx);
			/*NOTREACHED*/
			break;
		}
		return;
	}
	EXCEPTION(UD_EXCEPTION, 0);
}

void
INVD(void)
{

	CPU_WORKCLOCK(11);
	if (CPU_STAT_PM && (CPU_STAT_VM86 || CPU_STAT_CPL != 0)) {
		VERBOSE(("INVD: VM86(%s) or CPL(%d) != 0", CPU_STAT_VM86 ? "true" : "false", CPU_STAT_CPL));
		EXCEPTION(GP_EXCEPTION, 0);
	}
}

void
WBINVD(void)
{

	CPU_WORKCLOCK(11);
	if (CPU_STAT_PM && (CPU_STAT_VM86 || CPU_STAT_CPL != 0)) {
		VERBOSE(("WBINVD: VM86(%s) or CPL(%d) != 0", CPU_STAT_VM86 ? "true" : "false", CPU_STAT_CPL));
		EXCEPTION(GP_EXCEPTION, 0);
	}
}

void
INVLPG(UINT32 op)
{
	descriptor_t *sd;
	UINT32 madr;
	int idx;
	int exc;

	if (CPU_STAT_PM && (CPU_STAT_VM86 || CPU_STAT_CPL != 0)) {
		VERBOSE(("INVLPG: VM86(%s) or CPL(%d) != 0", CPU_STAT_VM86 ? "true" : "false", CPU_STAT_CPL));
		EXCEPTION(GP_EXCEPTION, 0);
	}

	if (op < 0xc0) {
		CPU_WORKCLOCK(11);
		madr = calc_ea_dst(op);

		idx = CPU_INST_SEGREG_INDEX;
		sd = &CPU_STAT_SREG(idx);
		if (!sd->valid) {
			exc = GP_EXCEPTION;
			goto err;
		}
		switch (sd->type) {
		case 4: case 5: case 6: case 7:
			if (madr <= sd->u.seg.limit) {
				if (idx == CPU_SS_INDEX)
					exc = SS_EXCEPTION;
				else
					exc = GP_EXCEPTION;
				goto err;
			}
			break;

		default:
			if (madr > sd->u.seg.limit) {
				if (idx == CPU_SS_INDEX)
					exc = SS_EXCEPTION;
				else
					exc = GP_EXCEPTION;
				goto err;
			}
			break;
		}
		tlb_flush_page(sd->u.seg.segbase + madr);
		return;
	}
	exc = UD_EXCEPTION;
err:
	EXCEPTION(exc, 0);
}

void
_LOCK(void)
{

	/* Nothing to do */
}

void
HLT(void)
{

	if (CPU_STAT_PM && CPU_STAT_CPL != 0) {
		VERBOSE(("HLT: CPL(%d) != 0", CPU_STAT_CPL));
		EXCEPTION(GP_EXCEPTION, 0);
	}

	CPU_HALT();
	CPU_EIP--;
	CPU_STAT_HLT = 1;
}

void
RSM(void)
{

	ia32_panic("RSM: not implemented yet!");
}

void
RDMSR(void)
{
	int idx;

	if (CPU_STAT_PM && (CPU_STAT_VM86 || CPU_STAT_CPL != 0)) {
		VERBOSE(("RDMSR: VM86(%s) or CPL(%d) != 0", CPU_STAT_VM86 ? "true" : "false", CPU_STAT_CPL));
		EXCEPTION(GP_EXCEPTION, 0);
	}

	idx = CPU_ECX;
	switch (idx) {
	default:
		EXCEPTION(GP_EXCEPTION, 0);
		break;
	}
}

void
WRMSR(void)
{
	int idx;

	if (CPU_STAT_PM && (CPU_STAT_VM86 || CPU_STAT_CPL != 0)) {
		VERBOSE(("WRMSR: VM86(%s) or CPL(%d) != 0", CPU_STAT_VM86 ? "true" : "false", CPU_STAT_CPL));
		EXCEPTION(GP_EXCEPTION, 0);
	}

	idx = CPU_ECX;
	switch (idx) {
		/* MTRR への書き込み時 tlb_flush(TRUE); */

	default:
		EXCEPTION(GP_EXCEPTION, 0);
		break;
	}
}

void
RDTSC(void)
{

	ia32_panic("RDTSC: not implemented yet!");
}

void
MOV_TdRd(void)
{

	ia32_panic("MOV_TdRd: not implemented yet!");
}

void
MOV_RdTd(void)
{

	ia32_panic("MOV_RdTd: not implemented yet!");
}
