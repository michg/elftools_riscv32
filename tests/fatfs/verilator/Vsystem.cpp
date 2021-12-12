// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsystem.h for the primary calling header

#include "Vsystem.h"
#include "Vsystem__Syms.h"

#include "verilated_dpi.h"

//==========

void Vsystem::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vsystem::eval\n"); );
    Vsystem__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    Vsystem* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
#ifdef VL_DEBUG
    // Debug assertions
    _eval_debug_assertions();
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        vlSymsp->__Vm_activity = true;
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("../system.v", 3, "",
                "Verilated model didn't converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void Vsystem::_eval_initial_loop(Vsystem__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    vlSymsp->__Vm_activity = true;
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        _eval_settle(vlSymsp);
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("../system.v", 3, "",
                "Verilated model didn't DC converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

VL_INLINE_OPT void Vsystem::_sequent__TOP__1(Vsystem__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsystem::_sequent__TOP__1\n"); );
    Vsystem* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    CData/*0:0*/ __Vdly__system__DOT__m_read_en;
    CData/*0:0*/ __Vdly__system__DOT__mem_ready;
    CData/*4:0*/ __Vdlyvlsb__system__DOT__memory__v0;
    CData/*7:0*/ __Vdlyvval__system__DOT__memory__v0;
    CData/*0:0*/ __Vdlyvset__system__DOT__memory__v0;
    CData/*4:0*/ __Vdlyvlsb__system__DOT__memory__v1;
    CData/*7:0*/ __Vdlyvval__system__DOT__memory__v1;
    CData/*0:0*/ __Vdlyvset__system__DOT__memory__v1;
    CData/*4:0*/ __Vdlyvlsb__system__DOT__memory__v2;
    CData/*7:0*/ __Vdlyvval__system__DOT__memory__v2;
    CData/*0:0*/ __Vdlyvset__system__DOT__memory__v2;
    CData/*4:0*/ __Vdlyvlsb__system__DOT__memory__v3;
    CData/*7:0*/ __Vdlyvval__system__DOT__memory__v3;
    CData/*0:0*/ __Vdlyvset__system__DOT__memory__v3;
    CData/*1:0*/ __Vdly__system__DOT__picorv32_core__DOT__mem_state;
    CData/*0:0*/ __Vdly__system__DOT__picorv32_core__DOT__mem_la_secondword;
    CData/*5:0*/ __Vdlyvdim0__system__DOT__picorv32_core__DOT__cpuregs__v0;
    CData/*0:0*/ __Vdlyvset__system__DOT__picorv32_core__DOT__cpuregs__v0;
    CData/*4:0*/ __Vdly__system__DOT__picorv32_core__DOT__reg_sh;
    CData/*0:0*/ __Vdly__system__DOT__picorv32_core__DOT__decoder_trigger;
    CData/*0:0*/ __Vdly__system__DOT__picorv32_core__DOT__decoder_pseudo_trigger;
    CData/*0:0*/ __Vdly__system__DOT__picorv32_core__DOT__do_waitirq;
    CData/*0:0*/ __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst;
    CData/*1:0*/ __Vdly__system__DOT__picorv32_core__DOT__mem_wordsize;
    CData/*0:0*/ __Vdly__system__DOT__picorv32_core__DOT__latched_is_lu;
    CData/*0:0*/ __Vdly__system__DOT__picorv32_core__DOT__latched_is_lh;
    CData/*0:0*/ __Vdly__system__DOT__picorv32_core__DOT__latched_is_lb;
    CData/*0:0*/ __Vdly__system__DOT__picorv32_core__DOT__irq_active;
    CData/*5:0*/ __Vdly__system__DOT__picorv32_core__DOT__latched_rd;
    CData/*0:0*/ __Vdly__system__DOT__picorv32_core__DOT__latched_compr;
    CData/*1:0*/ __Vdly__system__DOT__picorv32_core__DOT__irq_state;
    CData/*0:0*/ __Vdly__system__DOT__picorv32_core__DOT__mem_do_prefetch;
    CData/*7:0*/ __Vdly__system__DOT__picorv32_core__DOT__cpu_state;
    CData/*0:0*/ __Vdly__system__DOT__picorv32_core__DOT__pcpi_valid;
    CData/*3:0*/ __Vdly__system__DOT__picorv32_core__DOT__pcpi_timeout_counter;
    CData/*6:0*/ __Vdly__system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__mul_counter;
    CData/*0:0*/ __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_div;
    CData/*0:0*/ __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_divu;
    CData/*0:0*/ __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_rem;
    CData/*0:0*/ __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_remu;
    CData/*0:0*/ __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__running;
    SData/*14:0*/ __Vdlyvdim0__system__DOT__memory__v0;
    SData/*14:0*/ __Vdlyvdim0__system__DOT__memory__v1;
    SData/*14:0*/ __Vdlyvdim0__system__DOT__memory__v2;
    SData/*14:0*/ __Vdlyvdim0__system__DOT__memory__v3;
    IData/*31:0*/ __Vfunc_readspi__15__Vfuncout;
    IData/*31:0*/ __Vdly__system__DOT__mem_rdata;
    IData/*31:0*/ __Vdlyvval__system__DOT__picorv32_core__DOT__cpuregs__v0;
    IData/*31:0*/ __Vdly__system__DOT__picorv32_core__DOT__reg_out;
    IData/*31:0*/ __Vdly__system__DOT__picorv32_core__DOT__timer;
    IData/*31:0*/ __Vdly__system__DOT__picorv32_core__DOT__reg_pc;
    IData/*31:0*/ __Vdly__system__DOT__picorv32_core__DOT__reg_op1;
    IData/*31:0*/ __Vdly__system__DOT__picorv32_core__DOT__irq_mask;
    IData/*31:0*/ __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__dividend;
    IData/*31:0*/ __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient;
    IData/*31:0*/ __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient_msk;
    IData/*31:0*/ __Vdly__system__DOT__sd__DOT__readval;
    QData/*63:0*/ __Vdly__system__DOT__picorv32_core__DOT__count_cycle;
    QData/*63:0*/ __Vdly__system__DOT__picorv32_core__DOT__count_instr;
    QData/*62:0*/ __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__divisor;
    // Body
    __Vdlyvset__system__DOT__picorv32_core__DOT__cpuregs__v0 = 0U;
    __Vdly__system__DOT__picorv32_core__DOT__pcpi_timeout_counter 
        = vlTOPp->system__DOT__picorv32_core__DOT__pcpi_timeout_counter;
    __Vdly__system__DOT__picorv32_core__DOT__pcpi_valid 
        = vlTOPp->system__DOT__picorv32_core__DOT__pcpi_valid;
    __Vdly__system__DOT__picorv32_core__DOT__count_instr 
        = vlTOPp->system__DOT__picorv32_core__DOT__count_instr;
    __Vdly__system__DOT__picorv32_core__DOT__latched_rd 
        = vlTOPp->system__DOT__picorv32_core__DOT__latched_rd;
    __Vdly__system__DOT__picorv32_core__DOT__latched_is_lb 
        = vlTOPp->system__DOT__picorv32_core__DOT__latched_is_lb;
    __Vdly__system__DOT__picorv32_core__DOT__latched_is_lh 
        = vlTOPp->system__DOT__picorv32_core__DOT__latched_is_lh;
    __Vdly__system__DOT__picorv32_core__DOT__latched_is_lu 
        = vlTOPp->system__DOT__picorv32_core__DOT__latched_is_lu;
    __Vdly__system__DOT__picorv32_core__DOT__do_waitirq 
        = vlTOPp->system__DOT__picorv32_core__DOT__do_waitirq;
    __Vdly__system__DOT__picorv32_core__DOT__decoder_pseudo_trigger 
        = vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger;
    __Vdly__system__DOT__picorv32_core__DOT__timer 
        = vlTOPp->system__DOT__picorv32_core__DOT__timer;
    __Vdly__system__DOT__picorv32_core__DOT__count_cycle 
        = vlTOPp->system__DOT__picorv32_core__DOT__count_cycle;
    __Vdly__system__DOT__picorv32_core__DOT__reg_sh 
        = vlTOPp->system__DOT__picorv32_core__DOT__reg_sh;
    __Vdly__system__DOT__picorv32_core__DOT__irq_active 
        = vlTOPp->system__DOT__picorv32_core__DOT__irq_active;
    __Vdly__system__DOT__picorv32_core__DOT__decoder_trigger 
        = vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger;
    __Vdly__system__DOT__picorv32_core__DOT__latched_compr 
        = vlTOPp->system__DOT__picorv32_core__DOT__latched_compr;
    __Vdly__system__DOT__picorv32_core__DOT__reg_pc 
        = vlTOPp->system__DOT__picorv32_core__DOT__reg_pc;
    __Vdly__system__DOT__picorv32_core__DOT__mem_wordsize 
        = vlTOPp->system__DOT__picorv32_core__DOT__mem_wordsize;
    __Vdly__system__DOT__picorv32_core__DOT__irq_mask 
        = vlTOPp->system__DOT__picorv32_core__DOT__irq_mask;
    __Vdly__system__DOT__picorv32_core__DOT__cpu_state 
        = vlTOPp->system__DOT__picorv32_core__DOT__cpu_state;
    __Vdly__system__DOT__picorv32_core__DOT__reg_op1 
        = vlTOPp->system__DOT__picorv32_core__DOT__reg_op1;
    __Vdly__system__DOT__picorv32_core__DOT__irq_state 
        = vlTOPp->system__DOT__picorv32_core__DOT__irq_state;
    __Vdly__system__DOT__picorv32_core__DOT__mem_do_prefetch 
        = vlTOPp->system__DOT__picorv32_core__DOT__mem_do_prefetch;
    __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst 
        = vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst;
    __Vdly__system__DOT__picorv32_core__DOT__reg_out 
        = vlTOPp->system__DOT__picorv32_core__DOT__reg_out;
    __Vdly__system__DOT__picorv32_core__DOT__mem_state 
        = vlTOPp->system__DOT__picorv32_core__DOT__mem_state;
    __Vdly__system__DOT__picorv32_core__DOT__mem_la_secondword 
        = vlTOPp->system__DOT__picorv32_core__DOT__mem_la_secondword;
    __Vdly__system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__mul_counter 
        = vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__mul_counter;
    __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient_msk 
        = vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient_msk;
    __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient 
        = vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient;
    __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__divisor 
        = vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__divisor;
    __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__dividend 
        = vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__dividend;
    __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__running 
        = vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__running;
    __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_remu 
        = vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_remu;
    __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_rem 
        = vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_rem;
    __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_divu 
        = vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_divu;
    __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_div 
        = vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_div;
    __Vdly__system__DOT__sd__DOT__readval = vlTOPp->system__DOT__sd__DOT__readval;
    __Vdly__system__DOT__m_read_en = vlTOPp->system__DOT__m_read_en;
    __Vdly__system__DOT__mem_rdata = vlTOPp->system__DOT__mem_rdata;
    __Vdly__system__DOT__mem_ready = vlTOPp->system__DOT__mem_ready;
    __Vdlyvset__system__DOT__memory__v0 = 0U;
    __Vdlyvset__system__DOT__memory__v1 = 0U;
    __Vdlyvset__system__DOT__memory__v2 = 0U;
    __Vdlyvset__system__DOT__memory__v3 = 0U;
    vlTOPp->system__DOT__picorv32_core__DOT__alu_wait_2 = 0U;
    vlTOPp->system__DOT__picorv32_core__DOT__trace_data = 0ULL;
    vlTOPp->system__DOT__picorv32_core__DOT__trace_valid = 0U;
    vlTOPp->system__DOT__picorv32_core__DOT__alu_wait = 0U;
    vlTOPp->system__DOT__picorv32_core__DOT__alu_out_0_q 
        = vlTOPp->system__DOT__picorv32_core__DOT__alu_out_0;
    if ((1U & (~ (IData)(vlTOPp->resetn)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__latched_trace = 0U;
    }
    vlTOPp->system__DOT__picorv32_core__DOT__q_ascii_instr 
        = vlTOPp->system__DOT__picorv32_core__DOT__dbg_ascii_instr;
    vlTOPp->system__DOT__picorv32_core__DOT__q_insn_imm 
        = vlTOPp->system__DOT__picorv32_core__DOT__dbg_insn_imm;
    vlTOPp->system__DOT__picorv32_core__DOT__q_insn_opcode 
        = vlTOPp->system__DOT__picorv32_core__DOT__dbg_insn_opcode;
    vlTOPp->system__DOT__picorv32_core__DOT__q_insn_rs1 
        = vlTOPp->system__DOT__picorv32_core__DOT__dbg_insn_rs1;
    vlTOPp->system__DOT__picorv32_core__DOT__q_insn_rs2 
        = vlTOPp->system__DOT__picorv32_core__DOT__dbg_insn_rs2;
    vlTOPp->system__DOT__picorv32_core__DOT__q_insn_rd 
        = vlTOPp->system__DOT__picorv32_core__DOT__dbg_insn_rd;
    vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__pcpi_wait_q 
        = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_div_wait) 
           & (IData)(vlTOPp->resetn));
    if ((((IData)(vlTOPp->resetn) & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_write)) 
         & (0U != (IData)(vlTOPp->system__DOT__picorv32_core__DOT__latched_rd)))) {
        vlTOPp->system__DOT__picorv32_core__DOT____Vlvbound1 
            = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_wrdata;
        if ((0x23U >= (IData)(vlTOPp->system__DOT__picorv32_core__DOT__latched_rd))) {
            __Vdlyvval__system__DOT__picorv32_core__DOT__cpuregs__v0 
                = vlTOPp->system__DOT__picorv32_core__DOT____Vlvbound1;
            __Vdlyvset__system__DOT__picorv32_core__DOT__cpuregs__v0 = 1U;
            __Vdlyvdim0__system__DOT__picorv32_core__DOT__cpuregs__v0 
                = vlTOPp->system__DOT__picorv32_core__DOT__latched_rd;
        }
    }
    vlTOPp->system__DOT__picorv32_core__DOT__dbg_next 
        = vlTOPp->system__DOT__picorv32_core__DOT__launch_next_insn;
    vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger_q 
        = vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger;
    if (vlTOPp->system__DOT__picorv32_core__DOT__launch_next_insn) {
        vlTOPp->system__DOT__picorv32_core__DOT__dbg_insn_addr 
            = vlTOPp->system__DOT__picorv32_core__DOT__next_pc;
    }
    vlTOPp->system__DOT__picorv32_core__DOT__clear_prefetched_high_word_q 
        = vlTOPp->system__DOT__picorv32_core__DOT__clear_prefetched_high_word;
    if ((1U & ((~ (IData)(vlTOPp->resetn)) | (IData)(vlTOPp->trap)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__dbg_valid_insn = 0U;
    } else {
        if (vlTOPp->system__DOT__picorv32_core__DOT__launch_next_insn) {
            vlTOPp->system__DOT__picorv32_core__DOT__dbg_valid_insn = 1U;
        }
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger_q) {
        vlTOPp->system__DOT__picorv32_core__DOT__cached_ascii_instr 
            = vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger_q) {
        vlTOPp->system__DOT__picorv32_core__DOT__cached_insn_opcode 
            = ((3U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__next_insn_opcode))
                ? vlTOPp->system__DOT__picorv32_core__DOT__next_insn_opcode
                : (0xffffU & vlTOPp->system__DOT__picorv32_core__DOT__next_insn_opcode));
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger_q) {
        vlTOPp->system__DOT__picorv32_core__DOT__cached_insn_rd 
            = (0x1fU & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoded_rd));
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger_q) {
        vlTOPp->system__DOT__picorv32_core__DOT__cached_insn_rs2 
            = (0x1fU & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs2));
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger_q) {
        vlTOPp->system__DOT__picorv32_core__DOT__cached_insn_rs1 
            = (0x1fU & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1));
    }
    vlTOPp->system__DOT__picorv32_core__DOT__pcpi_mul_wr = 0U;
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__mul_finish) 
         & (IData)(vlTOPp->resetn))) {
        vlTOPp->system__DOT__picorv32_core__DOT__pcpi_mul_wr = 1U;
    }
    vlTOPp->system__DOT__picorv32_core__DOT__pcpi_mul_ready = 0U;
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__mul_finish) 
         & (IData)(vlTOPp->resetn))) {
        vlTOPp->system__DOT__picorv32_core__DOT__pcpi_mul_ready = 1U;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger_q) {
        vlTOPp->system__DOT__picorv32_core__DOT__cached_insn_imm 
            = vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm;
    }
    __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_remu = 0U;
    if ((((((IData)(vlTOPp->resetn) & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_valid)) 
           & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_div_ready))) 
          & (0x33U == (0x7fU & vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn))) 
         & (1U == (0x7fU & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                            >> 0x19U))))) {
        if ((4U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                          >> 0xcU)))) {
            if ((5U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                              >> 0xcU)))) {
                if ((6U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                                  >> 0xcU)))) {
                    if ((7U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                                      >> 0xcU)))) {
                        __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_remu = 1U;
                    }
                }
            }
        }
    }
    __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_rem = 0U;
    if ((((((IData)(vlTOPp->resetn) & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_valid)) 
           & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_div_ready))) 
          & (0x33U == (0x7fU & vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn))) 
         & (1U == (0x7fU & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                            >> 0x19U))))) {
        if ((4U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                          >> 0xcU)))) {
            if ((5U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                              >> 0xcU)))) {
                if ((6U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                                  >> 0xcU)))) {
                    __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_rem = 1U;
                }
            }
        }
    }
    __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_divu = 0U;
    if ((((((IData)(vlTOPp->resetn) & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_valid)) 
           & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_div_ready))) 
          & (0x33U == (0x7fU & vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn))) 
         & (1U == (0x7fU & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                            >> 0x19U))))) {
        if ((4U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                          >> 0xcU)))) {
            if ((5U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                              >> 0xcU)))) {
                __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_divu = 1U;
            }
        }
    }
    __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_div = 0U;
    if ((((((IData)(vlTOPp->resetn) & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_valid)) 
           & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_div_ready))) 
          & (0x33U == (0x7fU & vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn))) 
         & (1U == (0x7fU & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                            >> 0x19U))))) {
        if ((4U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                          >> 0xcU)))) {
            __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_div = 1U;
        }
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__mul_finish) 
         & (IData)(vlTOPp->resetn))) {
        vlTOPp->system__DOT__picorv32_core__DOT__pcpi_mul_rd 
            = (IData)(((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_any_mulh)
                        ? (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__rd 
                           >> 0x20U) : vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__rd));
    }
    __Vdly__system__DOT__m_read_en = 0U;
    __Vdly__system__DOT__mem_ready = ((((IData)(vlTOPp->system__DOT__mem_valid) 
                                        & (~ (IData)(vlTOPp->system__DOT__mem_ready_last))) 
                                       & (~ (IData)(vlTOPp->system__DOT__mem_ready))) 
                                      & (IData)(vlTOPp->system__DOT__m_read_en));
    vlTOPp->system__DOT__mem_ready_last = vlTOPp->system__DOT__mem_ready;
    if (((0x8000U > (vlTOPp->system__DOT__mem_addr 
                     >> 2U)) & (IData)(vlTOPp->system__DOT__mem_valid))) {
        __Vdly__system__DOT__m_read_en = 1U;
        __Vdly__system__DOT__mem_rdata = vlTOPp->system__DOT__m_read_data;
        vlTOPp->system__DOT__m_read_data = vlTOPp->system__DOT__memory
            [(0x7fffU & (vlTOPp->system__DOT__mem_addr 
                         >> 2U))];
        if (vlTOPp->system__DOT__wr) {
            if ((1U & (IData)(vlTOPp->system__DOT__mem_wstrb))) {
                __Vdlyvval__system__DOT__memory__v0 
                    = (0xffU & vlTOPp->system__DOT__mem_wdata);
                __Vdlyvset__system__DOT__memory__v0 = 1U;
                __Vdlyvlsb__system__DOT__memory__v0 = 0U;
                __Vdlyvdim0__system__DOT__memory__v0 
                    = (0x7fffU & (vlTOPp->system__DOT__mem_addr 
                                  >> 2U));
            }
            __Vdly__system__DOT__mem_ready = 1U;
            if ((2U & (IData)(vlTOPp->system__DOT__mem_wstrb))) {
                __Vdlyvval__system__DOT__memory__v1 
                    = (0xffU & (vlTOPp->system__DOT__mem_wdata 
                                >> 8U));
                __Vdlyvset__system__DOT__memory__v1 = 1U;
                __Vdlyvlsb__system__DOT__memory__v1 = 8U;
                __Vdlyvdim0__system__DOT__memory__v1 
                    = (0x7fffU & (vlTOPp->system__DOT__mem_addr 
                                  >> 2U));
            }
            if ((4U & (IData)(vlTOPp->system__DOT__mem_wstrb))) {
                __Vdlyvval__system__DOT__memory__v2 
                    = (0xffU & (vlTOPp->system__DOT__mem_wdata 
                                >> 0x10U));
                __Vdlyvset__system__DOT__memory__v2 = 1U;
                __Vdlyvlsb__system__DOT__memory__v2 = 0x10U;
                __Vdlyvdim0__system__DOT__memory__v2 
                    = (0x7fffU & (vlTOPp->system__DOT__mem_addr 
                                  >> 2U));
            }
            if ((8U & (IData)(vlTOPp->system__DOT__mem_wstrb))) {
                __Vdlyvval__system__DOT__memory__v3 
                    = (0xffU & (vlTOPp->system__DOT__mem_wdata 
                                >> 0x18U));
                __Vdlyvset__system__DOT__memory__v3 = 1U;
                __Vdlyvlsb__system__DOT__memory__v3 = 0x18U;
                __Vdlyvdim0__system__DOT__memory__v3 
                    = (0x7fffU & (vlTOPp->system__DOT__mem_addr 
                                  >> 2U));
            }
        }
    } else {
        if (vlTOPp->system__DOT__spi_cs) {
            if (vlTOPp->system__DOT__rd) {
                __Vdly__system__DOT__m_read_en = vlTOPp->system__DOT__spi_done;
                __Vdly__system__DOT__mem_rdata = vlTOPp->system__DOT__spi_rdata;
            }
            if (vlTOPp->system__DOT__wr) {
                __Vdly__system__DOT__mem_ready = vlTOPp->system__DOT__spi_done;
            }
        } else {
            if (((0x2000000U == (0xfffffffU & (vlTOPp->system__DOT__mem_addr 
                                               >> 4U))) 
                 & (IData)(vlTOPp->system__DOT__mem_valid))) {
                if (vlTOPp->system__DOT__rd) {
                    __Vdly__system__DOT__m_read_en 
                        = vlTOPp->system__DOT__uart_done;
                    __Vdly__system__DOT__mem_rdata 
                        = vlTOPp->system__DOT__uart_rdata;
                }
                if (vlTOPp->system__DOT__wr) {
                    if (VL_UNLIKELY(vlTOPp->resetn)) {
                        VL_WRITEF("%c",32,vlTOPp->system__DOT__mem_wdata);
                    }
                    __Vdly__system__DOT__mem_ready 
                        = vlTOPp->system__DOT__uart_done;
                    __Vdly__system__DOT__mem_ready = 1U;
                }
            }
        }
    }
    vlTOPp->system__DOT__m_read_en = __Vdly__system__DOT__m_read_en;
    if (__Vdlyvset__system__DOT__memory__v0) {
        vlTOPp->system__DOT__memory[__Vdlyvdim0__system__DOT__memory__v0] 
            = (((~ ((IData)(0xffU) << (IData)(__Vdlyvlsb__system__DOT__memory__v0))) 
                & vlTOPp->system__DOT__memory[__Vdlyvdim0__system__DOT__memory__v0]) 
               | ((IData)(__Vdlyvval__system__DOT__memory__v0) 
                  << (IData)(__Vdlyvlsb__system__DOT__memory__v0)));
    }
    if (__Vdlyvset__system__DOT__memory__v1) {
        vlTOPp->system__DOT__memory[__Vdlyvdim0__system__DOT__memory__v1] 
            = (((~ ((IData)(0xffU) << (IData)(__Vdlyvlsb__system__DOT__memory__v1))) 
                & vlTOPp->system__DOT__memory[__Vdlyvdim0__system__DOT__memory__v1]) 
               | ((IData)(__Vdlyvval__system__DOT__memory__v1) 
                  << (IData)(__Vdlyvlsb__system__DOT__memory__v1)));
    }
    if (__Vdlyvset__system__DOT__memory__v2) {
        vlTOPp->system__DOT__memory[__Vdlyvdim0__system__DOT__memory__v2] 
            = (((~ ((IData)(0xffU) << (IData)(__Vdlyvlsb__system__DOT__memory__v2))) 
                & vlTOPp->system__DOT__memory[__Vdlyvdim0__system__DOT__memory__v2]) 
               | ((IData)(__Vdlyvval__system__DOT__memory__v2) 
                  << (IData)(__Vdlyvlsb__system__DOT__memory__v2)));
    }
    if (__Vdlyvset__system__DOT__memory__v3) {
        vlTOPp->system__DOT__memory[__Vdlyvdim0__system__DOT__memory__v3] 
            = (((~ ((IData)(0xffU) << (IData)(__Vdlyvlsb__system__DOT__memory__v3))) 
                & vlTOPp->system__DOT__memory[__Vdlyvdim0__system__DOT__memory__v3]) 
               | ((IData)(__Vdlyvval__system__DOT__memory__v3) 
                  << (IData)(__Vdlyvlsb__system__DOT__memory__v3)));
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__mem_xfer) {
        vlTOPp->system__DOT__picorv32_core__DOT__next_insn_opcode 
            = vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched;
    }
    vlTOPp->system__DOT__picorv32_core__DOT__pcpi_div_ready = 0U;
    vlTOPp->system__DOT__picorv32_core__DOT__pcpi_div_wr = 0U;
    vlTOPp->system__DOT__picorv32_core__DOT__pcpi_div_rd = 0U;
    if (vlTOPp->resetn) {
        if (vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__start) {
            __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__running = 1U;
            __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__dividend 
                = ((((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_div) 
                     | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_rem)) 
                    & (vlTOPp->system__DOT__picorv32_core__DOT__reg_op1 
                       >> 0x1fU)) ? (- vlTOPp->system__DOT__picorv32_core__DOT__reg_op1)
                    : vlTOPp->system__DOT__picorv32_core__DOT__reg_op1);
            __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__divisor 
                = (0x7fffffffffffffffULL & (((((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_div) 
                                               | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_rem)) 
                                              & (vlTOPp->system__DOT__picorv32_core__DOT__reg_op2 
                                                 >> 0x1fU))
                                              ? (- (QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__reg_op2)))
                                              : (QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__reg_op2))) 
                                            << 0x1fU));
            __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient = 0U;
            __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient_msk = 0x80000000U;
        } else {
            if (((~ (IData)((0U != vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient_msk))) 
                 & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__running))) {
                __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__running = 0U;
                vlTOPp->system__DOT__picorv32_core__DOT__pcpi_div_ready = 1U;
                vlTOPp->system__DOT__picorv32_core__DOT__pcpi_div_wr = 1U;
                vlTOPp->system__DOT__picorv32_core__DOT__pcpi_div_rd 
                    = (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_div) 
                        | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_divu))
                        ? ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__outsign)
                            ? (- vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient)
                            : vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient)
                        : ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__outsign)
                            ? (- vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__dividend)
                            : vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__dividend));
            } else {
                if ((vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__divisor 
                     <= (QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__dividend)))) {
                    __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__dividend 
                        = (vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__dividend 
                           - (IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__divisor));
                    __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient 
                        = (vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient 
                           | vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient_msk);
                }
                __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__divisor 
                    = (0x7fffffffffffffffULL & (vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__divisor 
                                                >> 1U));
                __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient_msk 
                    = (vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient_msk 
                       >> 1U);
            }
        }
    } else {
        __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__running = 0U;
    }
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__mul_finish = 0U;
    if (vlTOPp->resetn) {
        if (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__mul_waiting) {
            vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__rs1 
                = (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_mulh) 
                    | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_mulhsu))
                    ? VL_EXTENDS_QI(64,32, vlTOPp->system__DOT__picorv32_core__DOT__reg_op1)
                    : (QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__reg_op1)));
            vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__rs2 
                = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_mulh)
                    ? VL_EXTENDS_QI(64,32, vlTOPp->system__DOT__picorv32_core__DOT__reg_op2)
                    : (QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__reg_op2)));
            vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__rd = 0ULL;
            vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__rdx = 0ULL;
            __Vdly__system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__mul_counter 
                = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_any_mulh)
                    ? 0x3eU : 0x1eU);
            vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__mul_waiting 
                = (1U & (~ ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_mul_wait) 
                            & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__pcpi_wait_q)))));
        } else {
            __Vdly__system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__mul_counter 
                = (0x7fU & ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__mul_counter) 
                            - (IData)(1U)));
            vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__rd 
                = vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd;
            vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__rdx 
                = vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx;
            vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__rs1 
                = vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rs1;
            vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__rs2 
                = vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rs2;
            if ((0x40U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__mul_counter))) {
                vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__mul_finish = 1U;
                vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__mul_waiting = 1U;
            }
        }
    } else {
        vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__mul_waiting = 1U;
    }
    vlTOPp->system__DOT__spi_done = vlTOPp->system__DOT__spi_cs;
    vlTOPp->system__DOT__spi_rdata = 0U;
    if (((IData)(vlTOPp->system__DOT__spi_cs) & ((0U 
                                                  != (IData)(vlTOPp->system__DOT__mem_wstrb)) 
                                                 & (IData)(vlTOPp->system__DOT__mem_ready)))) {
        if ((8U == (0xfU & vlTOPp->system__DOT__mem_addr))) {
            vlSymsp->TOP____024unit.__Vdpiimwrap_writespi_TOP____024unit(
                                                                         (&(vlSymsp->__Vscope_system__sd)), 
                                                                         "simsd.v", 0x1bU, 
                                                                         (0xffU 
                                                                          & vlTOPp->system__DOT__mem_wdata));
            vlSymsp->TOP____024unit.__Vdpiimwrap_readspi_TOP____024unit(
                                                                        (&(vlSymsp->__Vscope_system__sd)), 
                                                                        "simsd.v", 0x1cU, __Vfunc_readspi__15__Vfuncout);
            __Vdly__system__DOT__sd__DOT__readval = __Vfunc_readspi__15__Vfuncout;
        }
    } else {
        if (vlTOPp->system__DOT__spi_cs) {
            if ((8U == (0xfU & vlTOPp->system__DOT__mem_addr))) {
                vlTOPp->system__DOT__spi_rdata = vlTOPp->system__DOT__sd__DOT__readval;
            }
        }
    }
    vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__running 
        = __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__running;
    vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__dividend 
        = __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__dividend;
    vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__divisor 
        = __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__divisor;
    vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient 
        = __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient;
    vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient_msk 
        = __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__quotient_msk;
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__mul_counter 
        = __Vdly__system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__mul_counter;
    vlTOPp->system__DOT__sd__DOT__readval = __Vdly__system__DOT__sd__DOT__readval;
    vlTOPp->system__DOT__picorv32_core__DOT__dbg_insn_opcode 
        = vlTOPp->system__DOT__picorv32_core__DOT__q_insn_opcode;
    if (vlTOPp->system__DOT__picorv32_core__DOT__dbg_next) {
        vlTOPp->system__DOT__picorv32_core__DOT__dbg_insn_opcode 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger_q)
                ? vlTOPp->system__DOT__picorv32_core__DOT__cached_insn_opcode
                : ((3U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__next_insn_opcode))
                    ? vlTOPp->system__DOT__picorv32_core__DOT__next_insn_opcode
                    : (0xffffU & vlTOPp->system__DOT__picorv32_core__DOT__next_insn_opcode)));
    }
    if (vlTOPp->resetn) {
        if (vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__start) {
            vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__outsign 
                = ((((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_div) 
                     & ((1U & (vlTOPp->system__DOT__picorv32_core__DOT__reg_op1 
                               >> 0x1fU)) != (1U & 
                                              (vlTOPp->system__DOT__picorv32_core__DOT__reg_op2 
                                               >> 0x1fU)))) 
                    & (0U != vlTOPp->system__DOT__picorv32_core__DOT__reg_op2)) 
                   | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_rem) 
                      & (vlTOPp->system__DOT__picorv32_core__DOT__reg_op1 
                         >> 0x1fU)));
        }
    }
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
        = vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__rd;
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
        = vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__rdx;
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rs1 
        = vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__rs1;
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rs2 
        = vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__rs2;
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
        = ((1U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rs1))
            ? vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rs2
            : 0ULL);
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt = 0ULL;
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1 
        = (1U & ((((0xfU & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd)) 
                   + (0xfU & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx))) 
                  + (0xfU & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2))) 
                 >> 4U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2 
        = (0xfU & (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd) 
                    + (IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx)) 
                   + (IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2)));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt 
        = ((0xfffffffffffffff7ULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1)) 
              << 3U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
        = ((0xfffffffffffffff0ULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd) 
           | (IData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2)));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1 
        = (1U & ((((0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                                    >> 4U))) + (0xfU 
                                                & (IData)(
                                                          (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                           >> 4U)))) 
                  + (0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                                     >> 4U)))) >> 4U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2 
        = (0xfU & (((IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                             >> 4U)) + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                >> 4U))) 
                   + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                              >> 4U))));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt 
        = ((0xffffffffffffff7fULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1)) 
              << 7U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
        = ((0xffffffffffffff0fULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2)) 
              << 4U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1 
        = (1U & ((((0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                                    >> 8U))) + (0xfU 
                                                & (IData)(
                                                          (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                           >> 8U)))) 
                  + (0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                                     >> 8U)))) >> 4U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2 
        = (0xfU & (((IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                             >> 8U)) + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                >> 8U))) 
                   + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                              >> 8U))));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt 
        = ((0xfffffffffffff7ffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1)) 
              << 0xbU));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
        = ((0xfffffffffffff0ffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2)) 
              << 8U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1 
        = (1U & ((((0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                                    >> 0xcU))) + (0xfU 
                                                  & (IData)(
                                                            (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                             >> 0xcU)))) 
                  + (0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                                     >> 0xcU)))) >> 4U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2 
        = (0xfU & (((IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                             >> 0xcU)) + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                  >> 0xcU))) 
                   + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                              >> 0xcU))));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt 
        = ((0xffffffffffff7fffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1)) 
              << 0xfU));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
        = ((0xffffffffffff0fffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2)) 
              << 0xcU));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1 
        = (1U & ((((0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                                    >> 0x10U))) + (0xfU 
                                                   & (IData)(
                                                             (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                              >> 0x10U)))) 
                  + (0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                                     >> 0x10U)))) >> 4U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2 
        = (0xfU & (((IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                             >> 0x10U)) + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                   >> 0x10U))) 
                   + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                              >> 0x10U))));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt 
        = ((0xfffffffffff7ffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1)) 
              << 0x13U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
        = ((0xfffffffffff0ffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2)) 
              << 0x10U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1 
        = (1U & ((((0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                                    >> 0x14U))) + (0xfU 
                                                   & (IData)(
                                                             (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                              >> 0x14U)))) 
                  + (0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                                     >> 0x14U)))) >> 4U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2 
        = (0xfU & (((IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                             >> 0x14U)) + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                   >> 0x14U))) 
                   + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                              >> 0x14U))));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt 
        = ((0xffffffffff7fffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1)) 
              << 0x17U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
        = ((0xffffffffff0fffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2)) 
              << 0x14U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1 
        = (1U & ((((0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                                    >> 0x18U))) + (0xfU 
                                                   & (IData)(
                                                             (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                              >> 0x18U)))) 
                  + (0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                                     >> 0x18U)))) >> 4U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2 
        = (0xfU & (((IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                             >> 0x18U)) + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                   >> 0x18U))) 
                   + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                              >> 0x18U))));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt 
        = ((0xfffffffff7ffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1)) 
              << 0x1bU));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
        = ((0xfffffffff0ffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2)) 
              << 0x18U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1 
        = (1U & ((((0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                                    >> 0x1cU))) + (0xfU 
                                                   & (IData)(
                                                             (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                              >> 0x1cU)))) 
                  + (0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                                     >> 0x1cU)))) >> 4U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2 
        = (0xfU & (((IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                             >> 0x1cU)) + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                   >> 0x1cU))) 
                   + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                              >> 0x1cU))));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt 
        = ((0xffffffff7fffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1)) 
              << 0x1fU));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
        = ((0xffffffff0fffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2)) 
              << 0x1cU));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1 
        = (1U & ((((0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                                    >> 0x20U))) + (0xfU 
                                                   & (IData)(
                                                             (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                              >> 0x20U)))) 
                  + (0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                                     >> 0x20U)))) >> 4U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2 
        = (0xfU & (((IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                             >> 0x20U)) + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                   >> 0x20U))) 
                   + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                              >> 0x20U))));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt 
        = ((0xfffffff7ffffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1)) 
              << 0x23U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
        = ((0xfffffff0ffffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2)) 
              << 0x20U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1 
        = (1U & ((((0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                                    >> 0x24U))) + (0xfU 
                                                   & (IData)(
                                                             (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                              >> 0x24U)))) 
                  + (0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                                     >> 0x24U)))) >> 4U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2 
        = (0xfU & (((IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                             >> 0x24U)) + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                   >> 0x24U))) 
                   + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                              >> 0x24U))));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt 
        = ((0xffffff7fffffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1)) 
              << 0x27U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
        = ((0xffffff0fffffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2)) 
              << 0x24U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1 
        = (1U & ((((0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                                    >> 0x28U))) + (0xfU 
                                                   & (IData)(
                                                             (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                              >> 0x28U)))) 
                  + (0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                                     >> 0x28U)))) >> 4U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2 
        = (0xfU & (((IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                             >> 0x28U)) + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                   >> 0x28U))) 
                   + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                              >> 0x28U))));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt 
        = ((0xfffff7ffffffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1)) 
              << 0x2bU));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
        = ((0xfffff0ffffffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2)) 
              << 0x28U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1 
        = (1U & ((((0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                                    >> 0x2cU))) + (0xfU 
                                                   & (IData)(
                                                             (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                              >> 0x2cU)))) 
                  + (0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                                     >> 0x2cU)))) >> 4U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2 
        = (0xfU & (((IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                             >> 0x2cU)) + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                   >> 0x2cU))) 
                   + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                              >> 0x2cU))));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt 
        = ((0xffff7fffffffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1)) 
              << 0x2fU));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
        = ((0xffff0fffffffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2)) 
              << 0x2cU));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1 
        = (1U & ((((0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                                    >> 0x30U))) + (0xfU 
                                                   & (IData)(
                                                             (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                              >> 0x30U)))) 
                  + (0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                                     >> 0x30U)))) >> 4U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2 
        = (0xfU & (((IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                             >> 0x30U)) + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                   >> 0x30U))) 
                   + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                              >> 0x30U))));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt 
        = ((0xfff7ffffffffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1)) 
              << 0x33U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
        = ((0xfff0ffffffffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2)) 
              << 0x30U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1 
        = (1U & ((((0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                                    >> 0x34U))) + (0xfU 
                                                   & (IData)(
                                                             (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                              >> 0x34U)))) 
                  + (0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                                     >> 0x34U)))) >> 4U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2 
        = (0xfU & (((IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                             >> 0x34U)) + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                   >> 0x34U))) 
                   + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                              >> 0x34U))));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt 
        = ((0xff7fffffffffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1)) 
              << 0x37U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
        = ((0xff0fffffffffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2)) 
              << 0x34U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1 
        = (1U & ((((0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                                    >> 0x38U))) + (0xfU 
                                                   & (IData)(
                                                             (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                              >> 0x38U)))) 
                  + (0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                                     >> 0x38U)))) >> 4U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2 
        = (0xfU & (((IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                             >> 0x38U)) + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                   >> 0x38U))) 
                   + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                              >> 0x38U))));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt 
        = ((0xf7ffffffffffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1)) 
              << 0x3bU));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
        = ((0xf0ffffffffffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2)) 
              << 0x38U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1 
        = (1U & ((((0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                                    >> 0x3cU))) + (0xfU 
                                                   & (IData)(
                                                             (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                              >> 0x3cU)))) 
                  + (0xfU & (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                                     >> 0x3cU)))) >> 4U));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2 
        = (0xfU & (((IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
                             >> 0x3cU)) + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
                                                   >> 0x3cU))) 
                   + (IData)((vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__this_rs2 
                              >> 0x3cU))));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt 
        = ((0x7fffffffffffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap1)) 
              << 0x3fU));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd 
        = ((0xfffffffffffffffULL & vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rd) 
           | ((QData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT____Vconcswap2)) 
              << 0x3cU));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdx 
        = (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rdt 
           << 1U);
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rs1 
        = (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rs1 
           >> 1U);
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rs2 
        = (vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__next_rs2 
           << 1U);
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__pcpi_wait_q 
        = vlTOPp->system__DOT__picorv32_core__DOT__pcpi_mul_wait;
    if ((1U & (~ ((~ (IData)(vlTOPp->resetn)) | (IData)(vlTOPp->trap))))) {
        if (vlTOPp->system__DOT__picorv32_core__DOT__mem_la_write) {
            vlTOPp->system__DOT__mem_wdata = vlTOPp->system__DOT__picorv32_core__DOT__mem_la_wdata;
        }
    }
    if ((1U & (~ ((~ (IData)(vlTOPp->resetn)) | (IData)(vlTOPp->trap))))) {
        if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_read) 
             | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_write))) {
            vlTOPp->system__DOT__mem_addr = (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_prefetch) 
                                              | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst))
                                              ? (0xfffffffcU 
                                                 & (((vlTOPp->system__DOT__picorv32_core__DOT__next_pc 
                                                      >> 2U) 
                                                     + 
                                                     ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_xfer) 
                                                      & ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__last_mem_valid)
                                                          ? (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_firstword_reg)
                                                          : (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_firstword)))) 
                                                    << 2U))
                                              : (0xfffffffcU 
                                                 & vlTOPp->system__DOT__picorv32_core__DOT__reg_op1));
        }
    }
    if (vlTOPp->resetn) {
        if ((1U & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__last_mem_valid)))) {
            vlTOPp->system__DOT__picorv32_core__DOT__mem_la_firstword_reg 
                = vlTOPp->system__DOT__picorv32_core__DOT__mem_la_firstword;
        }
    } else {
        vlTOPp->system__DOT__picorv32_core__DOT__mem_la_firstword_reg = 0U;
    }
    vlTOPp->system__DOT__picorv32_core__DOT__last_mem_valid 
        = ((IData)(vlTOPp->resetn) & ((IData)(vlTOPp->system__DOT__mem_valid) 
                                      & (~ (IData)(vlTOPp->system__DOT__mem_ready))));
    if ((1U & ((~ (IData)(vlTOPp->resetn)) | (IData)(vlTOPp->trap)))) {
        if ((1U & (~ (IData)(vlTOPp->resetn)))) {
            __Vdly__system__DOT__picorv32_core__DOT__mem_state = 0U;
        }
        if ((1U & ((~ (IData)(vlTOPp->resetn)) | (IData)(vlTOPp->system__DOT__mem_ready)))) {
            vlTOPp->system__DOT__mem_valid = 0U;
        }
        __Vdly__system__DOT__picorv32_core__DOT__mem_la_secondword = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__prefetched_high_word = 0U;
    } else {
        if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_read) 
             | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_write))) {
            vlTOPp->system__DOT__mem_wstrb = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_wstrb) 
                                              & (- (IData)((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_write))));
        }
        if ((0U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_state))) {
            if ((((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_prefetch) 
                  | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst)) 
                 | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rdata))) {
                vlTOPp->system__DOT__mem_valid = (1U 
                                                  & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_use_prefetched_high_word)));
                vlTOPp->system__DOT__mem_instr = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_prefetch) 
                                                  | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst));
                vlTOPp->system__DOT__mem_wstrb = 0U;
                __Vdly__system__DOT__picorv32_core__DOT__mem_state = 1U;
            }
            if (vlTOPp->system__DOT__picorv32_core__DOT__mem_do_wdata) {
                vlTOPp->system__DOT__mem_valid = 1U;
                vlTOPp->system__DOT__mem_instr = 0U;
                __Vdly__system__DOT__picorv32_core__DOT__mem_state = 2U;
            }
        } else {
            if ((1U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_state))) {
                if (vlTOPp->system__DOT__picorv32_core__DOT__mem_xfer) {
                    if (vlTOPp->system__DOT__picorv32_core__DOT__mem_la_read) {
                        vlTOPp->system__DOT__mem_valid = 1U;
                        __Vdly__system__DOT__picorv32_core__DOT__mem_la_secondword = 1U;
                        if ((1U & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_use_prefetched_high_word)))) {
                            vlTOPp->system__DOT__picorv32_core__DOT__mem_16bit_buffer 
                                = (0xffffU & (vlTOPp->system__DOT__mem_rdata 
                                              >> 0x10U));
                        }
                    } else {
                        vlTOPp->system__DOT__mem_valid = 0U;
                        if ((1U & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rdata)))) {
                            if ((1U & ((~ (IData)((3U 
                                                   == 
                                                   (3U 
                                                    & vlTOPp->system__DOT__mem_rdata)))) 
                                       | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_secondword)))) {
                                vlTOPp->system__DOT__picorv32_core__DOT__mem_16bit_buffer 
                                    = (0xffffU & (vlTOPp->system__DOT__mem_rdata 
                                                  >> 0x10U));
                                vlTOPp->system__DOT__picorv32_core__DOT__prefetched_high_word = 1U;
                            } else {
                                vlTOPp->system__DOT__picorv32_core__DOT__prefetched_high_word = 0U;
                            }
                        }
                        __Vdly__system__DOT__picorv32_core__DOT__mem_state 
                            = (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
                                | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rdata))
                                ? 0U : 3U);
                        __Vdly__system__DOT__picorv32_core__DOT__mem_la_secondword = 0U;
                    }
                }
            } else {
                if ((2U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_state))) {
                    if (vlTOPp->system__DOT__picorv32_core__DOT__mem_xfer) {
                        vlTOPp->system__DOT__mem_valid = 0U;
                        __Vdly__system__DOT__picorv32_core__DOT__mem_state = 0U;
                    }
                } else {
                    if ((3U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_state))) {
                        if (vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) {
                            __Vdly__system__DOT__picorv32_core__DOT__mem_state = 0U;
                        }
                    }
                }
            }
        }
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__clear_prefetched_high_word) {
        vlTOPp->system__DOT__picorv32_core__DOT__prefetched_high_word = 0U;
    }
    vlTOPp->system__DOT__picorv32_core__DOT__mem_state 
        = __Vdly__system__DOT__picorv32_core__DOT__mem_state;
    vlTOPp->system__DOT__mem_rdata = __Vdly__system__DOT__mem_rdata;
    vlTOPp->system__DOT__mem_ready = __Vdly__system__DOT__mem_ready;
    vlTOPp->system__DOT__picorv32_core__DOT__mem_la_secondword 
        = __Vdly__system__DOT__picorv32_core__DOT__mem_la_secondword;
    vlTOPp->system__DOT__spi_cs = ((0x4000000U == (0xfffffffU 
                                                   & (vlTOPp->system__DOT__mem_addr 
                                                      >> 4U))) 
                                   & (IData)(vlTOPp->system__DOT__mem_valid));
    vlTOPp->system__DOT__wr = ((0U != (IData)(vlTOPp->system__DOT__mem_wstrb)) 
                               & (~ (IData)(vlTOPp->system__DOT__mem_ready)));
    vlTOPp->system__DOT__rd = (1U & ((~ (IData)((0U 
                                                 != (IData)(vlTOPp->system__DOT__mem_wstrb)))) 
                                     & (~ (IData)(vlTOPp->system__DOT__mem_ready))));
    vlTOPp->trap = 0U;
    __Vdly__system__DOT__picorv32_core__DOT__reg_sh = 0U;
    __Vdly__system__DOT__picorv32_core__DOT__reg_out = 0U;
    vlTOPp->system__DOT__picorv32_core__DOT__set_mem_do_rinst = 0U;
    vlTOPp->system__DOT__picorv32_core__DOT__set_mem_do_rdata = 0U;
    vlTOPp->system__DOT__picorv32_core__DOT__set_mem_do_wdata = 0U;
    if (vlTOPp->system__DOT__picorv32_core__DOT__launch_next_insn) {
        vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs2val = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val_valid = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs2val_valid = 0U;
    }
    __Vdly__system__DOT__picorv32_core__DOT__count_cycle 
        = ((IData)(vlTOPp->resetn) ? (1ULL + vlTOPp->system__DOT__picorv32_core__DOT__count_cycle)
            : 0ULL);
    vlTOPp->system__DOT__picorv32_core__DOT__next_irq_pending 
        = (0xfffffffeU & vlTOPp->system__DOT__picorv32_core__DOT__irq_pending);
    if ((0U != vlTOPp->system__DOT__picorv32_core__DOT__timer)) {
        if ((0U == (vlTOPp->system__DOT__picorv32_core__DOT__timer 
                    - (IData)(1U)))) {
            vlTOPp->system__DOT__picorv32_core__DOT__next_irq_pending 
                = (1U | vlTOPp->system__DOT__picorv32_core__DOT__next_irq_pending);
        }
        __Vdly__system__DOT__picorv32_core__DOT__timer 
            = (vlTOPp->system__DOT__picorv32_core__DOT__timer 
               - (IData)(1U));
    }
    vlTOPp->system__DOT__picorv32_core__DOT__next_irq_pending 
        = (vlTOPp->system__DOT__picorv32_core__DOT__next_irq_pending 
           | vlTOPp->system__DOT__irqs);
    __Vdly__system__DOT__picorv32_core__DOT__decoder_trigger 
        = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
           & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done));
    vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger_q 
        = vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger;
    __Vdly__system__DOT__picorv32_core__DOT__decoder_pseudo_trigger = 0U;
    __Vdly__system__DOT__picorv32_core__DOT__do_waitirq = 0U;
    if (vlTOPp->resetn) {
        if (((((((((0x80U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cpu_state)) 
                   | (0x40U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cpu_state))) 
                  | (0x20U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cpu_state))) 
                 | (0x10U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cpu_state))) 
                | (8U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cpu_state))) 
               | (4U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cpu_state))) 
              | (2U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cpu_state))) 
             | (1U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cpu_state)))) {
            if ((0x80U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cpu_state))) {
                vlTOPp->trap = 1U;
            } else {
                if ((0x40U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cpu_state))) {
                    __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst 
                        = (1U & ((~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger)) 
                                 & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__do_waitirq))));
                    __Vdly__system__DOT__picorv32_core__DOT__mem_wordsize = 0U;
                    __Vdly__system__DOT__picorv32_core__DOT__latched_is_lu = 0U;
                    __Vdly__system__DOT__picorv32_core__DOT__latched_is_lh = 0U;
                    __Vdly__system__DOT__picorv32_core__DOT__latched_is_lb = 0U;
                    vlTOPp->system__DOT__picorv32_core__DOT__current_pc 
                        = vlTOPp->system__DOT__picorv32_core__DOT__reg_next_pc;
                    if (vlTOPp->system__DOT__picorv32_core__DOT__latched_branch) {
                        vlTOPp->system__DOT__picorv32_core__DOT__current_pc 
                            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__latched_store)
                                ? (0xfffffffeU & ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__latched_stalu)
                                                   ? vlTOPp->system__DOT__picorv32_core__DOT__alu_out_q
                                                   : vlTOPp->system__DOT__picorv32_core__DOT__reg_out))
                                : vlTOPp->system__DOT__picorv32_core__DOT__reg_next_pc);
                    } else {
                        if ((1U & (~ ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__latched_store) 
                                      & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__latched_branch)))))) {
                            if ((1U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_state))) {
                                vlTOPp->system__DOT__picorv32_core__DOT__current_pc = 0x10U;
                                __Vdly__system__DOT__picorv32_core__DOT__irq_active = 1U;
                                __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst = 1U;
                            } else {
                                if ((2U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_state))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__next_irq_pending 
                                        = (vlTOPp->system__DOT__picorv32_core__DOT__next_irq_pending 
                                           & vlTOPp->system__DOT__picorv32_core__DOT__irq_mask);
                                    vlTOPp->system__DOT__eois 
                                        = (vlTOPp->system__DOT__picorv32_core__DOT__irq_pending 
                                           & (~ vlTOPp->system__DOT__picorv32_core__DOT__irq_mask));
                                }
                            }
                        }
                    }
                    __Vdly__system__DOT__picorv32_core__DOT__reg_pc 
                        = vlTOPp->system__DOT__picorv32_core__DOT__current_pc;
                    vlTOPp->system__DOT__picorv32_core__DOT__reg_next_pc 
                        = vlTOPp->system__DOT__picorv32_core__DOT__current_pc;
                    vlTOPp->system__DOT__picorv32_core__DOT__latched_stalu = 0U;
                    vlTOPp->system__DOT__picorv32_core__DOT__latched_store = 0U;
                    vlTOPp->system__DOT__picorv32_core__DOT__latched_branch = 0U;
                    __Vdly__system__DOT__picorv32_core__DOT__latched_rd 
                        = vlTOPp->system__DOT__picorv32_core__DOT__decoded_rd;
                    __Vdly__system__DOT__picorv32_core__DOT__latched_compr 
                        = vlTOPp->system__DOT__picorv32_core__DOT__compressed_instr;
                    if (((~ (IData)((0U != vlTOPp->system__DOT__picorv32_core__DOT__delintreg))) 
                         & (((((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger) 
                               & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_active))) 
                              & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_delay))) 
                             & (0U != (vlTOPp->system__DOT__picorv32_core__DOT__irq_pending 
                                       & (~ vlTOPp->system__DOT__picorv32_core__DOT__irq_mask)))) 
                            | (0U != (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_state))))) {
                        __Vdly__system__DOT__picorv32_core__DOT__irq_state 
                            = ((0U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_state))
                                ? 1U : ((1U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_state))
                                         ? 2U : 0U));
                        __Vdly__system__DOT__picorv32_core__DOT__latched_compr 
                            = vlTOPp->system__DOT__picorv32_core__DOT__latched_compr;
                        __Vdly__system__DOT__picorv32_core__DOT__latched_rd 
                            = (0x3fU & (0x20U | (1U 
                                                 & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_state))));
                    } else {
                        if (((((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger) 
                               & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_active))) 
                              & (0U != (vlTOPp->system__DOT__picorv32_core__DOT__irq_pending 
                                        & (~ vlTOPp->system__DOT__picorv32_core__DOT__irq_mask)))) 
                             | (0U != (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_state)))) {
                            if ((0U != vlTOPp->system__DOT__picorv32_core__DOT__delintreg)) {
                                vlTOPp->system__DOT__picorv32_core__DOT__delintreg 
                                    = (vlTOPp->system__DOT__picorv32_core__DOT__delintreg 
                                       - (IData)(1U));
                            }
                        }
                        if ((((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger) 
                              | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__do_waitirq)) 
                             & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_waitirq))) {
                            if ((0U != vlTOPp->system__DOT__picorv32_core__DOT__irq_pending)) {
                                vlTOPp->system__DOT__picorv32_core__DOT__latched_store = 1U;
                                __Vdly__system__DOT__picorv32_core__DOT__reg_out 
                                    = vlTOPp->system__DOT__picorv32_core__DOT__irq_pending;
                                vlTOPp->system__DOT__picorv32_core__DOT__reg_next_pc 
                                    = (vlTOPp->system__DOT__picorv32_core__DOT__current_pc 
                                       + ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__compressed_instr)
                                           ? 2U : 4U));
                                __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst = 1U;
                            } else {
                                __Vdly__system__DOT__picorv32_core__DOT__do_waitirq = 1U;
                            }
                        } else {
                            if (vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger) {
                                __Vdly__system__DOT__picorv32_core__DOT__count_instr 
                                    = (1ULL + vlTOPp->system__DOT__picorv32_core__DOT__count_instr);
                                vlTOPp->system__DOT__picorv32_core__DOT__irq_delay 
                                    = vlTOPp->system__DOT__picorv32_core__DOT__irq_active;
                                vlTOPp->system__DOT__picorv32_core__DOT__reg_next_pc 
                                    = (vlTOPp->system__DOT__picorv32_core__DOT__current_pc 
                                       + ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__compressed_instr)
                                           ? 2U : 4U));
                                if (vlTOPp->system__DOT__picorv32_core__DOT__instr_jal) {
                                    __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst = 1U;
                                    vlTOPp->system__DOT__picorv32_core__DOT__reg_next_pc 
                                        = (vlTOPp->system__DOT__picorv32_core__DOT__current_pc 
                                           + vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj);
                                    vlTOPp->system__DOT__picorv32_core__DOT__latched_branch = 1U;
                                } else {
                                    __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst = 0U;
                                    __Vdly__system__DOT__picorv32_core__DOT__mem_do_prefetch 
                                        = (1U & ((~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_jalr)) 
                                                 & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_retirq))));
                                    __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x20U;
                                }
                            }
                        }
                    }
                } else {
                    if ((0x20U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cpu_state))) {
                        __Vdly__system__DOT__picorv32_core__DOT__reg_op1 = 0U;
                        vlTOPp->system__DOT__picorv32_core__DOT__reg_op2 = 0U;
                        if (((((((((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_trap) 
                                   | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_rdcycle_rdcycleh_rdinstr_rdinstrh)) 
                                  | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_lui_auipc_jal)) 
                                 | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_getq)) 
                                | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_setq)) 
                               | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_delint)) 
                              | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_retirq)) 
                             | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_maskirq))) {
                            if (vlTOPp->system__DOT__picorv32_core__DOT__instr_trap) {
                                __Vdly__system__DOT__picorv32_core__DOT__reg_op1 
                                    = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1;
                                vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val 
                                    = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1;
                                vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val_valid = 1U;
                                __Vdly__system__DOT__picorv32_core__DOT__pcpi_valid = 1U;
                                __Vdly__system__DOT__picorv32_core__DOT__reg_sh 
                                    = (0x1fU & vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs2);
                                vlTOPp->system__DOT__picorv32_core__DOT__reg_op2 
                                    = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs2;
                                vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs2val 
                                    = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs2;
                                vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs2val_valid = 1U;
                                if (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_int_ready) {
                                    __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst = 1U;
                                    __Vdly__system__DOT__picorv32_core__DOT__pcpi_valid = 0U;
                                    __Vdly__system__DOT__picorv32_core__DOT__reg_out 
                                        = vlTOPp->system__DOT__picorv32_core__DOT__pcpi_int_rd;
                                    vlTOPp->system__DOT__picorv32_core__DOT__latched_store 
                                        = vlTOPp->system__DOT__picorv32_core__DOT__pcpi_int_wr;
                                    __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x40U;
                                } else {
                                    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_timeout) 
                                         | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_ecall_ebreak))) {
                                        __Vdly__system__DOT__picorv32_core__DOT__pcpi_valid = 0U;
                                        if ((1U & (
                                                   (~ 
                                                    (vlTOPp->system__DOT__picorv32_core__DOT__irq_mask 
                                                     >> 1U)) 
                                                   & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_active))))) {
                                            vlTOPp->system__DOT__picorv32_core__DOT__next_irq_pending 
                                                = (2U 
                                                   | vlTOPp->system__DOT__picorv32_core__DOT__next_irq_pending);
                                            __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x40U;
                                        } else {
                                            __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x80U;
                                        }
                                    }
                                }
                            } else {
                                if (vlTOPp->system__DOT__picorv32_core__DOT__is_rdcycle_rdcycleh_rdinstr_rdinstrh) {
                                    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_rdcycle) {
                                        __Vdly__system__DOT__picorv32_core__DOT__reg_out 
                                            = (IData)(vlTOPp->system__DOT__picorv32_core__DOT__count_cycle);
                                    } else {
                                        if (vlTOPp->system__DOT__picorv32_core__DOT__instr_rdcycleh) {
                                            __Vdly__system__DOT__picorv32_core__DOT__reg_out 
                                                = (IData)(
                                                          (vlTOPp->system__DOT__picorv32_core__DOT__count_cycle 
                                                           >> 0x20U));
                                        } else {
                                            if (vlTOPp->system__DOT__picorv32_core__DOT__instr_rdinstr) {
                                                __Vdly__system__DOT__picorv32_core__DOT__reg_out 
                                                    = (IData)(vlTOPp->system__DOT__picorv32_core__DOT__count_instr);
                                            } else {
                                                if (vlTOPp->system__DOT__picorv32_core__DOT__instr_rdinstrh) {
                                                    __Vdly__system__DOT__picorv32_core__DOT__reg_out 
                                                        = (IData)(
                                                                  (vlTOPp->system__DOT__picorv32_core__DOT__count_instr 
                                                                   >> 0x20U));
                                                }
                                            }
                                        }
                                    }
                                    vlTOPp->system__DOT__picorv32_core__DOT__latched_store = 1U;
                                    __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x40U;
                                } else {
                                    if (vlTOPp->system__DOT__picorv32_core__DOT__is_lui_auipc_jal) {
                                        __Vdly__system__DOT__picorv32_core__DOT__reg_op1 
                                            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_lui)
                                                ? 0U
                                                : vlTOPp->system__DOT__picorv32_core__DOT__reg_pc);
                                        vlTOPp->system__DOT__picorv32_core__DOT__reg_op2 
                                            = vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm;
                                        __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst 
                                            = vlTOPp->system__DOT__picorv32_core__DOT__mem_do_prefetch;
                                        __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 8U;
                                    } else {
                                        if (vlTOPp->system__DOT__picorv32_core__DOT__instr_getq) {
                                            __Vdly__system__DOT__picorv32_core__DOT__reg_out 
                                                = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1;
                                            vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val 
                                                = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1;
                                            vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val_valid = 1U;
                                            vlTOPp->system__DOT__picorv32_core__DOT__latched_store = 1U;
                                            __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x40U;
                                        } else {
                                            if (vlTOPp->system__DOT__picorv32_core__DOT__instr_setq) {
                                                __Vdly__system__DOT__picorv32_core__DOT__latched_rd 
                                                    = 
                                                    (0x20U 
                                                     | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__latched_rd));
                                                __Vdly__system__DOT__picorv32_core__DOT__reg_out 
                                                    = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1;
                                                vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val 
                                                    = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1;
                                                vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val_valid = 1U;
                                                vlTOPp->system__DOT__picorv32_core__DOT__latched_store = 1U;
                                                __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x40U;
                                            } else {
                                                if (vlTOPp->system__DOT__picorv32_core__DOT__instr_delint) {
                                                    vlTOPp->system__DOT__picorv32_core__DOT__delintreg 
                                                        = 
                                                        ((0U 
                                                          != (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1))
                                                          ? 
                                                         ((0x23U 
                                                           >= (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1))
                                                           ? 
                                                          vlTOPp->system__DOT__picorv32_core__DOT__cpuregs
                                                          [vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1]
                                                           : 0U)
                                                          : 0U);
                                                    __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x40U;
                                                } else {
                                                    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_retirq) {
                                                        vlTOPp->system__DOT__eois = 0U;
                                                        __Vdly__system__DOT__picorv32_core__DOT__irq_active = 0U;
                                                        vlTOPp->system__DOT__picorv32_core__DOT__latched_branch = 1U;
                                                        vlTOPp->system__DOT__picorv32_core__DOT__latched_store = 1U;
                                                        __Vdly__system__DOT__picorv32_core__DOT__reg_out 
                                                            = 
                                                            (0xfffffffeU 
                                                             & vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1);
                                                        vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val 
                                                            = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1;
                                                        vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val_valid = 1U;
                                                        __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x40U;
                                                    } else {
                                                        vlTOPp->system__DOT__picorv32_core__DOT__latched_store = 1U;
                                                        __Vdly__system__DOT__picorv32_core__DOT__reg_out 
                                                            = vlTOPp->system__DOT__picorv32_core__DOT__irq_mask;
                                                        vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val 
                                                            = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1;
                                                        vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val_valid = 1U;
                                                        __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x40U;
                                                        __Vdly__system__DOT__picorv32_core__DOT__irq_mask 
                                                            = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if (vlTOPp->system__DOT__picorv32_core__DOT__instr_timer) {
                                __Vdly__system__DOT__picorv32_core__DOT__timer 
                                    = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1;
                                vlTOPp->system__DOT__picorv32_core__DOT__latched_store = 1U;
                                __Vdly__system__DOT__picorv32_core__DOT__reg_out 
                                    = vlTOPp->system__DOT__picorv32_core__DOT__timer;
                                vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val 
                                    = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1;
                                vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val_valid = 1U;
                                __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x40U;
                            } else {
                                if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_lb_lh_lw_lbu_lhu) 
                                     & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_trap)))) {
                                    __Vdly__system__DOT__picorv32_core__DOT__reg_op1 
                                        = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1;
                                    vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val 
                                        = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1;
                                    vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val_valid = 1U;
                                    __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 1U;
                                    __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst = 1U;
                                } else {
                                    if (vlTOPp->system__DOT__picorv32_core__DOT__is_slli_srli_srai) {
                                        __Vdly__system__DOT__picorv32_core__DOT__reg_op1 
                                            = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1;
                                        vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val 
                                            = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1;
                                        vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val_valid = 1U;
                                        __Vdly__system__DOT__picorv32_core__DOT__reg_sh 
                                            = (0x1fU 
                                               & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs2));
                                        __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 4U;
                                    } else {
                                        if (vlTOPp->system__DOT__picorv32_core__DOT__is_jalr_addi_slti_sltiu_xori_ori_andi) {
                                            __Vdly__system__DOT__picorv32_core__DOT__reg_op1 
                                                = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1;
                                            vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val 
                                                = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1;
                                            vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val_valid = 1U;
                                            vlTOPp->system__DOT__picorv32_core__DOT__reg_op2 
                                                = vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm;
                                            __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst 
                                                = vlTOPp->system__DOT__picorv32_core__DOT__mem_do_prefetch;
                                            __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 8U;
                                        } else {
                                            __Vdly__system__DOT__picorv32_core__DOT__reg_op1 
                                                = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1;
                                            vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val 
                                                = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1;
                                            vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs1val_valid = 1U;
                                            __Vdly__system__DOT__picorv32_core__DOT__reg_sh 
                                                = (0x1fU 
                                                   & vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs2);
                                            vlTOPp->system__DOT__picorv32_core__DOT__reg_op2 
                                                = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs2;
                                            vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs2val 
                                                = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs2;
                                            vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs2val_valid = 1U;
                                            if (vlTOPp->system__DOT__picorv32_core__DOT__is_sb_sh_sw) {
                                                __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 2U;
                                                __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst = 1U;
                                            } else {
                                                if (vlTOPp->system__DOT__picorv32_core__DOT__is_sll_srl_sra) {
                                                    __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 4U;
                                                } else {
                                                    __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst 
                                                        = vlTOPp->system__DOT__picorv32_core__DOT__mem_do_prefetch;
                                                    __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 8U;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if ((0x10U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cpu_state))) {
                            __Vdly__system__DOT__picorv32_core__DOT__reg_sh 
                                = (0x1fU & vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs2);
                            vlTOPp->system__DOT__picorv32_core__DOT__reg_op2 
                                = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs2;
                            vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs2val 
                                = vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs2;
                            vlTOPp->system__DOT__picorv32_core__DOT__dbg_rs2val_valid = 1U;
                            if (vlTOPp->system__DOT__picorv32_core__DOT__instr_trap) {
                                __Vdly__system__DOT__picorv32_core__DOT__pcpi_valid = 1U;
                                if (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_int_ready) {
                                    __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst = 1U;
                                    __Vdly__system__DOT__picorv32_core__DOT__pcpi_valid = 0U;
                                    __Vdly__system__DOT__picorv32_core__DOT__reg_out 
                                        = vlTOPp->system__DOT__picorv32_core__DOT__pcpi_int_rd;
                                    vlTOPp->system__DOT__picorv32_core__DOT__latched_store 
                                        = vlTOPp->system__DOT__picorv32_core__DOT__pcpi_int_wr;
                                    __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x40U;
                                } else {
                                    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_timeout) 
                                         | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_ecall_ebreak))) {
                                        __Vdly__system__DOT__picorv32_core__DOT__pcpi_valid = 0U;
                                        if ((1U & (
                                                   (~ 
                                                    (vlTOPp->system__DOT__picorv32_core__DOT__irq_mask 
                                                     >> 1U)) 
                                                   & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_active))))) {
                                            vlTOPp->system__DOT__picorv32_core__DOT__next_irq_pending 
                                                = (2U 
                                                   | vlTOPp->system__DOT__picorv32_core__DOT__next_irq_pending);
                                            __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x40U;
                                        } else {
                                            __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x80U;
                                        }
                                    }
                                }
                            } else {
                                if (vlTOPp->system__DOT__picorv32_core__DOT__is_sb_sh_sw) {
                                    __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 2U;
                                    __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst = 1U;
                                } else {
                                    if (vlTOPp->system__DOT__picorv32_core__DOT__is_sll_srl_sra) {
                                        __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 4U;
                                    } else {
                                        __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst 
                                            = vlTOPp->system__DOT__picorv32_core__DOT__mem_do_prefetch;
                                        __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 8U;
                                    }
                                }
                            }
                        } else {
                            if ((8U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cpu_state))) {
                                __Vdly__system__DOT__picorv32_core__DOT__reg_out 
                                    = (vlTOPp->system__DOT__picorv32_core__DOT__reg_pc 
                                       + vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm);
                                if (vlTOPp->system__DOT__picorv32_core__DOT__is_beq_bne_blt_bge_bltu_bgeu) {
                                    __Vdly__system__DOT__picorv32_core__DOT__latched_rd = 0U;
                                    vlTOPp->system__DOT__picorv32_core__DOT__latched_store 
                                        = vlTOPp->system__DOT__picorv32_core__DOT__alu_out_0;
                                    vlTOPp->system__DOT__picorv32_core__DOT__latched_branch 
                                        = vlTOPp->system__DOT__picorv32_core__DOT__alu_out_0;
                                    if (vlTOPp->system__DOT__picorv32_core__DOT__mem_done) {
                                        __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x40U;
                                    }
                                    if (vlTOPp->system__DOT__picorv32_core__DOT__alu_out_0) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__set_mem_do_rinst = 1U;
                                        __Vdly__system__DOT__picorv32_core__DOT__decoder_trigger = 0U;
                                    }
                                } else {
                                    vlTOPp->system__DOT__picorv32_core__DOT__latched_branch 
                                        = vlTOPp->system__DOT__picorv32_core__DOT__instr_jalr;
                                    vlTOPp->system__DOT__picorv32_core__DOT__latched_store = 1U;
                                    vlTOPp->system__DOT__picorv32_core__DOT__latched_stalu = 1U;
                                    __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x40U;
                                }
                            } else {
                                if ((4U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cpu_state))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__latched_store = 1U;
                                    if ((0U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__reg_sh))) {
                                        __Vdly__system__DOT__picorv32_core__DOT__reg_out 
                                            = vlTOPp->system__DOT__picorv32_core__DOT__reg_op1;
                                        __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst 
                                            = vlTOPp->system__DOT__picorv32_core__DOT__mem_do_prefetch;
                                        __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x40U;
                                    } else {
                                        if ((4U <= (IData)(vlTOPp->system__DOT__picorv32_core__DOT__reg_sh))) {
                                            if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_slli) 
                                                 | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_sll))) {
                                                __Vdly__system__DOT__picorv32_core__DOT__reg_op1 
                                                    = 
                                                    (vlTOPp->system__DOT__picorv32_core__DOT__reg_op1 
                                                     << 4U);
                                            } else {
                                                if (
                                                    ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_srli) 
                                                     | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_srl))) {
                                                    __Vdly__system__DOT__picorv32_core__DOT__reg_op1 
                                                        = 
                                                        (vlTOPp->system__DOT__picorv32_core__DOT__reg_op1 
                                                         >> 4U);
                                                } else {
                                                    if (
                                                        ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_srai) 
                                                         | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_sra))) {
                                                        __Vdly__system__DOT__picorv32_core__DOT__reg_op1 
                                                            = 
                                                            VL_SHIFTRS_III(32,32,32, vlTOPp->system__DOT__picorv32_core__DOT__reg_op1, 4U);
                                                    }
                                                }
                                            }
                                            __Vdly__system__DOT__picorv32_core__DOT__reg_sh 
                                                = (0x1fU 
                                                   & ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__reg_sh) 
                                                      - (IData)(4U)));
                                        } else {
                                            if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_slli) 
                                                 | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_sll))) {
                                                __Vdly__system__DOT__picorv32_core__DOT__reg_op1 
                                                    = 
                                                    (vlTOPp->system__DOT__picorv32_core__DOT__reg_op1 
                                                     << 1U);
                                            } else {
                                                if (
                                                    ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_srli) 
                                                     | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_srl))) {
                                                    __Vdly__system__DOT__picorv32_core__DOT__reg_op1 
                                                        = 
                                                        (vlTOPp->system__DOT__picorv32_core__DOT__reg_op1 
                                                         >> 1U);
                                                } else {
                                                    if (
                                                        ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_srai) 
                                                         | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_sra))) {
                                                        __Vdly__system__DOT__picorv32_core__DOT__reg_op1 
                                                            = 
                                                            VL_SHIFTRS_III(32,32,32, vlTOPp->system__DOT__picorv32_core__DOT__reg_op1, 1U);
                                                    }
                                                }
                                            }
                                            __Vdly__system__DOT__picorv32_core__DOT__reg_sh 
                                                = (0x1fU 
                                                   & ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__reg_sh) 
                                                      - (IData)(1U)));
                                        }
                                    }
                                } else {
                                    if ((2U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cpu_state))) {
                                        if ((1U & (
                                                   (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_prefetch)) 
                                                   | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done)))) {
                                            if ((1U 
                                                 & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_wdata)))) {
                                                __Vdly__system__DOT__picorv32_core__DOT__reg_op1 
                                                    = 
                                                    (vlTOPp->system__DOT__picorv32_core__DOT__reg_op1 
                                                     + vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm);
                                                vlTOPp->system__DOT__picorv32_core__DOT__set_mem_do_wdata = 1U;
                                                if (vlTOPp->system__DOT__picorv32_core__DOT__instr_sb) {
                                                    __Vdly__system__DOT__picorv32_core__DOT__mem_wordsize = 2U;
                                                } else {
                                                    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_sh) {
                                                        __Vdly__system__DOT__picorv32_core__DOT__mem_wordsize = 1U;
                                                    } else {
                                                        if (vlTOPp->system__DOT__picorv32_core__DOT__instr_sw) {
                                                            __Vdly__system__DOT__picorv32_core__DOT__mem_wordsize = 0U;
                                                        }
                                                    }
                                                }
                                            }
                                            if (((~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_prefetch)) 
                                                 & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done))) {
                                                __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x40U;
                                                __Vdly__system__DOT__picorv32_core__DOT__decoder_trigger = 1U;
                                                __Vdly__system__DOT__picorv32_core__DOT__decoder_pseudo_trigger = 1U;
                                            }
                                        }
                                    } else {
                                        vlTOPp->system__DOT__picorv32_core__DOT__latched_store = 1U;
                                        if ((1U & (
                                                   (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_prefetch)) 
                                                   | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done)))) {
                                            if (((~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_prefetch)) 
                                                 & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done))) {
                                                if (vlTOPp->system__DOT__picorv32_core__DOT__latched_is_lu) {
                                                    __Vdly__system__DOT__picorv32_core__DOT__reg_out 
                                                        = vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_word;
                                                } else {
                                                    if (vlTOPp->system__DOT__picorv32_core__DOT__latched_is_lh) {
                                                        __Vdly__system__DOT__picorv32_core__DOT__reg_out 
                                                            = 
                                                            VL_EXTENDS_II(32,16, 
                                                                          (0xffffU 
                                                                           & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_word));
                                                    } else {
                                                        if (vlTOPp->system__DOT__picorv32_core__DOT__latched_is_lb) {
                                                            __Vdly__system__DOT__picorv32_core__DOT__reg_out 
                                                                = 
                                                                VL_EXTENDS_II(32,8, 
                                                                              (0xffU 
                                                                               & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_word));
                                                        }
                                                    }
                                                }
                                                __Vdly__system__DOT__picorv32_core__DOT__decoder_trigger = 1U;
                                                __Vdly__system__DOT__picorv32_core__DOT__decoder_pseudo_trigger = 1U;
                                                __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x40U;
                                            }
                                            if ((1U 
                                                 & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rdata)))) {
                                                __Vdly__system__DOT__picorv32_core__DOT__reg_op1 
                                                    = 
                                                    (vlTOPp->system__DOT__picorv32_core__DOT__reg_op1 
                                                     + vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm);
                                                vlTOPp->system__DOT__picorv32_core__DOT__set_mem_do_rdata = 1U;
                                                if (
                                                    ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_lb) 
                                                     | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_lbu))) {
                                                    __Vdly__system__DOT__picorv32_core__DOT__mem_wordsize = 2U;
                                                } else {
                                                    if (
                                                        ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_lh) 
                                                         | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_lhu))) {
                                                        __Vdly__system__DOT__picorv32_core__DOT__mem_wordsize = 1U;
                                                    } else {
                                                        if (vlTOPp->system__DOT__picorv32_core__DOT__instr_lw) {
                                                            __Vdly__system__DOT__picorv32_core__DOT__mem_wordsize = 0U;
                                                        }
                                                    }
                                                }
                                                __Vdly__system__DOT__picorv32_core__DOT__latched_is_lu 
                                                    = vlTOPp->system__DOT__picorv32_core__DOT__is_lbu_lhu_lw;
                                                __Vdly__system__DOT__picorv32_core__DOT__latched_is_lh 
                                                    = vlTOPp->system__DOT__picorv32_core__DOT__instr_lh;
                                                __Vdly__system__DOT__picorv32_core__DOT__latched_is_lb 
                                                    = vlTOPp->system__DOT__picorv32_core__DOT__instr_lb;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        __Vdly__system__DOT__picorv32_core__DOT__count_instr = 0ULL;
        vlTOPp->system__DOT__picorv32_core__DOT__next_irq_pending = 0U;
        __Vdly__system__DOT__picorv32_core__DOT__timer = 0U;
        __Vdly__system__DOT__picorv32_core__DOT__reg_pc = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__reg_next_pc = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__latched_store = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__latched_stalu = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__latched_branch = 0U;
        __Vdly__system__DOT__picorv32_core__DOT__latched_is_lu = 0U;
        __Vdly__system__DOT__picorv32_core__DOT__latched_is_lh = 0U;
        __Vdly__system__DOT__picorv32_core__DOT__latched_is_lb = 0U;
        __Vdly__system__DOT__picorv32_core__DOT__pcpi_valid = 0U;
        __Vdly__system__DOT__picorv32_core__DOT__irq_active = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__irq_delay = 0U;
        __Vdly__system__DOT__picorv32_core__DOT__irq_mask = 0xffffffffU;
        __Vdly__system__DOT__picorv32_core__DOT__irq_state = 0U;
        vlTOPp->system__DOT__eois = 0U;
        __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x40U;
    }
    if (((IData)(vlTOPp->resetn) & ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rdata) 
                                    | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_wdata)))) {
        if (((0U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_wordsize)) 
             & (0U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__reg_op1)))) {
            if ((1U & ((~ (vlTOPp->system__DOT__picorv32_core__DOT__irq_mask 
                           >> 2U)) & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_active))))) {
                vlTOPp->system__DOT__picorv32_core__DOT__next_irq_pending 
                    = (4U | vlTOPp->system__DOT__picorv32_core__DOT__next_irq_pending);
            } else {
                __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x80U;
            }
        }
        if (((1U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_wordsize)) 
             & vlTOPp->system__DOT__picorv32_core__DOT__reg_op1)) {
            if ((1U & ((~ (vlTOPp->system__DOT__picorv32_core__DOT__irq_mask 
                           >> 2U)) & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_active))))) {
                vlTOPp->system__DOT__picorv32_core__DOT__next_irq_pending 
                    = (4U | vlTOPp->system__DOT__picorv32_core__DOT__next_irq_pending);
            } else {
                __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x80U;
            }
        }
    }
    if ((((IData)(vlTOPp->resetn) & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst)) 
         & vlTOPp->system__DOT__picorv32_core__DOT__reg_pc)) {
        if ((1U & ((~ (vlTOPp->system__DOT__picorv32_core__DOT__irq_mask 
                       >> 2U)) & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_active))))) {
            vlTOPp->system__DOT__picorv32_core__DOT__next_irq_pending 
                = (4U | vlTOPp->system__DOT__picorv32_core__DOT__next_irq_pending);
        } else {
            __Vdly__system__DOT__picorv32_core__DOT__cpu_state = 0x80U;
        }
    }
    if ((1U & ((~ (IData)(vlTOPp->resetn)) | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done)))) {
        __Vdly__system__DOT__picorv32_core__DOT__mem_do_prefetch = 0U;
        __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rdata = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__mem_do_wdata = 0U;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__set_mem_do_rinst) {
        __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst = 1U;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__set_mem_do_rdata) {
        vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rdata = 1U;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__set_mem_do_wdata) {
        vlTOPp->system__DOT__picorv32_core__DOT__mem_do_wdata = 1U;
    }
    vlTOPp->system__DOT__picorv32_core__DOT__irq_pending 
        = vlTOPp->system__DOT__picorv32_core__DOT__next_irq_pending;
    vlTOPp->system__DOT__picorv32_core__DOT__current_pc = 0U;
    vlTOPp->system__DOT__picorv32_core__DOT__reg_sh 
        = __Vdly__system__DOT__picorv32_core__DOT__reg_sh;
    vlTOPp->system__DOT__picorv32_core__DOT__count_cycle 
        = __Vdly__system__DOT__picorv32_core__DOT__count_cycle;
    vlTOPp->system__DOT__picorv32_core__DOT__timer 
        = __Vdly__system__DOT__picorv32_core__DOT__timer;
    vlTOPp->system__DOT__picorv32_core__DOT__do_waitirq 
        = __Vdly__system__DOT__picorv32_core__DOT__do_waitirq;
    vlTOPp->system__DOT__picorv32_core__DOT__latched_is_lu 
        = __Vdly__system__DOT__picorv32_core__DOT__latched_is_lu;
    vlTOPp->system__DOT__picorv32_core__DOT__latched_is_lh 
        = __Vdly__system__DOT__picorv32_core__DOT__latched_is_lh;
    vlTOPp->system__DOT__picorv32_core__DOT__latched_is_lb 
        = __Vdly__system__DOT__picorv32_core__DOT__latched_is_lb;
    vlTOPp->system__DOT__picorv32_core__DOT__count_instr 
        = __Vdly__system__DOT__picorv32_core__DOT__count_instr;
    vlTOPp->system__DOT__picorv32_core__DOT__latched_rd 
        = __Vdly__system__DOT__picorv32_core__DOT__latched_rd;
    vlTOPp->system__DOT__picorv32_core__DOT__pcpi_int_ready 
        = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_mul_ready) 
           | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_div_ready));
    vlTOPp->system__DOT__picorv32_core__DOT__pcpi_int_rd = 0U;
    if (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_mul_ready) {
        vlTOPp->system__DOT__picorv32_core__DOT__pcpi_int_rd 
            = vlTOPp->system__DOT__picorv32_core__DOT__pcpi_mul_rd;
    } else {
        if (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_div_ready) {
            vlTOPp->system__DOT__picorv32_core__DOT__pcpi_int_rd 
                = vlTOPp->system__DOT__picorv32_core__DOT__pcpi_div_rd;
        }
    }
    vlTOPp->system__DOT__picorv32_core__DOT__pcpi_int_wr = 0U;
    if (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_mul_ready) {
        vlTOPp->system__DOT__picorv32_core__DOT__pcpi_int_wr 
            = vlTOPp->system__DOT__picorv32_core__DOT__pcpi_mul_wr;
    } else {
        if (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_div_ready) {
            vlTOPp->system__DOT__picorv32_core__DOT__pcpi_int_wr 
                = vlTOPp->system__DOT__picorv32_core__DOT__pcpi_div_wr;
        }
    }
    vlTOPp->system__DOT__picorv32_core__DOT__irq_active 
        = __Vdly__system__DOT__picorv32_core__DOT__irq_active;
    if (__Vdlyvset__system__DOT__picorv32_core__DOT__cpuregs__v0) {
        vlTOPp->system__DOT__picorv32_core__DOT__cpuregs[__Vdlyvdim0__system__DOT__picorv32_core__DOT__cpuregs__v0] 
            = __Vdlyvval__system__DOT__picorv32_core__DOT__cpuregs__v0;
    }
    vlTOPp->system__DOT__picorv32_core__DOT__reg_pc 
        = __Vdly__system__DOT__picorv32_core__DOT__reg_pc;
    vlTOPp->system__DOT__picorv32_core__DOT__latched_compr 
        = __Vdly__system__DOT__picorv32_core__DOT__latched_compr;
    vlTOPp->system__DOT__picorv32_core__DOT__mem_wordsize 
        = __Vdly__system__DOT__picorv32_core__DOT__mem_wordsize;
    vlTOPp->system__DOT__picorv32_core__DOT__irq_mask 
        = __Vdly__system__DOT__picorv32_core__DOT__irq_mask;
    vlTOPp->system__DOT__picorv32_core__DOT__cpu_state 
        = __Vdly__system__DOT__picorv32_core__DOT__cpu_state;
    vlTOPp->system__DOT__picorv32_core__DOT__reg_op1 
        = __Vdly__system__DOT__picorv32_core__DOT__reg_op1;
    vlTOPp->system__DOT__picorv32_core__DOT__irq_state 
        = __Vdly__system__DOT__picorv32_core__DOT__irq_state;
    vlTOPp->system__DOT__picorv32_core__DOT__reg_out 
        = __Vdly__system__DOT__picorv32_core__DOT__reg_out;
    vlTOPp->__Vtableidx1 = vlTOPp->system__DOT__picorv32_core__DOT__cpu_state;
    vlTOPp->system__DOT__picorv32_core__DOT__dbg_ascii_state[0U] 
        = vlTOPp->__Vtable1_system__DOT__picorv32_core__DOT__dbg_ascii_state
        [vlTOPp->__Vtableidx1][0U];
    vlTOPp->system__DOT__picorv32_core__DOT__dbg_ascii_state[1U] 
        = vlTOPp->__Vtable1_system__DOT__picorv32_core__DOT__dbg_ascii_state
        [vlTOPp->__Vtableidx1][1U];
    vlTOPp->system__DOT__picorv32_core__DOT__dbg_ascii_state[2U] 
        = vlTOPp->__Vtable1_system__DOT__picorv32_core__DOT__dbg_ascii_state
        [vlTOPp->__Vtableidx1][2U];
    vlTOPp->system__DOT__picorv32_core__DOT__dbg_ascii_state[3U] 
        = vlTOPp->__Vtable1_system__DOT__picorv32_core__DOT__dbg_ascii_state
        [vlTOPp->__Vtableidx1][3U];
    vlTOPp->system__DOT__picorv32_core__DOT__alu_out_q 
        = vlTOPp->system__DOT__picorv32_core__DOT__alu_out;
    if ((0U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_wordsize))) {
        vlTOPp->system__DOT__picorv32_core__DOT__mem_la_wdata 
            = vlTOPp->system__DOT__picorv32_core__DOT__reg_op2;
    } else {
        if ((1U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_wordsize))) {
            vlTOPp->system__DOT__picorv32_core__DOT__mem_la_wdata 
                = ((0xffff0000U & (vlTOPp->system__DOT__picorv32_core__DOT__reg_op2 
                                   << 0x10U)) | (0xffffU 
                                                 & vlTOPp->system__DOT__picorv32_core__DOT__reg_op2));
        } else {
            if ((2U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_wordsize))) {
                vlTOPp->system__DOT__picorv32_core__DOT__mem_la_wdata 
                    = ((0xff000000U & (vlTOPp->system__DOT__picorv32_core__DOT__reg_op2 
                                       << 0x18U)) | 
                       ((0xff0000U & (vlTOPp->system__DOT__picorv32_core__DOT__reg_op2 
                                      << 0x10U)) | 
                        ((0xff00U & (vlTOPp->system__DOT__picorv32_core__DOT__reg_op2 
                                     << 8U)) | (0xffU 
                                                & vlTOPp->system__DOT__picorv32_core__DOT__reg_op2))));
            }
        }
    }
    if ((0U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_wordsize))) {
        vlTOPp->system__DOT__picorv32_core__DOT__mem_la_wstrb = 0xfU;
    } else {
        if ((1U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_wordsize))) {
            vlTOPp->system__DOT__picorv32_core__DOT__mem_la_wstrb 
                = ((2U & vlTOPp->system__DOT__picorv32_core__DOT__reg_op1)
                    ? 0xcU : 3U);
        } else {
            if ((2U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_wordsize))) {
                vlTOPp->system__DOT__picorv32_core__DOT__mem_la_wstrb 
                    = (0xfU & ((IData)(1U) << (3U & vlTOPp->system__DOT__picorv32_core__DOT__reg_op1)));
            }
        }
    }
    if ((0U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_wordsize))) {
        vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_word 
            = vlTOPp->system__DOT__mem_rdata;
    } else {
        if ((1U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_wordsize))) {
            if ((2U & vlTOPp->system__DOT__picorv32_core__DOT__reg_op1)) {
                if ((2U & vlTOPp->system__DOT__picorv32_core__DOT__reg_op1)) {
                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_word 
                        = (0xffffU & (vlTOPp->system__DOT__mem_rdata 
                                      >> 0x10U));
                }
            } else {
                vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_word 
                    = (0xffffU & vlTOPp->system__DOT__mem_rdata);
            }
        } else {
            if ((2U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_wordsize))) {
                vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_word 
                    = ((2U & vlTOPp->system__DOT__picorv32_core__DOT__reg_op1)
                        ? ((1U & vlTOPp->system__DOT__picorv32_core__DOT__reg_op1)
                            ? (0xffU & (vlTOPp->system__DOT__mem_rdata 
                                        >> 0x18U)) : 
                           (0xffU & (vlTOPp->system__DOT__mem_rdata 
                                     >> 0x10U))) : 
                       ((1U & vlTOPp->system__DOT__picorv32_core__DOT__reg_op1)
                         ? (0xffU & (vlTOPp->system__DOT__mem_rdata 
                                     >> 8U)) : (0xffU 
                                                & vlTOPp->system__DOT__mem_rdata)));
            }
        }
    }
    vlTOPp->system__DOT__picorv32_core__DOT__alu_eq 
        = (vlTOPp->system__DOT__picorv32_core__DOT__reg_op1 
           == vlTOPp->system__DOT__picorv32_core__DOT__reg_op2);
    vlTOPp->system__DOT__picorv32_core__DOT__alu_lts 
        = VL_LTS_III(1,32,32, vlTOPp->system__DOT__picorv32_core__DOT__reg_op1, vlTOPp->system__DOT__picorv32_core__DOT__reg_op2);
    vlTOPp->system__DOT__picorv32_core__DOT__alu_ltu 
        = (vlTOPp->system__DOT__picorv32_core__DOT__reg_op1 
           < vlTOPp->system__DOT__picorv32_core__DOT__reg_op2);
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
         & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done))) {
        vlTOPp->system__DOT__picorv32_core__DOT__compressed_instr = 0U;
        if ((3U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
            vlTOPp->system__DOT__picorv32_core__DOT__compressed_instr = 1U;
        }
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
         & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done))) {
        vlTOPp->system__DOT__picorv32_core__DOT__decoded_rd 
            = (0x1fU & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                        >> 7U));
        if ((3U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
            vlTOPp->system__DOT__picorv32_core__DOT__decoded_rd = 0U;
            if ((0U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                if ((0U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                  >> 0xdU)))) {
                    vlTOPp->system__DOT__picorv32_core__DOT__decoded_rd 
                        = (0x3fU & ((IData)(8U) + (7U 
                                                   & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                      >> 2U))));
                } else {
                    if ((2U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                      >> 0xdU)))) {
                        vlTOPp->system__DOT__picorv32_core__DOT__decoded_rd 
                            = (0x3fU & ((IData)(8U) 
                                        + (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                 >> 2U))));
                    }
                }
            } else {
                if ((1U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                    if ((0x8000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                        if ((1U & (~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                      >> 0xeU)))) {
                            if ((1U & (~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                                if ((IData)((0U == 
                                             (0x1800U 
                                              & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__decoded_rd 
                                        = (0x3fU & 
                                           ((IData)(8U) 
                                            + (7U & 
                                               (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                >> 7U))));
                                }
                                if ((2U == (3U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xaU)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__decoded_rd 
                                        = (0x3fU & 
                                           ((IData)(8U) 
                                            + (7U & 
                                               (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                >> 7U))));
                                }
                                if ((3U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xaU)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__decoded_rd 
                                        = (0x3fU & 
                                           ((IData)(8U) 
                                            + (7U & 
                                               (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                >> 7U))));
                                }
                            }
                        }
                    } else {
                        if ((0x4000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                            if ((0x2000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                                if ((IData)((0U != 
                                             (0x107cU 
                                              & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__decoded_rd 
                                        = ((2U == (0x1fU 
                                                   & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                      >> 7U)))
                                            ? (0x1fU 
                                               & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 7U))
                                            : (0x1fU 
                                               & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 7U)));
                                }
                            } else {
                                vlTOPp->system__DOT__picorv32_core__DOT__decoded_rd 
                                    = (0x1fU & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                >> 7U));
                            }
                        } else {
                            vlTOPp->system__DOT__picorv32_core__DOT__decoded_rd 
                                = ((0x2000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)
                                    ? 1U : (0x1fU & 
                                            (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                             >> 7U)));
                        }
                    }
                } else {
                    if ((2U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                        if ((0U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                            if ((1U & (~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xcU)))) {
                                vlTOPp->system__DOT__picorv32_core__DOT__decoded_rd 
                                    = (0x1fU & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                >> 7U));
                            }
                        } else {
                            if ((2U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                              >> 0xdU)))) {
                                if ((0U != (0x1fU & 
                                            (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                             >> 7U)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__decoded_rd 
                                        = (0x1fU & 
                                           (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                            >> 7U));
                                }
                            } else {
                                if ((4U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xdU)))) {
                                    if ((IData)(((0U 
                                                  == 
                                                  (0x107cU 
                                                   & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) 
                                                 & (0U 
                                                    != 
                                                    (0x1fU 
                                                     & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                        >> 7U)))))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__decoded_rd = 0U;
                                    }
                                    if (((~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                             >> 0xcU)) 
                                         & (0U != (0x1fU 
                                                   & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                      >> 2U))))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__decoded_rd 
                                            = (0x1fU 
                                               & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 7U));
                                    }
                                    if ((IData)(((0x1000U 
                                                  == 
                                                  (0x107cU 
                                                   & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) 
                                                 & (0U 
                                                    != 
                                                    (0x1fU 
                                                     & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                        >> 7U)))))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__decoded_rd = 1U;
                                    }
                                    if (((vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xcU) 
                                         & (0U != (0x1fU 
                                                   & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                      >> 2U))))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__decoded_rd 
                                            = (0x1fU 
                                               & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 7U));
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
         & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done))) {
        vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 
            = (0x1fU & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                        >> 0xfU));
        if ((IData)((0xbU == (0xfe00007fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)))) {
            vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 
                = (0x20U | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1));
        }
        if ((IData)((0x400000bU == (0xfe00007fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)))) {
            vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 = 0x20U;
        }
        if ((3U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
            vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 = 0U;
            if ((0U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                if ((0U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                  >> 0xdU)))) {
                    vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 = 2U;
                } else {
                    if ((2U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                      >> 0xdU)))) {
                        vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 
                            = (0x3fU & ((IData)(8U) 
                                        + (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                 >> 7U))));
                    } else {
                        if ((6U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                            vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 
                                = (0x3fU & ((IData)(8U) 
                                            + (7U & 
                                               (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                >> 7U))));
                        }
                    }
                }
            } else {
                if ((1U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                    if ((0x8000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                        if ((0x4000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                            vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 
                                = (0x3fU & ((0x2000U 
                                             & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)
                                             ? ((IData)(8U) 
                                                + (7U 
                                                   & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                      >> 7U)))
                                             : ((IData)(8U) 
                                                + (7U 
                                                   & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                      >> 7U)))));
                        } else {
                            if ((1U & (~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                                if ((IData)((0U == 
                                             (0x1800U 
                                              & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 
                                        = (0x3fU & 
                                           ((IData)(8U) 
                                            + (7U & 
                                               (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                >> 7U))));
                                }
                                if ((2U == (3U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xaU)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 
                                        = (0x3fU & 
                                           ((IData)(8U) 
                                            + (7U & 
                                               (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                >> 7U))));
                                }
                                if ((3U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xaU)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 
                                        = (0x3fU & 
                                           ((IData)(8U) 
                                            + (7U & 
                                               (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                >> 7U))));
                                }
                            }
                        }
                    } else {
                        if ((0x4000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                            if ((0x2000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                                if ((IData)((0U != 
                                             (0x107cU 
                                              & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 
                                        = ((2U == (0x1fU 
                                                   & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                      >> 7U)))
                                            ? (0x1fU 
                                               & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 7U))
                                            : 0U);
                                }
                            } else {
                                vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 = 0U;
                            }
                        } else {
                            if ((1U & (~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                                vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 
                                    = (0x1fU & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                >> 7U));
                            }
                        }
                    }
                } else {
                    if ((2U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                        if ((0U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                            if ((1U & (~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xcU)))) {
                                vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 
                                    = (0x1fU & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                >> 7U));
                            }
                        } else {
                            if ((2U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                              >> 0xdU)))) {
                                if ((0U != (0x1fU & 
                                            (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                             >> 7U)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 = 2U;
                                }
                            } else {
                                if ((4U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xdU)))) {
                                    if ((IData)(((0U 
                                                  == 
                                                  (0x107cU 
                                                   & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) 
                                                 & (0U 
                                                    != 
                                                    (0x1fU 
                                                     & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                        >> 7U)))))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 
                                            = (0x1fU 
                                               & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 7U));
                                    }
                                    if (((~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                             >> 0xcU)) 
                                         & (0U != (0x1fU 
                                                   & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                      >> 2U))))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 = 0U;
                                    }
                                    if ((IData)(((0x1000U 
                                                  == 
                                                  (0x107cU 
                                                   & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) 
                                                 & (0U 
                                                    != 
                                                    (0x1fU 
                                                     & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                        >> 7U)))))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 
                                            = (0x1fU 
                                               & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 7U));
                                    }
                                    if (((vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xcU) 
                                         & (0U != (0x1fU 
                                                   & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                      >> 2U))))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 
                                            = (0x1fU 
                                               & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 7U));
                                    }
                                } else {
                                    if ((6U == (7U 
                                                & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                   >> 0xdU)))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1 = 2U;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
         & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done))) {
        vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs2 
            = (0x1fU & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                        >> 0x14U));
        if ((3U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
            vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs2 = 0U;
            if ((0U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                if ((0U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                  >> 0xdU)))) {
                    if ((2U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                      >> 0xdU)))) {
                        if ((6U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                            vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs2 
                                = (0x3fU & ((IData)(8U) 
                                            + (7U & 
                                               (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                >> 2U))));
                        }
                    }
                }
            } else {
                if ((1U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                    if ((0x8000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                        if ((0x4000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                            vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs2 = 0U;
                        } else {
                            if ((1U & (~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                                if ((IData)((0U == 
                                             (0x1800U 
                                              & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs2 
                                        = ((0x20U & 
                                            (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                             >> 7U)) 
                                           | (0x1fU 
                                              & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                 >> 2U)));
                                }
                                if ((3U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xaU)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs2 
                                        = (0x3fU & 
                                           ((IData)(8U) 
                                            + (7U & 
                                               (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                >> 2U))));
                                }
                            }
                        }
                    }
                } else {
                    if ((2U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                        if ((0U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                            if ((1U & (~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xcU)))) {
                                vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs2 
                                    = ((0x20U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                 >> 7U)) 
                                       | (0x1fU & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                   >> 2U)));
                            }
                        } else {
                            if ((2U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                              >> 0xdU)))) {
                                if ((4U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xdU)))) {
                                    if (((~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                             >> 0xcU)) 
                                         & (0U != (0x1fU 
                                                   & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                      >> 2U))))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs2 
                                            = (0x1fU 
                                               & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 2U));
                                    }
                                    if (((vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xcU) 
                                         & (0U != (0x1fU 
                                                   & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                      >> 2U))))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs2 
                                            = (0x1fU 
                                               & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 2U));
                                    }
                                } else {
                                    if ((6U == (7U 
                                                & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                   >> 0xdU)))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs2 
                                            = (0x1fU 
                                               & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 2U));
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
         & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done))) {
        vlTOPp->system__DOT__picorv32_core__DOT__instr_waitirq 
            = (IData)((0x800000bU == (0xfe00007fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)));
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
         & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done))) {
        vlTOPp->system__DOT__picorv32_core__DOT__instr_retirq 
            = (IData)((0x400000bU == (0xfe00007fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)));
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger) 
         & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__instr_ecall_ebreak 
            = ((((0x73U == (0x7fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q)) 
                 & (~ (IData)((0U != (0x7ffU & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                                >> 0x15U)))))) 
                & (~ (IData)((0U != (0x1fffU & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                                >> 7U)))))) 
               | (0x9002U == (0xffffU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q)));
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger) 
         & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__instr_getq 
            = (IData)((0xbU == (0xfe00007fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q)));
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger) 
         & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__instr_setq 
            = (IData)((0x200000bU == (0xfe00007fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q)));
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger) 
         & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__instr_delint 
            = (IData)((0xc00000bU == (0xfe00007fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q)));
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger) 
         & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__instr_maskirq 
            = (IData)((0x600000bU == (0xfe00007fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q)));
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger) 
         & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__instr_timer 
            = (IData)((0xa00000bU == (0xfe00007fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q)));
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger) 
         & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__instr_rdcycle 
            = ((IData)((0xc0002073U == (0xfffff07fU 
                                        & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))) 
               | (IData)((0xc0102073U == (0xfffff07fU 
                                          & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))));
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger) 
         & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__instr_rdcycleh 
            = ((IData)((0xc8002073U == (0xfffff07fU 
                                        & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))) 
               | (IData)((0xc8102073U == (0xfffff07fU 
                                          & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))));
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger) 
         & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__instr_rdinstr 
            = (IData)((0xc0202073U == (0xfffff07fU 
                                       & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q)));
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger) 
         & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__instr_rdinstrh 
            = (IData)((0xc8202073U == (0xfffff07fU 
                                       & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q)));
    }
    vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_write = 0U;
    if ((0x40U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cpu_state))) {
        if (vlTOPp->system__DOT__picorv32_core__DOT__latched_branch) {
            vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_write = 1U;
        } else {
            if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__latched_store) 
                 & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__latched_branch)))) {
                vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_write = 1U;
            } else {
                if ((1U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_state))) {
                    vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_write = 1U;
                } else {
                    if ((2U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_state))) {
                        vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_write = 1U;
                    }
                }
            }
        }
    }
    vlTOPp->system__DOT__picorv32_core__DOT__next_pc 
        = (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__latched_store) 
            & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__latched_branch))
            ? (0xfffffffeU & vlTOPp->system__DOT__picorv32_core__DOT__reg_out)
            : vlTOPp->system__DOT__picorv32_core__DOT__reg_next_pc);
    if ((((IData)(vlTOPp->resetn) & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_valid)) 
         & (~ ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_mul_wait) 
               | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_div_wait))))) {
        if ((0U != (IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_timeout_counter))) {
            __Vdly__system__DOT__picorv32_core__DOT__pcpi_timeout_counter 
                = (0xfU & ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_timeout_counter) 
                           - (IData)(1U)));
        }
    } else {
        __Vdly__system__DOT__picorv32_core__DOT__pcpi_timeout_counter = 0xfU;
    }
    vlTOPp->system__DOT__picorv32_core__DOT__pcpi_timeout 
        = (1U & (~ (IData)((0U != (IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_timeout_counter)))));
    if ((1U & (~ (IData)(vlTOPp->resetn)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__pcpi_timeout = 0U;
    }
    vlTOPp->system__DOT__picorv32_core__DOT__is_lbu_lhu_lw 
        = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_lbu) 
           | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_lhu) 
              | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_lw)));
    vlTOPp->system__DOT__picorv32_core__DOT__pcpi_timeout_counter 
        = __Vdly__system__DOT__picorv32_core__DOT__pcpi_timeout_counter;
    vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_wrdata = 0U;
    if ((0x40U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cpu_state))) {
        if (vlTOPp->system__DOT__picorv32_core__DOT__latched_branch) {
            vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_wrdata 
                = (vlTOPp->system__DOT__picorv32_core__DOT__reg_pc 
                   + ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__latched_compr)
                       ? 2U : 4U));
        } else {
            if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__latched_store) 
                 & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__latched_branch)))) {
                vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_wrdata 
                    = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__latched_stalu)
                        ? vlTOPp->system__DOT__picorv32_core__DOT__alu_out_q
                        : vlTOPp->system__DOT__picorv32_core__DOT__reg_out);
            } else {
                if ((1U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_state))) {
                    vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_wrdata 
                        = (vlTOPp->system__DOT__picorv32_core__DOT__reg_next_pc 
                           | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__latched_compr));
                } else {
                    if ((2U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_state))) {
                        vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_wrdata 
                            = (vlTOPp->system__DOT__picorv32_core__DOT__irq_pending 
                               & (~ vlTOPp->system__DOT__picorv32_core__DOT__irq_mask));
                    }
                }
            }
        }
    }
    vlTOPp->system__DOT__picorv32_core__DOT__dbg_insn_rd 
        = vlTOPp->system__DOT__picorv32_core__DOT__q_insn_rd;
    if (vlTOPp->system__DOT__picorv32_core__DOT__dbg_next) {
        vlTOPp->system__DOT__picorv32_core__DOT__dbg_insn_rd 
            = (0x1fU & ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger_q)
                         ? (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cached_insn_rd)
                         : (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoded_rd)));
    }
    vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs1 
        = ((0U != (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1))
            ? ((0x23U >= (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1))
                ? vlTOPp->system__DOT__picorv32_core__DOT__cpuregs
               [vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1]
                : 0U) : 0U);
    vlTOPp->system__DOT__picorv32_core__DOT__dbg_insn_rs1 
        = vlTOPp->system__DOT__picorv32_core__DOT__q_insn_rs1;
    if (vlTOPp->system__DOT__picorv32_core__DOT__dbg_next) {
        vlTOPp->system__DOT__picorv32_core__DOT__dbg_insn_rs1 
            = (0x1fU & ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger_q)
                         ? (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cached_insn_rs1)
                         : (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs1)));
    }
    vlTOPp->system__DOT__picorv32_core__DOT__cpuregs_rs2 
        = ((0U != (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs2))
            ? ((0x23U >= (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs2))
                ? vlTOPp->system__DOT__picorv32_core__DOT__cpuregs
               [vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs2]
                : 0U) : 0U);
    vlTOPp->system__DOT__picorv32_core__DOT__dbg_insn_rs2 
        = vlTOPp->system__DOT__picorv32_core__DOT__q_insn_rs2;
    if (vlTOPp->system__DOT__picorv32_core__DOT__dbg_next) {
        vlTOPp->system__DOT__picorv32_core__DOT__dbg_insn_rs2 
            = (0x1fU & ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger_q)
                         ? (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cached_insn_rs2)
                         : (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoded_rs2)));
    }
    vlTOPp->system__DOT__picorv32_core__DOT__is_rdcycle_rdcycleh_rdinstr_rdinstrh 
        = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_rdcycle) 
           | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_rdcycleh) 
              | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_rdinstr) 
                 | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_rdinstrh))));
    vlTOPp->system__DOT__picorv32_core__DOT__pcpi_div_wait 
        = (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_div) 
            | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_divu) 
               | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_rem) 
                  | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_remu)))) 
           & (IData)(vlTOPp->resetn));
    vlTOPp->system__DOT__picorv32_core__DOT__pcpi_mul_wait 
        = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_mul) 
           | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_mulh) 
              | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_mulhsu) 
                 | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_mulhu))));
    vlTOPp->system__DOT__picorv32_core__DOT__is_lui_auipc_jal 
        = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_lui) 
           | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_auipc) 
              | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_jal)));
    vlTOPp->system__DOT__picorv32_core__DOT__is_lui_auipc_jal_jalr_addi_add_sub 
        = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_lui) 
           | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_auipc) 
              | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_jal) 
                 | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_jalr) 
                    | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_addi) 
                       | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_add) 
                          | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_sub)))))));
    vlTOPp->system__DOT__picorv32_core__DOT__is_slti_blt_slt 
        = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_slti) 
           | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_blt) 
              | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_slt)));
    vlTOPp->system__DOT__picorv32_core__DOT__is_sltiu_bltu_sltu 
        = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_sltiu) 
           | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_bltu) 
              | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_sltu)));
    vlTOPp->system__DOT__picorv32_core__DOT__is_compare 
        = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_beq_bne_blt_bge_bltu_bgeu) 
           | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_slti) 
              | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_slt) 
                 | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_sltiu) 
                    | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_sltu)))));
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger) 
         & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__instr_beq 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_beq_bne_blt_bge_bltu_bgeu) 
               & (0U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_bne 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_beq_bne_blt_bge_bltu_bgeu) 
               & (1U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_blt 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_beq_bne_blt_bge_bltu_bgeu) 
               & (4U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_bge 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_beq_bne_blt_bge_bltu_bgeu) 
               & (5U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_bltu 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_beq_bne_blt_bge_bltu_bgeu) 
               & (6U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_bgeu 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_beq_bne_blt_bge_bltu_bgeu) 
               & (7U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_lb 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_lb_lh_lw_lbu_lhu) 
               & (0U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_lh 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_lb_lh_lw_lbu_lhu) 
               & (1U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_lw 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_lb_lh_lw_lbu_lhu) 
               & (2U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_lbu 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_lb_lh_lw_lbu_lhu) 
               & (4U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_lhu 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_lb_lh_lw_lbu_lhu) 
               & (5U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_sb 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_sb_sh_sw) 
               & (0U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_sh 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_sb_sh_sw) 
               & (1U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_sw 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_sb_sh_sw) 
               & (2U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_addi 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm) 
               & (0U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_slti 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm) 
               & (2U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_sltiu 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm) 
               & (3U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_xori 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm) 
               & (4U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_ori 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm) 
               & (6U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_andi 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm) 
               & (7U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                               >> 0xcU))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_slli 
            = (IData)(((1U == (1U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm))) 
                       & (0x1000U == (0xfe007000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_srli 
            = (IData)(((1U == (1U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm))) 
                       & (0x5000U == (0xfe007000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_srai 
            = (IData)(((1U == (1U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm))) 
                       & (0x40005000U == (0xfe007000U 
                                          & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))));
        vlTOPp->system__DOT__picorv32_core__DOT__is_slli_srli_srai 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm) 
               & ((IData)((0x1000U == (0xfe007000U 
                                       & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))) 
                  | ((IData)((0x5000U == (0xfe007000U 
                                          & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))) 
                     | (IData)((0x40005000U == (0xfe007000U 
                                                & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))))));
        vlTOPp->system__DOT__picorv32_core__DOT__is_jalr_addi_slti_sltiu_xori_ori_andi 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_jalr) 
               | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm) 
                  & ((0U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                   >> 0xcU))) | ((2U 
                                                  == 
                                                  (7U 
                                                   & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                                      >> 0xcU))) 
                                                 | ((3U 
                                                     == 
                                                     (7U 
                                                      & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                                         >> 0xcU))) 
                                                    | ((4U 
                                                        == 
                                                        (7U 
                                                         & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                                            >> 0xcU))) 
                                                       | ((6U 
                                                           == 
                                                           (7U 
                                                            & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                                               >> 0xcU))) 
                                                          | (7U 
                                                             == 
                                                             (7U 
                                                              & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                                                 >> 0xcU))))))))));
        vlTOPp->system__DOT__picorv32_core__DOT__is_lui_auipc_jal_jalr_addi_add_sub = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__is_compare = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_jal)
                ? vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj
                : (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_lui) 
                    | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_auipc))
                    ? (0xfffff000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q)
                    : (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_jalr) 
                        | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_lb_lh_lw_lbu_lhu) 
                           | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm)))
                        ? VL_EXTENDS_II(32,12, (0xfffU 
                                                & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                                   >> 0x14U)))
                        : ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_beq_bne_blt_bge_bltu_bgeu)
                            ? VL_EXTENDS_II(32,13, 
                                            ((0x1000U 
                                              & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                                 >> 0x13U)) 
                                             | ((0x800U 
                                                 & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                                    << 4U)) 
                                                | ((0x7e0U 
                                                    & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                                       >> 0x14U)) 
                                                   | (0x1eU 
                                                      & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                                         >> 7U))))))
                            : ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_sb_sh_sw)
                                ? VL_EXTENDS_II(32,12, 
                                                ((0xfe0U 
                                                  & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                                     >> 0x14U)) 
                                                 | (0x1fU 
                                                    & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                                       >> 7U))))
                                : 0U)))));
    }
    if ((1U & (~ (IData)(vlTOPp->resetn)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__is_compare = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_beq = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_bne = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_blt = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_bge = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_bltu = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_bgeu = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_addi = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_slti = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_sltiu = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_xori = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_ori = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_andi = 0U;
    }
    vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_remu 
        = __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_remu;
    vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_divu 
        = __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_divu;
    vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_div 
        = __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_div;
    vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_rem 
        = __Vdly__system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__instr_rem;
    vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__start 
        = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_div_wait) 
           & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk2__DOT__pcpi_div__DOT__pcpi_wait_q)));
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_mul = 0U;
    if (((((IData)(vlTOPp->resetn) & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_valid)) 
          & (0x33U == (0x7fU & vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn))) 
         & (1U == (0x7fU & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                            >> 0x19U))))) {
        if ((0U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                          >> 0xcU)))) {
            vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_mul = 1U;
        }
    }
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_mulhu = 0U;
    if (((((IData)(vlTOPp->resetn) & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_valid)) 
          & (0x33U == (0x7fU & vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn))) 
         & (1U == (0x7fU & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                            >> 0x19U))))) {
        if ((0U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                          >> 0xcU)))) {
            if ((1U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                              >> 0xcU)))) {
                if ((2U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                                  >> 0xcU)))) {
                    if ((3U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                                      >> 0xcU)))) {
                        vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_mulhu = 1U;
                    }
                }
            }
        }
    }
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_mulh = 0U;
    if (((((IData)(vlTOPp->resetn) & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_valid)) 
          & (0x33U == (0x7fU & vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn))) 
         & (1U == (0x7fU & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                            >> 0x19U))))) {
        if ((0U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                          >> 0xcU)))) {
            if ((1U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                              >> 0xcU)))) {
                vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_mulh = 1U;
            }
        }
    }
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_mulhsu = 0U;
    if (((((IData)(vlTOPp->resetn) & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__pcpi_valid)) 
          & (0x33U == (0x7fU & vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn))) 
         & (1U == (0x7fU & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                            >> 0x19U))))) {
        if ((0U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                          >> 0xcU)))) {
            if ((1U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                              >> 0xcU)))) {
                if ((2U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
                                  >> 0xcU)))) {
                    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_mulhsu = 1U;
                }
            }
        }
    }
    vlTOPp->system__DOT__picorv32_core__DOT__dbg_insn_imm 
        = vlTOPp->system__DOT__picorv32_core__DOT__q_insn_imm;
    if (vlTOPp->system__DOT__picorv32_core__DOT__dbg_next) {
        vlTOPp->system__DOT__picorv32_core__DOT__dbg_insn_imm 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger_q)
                ? vlTOPp->system__DOT__picorv32_core__DOT__cached_insn_imm
                : vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm);
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
         & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done))) {
        vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm 
            = (0x13U == (0x7fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched));
        if ((3U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
            if ((0U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                if ((0U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                  >> 0xdU)))) {
                    vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm 
                        = (0U != (0xffU & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                           >> 5U)));
                }
            } else {
                if ((1U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                    if ((0x8000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                        if ((1U & (~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                      >> 0xeU)))) {
                            if ((1U & (~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                                if ((IData)((0U == 
                                             (0x1800U 
                                              & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm = 1U;
                                }
                                if ((2U == (3U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xaU)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm = 1U;
                                }
                            }
                        }
                    } else {
                        if ((0x4000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                            if ((0x2000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                                if ((IData)((0U != 
                                             (0x107cU 
                                              & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)))) {
                                    if ((2U == (0x1fU 
                                                & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                   >> 7U)))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm = 1U;
                                    }
                                }
                            } else {
                                vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm = 1U;
                            }
                        } else {
                            if ((1U & (~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                                vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm = 1U;
                            }
                        }
                    }
                } else {
                    if ((2U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                        if ((0U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                            if ((1U & (~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xcU)))) {
                                vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_imm = 1U;
                            }
                        }
                    }
                }
            }
        }
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
         & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done))) {
        vlTOPp->system__DOT__picorv32_core__DOT__is_lb_lh_lw_lbu_lhu 
            = (3U == (0x7fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched));
        if ((3U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
            if ((0U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                if ((0U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                  >> 0xdU)))) {
                    if ((2U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                      >> 0xdU)))) {
                        vlTOPp->system__DOT__picorv32_core__DOT__is_lb_lh_lw_lbu_lhu = 1U;
                    }
                }
            } else {
                if ((1U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                    if ((2U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                        if ((0U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                            if ((2U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                              >> 0xdU)))) {
                                if ((0U != (0x1fU & 
                                            (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                             >> 7U)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__is_lb_lh_lw_lbu_lhu = 1U;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
         & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done))) {
        vlTOPp->system__DOT__picorv32_core__DOT__is_sb_sh_sw 
            = (0x23U == (0x7fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched));
        if ((3U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
            if ((0U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                if ((0U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                  >> 0xdU)))) {
                    if ((2U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                      >> 0xdU)))) {
                        if ((6U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                            vlTOPp->system__DOT__picorv32_core__DOT__is_sb_sh_sw = 1U;
                        }
                    }
                }
            } else {
                if ((1U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                    if ((2U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                        if ((0U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                            if ((2U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                              >> 0xdU)))) {
                                if ((4U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xdU)))) {
                                    if ((6U == (7U 
                                                & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                   >> 0xdU)))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__is_sb_sh_sw = 1U;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
         & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done))) {
        vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj 
            = ((0xfffffU & vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj) 
               | (0xfff00000U & VL_EXTENDS_II(32,21, 
                                              (0x1ffffeU 
                                               & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xbU)))));
        vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj 
            = ((0xfffff801U & vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj) 
               | (0x7feU & (VL_EXTENDS_II(32,21, (0x1ffffeU 
                                                  & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                     >> 0xbU))) 
                            >> 9U)));
        vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj 
            = ((0xfffff7ffU & vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj) 
               | (0x800U & (VL_EXTENDS_II(32,21, (0x1ffffeU 
                                                  & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                     >> 0xbU))) 
                            << 2U)));
        vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj 
            = ((0xfff00fffU & vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj) 
               | (0xff000U & (VL_EXTENDS_II(32,21, 
                                            (0x1ffffeU 
                                             & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                >> 0xbU))) 
                              << 0xbU)));
        vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj 
            = ((0xfffffffeU & vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj) 
               | (1U & VL_EXTENDS_II(1,21, (0x1ffffeU 
                                            & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                               >> 0xbU)))));
        if ((3U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
            vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj 
                = ((0x7ffU & vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj) 
                   | (0xfffff800U & VL_EXTENDS_II(32,12, 
                                                  (0xffeU 
                                                   & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                      >> 1U)))));
            vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj 
                = ((0xffffffefU & vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj) 
                   | (0x10U & (VL_EXTENDS_II(32,12, 
                                             (0xffeU 
                                              & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                 >> 1U))) 
                               >> 6U)));
            vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj 
                = ((0xfffffcffU & vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj) 
                   | (0x300U & VL_EXTENDS_II(32,12, 
                                             (0xffeU 
                                              & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                 >> 1U)))));
            vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj 
                = ((0xfffffbffU & vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj) 
                   | (0x400U & (VL_EXTENDS_II(32,12, 
                                              (0xffeU 
                                               & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 1U))) 
                                << 3U)));
            vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj 
                = ((0xffffffbfU & vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj) 
                   | (0x40U & VL_EXTENDS_II(32,12, 
                                            (0xffeU 
                                             & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                >> 1U)))));
            vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj 
                = ((0xffffff7fU & vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj) 
                   | (0x80U & (VL_EXTENDS_II(32,12, 
                                             (0xffeU 
                                              & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                 >> 1U))) 
                               << 2U)));
            vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj 
                = ((0xfffffff1U & vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj) 
                   | (0xeU & (VL_EXTENDS_II(32,12, 
                                            (0xffeU 
                                             & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                >> 1U))) 
                              >> 1U)));
            vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj 
                = ((0xffffffdfU & vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj) 
                   | (0x20U & (VL_EXTENDS_II(32,12, 
                                             (0xffeU 
                                              & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                 >> 1U))) 
                               << 4U)));
            vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj 
                = ((0xfffffffeU & vlTOPp->system__DOT__picorv32_core__DOT__decoded_imm_uj) 
                   | (1U & VL_EXTENDS_II(1,12, (0xffeU 
                                                & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                   >> 1U)))));
        }
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
         & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done))) {
        vlTOPp->system__DOT__picorv32_core__DOT__is_beq_bne_blt_bge_bltu_bgeu 
            = (0x63U == (0x7fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched));
        if ((3U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
            if ((0U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                if ((1U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                    if ((0x8000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                        if ((0x4000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                            vlTOPp->system__DOT__picorv32_core__DOT__is_beq_bne_blt_bge_bltu_bgeu = 1U;
                        }
                    }
                }
            }
        }
    }
    if ((1U & (~ (IData)(vlTOPp->resetn)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__is_beq_bne_blt_bge_bltu_bgeu = 0U;
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
         & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done))) {
        vlTOPp->system__DOT__picorv32_core__DOT__instr_auipc 
            = (0x17U == (0x7fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched));
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
         & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done))) {
        vlTOPp->system__DOT__picorv32_core__DOT__instr_lui 
            = (0x37U == (0x7fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched));
        if ((3U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
            if ((0U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                if ((1U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                    if ((1U & (~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                  >> 0xfU)))) {
                        if ((0x4000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                            if ((0x2000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                                if ((IData)((0U != 
                                             (0x107cU 
                                              & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)))) {
                                    if ((2U != (0x1fU 
                                                & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                   >> 7U)))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__instr_lui = 1U;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
         & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done))) {
        vlTOPp->system__DOT__picorv32_core__DOT__instr_jal 
            = (0x6fU == (0x7fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched));
        if ((3U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
            if ((0U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                if ((1U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                    if ((0x8000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                        if ((1U & (~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                      >> 0xeU)))) {
                            if ((0x2000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                                vlTOPp->system__DOT__picorv32_core__DOT__instr_jal = 1U;
                            }
                        }
                    } else {
                        if ((1U & (~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                      >> 0xeU)))) {
                            if ((0x2000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                                vlTOPp->system__DOT__picorv32_core__DOT__instr_jal = 1U;
                            }
                        }
                    }
                }
            }
        }
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
         & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done))) {
        vlTOPp->system__DOT__picorv32_core__DOT__instr_jalr 
            = (IData)((0x67U == (0x707fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)));
        if ((3U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
            if ((0U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                if ((1U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                    if ((2U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                        if ((0U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                            if ((2U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                              >> 0xdU)))) {
                                if ((4U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xdU)))) {
                                    if ((IData)(((0U 
                                                  == 
                                                  (0x107cU 
                                                   & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) 
                                                 & (0U 
                                                    != 
                                                    (0x1fU 
                                                     & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                        >> 7U)))))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__instr_jalr = 1U;
                                    }
                                    if ((IData)(((0x1000U 
                                                  == 
                                                  (0x107cU 
                                                   & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) 
                                                 & (0U 
                                                    != 
                                                    (0x1fU 
                                                     & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                        >> 7U)))))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__instr_jalr = 1U;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger) 
         & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__instr_add 
            = (IData)(((1U == (1U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_reg))) 
                       & (0U == (0xfe007000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_sub 
            = (IData)(((1U == (1U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_reg))) 
                       & (0x40000000U == (0xfe007000U 
                                          & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_sll 
            = (IData)(((1U == (1U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_reg))) 
                       & (0x1000U == (0xfe007000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_slt 
            = (IData)(((1U == (1U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_reg))) 
                       & (0x2000U == (0xfe007000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_sltu 
            = (IData)(((1U == (1U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_reg))) 
                       & (0x3000U == (0xfe007000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_xor 
            = (IData)(((1U == (1U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_reg))) 
                       & (0x4000U == (0xfe007000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_srl 
            = (IData)(((1U == (1U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_reg))) 
                       & (0x5000U == (0xfe007000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_sra 
            = (IData)(((1U == (1U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_reg))) 
                       & (0x40005000U == (0xfe007000U 
                                          & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_or 
            = (IData)(((1U == (1U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_reg))) 
                       & (0x6000U == (0xfe007000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))));
        vlTOPp->system__DOT__picorv32_core__DOT__instr_and 
            = (IData)(((1U == (1U & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_reg))) 
                       & (0x7000U == (0xfe007000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))));
        vlTOPp->system__DOT__picorv32_core__DOT__is_sll_srl_sra 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_reg) 
               & ((IData)((0x1000U == (0xfe007000U 
                                       & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))) 
                  | ((IData)((0x5000U == (0xfe007000U 
                                          & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))) 
                     | (IData)((0x40005000U == (0xfe007000U 
                                                & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q))))));
    }
    if ((1U & (~ (IData)(vlTOPp->resetn)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__instr_add = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_sub = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_sll = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_slt = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_sltu = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_xor = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_srl = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_sra = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_or = 0U;
        vlTOPp->system__DOT__picorv32_core__DOT__instr_and = 0U;
    }
    vlTOPp->system__DOT__picorv32_core__DOT__pcpi_valid 
        = __Vdly__system__DOT__picorv32_core__DOT__pcpi_valid;
    vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_any_mulh 
        = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_mulh) 
           | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_mulhsu) 
              | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__genblk1__DOT__pcpi_mul__DOT__instr_mulhu)));
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger) 
         & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__pcpi_insn 
            = vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q;
    }
    vlTOPp->system__DOT__picorv32_core__DOT__alu_out_0 = 0U;
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_beq) {
        vlTOPp->system__DOT__picorv32_core__DOT__alu_out_0 
            = vlTOPp->system__DOT__picorv32_core__DOT__alu_eq;
    } else {
        if (vlTOPp->system__DOT__picorv32_core__DOT__instr_bne) {
            vlTOPp->system__DOT__picorv32_core__DOT__alu_out_0 
                = (1U & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__alu_eq)));
        } else {
            if (vlTOPp->system__DOT__picorv32_core__DOT__instr_bge) {
                vlTOPp->system__DOT__picorv32_core__DOT__alu_out_0 
                    = (1U & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__alu_lts)));
            } else {
                if (vlTOPp->system__DOT__picorv32_core__DOT__instr_bgeu) {
                    vlTOPp->system__DOT__picorv32_core__DOT__alu_out_0 
                        = (1U & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__alu_ltu)));
                } else {
                    if (vlTOPp->system__DOT__picorv32_core__DOT__is_slti_blt_slt) {
                        vlTOPp->system__DOT__picorv32_core__DOT__alu_out_0 
                            = vlTOPp->system__DOT__picorv32_core__DOT__alu_lts;
                    } else {
                        if (vlTOPp->system__DOT__picorv32_core__DOT__is_sltiu_bltu_sltu) {
                            vlTOPp->system__DOT__picorv32_core__DOT__alu_out_0 
                                = vlTOPp->system__DOT__picorv32_core__DOT__alu_ltu;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->system__DOT__picorv32_core__DOT__alu_out = 0U;
    if (vlTOPp->system__DOT__picorv32_core__DOT__is_lui_auipc_jal_jalr_addi_add_sub) {
        vlTOPp->system__DOT__picorv32_core__DOT__alu_out 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_sub)
                ? (vlTOPp->system__DOT__picorv32_core__DOT__reg_op1 
                   - vlTOPp->system__DOT__picorv32_core__DOT__reg_op2)
                : (vlTOPp->system__DOT__picorv32_core__DOT__reg_op1 
                   + vlTOPp->system__DOT__picorv32_core__DOT__reg_op2));
    } else {
        if (vlTOPp->system__DOT__picorv32_core__DOT__is_compare) {
            vlTOPp->system__DOT__picorv32_core__DOT__alu_out 
                = vlTOPp->system__DOT__picorv32_core__DOT__alu_out_0;
        } else {
            if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_xori) 
                 | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_xor))) {
                vlTOPp->system__DOT__picorv32_core__DOT__alu_out 
                    = (vlTOPp->system__DOT__picorv32_core__DOT__reg_op1 
                       ^ vlTOPp->system__DOT__picorv32_core__DOT__reg_op2);
            } else {
                if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_ori) 
                     | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_or))) {
                    vlTOPp->system__DOT__picorv32_core__DOT__alu_out 
                        = (vlTOPp->system__DOT__picorv32_core__DOT__reg_op1 
                           | vlTOPp->system__DOT__picorv32_core__DOT__reg_op2);
                } else {
                    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_andi) 
                         | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_and))) {
                        vlTOPp->system__DOT__picorv32_core__DOT__alu_out 
                            = (vlTOPp->system__DOT__picorv32_core__DOT__reg_op1 
                               & vlTOPp->system__DOT__picorv32_core__DOT__reg_op2);
                    }
                }
            }
        }
    }
    vlTOPp->system__DOT__picorv32_core__DOT__instr_trap 
        = (1U & (~ (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_lui) 
                     | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_auipc) 
                        | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_jal) 
                           | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_jalr) 
                              | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_beq) 
                                 | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_bne) 
                                    | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_blt) 
                                       | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_bge) 
                                          | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_bltu) 
                                             | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_bgeu) 
                                                | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_lb) 
                                                   | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_lh) 
                                                      | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_lw) 
                                                         | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_lbu) 
                                                            | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_lhu) 
                                                               | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_sb) 
                                                                  | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_sh) 
                                                                     | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_sw) 
                                                                        | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_addi) 
                                                                           | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_slti) 
                                                                              | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_sltiu) 
                                                                                | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_xori) 
                                                                                | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_ori) 
                                                                                | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_andi) 
                                                                                | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_slli) 
                                                                                | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_srli) 
                                                                                | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_srai) 
                                                                                | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_add) 
                                                                                | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_sub) 
                                                                                | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_sll) 
                                                                                | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_slt) 
                                                                                | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_sltu)))))))))))))))))))))))))))))))) 
                    | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_xor) 
                       | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_srl) 
                          | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_sra) 
                             | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_or) 
                                | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_and) 
                                   | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_rdcycle) 
                                      | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_rdcycleh) 
                                         | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_rdinstr) 
                                            | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_rdinstrh) 
                                               | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_getq) 
                                                  | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_setq) 
                                                     | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_delint) 
                                                        | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_retirq) 
                                                           | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_maskirq) 
                                                              | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_waitirq) 
                                                                 | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__instr_timer)))))))))))))))))));
    vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0ULL;
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_lui) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x6c7569ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_auipc) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x6175697063ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_jal) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x6a616cULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_jalr) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x6a616c72ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_beq) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x626571ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_bne) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x626e65ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_blt) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x626c74ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_bge) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x626765ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_bltu) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x626c7475ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_bgeu) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x62676575ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_lb) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x6c62ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_lh) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x6c68ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_lw) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x6c77ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_lbu) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x6c6275ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_lhu) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x6c6875ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_sb) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x7362ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_sh) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x7368ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_sw) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x7377ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_addi) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x61646469ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_slti) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x736c7469ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_sltiu) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x736c746975ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_xori) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x786f7269ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_ori) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x6f7269ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_andi) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x616e6469ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_slli) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x736c6c69ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_srli) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x73726c69ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_srai) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x73726169ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_add) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x616464ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_sub) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x737562ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_sll) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x736c6cULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_slt) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x736c74ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_sltu) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x736c7475ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_xor) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x786f72ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_srl) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x73726cULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_sra) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x737261ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_or) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x6f72ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_and) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x616e64ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_rdcycle) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x72646379636c65ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_rdcycleh) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x72646379636c6568ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_rdinstr) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x7264696e737472ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_rdinstrh) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x7264696e73747268ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_getq) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x67657471ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_setq) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x73657471ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_delint) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x64656c696e74ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_retirq) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x726574697271ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_maskirq) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x6d61736b697271ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_waitirq) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x77616974697271ULL;
    }
    if (vlTOPp->system__DOT__picorv32_core__DOT__instr_timer) {
        vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr = 0x74696d6572ULL;
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
         & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done))) {
        vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_reg 
            = (0x33U == (0x7fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched));
        if ((3U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
            if ((0U != (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                if ((1U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                    if ((0x8000U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) {
                        if ((1U & (~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                      >> 0xeU)))) {
                            if ((1U & (~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                                if ((3U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xaU)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_reg = 1U;
                                }
                            }
                        }
                    }
                } else {
                    if ((2U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                        if ((0U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                            if ((2U != (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                              >> 0xdU)))) {
                                if ((4U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xdU)))) {
                                    if (((~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                             >> 0xcU)) 
                                         & (0U != (0x1fU 
                                                   & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                      >> 2U))))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_reg = 1U;
                                    }
                                    if (((vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xcU) 
                                         & (0U != (0x1fU 
                                                   & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                      >> 2U))))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__is_alu_reg_reg = 1U;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger 
        = __Vdly__system__DOT__picorv32_core__DOT__decoder_pseudo_trigger;
    vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger 
        = __Vdly__system__DOT__picorv32_core__DOT__decoder_trigger;
    vlTOPp->system__DOT__picorv32_core__DOT__dbg_ascii_instr 
        = vlTOPp->system__DOT__picorv32_core__DOT__q_ascii_instr;
    if (vlTOPp->system__DOT__picorv32_core__DOT__dbg_next) {
        vlTOPp->system__DOT__picorv32_core__DOT__dbg_ascii_instr 
            = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_pseudo_trigger_q)
                ? vlTOPp->system__DOT__picorv32_core__DOT__cached_ascii_instr
                : vlTOPp->system__DOT__picorv32_core__DOT__new_ascii_instr);
    }
    vlTOPp->system__DOT__picorv32_core__DOT__launch_next_insn 
        = (((0x40U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__cpu_state)) 
            & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__decoder_trigger)) 
           & (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_delay) 
               | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_active)) 
              | (~ (IData)((0U != (vlTOPp->system__DOT__picorv32_core__DOT__irq_pending 
                                   & (~ vlTOPp->system__DOT__picorv32_core__DOT__irq_mask)))))));
    if (vlTOPp->system__DOT__picorv32_core__DOT__mem_xfer) {
        vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
            = vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched;
    }
    if (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_done) 
         & ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_prefetch) 
            | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst)))) {
        if ((0U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
            if ((0U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                              >> 0xdU)))) {
                vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                    = (0xffff8fffU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q);
                vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                    = ((0xfffffU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                       | ((0x3c000000U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          << 0x13U)) 
                          | ((0x3000000U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                            << 0xdU)) 
                             | ((0x800000U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                              << 0x12U)) 
                                | (0x400000U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                << 0x10U))))));
            } else {
                if ((2U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                  >> 0xdU)))) {
                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                        = ((0xfffffU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                           | ((0x4000000U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                             << 0x15U)) 
                              | ((0x3800000U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                << 0xdU)) 
                                 | (0x400000U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                 << 0x10U)))));
                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                        = (0x2000U | (0xffff8fffU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q));
                } else {
                    if ((6U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                      >> 0xdU)))) {
                        vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                            = ((0x1ffffffU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                               | ((0x4000000U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                 << 0x15U)) 
                                  | (0x2000000U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                   << 0xdU))));
                        vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                            = ((0xfffff07fU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                               | ((0xc00U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched) 
                                  | (0x200U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                               << 3U))));
                        vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                            = (0x2000U | (0xffff8fffU 
                                          & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q));
                    }
                }
            }
        } else {
            if ((1U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                if ((0U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                  >> 0xdU)))) {
                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                        = (0xffff8fffU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q);
                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                        = ((0xfffffU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                           | (0xfff00000U & (VL_EXTENDS_II(12,6, 
                                                           ((0x20U 
                                                             & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                >> 7U)) 
                                                            | (0x1fU 
                                                               & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                  >> 2U)))) 
                                             << 0x14U)));
                } else {
                    if ((2U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                      >> 0xdU)))) {
                        vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                            = (0xffff8fffU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q);
                        vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                            = ((0xfffffU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                               | (0xfff00000U & (VL_EXTENDS_II(12,6, 
                                                               ((0x20U 
                                                                 & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                    >> 7U)) 
                                                                | (0x1fU 
                                                                   & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                      >> 2U)))) 
                                                 << 0x14U)));
                    } else {
                        if ((3U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                            if ((2U == (0x1fU & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                 >> 7U)))) {
                                vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                    = (0xffff8fffU 
                                       & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q);
                                vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                    = ((0xfffffU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                                       | (0xfff00000U 
                                          & (VL_EXTENDS_II(12,10, 
                                                           ((0x200U 
                                                             & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                >> 3U)) 
                                                            | ((0x180U 
                                                                & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                   << 4U)) 
                                                               | ((0x40U 
                                                                   & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                      << 1U)) 
                                                                  | ((0x20U 
                                                                      & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                         << 3U)) 
                                                                     | (0x10U 
                                                                        & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                           >> 2U))))))) 
                                             << 0x14U)));
                            } else {
                                vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                    = ((0xfffU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                                       | (0xfffff000U 
                                          & (VL_EXTENDS_II(20,6, 
                                                           ((0x20U 
                                                             & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                >> 7U)) 
                                                            | (0x1fU 
                                                               & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                  >> 2U)))) 
                                             << 0xcU)));
                            }
                        } else {
                            if ((4U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                              >> 0xdU)))) {
                                if ((0U == (3U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xaU)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = (0x1ffffffU 
                                           & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q);
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = (0x5000U 
                                           | (0xffff8fffU 
                                              & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q));
                                }
                                if ((1U == (3U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xaU)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = (0x40000000U 
                                           | (0x1ffffffU 
                                              & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q));
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = (0x5000U 
                                           | (0xffff8fffU 
                                              & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q));
                                }
                                if ((2U == (3U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xaU)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = (0x7000U 
                                           | vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q);
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = ((0xfffffU 
                                            & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                                           | (0xfff00000U 
                                              & (VL_EXTENDS_II(12,6, 
                                                               ((0x20U 
                                                                 & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                    >> 7U)) 
                                                                | (0x1fU 
                                                                   & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                      >> 2U)))) 
                                                 << 0x14U)));
                                }
                                if ((3U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xaU)))) {
                                    if ((0U == (3U 
                                                & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                   >> 5U)))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                            = (0xffff8fffU 
                                               & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q);
                                    }
                                    if ((1U == (3U 
                                                & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                   >> 5U)))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                            = (0x4000U 
                                               | (0xffff8fffU 
                                                  & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q));
                                    }
                                    if ((2U == (3U 
                                                & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                   >> 5U)))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                            = (0x6000U 
                                               | (0xffff8fffU 
                                                  & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q));
                                    }
                                    if ((3U == (3U 
                                                & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                   >> 5U)))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                            = (0x7000U 
                                               | vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q);
                                    }
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = ((0x1ffffffU 
                                            & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                                           | (((0U 
                                                == 
                                                (3U 
                                                 & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                    >> 5U)))
                                                ? 0x20U
                                                : 0U) 
                                              << 0x19U));
                                }
                            } else {
                                if ((6U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xdU)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = (0xffff8fffU 
                                           & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q);
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = ((0x7fffffffU 
                                            & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                                           | (0x80000000U 
                                              & (VL_EXTENDS_II(12,8, 
                                                               ((0x80U 
                                                                 & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                    >> 5U)) 
                                                                | ((0x60U 
                                                                    & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched) 
                                                                   | ((0x10U 
                                                                       & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                          << 2U)) 
                                                                      | ((0xcU 
                                                                          & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                             >> 8U)) 
                                                                         | (3U 
                                                                            & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                               >> 3U))))))) 
                                                 << 0x14U)));
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = ((0xffffff7fU 
                                            & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                                           | (0x80U 
                                              & (VL_EXTENDS_II(12,8, 
                                                               ((0x80U 
                                                                 & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                    >> 5U)) 
                                                                | ((0x60U 
                                                                    & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched) 
                                                                   | ((0x10U 
                                                                       & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                          << 2U)) 
                                                                      | ((0xcU 
                                                                          & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                             >> 8U)) 
                                                                         | (3U 
                                                                            & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                               >> 3U))))))) 
                                                 >> 3U)));
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = ((0x81ffffffU 
                                            & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                                           | (0x7e000000U 
                                              & (VL_EXTENDS_II(12,8, 
                                                               ((0x80U 
                                                                 & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                    >> 5U)) 
                                                                | ((0x60U 
                                                                    & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched) 
                                                                   | ((0x10U 
                                                                       & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                          << 2U)) 
                                                                      | ((0xcU 
                                                                          & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                             >> 8U)) 
                                                                         | (3U 
                                                                            & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                               >> 3U))))))) 
                                                 << 0x15U)));
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = ((0xfffff0ffU 
                                            & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                                           | (0xf00U 
                                              & (VL_EXTENDS_II(12,8, 
                                                               ((0x80U 
                                                                 & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                    >> 5U)) 
                                                                | ((0x60U 
                                                                    & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched) 
                                                                   | ((0x10U 
                                                                       & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                          << 2U)) 
                                                                      | ((0xcU 
                                                                          & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                             >> 8U)) 
                                                                         | (3U 
                                                                            & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                               >> 3U))))))) 
                                                 << 8U)));
                                } else {
                                    if ((7U == (7U 
                                                & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                   >> 0xdU)))) {
                                        vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                            = (0x1000U 
                                               | (0xffff8fffU 
                                                  & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q));
                                        vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                            = ((0x7fffffffU 
                                                & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                                               | (0x80000000U 
                                                  & (VL_EXTENDS_II(12,8, 
                                                                   ((0x80U 
                                                                     & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                        >> 5U)) 
                                                                    | ((0x60U 
                                                                        & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched) 
                                                                       | ((0x10U 
                                                                           & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                              << 2U)) 
                                                                          | ((0xcU 
                                                                              & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                                >> 8U)) 
                                                                             | (3U 
                                                                                & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                                >> 3U))))))) 
                                                     << 0x14U)));
                                        vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                            = ((0xffffff7fU 
                                                & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                                               | (0x80U 
                                                  & (VL_EXTENDS_II(12,8, 
                                                                   ((0x80U 
                                                                     & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                        >> 5U)) 
                                                                    | ((0x60U 
                                                                        & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched) 
                                                                       | ((0x10U 
                                                                           & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                              << 2U)) 
                                                                          | ((0xcU 
                                                                              & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                                >> 8U)) 
                                                                             | (3U 
                                                                                & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                                >> 3U))))))) 
                                                     >> 3U)));
                                        vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                            = ((0x81ffffffU 
                                                & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                                               | (0x7e000000U 
                                                  & (VL_EXTENDS_II(12,8, 
                                                                   ((0x80U 
                                                                     & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                        >> 5U)) 
                                                                    | ((0x60U 
                                                                        & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched) 
                                                                       | ((0x10U 
                                                                           & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                              << 2U)) 
                                                                          | ((0xcU 
                                                                              & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                                >> 8U)) 
                                                                             | (3U 
                                                                                & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                                >> 3U))))))) 
                                                     << 0x15U)));
                                        vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                            = ((0xfffff0ffU 
                                                & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                                               | (0xf00U 
                                                  & (VL_EXTENDS_II(12,8, 
                                                                   ((0x80U 
                                                                     & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                        >> 5U)) 
                                                                    | ((0x60U 
                                                                        & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched) 
                                                                       | ((0x10U 
                                                                           & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                              << 2U)) 
                                                                          | ((0xcU 
                                                                              & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                                >> 8U)) 
                                                                             | (3U 
                                                                                & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                                                >> 3U))))))) 
                                                     << 8U)));
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                if ((2U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched))) {
                    if ((0U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                      >> 0xdU)))) {
                        vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                            = (0x1ffffffU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q);
                        vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                            = (0x1000U | (0xffff8fffU 
                                          & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q));
                    } else {
                        if ((2U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                          >> 0xdU)))) {
                            vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                = ((0xfffffU & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                                   | ((0xc000000U & 
                                       (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                        << 0x18U)) 
                                      | ((0x2000000U 
                                          & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                             << 0xdU)) 
                                         | (0x1c00000U 
                                            & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                               << 0x12U)))));
                            vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                = (0x2000U | (0xffff8fffU 
                                              & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q));
                        } else {
                            if ((4U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                              >> 0xdU)))) {
                                if ((IData)((0U == 
                                             (0x107cU 
                                              & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = (0xffff8fffU 
                                           & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q);
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = (0xfffffU 
                                           & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q);
                                }
                                if (((~ (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                         >> 0xcU)) 
                                     & (0U != (0x1fU 
                                               & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 2U))))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = (0xffff8fffU 
                                           & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q);
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = (0x1ffffffU 
                                           & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q);
                                }
                                if ((IData)(((0x1000U 
                                              == (0x107cU 
                                                  & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)) 
                                             & (0U 
                                                != 
                                                (0x1fU 
                                                 & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                    >> 7U)))))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = (0xffff8fffU 
                                           & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q);
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = (0xfffffU 
                                           & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q);
                                }
                                if (((vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                      >> 0xcU) & (0U 
                                                  != 
                                                  (0x1fU 
                                                   & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                      >> 2U))))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = (0xffff8fffU 
                                           & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q);
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = (0x1ffffffU 
                                           & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q);
                                }
                            } else {
                                if ((6U == (7U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  >> 0xdU)))) {
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = ((0x1ffffffU 
                                            & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                                           | ((0xc000000U 
                                               & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                  << 0x13U)) 
                                              | (0x2000000U 
                                                 & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
                                                    << 0xdU))));
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = ((0xfffff07fU 
                                            & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q) 
                                           | (0xe00U 
                                              & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched));
                                    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q 
                                        = (0x2000U 
                                           | (0xffff8fffU 
                                              & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q));
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    vlTOPp->system__DOT__picorv32_core__DOT__mem_do_prefetch 
        = __Vdly__system__DOT__picorv32_core__DOT__mem_do_prefetch;
    vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst 
        = __Vdly__system__DOT__picorv32_core__DOT__mem_do_rinst;
    vlTOPp->system__DOT__picorv32_core__DOT__mem_la_firstword 
        = ((((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_prefetch) 
             | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst)) 
            & (vlTOPp->system__DOT__picorv32_core__DOT__next_pc 
               >> 1U)) & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_secondword)));
}

