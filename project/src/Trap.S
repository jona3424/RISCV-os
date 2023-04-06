# 1 "src/Trap.S"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 32 "<command-line>" 2
# 1 "src/Trap.S"
.extern handleSupervisorTrap
.global supervisorTrap
.align 4
supervisorTrap:
    addi sp, sp, -256
    #registar zero
    # sd x0, 0x00(sp)

    #registar ra
    sd x1, 0x08(sp)

    #registar sp
    sd x2, 0x10(sp)

    #registar gp
    sd x3, 0x18(sp)

    #registar tp
    sd x4, 0x20(sp)

    #registri t0-t2
    sd x5, 0x28(sp)
    sd x6, 0x30(sp)
    sd x7, 0x38(sp)

    #registar framepointer fp
    sd x8, 0x40(sp)

    #registar s1
    sd x9, 0x48(sp)

    #registri a0 - a7
    sd x10, 0x50(sp)
    sd x11, 0x58(sp)
    sd x12, 0x60(sp)
    sd x13, 0x68(sp)
    sd x14, 0x70(sp)
    sd x15, 0x78(sp)
    sd x16, 0x80(sp)
    sd x17, 0x88(sp)

    # registri s2-s11
    sd x18, 0x90(sp)
    sd x19, 0x98(sp)
    sd x20, 0xA0(sp)
    sd x21, 0xA8(sp)
    sd x22, 0xB0(sp)
    sd x23, 0xB8(sp)
    sd x24, 0xC0(sp)
    sd x25, 0xC8(sp)
    sd x26, 0xD0(sp)
    sd x27, 0xD8(sp)

    #registri t3-t6
    sd x28, 0xE0(sp)
    sd x29, 0xE8(sp)
    sd x30, 0xF0(sp)
    sd x31, 0xF8(sp)

    csrw sscratch, sp

    call handleSupervisorTrap

    #registar zero
    # ld x0, 0x00(sp)

    #registar ra
    ld x1, 0x08(sp)

    #registar sp
    ld x2, 0x10(sp)

    #registar gp
    ld x3, 0x18(sp)

    #registar tp
    ld x4, 0x20(sp)

    #registri t0-t2
    ld x5, 0x28(sp)
    ld x6, 0x30(sp)
    ld x7, 0x38(sp)

    #registar framepointer fp
    ld x8, 0x40(sp)

    #registar s1
    ld x9, 0x48(sp)

    #registri a0 - a7
    ld x10, 0x50(sp)
    ld x11, 0x58(sp)
    ld x12, 0x60(sp)
    ld x13, 0x68(sp)
    ld x14, 0x70(sp)
    ld x15, 0x78(sp)
    ld x16, 0x80(sp)
    ld x17, 0x88(sp)

    # registri s2-s11
    ld x18, 0x90(sp)
    ld x19, 0x98(sp)
    ld x20, 0xA0(sp)
    ld x21, 0xA8(sp)
    ld x22, 0xB0(sp)
    ld x23, 0xB8(sp)
    ld x24, 0xC0(sp)
    ld x25, 0xC8(sp)
    ld x26, 0xD0(sp)
    ld x27, 0xD8(sp)

    #registri t3-t6
    ld x28, 0xE0(sp)
    ld x29, 0xE8(sp)
    ld x30, 0xF0(sp)
    ld x31, 0xF8(sp)


    addi sp, sp, 256

    sret
