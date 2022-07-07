# 1 "src/contextswitch.S"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 32 "<command-line>" 2
# 1 "src/contextswitch.S"
.global _ZN9ThreadABI13contextswitchEPNS_7ContextES1_
.type __ZN9ThreadABI13contextswitchEPNS_7ContextES1_, @function
_ZN9ThreadABI13contextswitchEPNS_7ContextES1_:
    sd ra, 0x0(a0)
    sd sp, 0x8(a0)
#pokusaj dodat sve registre odje

    ld ra, 0x0(a1)
    ld sp, 0x8(a1)

    ret