VL_INLINE_OPT void Vsystem::_combo__TOP__4(Vsystem__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsystem::_combo__TOP__4\n"); );
    Vsystem* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->system__DOT__picorv32_core__DOT__mem_la_write 
        = (((IData)(vlTOPp->resetn) & (~ (IData)((0U 
                                                  != (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_state))))) 
           & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_wdata));
    vlTOPp->system__DOT__picorv32_core__DOT__clear_prefetched_high_word 
        = vlTOPp->system__DOT__picorv32_core__DOT__clear_prefetched_high_word_q;
    if ((1U & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__prefetched_high_word)))) {
        vlTOPp->system__DOT__picorv32_core__DOT__clear_prefetched_high_word = 0U;
    }
    if ((1U & (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__latched_branch) 
                | (0U != (IData)(vlTOPp->system__DOT__picorv32_core__DOT__irq_state))) 
               | (~ (IData)(vlTOPp->resetn))))) {
        vlTOPp->system__DOT__picorv32_core__DOT__clear_prefetched_high_word = 1U;
    }
    vlTOPp->system__DOT__picorv32_core__DOT__mem_la_use_prefetched_high_word 
        = (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_firstword) 
            & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__prefetched_high_word)) 
           & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__clear_prefetched_high_word)));
    vlTOPp->system__DOT__picorv32_core__DOT__mem_xfer 
        = (((IData)(vlTOPp->system__DOT__mem_valid) 
            & (IData)(vlTOPp->system__DOT__mem_ready)) 
           | ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_use_prefetched_high_word) 
              & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst)));
    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched_noshuffle 
        = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_xfer)
            ? vlTOPp->system__DOT__mem_rdata : vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_q);
    vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched 
        = ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_use_prefetched_high_word)
            ? (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_16bit_buffer)
            : ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_secondword)
                ? ((0xffff0000U & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched_noshuffle 
                                   << 0x10U)) | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_16bit_buffer))
                : ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_firstword)
                    ? (0xffffU & (vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched_noshuffle 
                                  >> 0x10U)) : vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched_noshuffle)));
    vlTOPp->system__DOT__picorv32_core__DOT__mem_done 
        = (((IData)(vlTOPp->resetn) & ((((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_xfer) 
                                         & (0U != (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_state))) 
                                        & (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
                                            | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rdata)) 
                                           | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_wdata))) 
                                       | ((3U == (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_state)) 
                                          & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst)))) 
           & ((~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_firstword)) 
              | ((~ (IData)((3U == (3U & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)))) 
                 & (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_xfer))));
    vlTOPp->system__DOT__picorv32_core__DOT__mem_la_read 
        = ((IData)(vlTOPp->resetn) & ((((~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_use_prefetched_high_word)) 
                                        & (~ (IData)(
                                                     (0U 
                                                      != (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_state))))) 
                                       & (((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rinst) 
                                           | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_prefetch)) 
                                          | (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_do_rdata))) 
                                      | ((((IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_xfer) 
                                           & ((IData)(vlTOPp->system__DOT__picorv32_core__DOT__last_mem_valid)
                                               ? (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_firstword_reg)
                                               : (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_firstword))) 
                                          & (~ (IData)(vlTOPp->system__DOT__picorv32_core__DOT__mem_la_secondword))) 
                                         & (3U == (3U 
                                                   & vlTOPp->system__DOT__picorv32_core__DOT__mem_rdata_latched)))));
}

void Vsystem::_eval(Vsystem__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsystem::_eval\n"); );
    Vsystem* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((IData)(vlTOPp->clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__clk)))) {
        vlTOPp->_sequent__TOP__1(vlSymsp);
        vlTOPp->__Vm_traceActivity[1U] = 1U;
    }
    vlTOPp->_combo__TOP__4(vlSymsp);
    vlTOPp->__Vm_traceActivity[2U] = 1U;
    // Final
    vlTOPp->__Vclklast__TOP__clk = vlTOPp->clk;
}

VL_INLINE_OPT QData Vsystem::_change_request(Vsystem__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsystem::_change_request\n"); );
    Vsystem* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    return (vlTOPp->_change_request_1(vlSymsp));
}

VL_INLINE_OPT QData Vsystem::_change_request_1(Vsystem__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsystem::_change_request_1\n"); );
    Vsystem* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void Vsystem::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsystem::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((clk & 0xfeU))) {
        Verilated::overWidthError("clk");}
    if (VL_UNLIKELY((resetn & 0xfeU))) {
        Verilated::overWidthError("resetn");}
}
#endif  // VL_DEBUG
