
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	21013103          	ld	sp,528(sp) # 80007210 <_GLOBAL_OFFSET_TABLE_+0x48>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	554030ef          	jal	ra,80003570 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN9ThreadABI13contextswitchEPNS_7ContextES1_>:
.global _ZN9ThreadABI13contextswitchEPNS_7ContextES1_
.type __ZN9ThreadABI13contextswitchEPNS_7ContextES1_, @function
_ZN9ThreadABI13contextswitchEPNS_7ContextES1_:
    sd ra, 0x0(a0)
    80001000:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 0x8(a0)
    80001004:	00253423          	sd	sp,8(a0)
#pokusaj dodat sve registre odje

    ld ra,  0x0(a1)
    80001008:	0005b083          	ld	ra,0(a1)
    ld sp,  0x8(a1)
    8000100c:	0085b103          	ld	sp,8(a1)

    80001010:	00008067          	ret
	...

0000000080001020 <supervisorTrap>:
.extern handleSupervisorTrap
.global supervisorTrap
.align 4
supervisorTrap:
    addi sp, sp, -256
    80001020:	f0010113          	addi	sp,sp,-256
    #registar zero
    # sd x0, 0x00(sp)

    #registar ra
    sd x1, 0x08(sp)
    80001024:	00113423          	sd	ra,8(sp)

    #registar sp
    sd x2, 0x10(sp)
    80001028:	00213823          	sd	sp,16(sp)

    #registar gp
    sd x3, 0x18(sp)
    8000102c:	00313c23          	sd	gp,24(sp)

    #registar tp
    sd x4, 0x20(sp)
    80001030:	02413023          	sd	tp,32(sp)

    #registri t0-t2
    sd x5, 0x28(sp)
    80001034:	02513423          	sd	t0,40(sp)
    sd x6, 0x30(sp)
    80001038:	02613823          	sd	t1,48(sp)
    sd x7, 0x38(sp)
    8000103c:	02713c23          	sd	t2,56(sp)

    #registar framepointer fp
    sd x8, 0x40(sp)
    80001040:	04813023          	sd	s0,64(sp)

    #registar s1
    sd x9, 0x48(sp)
    80001044:	04913423          	sd	s1,72(sp)

    #registri a0 - a7
    sd x10, 0x50(sp)
    80001048:	04a13823          	sd	a0,80(sp)
    sd x11, 0x58(sp)
    8000104c:	04b13c23          	sd	a1,88(sp)
    sd x12, 0x60(sp)
    80001050:	06c13023          	sd	a2,96(sp)
    sd x13, 0x68(sp)
    80001054:	06d13423          	sd	a3,104(sp)
    sd x14, 0x70(sp)
    80001058:	06e13823          	sd	a4,112(sp)
    sd x15, 0x78(sp)
    8000105c:	06f13c23          	sd	a5,120(sp)
    sd x16, 0x80(sp)
    80001060:	09013023          	sd	a6,128(sp)
    sd x17, 0x88(sp)
    80001064:	09113423          	sd	a7,136(sp)

    # registri s2-s11
    sd x18, 0x90(sp)
    80001068:	09213823          	sd	s2,144(sp)
    sd x19, 0x98(sp)
    8000106c:	09313c23          	sd	s3,152(sp)
    sd x20, 0xA0(sp)
    80001070:	0b413023          	sd	s4,160(sp)
    sd x21, 0xA8(sp)
    80001074:	0b513423          	sd	s5,168(sp)
    sd x22, 0xB0(sp)
    80001078:	0b613823          	sd	s6,176(sp)
    sd x23, 0xB8(sp)
    8000107c:	0b713c23          	sd	s7,184(sp)
    sd x24, 0xC0(sp)
    80001080:	0d813023          	sd	s8,192(sp)
    sd x25, 0xC8(sp)
    80001084:	0d913423          	sd	s9,200(sp)
    sd x26, 0xD0(sp)
    80001088:	0da13823          	sd	s10,208(sp)
    sd x27, 0xD8(sp)
    8000108c:	0db13c23          	sd	s11,216(sp)

    #registri t3-t6
    sd x28, 0xE0(sp)
    80001090:	0fc13023          	sd	t3,224(sp)
    sd x29, 0xE8(sp)
    80001094:	0fd13423          	sd	t4,232(sp)
    sd x30, 0xF0(sp)
    80001098:	0fe13823          	sd	t5,240(sp)
    sd x31, 0xF8(sp)
    8000109c:	0ff13c23          	sd	t6,248(sp)

    csrw sscratch, sp
    800010a0:	14011073          	csrw	sscratch,sp

    call handleSupervisorTrap
    800010a4:	0d4010ef          	jal	ra,80002178 <handleSupervisorTrap>

    #registar zero
    # ld x0, 0x00(sp)

    #registar ra
    ld x1, 0x08(sp)
    800010a8:	00813083          	ld	ra,8(sp)

    #registar sp
    ld x2, 0x10(sp)
    800010ac:	01013103          	ld	sp,16(sp)

    #registar gp
    ld x3, 0x18(sp)
    800010b0:	01813183          	ld	gp,24(sp)

    #registar tp
    ld x4, 0x20(sp)
    800010b4:	02013203          	ld	tp,32(sp)

    #registri t0-t2
    ld x5, 0x28(sp)
    800010b8:	02813283          	ld	t0,40(sp)
    ld x6, 0x30(sp)
    800010bc:	03013303          	ld	t1,48(sp)
    ld x7, 0x38(sp)
    800010c0:	03813383          	ld	t2,56(sp)

    #registar framepointer fp
    ld x8, 0x40(sp)
    800010c4:	04013403          	ld	s0,64(sp)

    #registar s1
    ld x9, 0x48(sp)
    800010c8:	04813483          	ld	s1,72(sp)

    #registri a0 - a7
    ld x10, 0x50(sp)
    800010cc:	05013503          	ld	a0,80(sp)
    ld x11, 0x58(sp)
    800010d0:	05813583          	ld	a1,88(sp)
    ld x12, 0x60(sp)
    800010d4:	06013603          	ld	a2,96(sp)
    ld x13, 0x68(sp)
    800010d8:	06813683          	ld	a3,104(sp)
    ld x14, 0x70(sp)
    800010dc:	07013703          	ld	a4,112(sp)
    ld x15, 0x78(sp)
    800010e0:	07813783          	ld	a5,120(sp)
    ld x16, 0x80(sp)
    800010e4:	08013803          	ld	a6,128(sp)
    ld x17, 0x88(sp)
    800010e8:	08813883          	ld	a7,136(sp)

    # registri s2-s11
    ld x18, 0x90(sp)
    800010ec:	09013903          	ld	s2,144(sp)
    ld x19, 0x98(sp)
    800010f0:	09813983          	ld	s3,152(sp)
    ld x20, 0xA0(sp)
    800010f4:	0a013a03          	ld	s4,160(sp)
    ld x21, 0xA8(sp)
    800010f8:	0a813a83          	ld	s5,168(sp)
    ld x22, 0xB0(sp)
    800010fc:	0b013b03          	ld	s6,176(sp)
    ld x23, 0xB8(sp)
    80001100:	0b813b83          	ld	s7,184(sp)
    ld x24, 0xC0(sp)
    80001104:	0c013c03          	ld	s8,192(sp)
    ld x25, 0xC8(sp)
    80001108:	0c813c83          	ld	s9,200(sp)
    ld x26, 0xD0(sp)
    8000110c:	0d013d03          	ld	s10,208(sp)
    ld x27, 0xD8(sp)
    80001110:	0d813d83          	ld	s11,216(sp)

    #registri t3-t6
    ld x28, 0xE0(sp)
    80001114:	0e013e03          	ld	t3,224(sp)
    ld x29, 0xE8(sp)
    80001118:	0e813e83          	ld	t4,232(sp)
    ld x30, 0xF0(sp)
    8000111c:	0f013f03          	ld	t5,240(sp)
    ld x31, 0xF8(sp)
    80001120:	0f813f83          	ld	t6,248(sp)


    addi sp, sp, 256
    80001124:	10010113          	addi	sp,sp,256

    80001128:	10200073          	sret
    8000112c:	0000                	unimp
	...

0000000080001130 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001130:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001134:	00b29a63          	bne	t0,a1,80001148 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001138:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    8000113c:	fe029ae3          	bnez	t0,80001130 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001140:	00000513          	li	a0,0
    jr ra                  # Return.
    80001144:	00008067          	ret

0000000080001148 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001148:	00100513          	li	a0,1
    8000114c:	00008067          	ret

0000000080001150 <_Z9mem_allocm>:
#include "../h/syscall_c.h"
#include "../h/SchedulerABI.hpp"
#include "../h/BufferPrinting.hpp"


void* mem_alloc (size_t size){
    80001150:	ff010113          	addi	sp,sp,-16
    80001154:	00813423          	sd	s0,8(sp)
    80001158:	01010413          	addi	s0,sp,16
    size_t cnt=0;
    void *povr;
    uint64 code=0x01;
    size_t t;
    cnt=(size+(sizeof(size_t)))/MEM_BLOCK_SIZE;
    8000115c:	00850513          	addi	a0,a0,8
    80001160:	00655793          	srli	a5,a0,0x6
    t=(size+(sizeof(size_t)))%MEM_BLOCK_SIZE;
    80001164:	03f57513          	andi	a0,a0,63
    if(t!=cnt)cnt++;
    80001168:	00a78463          	beq	a5,a0,80001170 <_Z9mem_allocm+0x20>
    8000116c:	00178793          	addi	a5,a5,1
    cnt*=MEM_BLOCK_SIZE;
    80001170:	00679793          	slli	a5,a5,0x6

    __asm__ volatile("mv a0, %0" : : "r" (code));
    80001174:	00100713          	li	a4,1
    80001178:	00070513          	mv	a0,a4
    __asm__ volatile("mv a1, %0" : : "r" (cnt));
    8000117c:	00078593          	mv	a1,a5
   __asm__ volatile("ecall");
    80001180:	00000073          	ecall
   __asm__ volatile("mv %0, a0" : "=r" (povr));
    80001184:	00050513          	mv	a0,a0
    return povr;
}
    80001188:	00813403          	ld	s0,8(sp)
    8000118c:	01010113          	addi	sp,sp,16
    80001190:	00008067          	ret

0000000080001194 <_Z8mem_freePv>:

int mem_free (void* arg){
    80001194:	ff010113          	addi	sp,sp,-16
    80001198:	00813423          	sd	s0,8(sp)
    8000119c:	01010413          	addi	s0,sp,16
    uint64 code=0x02;
    uint64 flag;
    void * handler=arg;
    __asm__ volatile("mv a1, %0" : : "r" (handler));
    800011a0:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (code));
    800011a4:	00200793          	li	a5,2
    800011a8:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800011ac:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (flag));
    800011b0:	00050713          	mv	a4,a0
    if(flag==0x696969) return 0;
    800011b4:	006977b7          	lui	a5,0x697
    800011b8:	96978793          	addi	a5,a5,-1687 # 696969 <_entry-0x7f969697>
    800011bc:	00f71a63          	bne	a4,a5,800011d0 <_Z8mem_freePv+0x3c>
    800011c0:	00000513          	li	a0,0
    else return -1;

}
    800011c4:	00813403          	ld	s0,8(sp)
    800011c8:	01010113          	addi	sp,sp,16
    800011cc:	00008067          	ret
    else return -1;
    800011d0:	fff00513          	li	a0,-1
    800011d4:	ff1ff06f          	j	800011c4 <_Z8mem_freePv+0x30>

00000000800011d8 <_Z15thread_dispatchv>:

void thread_dispatch() {
    800011d8:	ff010113          	addi	sp,sp,-16
    800011dc:	00813423          	sd	s0,8(sp)
    800011e0:	01010413          	addi	s0,sp,16
    uint64 code=0x13;
    __asm__ volatile("mv a0, %0" : : "r" (code));
    800011e4:	01300793          	li	a5,19
    800011e8:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800011ec:	00000073          	ecall


}
    800011f0:	00813403          	ld	s0,8(sp)
    800011f4:	01010113          	addi	sp,sp,16
    800011f8:	00008067          	ret

00000000800011fc <_Z11thread_exitv>:

int thread_exit() {
    800011fc:	ff010113          	addi	sp,sp,-16
    80001200:	00813423          	sd	s0,8(sp)
    80001204:	01010413          	addi	s0,sp,16
    uint64 code=0x12;
    __asm__ volatile("mv a0, %0" : : "r" (code));
    80001208:	01200793          	li	a5,18
    8000120c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001210:	00000073          	ecall
    return 0;
}
    80001214:	00000513          	li	a0,0
    80001218:	00813403          	ld	s0,8(sp)
    8000121c:	01010113          	addi	sp,sp,16
    80001220:	00008067          	ret

0000000080001224 <_Z13thread_createPP9ThreadABIPFvPvES2_>:


int thread_create(thread_t *handle, void (*start_routine)(void *), void *arg) {
    80001224:	fd010113          	addi	sp,sp,-48
    80001228:	02113423          	sd	ra,40(sp)
    8000122c:	02813023          	sd	s0,32(sp)
    80001230:	00913c23          	sd	s1,24(sp)
    80001234:	01213823          	sd	s2,16(sp)
    80001238:	01313423          	sd	s3,8(sp)
    8000123c:	03010413          	addi	s0,sp,48
    80001240:	00050913          	mv	s2,a0
    80001244:	00058493          	mv	s1,a1
    80001248:	00060993          	mv	s3,a2
    __asm__ volatile("mv a4, %0" : : "r" (mem_alloc(DEFAULT_STACK_SIZE)));
    8000124c:	00001537          	lui	a0,0x1
    80001250:	00000097          	auipc	ra,0x0
    80001254:	f00080e7          	jalr	-256(ra) # 80001150 <_Z9mem_allocm>
    80001258:	00050713          	mv	a4,a0
    __asm__ volatile("mv a3, %0" : : "r" (arg));
    8000125c:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2, %0" : : "r" (start_routine));
    80001260:	00048613          	mv	a2,s1

    __asm__ volatile("li a0, 0x11" );
    80001264:	01100513          	li	a0,17
    __asm__ volatile("mv a1, %0" : : "r" ((void *)handle));
    80001268:	00090593          	mv	a1,s2

    __asm__ volatile("ecall");
    8000126c:	00000073          	ecall
    int povr;
    __asm__ volatile("mv %0, a0" : "=r" (povr));
    80001270:	00050493          	mv	s1,a0
    80001274:	0004849b          	sext.w	s1,s1
    if(povr==0){
    80001278:	02048263          	beqz	s1,8000129c <_Z13thread_createPP9ThreadABIPFvPvES2_+0x78>
        SchedulerABI::getInstanceScheduler().put(*(handle));
    }

    return povr;
}
    8000127c:	00048513          	mv	a0,s1
    80001280:	02813083          	ld	ra,40(sp)
    80001284:	02013403          	ld	s0,32(sp)
    80001288:	01813483          	ld	s1,24(sp)
    8000128c:	01013903          	ld	s2,16(sp)
    80001290:	00813983          	ld	s3,8(sp)
    80001294:	03010113          	addi	sp,sp,48
    80001298:	00008067          	ret
        SchedulerABI::getInstanceScheduler().put(*(handle));
    8000129c:	00002097          	auipc	ra,0x2
    800012a0:	bf8080e7          	jalr	-1032(ra) # 80002e94 <_ZN12SchedulerABI20getInstanceSchedulerEv>
    800012a4:	00093583          	ld	a1,0(s2)
    800012a8:	00002097          	auipc	ra,0x2
    800012ac:	af4080e7          	jalr	-1292(ra) # 80002d9c <_ZN12SchedulerABI3putEP9ThreadABI>
    800012b0:	fcdff06f          	j	8000127c <_Z13thread_createPP9ThreadABIPFvPvES2_+0x58>

00000000800012b4 <_Z8sem_openPP12SemaphoreABIj>:

int sem_open(sem_t *handle, unsigned int init) {
    800012b4:	ff010113          	addi	sp,sp,-16
    800012b8:	00813423          	sd	s0,8(sp)
    800012bc:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0" : : "r" ((void*)handle));
    800012c0:	00050613          	mv	a2,a0
    __asm__ volatile("mv a1, %0" : : "r" (init));
    800012c4:	00058593          	mv	a1,a1
    __asm__ volatile("li a0, 0x21" );
    800012c8:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    800012cc:	00000073          	ecall
    int povr;
    __asm__ volatile("mv %0, a0" : "=r" (povr));
    800012d0:	00050513          	mv	a0,a0
    return povr;
}
    800012d4:	0005051b          	sext.w	a0,a0
    800012d8:	00813403          	ld	s0,8(sp)
    800012dc:	01010113          	addi	sp,sp,16
    800012e0:	00008067          	ret

00000000800012e4 <_Z9sem_closeP12SemaphoreABI>:

int sem_close(sem_t handle) {
    800012e4:	ff010113          	addi	sp,sp,-16
    800012e8:	00813423          	sd	s0,8(sp)
    800012ec:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" ((void*)handle));
    800012f0:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x22" );
    800012f4:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    800012f8:	00000073          	ecall
    int povr;
    __asm__ volatile("mv %0, a0" : "=r" (povr));
    800012fc:	00050513          	mv	a0,a0
    return povr;
}
    80001300:	0005051b          	sext.w	a0,a0
    80001304:	00813403          	ld	s0,8(sp)
    80001308:	01010113          	addi	sp,sp,16
    8000130c:	00008067          	ret

0000000080001310 <_Z8sem_waitP12SemaphoreABI>:

int sem_wait(sem_t id) {
    80001310:	ff010113          	addi	sp,sp,-16
    80001314:	00813423          	sd	s0,8(sp)
    80001318:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" ((void*)id));
    8000131c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x23" );
    80001320:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    80001324:	00000073          	ecall
    int povr;
    __asm__ volatile("mv %0, a0" : "=r" (povr));
    80001328:	00050513          	mv	a0,a0
    return povr;

}
    8000132c:	0005051b          	sext.w	a0,a0
    80001330:	00813403          	ld	s0,8(sp)
    80001334:	01010113          	addi	sp,sp,16
    80001338:	00008067          	ret

000000008000133c <_Z10sem_signalP12SemaphoreABI>:

int sem_signal(sem_t id) {
    8000133c:	ff010113          	addi	sp,sp,-16
    80001340:	00813423          	sd	s0,8(sp)
    80001344:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" ((void*)id));
    80001348:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x24" );
    8000134c:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    80001350:	00000073          	ecall
    int povr;
    __asm__ volatile("mv %0, a0" : "=r" (povr));
    80001354:	00050513          	mv	a0,a0
    return povr;
}
    80001358:	0005051b          	sext.w	a0,a0
    8000135c:	00813403          	ld	s0,8(sp)
    80001360:	01010113          	addi	sp,sp,16
    80001364:	00008067          	ret

0000000080001368 <_Z10time_sleepm>:

int time_sleep(time_t time) {
    80001368:	ff010113          	addi	sp,sp,-16
    8000136c:	00813423          	sd	s0,8(sp)
    80001370:	01010413          	addi	s0,sp,16
    if(time==0)return -1;
    80001374:	02050263          	beqz	a0,80001398 <_Z10time_sleepm+0x30>
    __asm__ volatile("mv a1, %0" : : "r" (time));
    80001378:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x31" );
    8000137c:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    80001380:	00000073          	ecall
    int povr;
    __asm__ volatile("mv %0, a0" : "=r" (povr));
    80001384:	00050513          	mv	a0,a0
    80001388:	0005051b          	sext.w	a0,a0
    return povr;
}
    8000138c:	00813403          	ld	s0,8(sp)
    80001390:	01010113          	addi	sp,sp,16
    80001394:	00008067          	ret
    if(time==0)return -1;
    80001398:	fff00513          	li	a0,-1
    8000139c:	ff1ff06f          	j	8000138c <_Z10time_sleepm+0x24>

00000000800013a0 <_Z4getcv>:

char getc (){
    800013a0:	ff010113          	addi	sp,sp,-16
    800013a4:	00813423          	sd	s0,8(sp)
    800013a8:	01010413          	addi	s0,sp,16
    BufferPrinting::tmpget++;
    800013ac:	00006717          	auipc	a4,0x6
    800013b0:	e9c73703          	ld	a4,-356(a4) # 80007248 <_GLOBAL_OFFSET_TABLE_+0x80>
    800013b4:	00072783          	lw	a5,0(a4)
    800013b8:	0017879b          	addiw	a5,a5,1
    800013bc:	00f72023          	sw	a5,0(a4)
    __asm__ volatile("li a0,0x41");
    800013c0:	04100513          	li	a0,65
    __asm__ volatile("ecall");
    800013c4:	00000073          	ecall

    int povr;
    __asm__ volatile("mv %0, a0" : "=r" (povr));
    800013c8:	00050513          	mv	a0,a0

    return povr;
}
    800013cc:	0ff57513          	andi	a0,a0,255
    800013d0:	00813403          	ld	s0,8(sp)
    800013d4:	01010113          	addi	sp,sp,16
    800013d8:	00008067          	ret

00000000800013dc <_Z4putcc>:



void putc (char c){
    800013dc:	ff010113          	addi	sp,sp,-16
    800013e0:	00813423          	sd	s0,8(sp)
    800013e4:	01010413          	addi	s0,sp,16
    BufferPrinting::tmpput++;
    800013e8:	00006717          	auipc	a4,0x6
    800013ec:	e4073703          	ld	a4,-448(a4) # 80007228 <_GLOBAL_OFFSET_TABLE_+0x60>
    800013f0:	00072783          	lw	a5,0(a4)
    800013f4:	0017879b          	addiw	a5,a5,1
    800013f8:	00f72023          	sw	a5,0(a4)

    __asm__ volatile("mv a1,%0" : : "r" (c));
    800013fc:	00050593          	mv	a1,a0
    __asm__ volatile("li a0,0x42");
    80001400:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    80001404:	00000073          	ecall

}
    80001408:	00813403          	ld	s0,8(sp)
    8000140c:	01010113          	addi	sp,sp,16
    80001410:	00008067          	ret

0000000080001414 <_Z8intoprivv>:
void intopriv(){
    80001414:	ff010113          	addi	sp,sp,-16
    80001418:	00813423          	sd	s0,8(sp)
    8000141c:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0xfe");
    80001420:	0fe00513          	li	a0,254
    __asm__ volatile("ecall");
    80001424:	00000073          	ecall
}
    80001428:	00813403          	ld	s0,8(sp)
    8000142c:	01010113          	addi	sp,sp,16
    80001430:	00008067          	ret

0000000080001434 <_Z8intouserv>:
void intouser(){
    80001434:	ff010113          	addi	sp,sp,-16
    80001438:	00813423          	sd	s0,8(sp)
    8000143c:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0,0xff");
    80001440:	0ff00513          	li	a0,255
    __asm__ volatile("ecall");
    80001444:	00000073          	ecall
    80001448:	00813403          	ld	s0,8(sp)
    8000144c:	01010113          	addi	sp,sp,16
    80001450:	00008067          	ret

0000000080001454 <_ZN9ThreadABI7popregsEv>:

ThreadABI *ThreadABI::running = nullptr;
ThreadABI *ThreadABI::main = nullptr;
ThreadABI *ThreadABI::idle = nullptr;

void ThreadABI::popregs() {
    80001454:	ff010113          	addi	sp,sp,-16
    80001458:	00813423          	sd	s0,8(sp)
    8000145c:	01010413          	addi	s0,sp,16
// Pop all registers
    asm volatile("ld x3, 0x18(sp)");
    80001460:	01813183          	ld	gp,24(sp)
    asm volatile("ld x4, 0x20(sp)");
    80001464:	02013203          	ld	tp,32(sp)
    asm volatile("ld x5, 0x28(sp)");
    80001468:	02813283          	ld	t0,40(sp)
    asm volatile("ld x6, 0x30(sp)");
    8000146c:	03013303          	ld	t1,48(sp)
    asm volatile("ld x7, 0x38(sp)");
    80001470:	03813383          	ld	t2,56(sp)
    asm volatile("ld x8, 0x40(sp)");
    80001474:	04013403          	ld	s0,64(sp)
    asm volatile("ld x9, 0x48(sp)");
    80001478:	04813483          	ld	s1,72(sp)
    asm volatile("ld x10, 0x50(sp)");
    8000147c:	05013503          	ld	a0,80(sp)
    asm volatile("ld x11, 0x58(sp)");
    80001480:	05813583          	ld	a1,88(sp)
    asm volatile("ld x12, 0x60(sp)");
    80001484:	06013603          	ld	a2,96(sp)
    asm volatile("ld x13, 0x68(sp)");
    80001488:	06813683          	ld	a3,104(sp)
    asm volatile("ld x14, 0x70(sp)");
    8000148c:	07013703          	ld	a4,112(sp)
    asm volatile("ld x15, 0x78(sp)");
    80001490:	07813783          	ld	a5,120(sp)
    asm volatile("ld x16, 0x80(sp)");
    80001494:	08013803          	ld	a6,128(sp)
    asm volatile("ld x17, 0x88(sp)");
    80001498:	08813883          	ld	a7,136(sp)
    asm volatile("ld x18, 0x90(sp)");
    8000149c:	09013903          	ld	s2,144(sp)
    asm volatile("ld x19, 0x98(sp)");
    800014a0:	09813983          	ld	s3,152(sp)
    asm volatile("ld x20, 0xa0(sp)");
    800014a4:	0a013a03          	ld	s4,160(sp)
    asm volatile("ld x21, 0xa8(sp)");
    800014a8:	0a813a83          	ld	s5,168(sp)
    asm volatile("ld x22, 0xb0(sp)");
    800014ac:	0b013b03          	ld	s6,176(sp)
    asm volatile("ld x23, 0xb8(sp)");
    800014b0:	0b813b83          	ld	s7,184(sp)
    asm volatile("ld x24, 0xc0(sp)");
    800014b4:	0c013c03          	ld	s8,192(sp)
    asm volatile("ld x25, 0xc8(sp)");
    800014b8:	0c813c83          	ld	s9,200(sp)
    asm volatile("ld x26, 0xd0(sp)");
    800014bc:	0d013d03          	ld	s10,208(sp)
    asm volatile("ld x27, 0xd8(sp)");
    800014c0:	0d813d83          	ld	s11,216(sp)
    asm volatile("ld x28, 0xe0(sp)");
    800014c4:	0e013e03          	ld	t3,224(sp)
    asm volatile("ld x29, 0xe8(sp)");
    800014c8:	0e813e83          	ld	t4,232(sp)
    asm volatile("ld x30, 0xf0(sp)");
    800014cc:	0f013f03          	ld	t5,240(sp)
    asm volatile("ld x31, 0xf8(sp)");
    800014d0:	0f813f83          	ld	t6,248(sp)
    asm volatile("addi sp, sp, 256");
    800014d4:	10010113          	addi	sp,sp,256
}
    800014d8:	00813403          	ld	s0,8(sp)
    800014dc:	01010113          	addi	sp,sp,16
    800014e0:	00008067          	ret

00000000800014e4 <_ZN9ThreadABI8pushregsEv>:

void ThreadABI::pushregs() {
    800014e4:	ff010113          	addi	sp,sp,-16
    800014e8:	00813423          	sd	s0,8(sp)
    800014ec:	01010413          	addi	s0,sp,16
    asm volatile("addi sp, sp, -256");
    800014f0:	f0010113          	addi	sp,sp,-256
    asm volatile("sd x3, 0x18(sp)");
    800014f4:	00313c23          	sd	gp,24(sp)
    asm volatile("sd x4, 0x20(sp)");
    800014f8:	02413023          	sd	tp,32(sp)
    asm volatile("sd x5, 0x28(sp)");
    800014fc:	02513423          	sd	t0,40(sp)
    asm volatile("sd x6, 0x30(sp)");
    80001500:	02613823          	sd	t1,48(sp)
    asm volatile("sd x7, 0x38(sp)");
    80001504:	02713c23          	sd	t2,56(sp)
    asm volatile("sd x8, 0x40(sp)");
    80001508:	04813023          	sd	s0,64(sp)
    asm volatile("sd x9, 0x48(sp)");
    8000150c:	04913423          	sd	s1,72(sp)
    asm volatile("sd x10, 0x50(sp)");
    80001510:	04a13823          	sd	a0,80(sp)
    asm volatile("sd x11, 0x58(sp)");
    80001514:	04b13c23          	sd	a1,88(sp)
    asm volatile("sd x12, 0x60(sp)");
    80001518:	06c13023          	sd	a2,96(sp)
    asm volatile("sd x13, 0x68(sp)");
    8000151c:	06d13423          	sd	a3,104(sp)
    asm volatile("sd x14, 0x70(sp)");
    80001520:	06e13823          	sd	a4,112(sp)
    asm volatile("sd x15, 0x78(sp)");
    80001524:	06f13c23          	sd	a5,120(sp)
    asm volatile("sd x16, 0x80(sp)");
    80001528:	09013023          	sd	a6,128(sp)
    asm volatile("sd x17, 0x88(sp)");
    8000152c:	09113423          	sd	a7,136(sp)
    asm volatile("sd x18, 0x90(sp)");
    80001530:	09213823          	sd	s2,144(sp)
    asm volatile("sd x19, 0x98(sp)");
    80001534:	09313c23          	sd	s3,152(sp)
    asm volatile("sd x20, 0xa0(sp)");
    80001538:	0b413023          	sd	s4,160(sp)
    asm volatile("sd x21, 0xa8(sp)");
    8000153c:	0b513423          	sd	s5,168(sp)
    asm volatile("sd x22, 0xb0(sp)");
    80001540:	0b613823          	sd	s6,176(sp)
    asm volatile("sd x23, 0xb8(sp)");
    80001544:	0b713c23          	sd	s7,184(sp)
    asm volatile("sd x24, 0xc0(sp)");
    80001548:	0d813023          	sd	s8,192(sp)
    asm volatile("sd x25, 0xc8(sp)");
    8000154c:	0d913423          	sd	s9,200(sp)
    asm volatile("sd x26, 0xd0(sp)");
    80001550:	0da13823          	sd	s10,208(sp)
    asm volatile("sd x27, 0xd8(sp)");
    80001554:	0db13c23          	sd	s11,216(sp)
    asm volatile("sd x28, 0xe0(sp)");
    80001558:	0fc13023          	sd	t3,224(sp)
    asm volatile("sd x29, 0xe8(sp)");
    8000155c:	0fd13423          	sd	t4,232(sp)
    asm volatile("sd x30, 0xf0(sp)");
    80001560:	0fe13823          	sd	t5,240(sp)
    asm volatile("sd x31, 0xf8(sp)");
    80001564:	0ff13c23          	sd	t6,248(sp)
}
    80001568:	00813403          	ld	s0,8(sp)
    8000156c:	01010113          	addi	sp,sp,16
    80001570:	00008067          	ret

0000000080001574 <_ZN9ThreadABI8dispatchEv>:


}

void ThreadABI::dispatch()
{
    80001574:	fe010113          	addi	sp,sp,-32
    80001578:	00113c23          	sd	ra,24(sp)
    8000157c:	00813823          	sd	s0,16(sp)
    80001580:	00913423          	sd	s1,8(sp)
    80001584:	01213023          	sd	s2,0(sp)
    80001588:	02010413          	addi	s0,sp,32
    ThreadABI *old = running;
    8000158c:	00006497          	auipc	s1,0x6
    80001590:	d144b483          	ld	s1,-748(s1) # 800072a0 <_ZN9ThreadABI7runningE>
    if (old->state!=ThreadABI::FINISHED ) {
    80001594:	00c4a783          	lw	a5,12(s1)
    80001598:	00400713          	li	a4,4
    8000159c:	00e78a63          	beq	a5,a4,800015b0 <_ZN9ThreadABI8dispatchEv+0x3c>
        if(old->state!=ThreadABI::BLOCKED)
    800015a0:	00300713          	li	a4,3
    800015a4:	00e78663          	beq	a5,a4,800015b0 <_ZN9ThreadABI8dispatchEv+0x3c>
            if(old->state!=ThreadABI::SLEEP)
    800015a8:	00200713          	li	a4,2
    800015ac:	04e79863          	bne	a5,a4,800015fc <_ZN9ThreadABI8dispatchEv+0x88>
            SchedulerABI::getInstanceScheduler().put(old); }

    running = SchedulerABI::getInstanceScheduler().get();
    800015b0:	00002097          	auipc	ra,0x2
    800015b4:	8e4080e7          	jalr	-1820(ra) # 80002e94 <_ZN12SchedulerABI20getInstanceSchedulerEv>
    800015b8:	00001097          	auipc	ra,0x1
    800015bc:	780080e7          	jalr	1920(ra) # 80002d38 <_ZN12SchedulerABI3getEv>
    800015c0:	00006797          	auipc	a5,0x6
    800015c4:	cea7b023          	sd	a0,-800(a5) # 800072a0 <_ZN9ThreadABI7runningE>

    ThreadABI::contextswitch(&old->context, &running->context);
    800015c8:	02050593          	addi	a1,a0,32 # 1020 <_entry-0x7fffefe0>
    800015cc:	02048513          	addi	a0,s1,32
    800015d0:	00000097          	auipc	ra,0x0
    800015d4:	a30080e7          	jalr	-1488(ra) # 80001000 <_ZN9ThreadABI13contextswitchEPNS_7ContextES1_>

     void timeSliceCounterSet(){timeSliceCounter=DEFAULT_TIME_SLICE;}
     bool timeSliceEnd(){ return 0==timeSliceCounter; }

    void setState(State value) { state = value; }
    State getState() const { return state; }
    800015d8:	00c4a703          	lw	a4,12(s1)
    if(old->getState()==ThreadABI::FINISHED){
    800015dc:	00400793          	li	a5,4
    800015e0:	02f70a63          	beq	a4,a5,80001614 <_ZN9ThreadABI8dispatchEv+0xa0>
        MemoryAllocator::getInstance().MemoryFree(old);
        if(stack!=nullptr)
        MemoryAllocator::getInstance().MemoryFree(stack);
    }

}
    800015e4:	01813083          	ld	ra,24(sp)
    800015e8:	01013403          	ld	s0,16(sp)
    800015ec:	00813483          	ld	s1,8(sp)
    800015f0:	00013903          	ld	s2,0(sp)
    800015f4:	02010113          	addi	sp,sp,32
    800015f8:	00008067          	ret
            SchedulerABI::getInstanceScheduler().put(old); }
    800015fc:	00002097          	auipc	ra,0x2
    80001600:	898080e7          	jalr	-1896(ra) # 80002e94 <_ZN12SchedulerABI20getInstanceSchedulerEv>
    80001604:	00048593          	mv	a1,s1
    80001608:	00001097          	auipc	ra,0x1
    8000160c:	794080e7          	jalr	1940(ra) # 80002d9c <_ZN12SchedulerABI3putEP9ThreadABI>
    80001610:	fa1ff06f          	j	800015b0 <_ZN9ThreadABI8dispatchEv+0x3c>
        void * stack=old->stack;
    80001614:	0184b903          	ld	s2,24(s1)
        MemoryAllocator::getInstance().MemoryFree(old);
    80001618:	00001097          	auipc	ra,0x1
    8000161c:	34c080e7          	jalr	844(ra) # 80002964 <_ZN15MemoryAllocator11getInstanceEv>
    80001620:	00048593          	mv	a1,s1
    80001624:	00001097          	auipc	ra,0x1
    80001628:	4a4080e7          	jalr	1188(ra) # 80002ac8 <_ZN15MemoryAllocator10MemoryFreeEPv>
        if(stack!=nullptr)
    8000162c:	fa090ce3          	beqz	s2,800015e4 <_ZN9ThreadABI8dispatchEv+0x70>
        MemoryAllocator::getInstance().MemoryFree(stack);
    80001630:	00001097          	auipc	ra,0x1
    80001634:	334080e7          	jalr	820(ra) # 80002964 <_ZN15MemoryAllocator11getInstanceEv>
    80001638:	00090593          	mv	a1,s2
    8000163c:	00001097          	auipc	ra,0x1
    80001640:	48c080e7          	jalr	1164(ra) # 80002ac8 <_ZN15MemoryAllocator10MemoryFreeEPv>
}
    80001644:	fa1ff06f          	j	800015e4 <_ZN9ThreadABI8dispatchEv+0x70>

0000000080001648 <_ZN9ThreadABI5yieldEv>:
{
    80001648:	ff010113          	addi	sp,sp,-16
    8000164c:	00113423          	sd	ra,8(sp)
    80001650:	00813023          	sd	s0,0(sp)
    80001654:	01010413          	addi	s0,sp,16
    pushregs();
    80001658:	00000097          	auipc	ra,0x0
    8000165c:	e8c080e7          	jalr	-372(ra) # 800014e4 <_ZN9ThreadABI8pushregsEv>
    dispatch();
    80001660:	00000097          	auipc	ra,0x0
    80001664:	f14080e7          	jalr	-236(ra) # 80001574 <_ZN9ThreadABI8dispatchEv>
    popregs();
    80001668:	00000097          	auipc	ra,0x0
    8000166c:	dec080e7          	jalr	-532(ra) # 80001454 <_ZN9ThreadABI7popregsEv>
}
    80001670:	00813083          	ld	ra,8(sp)
    80001674:	00013403          	ld	s0,0(sp)
    80001678:	01010113          	addi	sp,sp,16
    8000167c:	00008067          	ret

0000000080001680 <_ZN9ThreadABI13threadWrapperEv>:
    (*handle)->stack=stack_space;
    return 0;
}


void ThreadABI::threadWrapper() {
    80001680:	fe010113          	addi	sp,sp,-32
    80001684:	00113c23          	sd	ra,24(sp)
    80001688:	00813823          	sd	s0,16(sp)
    8000168c:	00913423          	sd	s1,8(sp)
    80001690:	02010413          	addi	s0,sp,32
    popSppSpie();
    80001694:	00001097          	auipc	ra,0x1
    80001698:	ac0080e7          	jalr	-1344(ra) # 80002154 <_ZN9ThreadABI10popSppSpieEv>
    ThreadABI::running->body(ThreadABI::running->arg);
    8000169c:	00006497          	auipc	s1,0x6
    800016a0:	c0448493          	addi	s1,s1,-1020 # 800072a0 <_ZN9ThreadABI7runningE>
    800016a4:	0004b783          	ld	a5,0(s1)
    800016a8:	0107b703          	ld	a4,16(a5)
    800016ac:	0307b503          	ld	a0,48(a5)
    800016b0:	000700e7          	jalr	a4
    ThreadABI::running->state=ThreadABI::FINISHED;
    800016b4:	0004b783          	ld	a5,0(s1)
    800016b8:	00400713          	li	a4,4
    800016bc:	00e7a623          	sw	a4,12(a5)
    yield();
    800016c0:	00000097          	auipc	ra,0x0
    800016c4:	f88080e7          	jalr	-120(ra) # 80001648 <_ZN9ThreadABI5yieldEv>
}
    800016c8:	01813083          	ld	ra,24(sp)
    800016cc:	01013403          	ld	s0,16(sp)
    800016d0:	00813483          	ld	s1,8(sp)
    800016d4:	02010113          	addi	sp,sp,32
    800016d8:	00008067          	ret

00000000800016dc <_ZN9ThreadABI13thread_createEPPS_PFvPvES2_S2_>:
    if(stack_space== nullptr)return -1;
    800016dc:	0c068263          	beqz	a3,800017a0 <_ZN9ThreadABI13thread_createEPPS_PFvPvES2_S2_+0xc4>
int ThreadABI::thread_create(ThreadABI **handle, void (*start_routine)(void *), void *arg, void *stack_space) {
    800016e0:	fd010113          	addi	sp,sp,-48
    800016e4:	02113423          	sd	ra,40(sp)
    800016e8:	02813023          	sd	s0,32(sp)
    800016ec:	00913c23          	sd	s1,24(sp)
    800016f0:	01213823          	sd	s2,16(sp)
    800016f4:	01313423          	sd	s3,8(sp)
    800016f8:	01413023          	sd	s4,0(sp)
    800016fc:	03010413          	addi	s0,sp,48
    80001700:	00050493          	mv	s1,a0
    80001704:	00058a13          	mv	s4,a1
    80001708:	00060993          	mv	s3,a2
    8000170c:	00068913          	mv	s2,a3
    MEM_ALLOC;
    80001710:	00001097          	auipc	ra,0x1
    80001714:	254080e7          	jalr	596(ra) # 80002964 <_ZN15MemoryAllocator11getInstanceEv>
    80001718:	08000593          	li	a1,128
    8000171c:	00001097          	auipc	ra,0x1
    80001720:	2a4080e7          	jalr	676(ra) # 800029c0 <_ZN15MemoryAllocator11MemoryAllocEm>




    ThreadABI(void(*start_routine)(void*),
              void* args){
    80001724:	00053023          	sd	zero,0(a0)
    80001728:	00050423          	sb	zero,8(a0)
    8000172c:	00052623          	sw	zero,12(a0)
    80001730:	00053c23          	sd	zero,24(a0)
    80001734:	02053c23          	sd	zero,56(a0)
    80001738:	00200793          	li	a5,2
    8000173c:	04f53023          	sd	a5,64(a0)
        body=start_routine;
    80001740:	01453823          	sd	s4,16(a0)
        arg=args;
    80001744:	03353823          	sd	s3,48(a0)
    *handle=new ThreadABI(start_routine,arg);
    80001748:	00a4b023          	sd	a0,0(s1)
    if(*handle== nullptr)return  -1;
    8000174c:	04050e63          	beqz	a0,800017a8 <_ZN9ThreadABI13thread_createEPPS_PFvPvES2_S2_+0xcc>
    (*handle)->errorsem=false;
    80001750:	00050423          	sb	zero,8(a0)
    (*handle)->context.ra=(uint64)&threadWrapper;
    80001754:	0004b783          	ld	a5,0(s1)
    80001758:	00000717          	auipc	a4,0x0
    8000175c:	f2870713          	addi	a4,a4,-216 # 80001680 <_ZN9ThreadABI13threadWrapperEv>
    80001760:	02e7b023          	sd	a4,32(a5)
    (*handle)->context.sp=(uint64)stack_space+DEFAULT_STACK_SIZE;
    80001764:	0004b703          	ld	a4,0(s1)
    80001768:	000017b7          	lui	a5,0x1
    8000176c:	00f907b3          	add	a5,s2,a5
    80001770:	02f73423          	sd	a5,40(a4)
    (*handle)->stack=stack_space;
    80001774:	0004b783          	ld	a5,0(s1)
    80001778:	0127bc23          	sd	s2,24(a5) # 1018 <_entry-0x7fffefe8>
    return 0;
    8000177c:	00000513          	li	a0,0
}
    80001780:	02813083          	ld	ra,40(sp)
    80001784:	02013403          	ld	s0,32(sp)
    80001788:	01813483          	ld	s1,24(sp)
    8000178c:	01013903          	ld	s2,16(sp)
    80001790:	00813983          	ld	s3,8(sp)
    80001794:	00013a03          	ld	s4,0(sp)
    80001798:	03010113          	addi	sp,sp,48
    8000179c:	00008067          	ret
    if(stack_space== nullptr)return -1;
    800017a0:	fff00513          	li	a0,-1
}
    800017a4:	00008067          	ret
    if(*handle== nullptr)return  -1;
    800017a8:	fff00513          	li	a0,-1
    800017ac:	fd5ff06f          	j	80001780 <_ZN9ThreadABI13thread_createEPPS_PFvPvES2_S2_+0xa4>

00000000800017b0 <_ZNK9ThreadABI10getContextEv>:

const ThreadABI::Context &ThreadABI::getContext() const {
    800017b0:	ff010113          	addi	sp,sp,-16
    800017b4:	00813423          	sd	s0,8(sp)
    800017b8:	01010413          	addi	s0,sp,16
    return context;
}
    800017bc:	02050513          	addi	a0,a0,32
    800017c0:	00813403          	ld	s0,8(sp)
    800017c4:	01010113          	addi	sp,sp,16
    800017c8:	00008067          	ret

00000000800017cc <_ZNK9ThreadABI8getStackEv>:

void *ThreadABI::getStack() const {
    800017cc:	ff010113          	addi	sp,sp,-16
    800017d0:	00813423          	sd	s0,8(sp)
    800017d4:	01010413          	addi	s0,sp,16
    return stack;
}
    800017d8:	01853503          	ld	a0,24(a0)
    800017dc:	00813403          	ld	s0,8(sp)
    800017e0:	01010113          	addi	sp,sp,16
    800017e4:	00008067          	ret

00000000800017e8 <_ZN9ThreadABI8setStackEPv>:

void ThreadABI::setStack(void *stack) {
    800017e8:	ff010113          	addi	sp,sp,-16
    800017ec:	00813423          	sd	s0,8(sp)
    800017f0:	01010413          	addi	s0,sp,16
    ThreadABI::stack = stack;
    800017f4:	00b53c23          	sd	a1,24(a0)
}
    800017f8:	00813403          	ld	s0,8(sp)
    800017fc:	01010113          	addi	sp,sp,16
    80001800:	00008067          	ret

0000000080001804 <_ZNK9ThreadABI12getSleeptimeEv>:

time_t ThreadABI::getSleeptime() const {
    80001804:	ff010113          	addi	sp,sp,-16
    80001808:	00813423          	sd	s0,8(sp)
    8000180c:	01010413          	addi	s0,sp,16
    return sleeptime;
}
    80001810:	03853503          	ld	a0,56(a0)
    80001814:	00813403          	ld	s0,8(sp)
    80001818:	01010113          	addi	sp,sp,16
    8000181c:	00008067          	ret

0000000080001820 <_ZN9ThreadABI14decrementsleepEv>:

int ThreadABI::decrementsleep() {
    80001820:	ff010113          	addi	sp,sp,-16
    80001824:	00813423          	sd	s0,8(sp)
    80001828:	01010413          	addi	s0,sp,16
    return --ThreadABI::sleeptime;
    8000182c:	03853783          	ld	a5,56(a0)
    80001830:	fff78793          	addi	a5,a5,-1
    80001834:	02f53c23          	sd	a5,56(a0)
}
    80001838:	0007851b          	sext.w	a0,a5
    8000183c:	00813403          	ld	s0,8(sp)
    80001840:	01010113          	addi	sp,sp,16
    80001844:	00008067          	ret

0000000080001848 <_Z7idlefunPv>:
extern "C" void supervisorTrap();


void idlefun(void *) {
    while (1){
        if(SchedulerABI::headready)thread_dispatch();
    80001848:	00006797          	auipc	a5,0x6
    8000184c:	a087b783          	ld	a5,-1528(a5) # 80007250 <_GLOBAL_OFFSET_TABLE_+0x88>
    80001850:	0007b783          	ld	a5,0(a5)
    80001854:	fe078ae3          	beqz	a5,80001848 <_Z7idlefunPv>
void idlefun(void *) {
    80001858:	ff010113          	addi	sp,sp,-16
    8000185c:	00113423          	sd	ra,8(sp)
    80001860:	00813023          	sd	s0,0(sp)
    80001864:	01010413          	addi	s0,sp,16
        if(SchedulerABI::headready)thread_dispatch();
    80001868:	00000097          	auipc	ra,0x0
    8000186c:	970080e7          	jalr	-1680(ra) # 800011d8 <_Z15thread_dispatchv>
    80001870:	00006797          	auipc	a5,0x6
    80001874:	9e07b783          	ld	a5,-1568(a5) # 80007250 <_GLOBAL_OFFSET_TABLE_+0x88>
    80001878:	0007b783          	ld	a5,0(a5)
    8000187c:	fe0796e3          	bnez	a5,80001868 <_Z7idlefunPv+0x20>
    80001880:	ff1ff06f          	j	80001870 <_Z7idlefunPv+0x28>

0000000080001884 <_Z10putcthrfunPv>:
    }
}



void putcthrfun(void *arg) {
    80001884:	fe010113          	addi	sp,sp,-32
    80001888:	00113c23          	sd	ra,24(sp)
    8000188c:	00813823          	sd	s0,16(sp)
    80001890:	00913423          	sd	s1,8(sp)
    80001894:	01213023          	sd	s2,0(sp)
    80001898:	02010413          	addi	s0,sp,32
    intopriv();
    8000189c:	00000097          	auipc	ra,0x0
    800018a0:	b78080e7          	jalr	-1160(ra) # 80001414 <_Z8intoprivv>
    __asm__ volatile("csrc sstatus,0x02");
    800018a4:	10017073          	csrci	sstatus,2
    800018a8:	00c0006f          	j	800018b4 <_Z10putcthrfunPv+0x30>
           // sem_wait(sempolling);
            uint8 *adr = (uint8 *) CONSOLE_TX_DATA;
            *adr = BufferPrinting::bin->get();
            BufferPrinting::tmpput--;
        }
        thread_dispatch();
    800018ac:	00000097          	auipc	ra,0x0
    800018b0:	92c080e7          	jalr	-1748(ra) # 800011d8 <_Z15thread_dispatchv>
        uint8 *tmp = (uint8 *) CONSOLE_STATUS;
    800018b4:	00006797          	auipc	a5,0x6
    800018b8:	9247b783          	ld	a5,-1756(a5) # 800071d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    800018bc:	0007b483          	ld	s1,0(a5)
        while ((*tmp & CONSOLE_TX_STATUS_BIT) && BufferPrinting::tmpput!=0) {
    800018c0:	0004c783          	lbu	a5,0(s1)
    800018c4:	0207f793          	andi	a5,a5,32
    800018c8:	fe0782e3          	beqz	a5,800018ac <_Z10putcthrfunPv+0x28>
    800018cc:	00006797          	auipc	a5,0x6
    800018d0:	95c7b783          	ld	a5,-1700(a5) # 80007228 <_GLOBAL_OFFSET_TABLE_+0x60>
    800018d4:	0007a783          	lw	a5,0(a5)
    800018d8:	fc078ae3          	beqz	a5,800018ac <_Z10putcthrfunPv+0x28>
            uint8 *adr = (uint8 *) CONSOLE_TX_DATA;
    800018dc:	00006797          	auipc	a5,0x6
    800018e0:	9247b783          	ld	a5,-1756(a5) # 80007200 <_GLOBAL_OFFSET_TABLE_+0x38>
    800018e4:	0007b903          	ld	s2,0(a5)
            *adr = BufferPrinting::bin->get();
    800018e8:	00006797          	auipc	a5,0x6
    800018ec:	9507b783          	ld	a5,-1712(a5) # 80007238 <_GLOBAL_OFFSET_TABLE_+0x70>
    800018f0:	0007b503          	ld	a0,0(a5)
    800018f4:	00001097          	auipc	ra,0x1
    800018f8:	298080e7          	jalr	664(ra) # 80002b8c <_ZN14BufferPrinting3getEv>
    800018fc:	00a90023          	sb	a0,0(s2)
            BufferPrinting::tmpput--;
    80001900:	00006717          	auipc	a4,0x6
    80001904:	92873703          	ld	a4,-1752(a4) # 80007228 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001908:	00072783          	lw	a5,0(a4)
    8000190c:	fff7879b          	addiw	a5,a5,-1
    80001910:	00f72023          	sw	a5,0(a4)
        while ((*tmp & CONSOLE_TX_STATUS_BIT) && BufferPrinting::tmpput!=0) {
    80001914:	fadff06f          	j	800018c0 <_Z10putcthrfunPv+0x3c>

0000000080001918 <_Z10getcthrfunPv>:

    }
}

void getcthrfun(void *arg) {
    80001918:	fe010113          	addi	sp,sp,-32
    8000191c:	00113c23          	sd	ra,24(sp)
    80001920:	00813823          	sd	s0,16(sp)
    80001924:	00913423          	sd	s1,8(sp)
    80001928:	02010413          	addi	s0,sp,32
    intopriv();
    8000192c:	00000097          	auipc	ra,0x0
    80001930:	ae8080e7          	jalr	-1304(ra) # 80001414 <_Z8intoprivv>
    __asm__ volatile("csrs sstatus,0x02");
    80001934:	10016073          	csrsi	sstatus,2
    80001938:	00c0006f          	j	80001944 <_Z10getcthrfunPv+0x2c>
          //  sem_wait(sempolling);
            uint8 *adr = (uint8 *) CONSOLE_RX_DATA;
            BufferPrinting::bout->put(*adr);
            BufferPrinting::tmpget--;
        }
        thread_dispatch();
    8000193c:	00000097          	auipc	ra,0x0
    80001940:	89c080e7          	jalr	-1892(ra) # 800011d8 <_Z15thread_dispatchv>
        uint8 *tmp = (uint8 *) CONSOLE_STATUS;
    80001944:	00006797          	auipc	a5,0x6
    80001948:	8947b783          	ld	a5,-1900(a5) # 800071d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    8000194c:	0007b483          	ld	s1,0(a5)
        while (*tmp & CONSOLE_RX_STATUS_BIT) {
    80001950:	0004c783          	lbu	a5,0(s1)
    80001954:	0017f793          	andi	a5,a5,1
    80001958:	fe0782e3          	beqz	a5,8000193c <_Z10getcthrfunPv+0x24>
            uint8 *adr = (uint8 *) CONSOLE_RX_DATA;
    8000195c:	00006797          	auipc	a5,0x6
    80001960:	8747b783          	ld	a5,-1932(a5) # 800071d0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001964:	0007b783          	ld	a5,0(a5)
            BufferPrinting::bout->put(*adr);
    80001968:	0007c583          	lbu	a1,0(a5)
    8000196c:	00006797          	auipc	a5,0x6
    80001970:	89c7b783          	ld	a5,-1892(a5) # 80007208 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001974:	0007b503          	ld	a0,0(a5)
    80001978:	00001097          	auipc	ra,0x1
    8000197c:	284080e7          	jalr	644(ra) # 80002bfc <_ZN14BufferPrinting3putEc>
            BufferPrinting::tmpget--;
    80001980:	00006717          	auipc	a4,0x6
    80001984:	8c873703          	ld	a4,-1848(a4) # 80007248 <_GLOBAL_OFFSET_TABLE_+0x80>
    80001988:	00072783          	lw	a5,0(a4)
    8000198c:	fff7879b          	addiw	a5,a5,-1
    80001990:	00f72023          	sw	a5,0(a4)
        while (*tmp & CONSOLE_RX_STATUS_BIT) {
    80001994:	fbdff06f          	j	80001950 <_Z10getcthrfunPv+0x38>

0000000080001998 <main>:
    }
}

int main() {
    80001998:	fd010113          	addi	sp,sp,-48
    8000199c:	02113423          	sd	ra,40(sp)
    800019a0:	02813023          	sd	s0,32(sp)
    800019a4:	00913c23          	sd	s1,24(sp)
    800019a8:	01213823          	sd	s2,16(sp)
    800019ac:	03010413          	addi	s0,sp,48
    __asm__ volatile("csrw stvec, %0" : : "r" (&supervisorTrap));
    800019b0:	00006797          	auipc	a5,0x6
    800019b4:	8407b783          	ld	a5,-1984(a5) # 800071f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800019b8:	10579073          	csrw	stvec,a5
    thread_t loopputc = nullptr;
    800019bc:	fc043c23          	sd	zero,-40(s0)
    thread_t loopgetc = nullptr;
    800019c0:	fc043823          	sd	zero,-48(s0)
    MEM_ALLOC;
    800019c4:	00001097          	auipc	ra,0x1
    800019c8:	fa0080e7          	jalr	-96(ra) # 80002964 <_ZN15MemoryAllocator11getInstanceEv>
    800019cc:	08000593          	li	a1,128
    800019d0:	00001097          	auipc	ra,0x1
    800019d4:	ff0080e7          	jalr	-16(ra) # 800029c0 <_ZN15MemoryAllocator11MemoryAllocEm>
    ThreadABI()=default;
    800019d8:	00053023          	sd	zero,0(a0)
    800019dc:	00050423          	sb	zero,8(a0)
    800019e0:	00052623          	sw	zero,12(a0)
    800019e4:	00053823          	sd	zero,16(a0)
    800019e8:	00053c23          	sd	zero,24(a0)
    800019ec:	02053823          	sd	zero,48(a0)
    800019f0:	02053c23          	sd	zero,56(a0)
    800019f4:	00200793          	li	a5,2
    800019f8:	04f53023          	sd	a5,64(a0)

    ThreadABI::main = new ThreadABI;
    800019fc:	00006797          	auipc	a5,0x6
    80001a00:	8347b783          	ld	a5,-1996(a5) # 80007230 <_GLOBAL_OFFSET_TABLE_+0x68>
    80001a04:	00a7b023          	sd	a0,0(a5)
    ThreadABI::running = ThreadABI::main;
    80001a08:	00005797          	auipc	a5,0x5
    80001a0c:	7f07b783          	ld	a5,2032(a5) # 800071f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001a10:	00a7b023          	sd	a0,0(a5)
    thread_create(&ThreadABI::idle, idlefun, nullptr);
    80001a14:	00000613          	li	a2,0
    80001a18:	00000597          	auipc	a1,0x0
    80001a1c:	e3058593          	addi	a1,a1,-464 # 80001848 <_Z7idlefunPv>
    80001a20:	00006517          	auipc	a0,0x6
    80001a24:	80053503          	ld	a0,-2048(a0) # 80007220 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001a28:	fffff097          	auipc	ra,0xfffff
    80001a2c:	7fc080e7          	jalr	2044(ra) # 80001224 <_Z13thread_createPP9ThreadABIPFvPvES2_>
    sem_t itemAvailable,spaceAvailable;
    char* buffer;
    int head,tail,cap;
public:
    static int tmpput,tmpget;
    MEM_ALLOC;
    80001a30:	00001097          	auipc	ra,0x1
    80001a34:	f34080e7          	jalr	-204(ra) # 80002964 <_ZN15MemoryAllocator11getInstanceEv>
    80001a38:	04000593          	li	a1,64
    80001a3c:	00001097          	auipc	ra,0x1
    80001a40:	f84080e7          	jalr	-124(ra) # 800029c0 <_ZN15MemoryAllocator11MemoryAllocEm>
    80001a44:	00050493          	mv	s1,a0
    BufferPrinting::bin = new BufferPrinting(100);
    80001a48:	06400593          	li	a1,100
    80001a4c:	00001097          	auipc	ra,0x1
    80001a50:	278080e7          	jalr	632(ra) # 80002cc4 <_ZN14BufferPrintingC1Ei>
    80001a54:	00005797          	auipc	a5,0x5
    80001a58:	7e47b783          	ld	a5,2020(a5) # 80007238 <_GLOBAL_OFFSET_TABLE_+0x70>
    80001a5c:	0097b023          	sd	s1,0(a5)
    80001a60:	00001097          	auipc	ra,0x1
    80001a64:	f04080e7          	jalr	-252(ra) # 80002964 <_ZN15MemoryAllocator11getInstanceEv>
    80001a68:	04000593          	li	a1,64
    80001a6c:	00001097          	auipc	ra,0x1
    80001a70:	f54080e7          	jalr	-172(ra) # 800029c0 <_ZN15MemoryAllocator11MemoryAllocEm>
    80001a74:	00050493          	mv	s1,a0
    BufferPrinting::bout = new BufferPrinting(100);
    80001a78:	06400593          	li	a1,100
    80001a7c:	00001097          	auipc	ra,0x1
    80001a80:	248080e7          	jalr	584(ra) # 80002cc4 <_ZN14BufferPrintingC1Ei>
    80001a84:	00005797          	auipc	a5,0x5
    80001a88:	7847b783          	ld	a5,1924(a5) # 80007208 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001a8c:	0097b023          	sd	s1,0(a5)
    sem_open(&BufferPrinting::in, 0);
    80001a90:	00000593          	li	a1,0
    80001a94:	00005517          	auipc	a0,0x5
    80001a98:	7ac53503          	ld	a0,1964(a0) # 80007240 <_GLOBAL_OFFSET_TABLE_+0x78>
    80001a9c:	00000097          	auipc	ra,0x0
    80001aa0:	818080e7          	jalr	-2024(ra) # 800012b4 <_Z8sem_openPP12SemaphoreABIj>
    sem_open(&BufferPrinting::out, 0);
    80001aa4:	00000593          	li	a1,0
    80001aa8:	00005517          	auipc	a0,0x5
    80001aac:	77053503          	ld	a0,1904(a0) # 80007218 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001ab0:	00000097          	auipc	ra,0x0
    80001ab4:	804080e7          	jalr	-2044(ra) # 800012b4 <_Z8sem_openPP12SemaphoreABIj>
    thread_create(&loopputc, putcthrfun, BufferPrinting::in);
    80001ab8:	00005797          	auipc	a5,0x5
    80001abc:	7887b783          	ld	a5,1928(a5) # 80007240 <_GLOBAL_OFFSET_TABLE_+0x78>
    80001ac0:	0007b603          	ld	a2,0(a5)
    80001ac4:	00000597          	auipc	a1,0x0
    80001ac8:	dc058593          	addi	a1,a1,-576 # 80001884 <_Z10putcthrfunPv>
    80001acc:	fd840513          	addi	a0,s0,-40
    80001ad0:	fffff097          	auipc	ra,0xfffff
    80001ad4:	754080e7          	jalr	1876(ra) # 80001224 <_Z13thread_createPP9ThreadABIPFvPvES2_>
    thread_create(&loopgetc, getcthrfun, BufferPrinting::out);
    80001ad8:	00005797          	auipc	a5,0x5
    80001adc:	7407b783          	ld	a5,1856(a5) # 80007218 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001ae0:	0007b603          	ld	a2,0(a5)
    80001ae4:	00000597          	auipc	a1,0x0
    80001ae8:	e3458593          	addi	a1,a1,-460 # 80001918 <_Z10getcthrfunPv>
    80001aec:	fd040513          	addi	a0,s0,-48
    80001af0:	fffff097          	auipc	ra,0xfffff
    80001af4:	734080e7          	jalr	1844(ra) # 80001224 <_Z13thread_createPP9ThreadABIPFvPvES2_>

    __asm__ volatile("csrs sstatus,0x02");
    80001af8:	10016073          	csrsi	sstatus,2
    intouser();
    80001afc:	00000097          	auipc	ra,0x0
    80001b00:	938080e7          	jalr	-1736(ra) # 80001434 <_Z8intouserv>


    //usermainhere
    putc('G');
    80001b04:	04700513          	li	a0,71
    80001b08:	00000097          	auipc	ra,0x0
    80001b0c:	8d4080e7          	jalr	-1836(ra) # 800013dc <_Z4putcc>
    putc('O');
    80001b10:	04f00513          	li	a0,79
    80001b14:	00000097          	auipc	ra,0x0
    80001b18:	8c8080e7          	jalr	-1848(ra) # 800013dc <_Z4putcc>
    putc('T');
    80001b1c:	05400513          	li	a0,84
    80001b20:	00000097          	auipc	ra,0x0
    80001b24:	8bc080e7          	jalr	-1860(ra) # 800013dc <_Z4putcc>
    putc('O');
    80001b28:	04f00513          	li	a0,79
    80001b2c:	00000097          	auipc	ra,0x0
    80001b30:	8b0080e7          	jalr	-1872(ra) # 800013dc <_Z4putcc>
    putc('V');
    80001b34:	05600513          	li	a0,86
    80001b38:	00000097          	auipc	ra,0x0
    80001b3c:	8a4080e7          	jalr	-1884(ra) # 800013dc <_Z4putcc>
    putc('O');
    80001b40:	04f00513          	li	a0,79
    80001b44:	00000097          	auipc	ra,0x0
    80001b48:	898080e7          	jalr	-1896(ra) # 800013dc <_Z4putcc>
    putc(':');
    80001b4c:	03a00513          	li	a0,58
    80001b50:	00000097          	auipc	ra,0x0
    80001b54:	88c080e7          	jalr	-1908(ra) # 800013dc <_Z4putcc>
    putc('D');
    80001b58:	04400513          	li	a0,68
    80001b5c:	00000097          	auipc	ra,0x0
    80001b60:	880080e7          	jalr	-1920(ra) # 800013dc <_Z4putcc>
    putc('\n');
    80001b64:	00a00513          	li	a0,10
    80001b68:	00000097          	auipc	ra,0x0
    80001b6c:	874080e7          	jalr	-1932(ra) # 800013dc <_Z4putcc>
    80001b70:	00c0006f          	j	80001b7c <main+0x1e4>

    while (BufferPrinting::tmpput>0 || BufferPrinting::tmpget>0) thread_dispatch();
    80001b74:	fffff097          	auipc	ra,0xfffff
    80001b78:	664080e7          	jalr	1636(ra) # 800011d8 <_Z15thread_dispatchv>
    80001b7c:	00005797          	auipc	a5,0x5
    80001b80:	6ac7b783          	ld	a5,1708(a5) # 80007228 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001b84:	0007a783          	lw	a5,0(a5)
    80001b88:	fef046e3          	bgtz	a5,80001b74 <main+0x1dc>
    80001b8c:	00005797          	auipc	a5,0x5
    80001b90:	6bc7b783          	ld	a5,1724(a5) # 80007248 <_GLOBAL_OFFSET_TABLE_+0x80>
    80001b94:	0007a783          	lw	a5,0(a5)
    80001b98:	fcf04ee3          	bgtz	a5,80001b74 <main+0x1dc>


    return 0;
    80001b9c:	00000513          	li	a0,0
    80001ba0:	02813083          	ld	ra,40(sp)
    80001ba4:	02013403          	ld	s0,32(sp)
    80001ba8:	01813483          	ld	s1,24(sp)
    80001bac:	01013903          	ld	s2,16(sp)
    80001bb0:	03010113          	addi	sp,sp,48
    80001bb4:	00008067          	ret
    80001bb8:	00050913          	mv	s2,a0
    80001bbc:	00001097          	auipc	ra,0x1
    80001bc0:	da8080e7          	jalr	-600(ra) # 80002964 <_ZN15MemoryAllocator11getInstanceEv>
    80001bc4:	00048593          	mv	a1,s1
    80001bc8:	00001097          	auipc	ra,0x1
    80001bcc:	f00080e7          	jalr	-256(ra) # 80002ac8 <_ZN15MemoryAllocator10MemoryFreeEPv>
    80001bd0:	00090513          	mv	a0,s2
    80001bd4:	00007097          	auipc	ra,0x7
    80001bd8:	814080e7          	jalr	-2028(ra) # 800083e8 <_Unwind_Resume>
    80001bdc:	00050913          	mv	s2,a0
    80001be0:	00001097          	auipc	ra,0x1
    80001be4:	d84080e7          	jalr	-636(ra) # 80002964 <_ZN15MemoryAllocator11getInstanceEv>
    80001be8:	00048593          	mv	a1,s1
    80001bec:	00001097          	auipc	ra,0x1
    80001bf0:	edc080e7          	jalr	-292(ra) # 80002ac8 <_ZN15MemoryAllocator10MemoryFreeEPv>
    80001bf4:	00090513          	mv	a0,s2
    80001bf8:	00006097          	auipc	ra,0x6
    80001bfc:	7f0080e7          	jalr	2032(ra) # 800083e8 <_Unwind_Resume>

0000000080001c00 <_ZN6ThreadD1Ev>:
    __asm__ volatile("mv a1, %0" : : "r" (&myHandle));
    __asm__ volatile("li a0, 0x11");
    __asm__ volatile("ecall");
}

Thread::~Thread() {
    80001c00:	ff010113          	addi	sp,sp,-16
    80001c04:	00113423          	sd	ra,8(sp)
    80001c08:	00813023          	sd	s0,0(sp)
    80001c0c:	01010413          	addi	s0,sp,16
    80001c10:	00005797          	auipc	a5,0x5
    80001c14:	56878793          	addi	a5,a5,1384 # 80007178 <_ZTV6Thread+0x10>
    80001c18:	00f53023          	sd	a5,0(a0)
    mem_free( myHandle);
    80001c1c:	00853503          	ld	a0,8(a0)
    80001c20:	fffff097          	auipc	ra,0xfffff
    80001c24:	574080e7          	jalr	1396(ra) # 80001194 <_Z8mem_freePv>
}
    80001c28:	00813083          	ld	ra,8(sp)
    80001c2c:	00013403          	ld	s0,0(sp)
    80001c30:	01010113          	addi	sp,sp,16
    80001c34:	00008067          	ret

0000000080001c38 <_ZN9SemaphoreD1Ev>:
}
int Semaphore::signal() {
    return sem_signal(myHandle);
}

Semaphore::~Semaphore() {
    80001c38:	ff010113          	addi	sp,sp,-16
    80001c3c:	00113423          	sd	ra,8(sp)
    80001c40:	00813023          	sd	s0,0(sp)
    80001c44:	01010413          	addi	s0,sp,16
    80001c48:	00005797          	auipc	a5,0x5
    80001c4c:	55878793          	addi	a5,a5,1368 # 800071a0 <_ZTV9Semaphore+0x10>
    80001c50:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80001c54:	00853503          	ld	a0,8(a0)
    80001c58:	fffff097          	auipc	ra,0xfffff
    80001c5c:	68c080e7          	jalr	1676(ra) # 800012e4 <_Z9sem_closeP12SemaphoreABI>
}
    80001c60:	00813083          	ld	ra,8(sp)
    80001c64:	00013403          	ld	s0,0(sp)
    80001c68:	01010113          	addi	sp,sp,16
    80001c6c:	00008067          	ret

0000000080001c70 <_Znwm>:
{
    80001c70:	ff010113          	addi	sp,sp,-16
    80001c74:	00113423          	sd	ra,8(sp)
    80001c78:	00813023          	sd	s0,0(sp)
    80001c7c:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    80001c80:	fffff097          	auipc	ra,0xfffff
    80001c84:	4d0080e7          	jalr	1232(ra) # 80001150 <_Z9mem_allocm>
}
    80001c88:	00813083          	ld	ra,8(sp)
    80001c8c:	00013403          	ld	s0,0(sp)
    80001c90:	01010113          	addi	sp,sp,16
    80001c94:	00008067          	ret

0000000080001c98 <_Znam>:
{
    80001c98:	ff010113          	addi	sp,sp,-16
    80001c9c:	00113423          	sd	ra,8(sp)
    80001ca0:	00813023          	sd	s0,0(sp)
    80001ca4:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    80001ca8:	fffff097          	auipc	ra,0xfffff
    80001cac:	4a8080e7          	jalr	1192(ra) # 80001150 <_Z9mem_allocm>
}
    80001cb0:	00813083          	ld	ra,8(sp)
    80001cb4:	00013403          	ld	s0,0(sp)
    80001cb8:	01010113          	addi	sp,sp,16
    80001cbc:	00008067          	ret

0000000080001cc0 <_ZdlPv>:
{
    80001cc0:	ff010113          	addi	sp,sp,-16
    80001cc4:	00113423          	sd	ra,8(sp)
    80001cc8:	00813023          	sd	s0,0(sp)
    80001ccc:	01010413          	addi	s0,sp,16
    mem_free(p);
    80001cd0:	fffff097          	auipc	ra,0xfffff
    80001cd4:	4c4080e7          	jalr	1220(ra) # 80001194 <_Z8mem_freePv>
}
    80001cd8:	00813083          	ld	ra,8(sp)
    80001cdc:	00013403          	ld	s0,0(sp)
    80001ce0:	01010113          	addi	sp,sp,16
    80001ce4:	00008067          	ret

0000000080001ce8 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80001ce8:	fe010113          	addi	sp,sp,-32
    80001cec:	00113c23          	sd	ra,24(sp)
    80001cf0:	00813823          	sd	s0,16(sp)
    80001cf4:	00913423          	sd	s1,8(sp)
    80001cf8:	02010413          	addi	s0,sp,32
    80001cfc:	00050493          	mv	s1,a0
}
    80001d00:	00000097          	auipc	ra,0x0
    80001d04:	f00080e7          	jalr	-256(ra) # 80001c00 <_ZN6ThreadD1Ev>
    80001d08:	00048513          	mv	a0,s1
    80001d0c:	00000097          	auipc	ra,0x0
    80001d10:	fb4080e7          	jalr	-76(ra) # 80001cc0 <_ZdlPv>
    80001d14:	01813083          	ld	ra,24(sp)
    80001d18:	01013403          	ld	s0,16(sp)
    80001d1c:	00813483          	ld	s1,8(sp)
    80001d20:	02010113          	addi	sp,sp,32
    80001d24:	00008067          	ret

0000000080001d28 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80001d28:	fe010113          	addi	sp,sp,-32
    80001d2c:	00113c23          	sd	ra,24(sp)
    80001d30:	00813823          	sd	s0,16(sp)
    80001d34:	00913423          	sd	s1,8(sp)
    80001d38:	02010413          	addi	s0,sp,32
    80001d3c:	00050493          	mv	s1,a0
}
    80001d40:	00000097          	auipc	ra,0x0
    80001d44:	ef8080e7          	jalr	-264(ra) # 80001c38 <_ZN9SemaphoreD1Ev>
    80001d48:	00048513          	mv	a0,s1
    80001d4c:	00000097          	auipc	ra,0x0
    80001d50:	f74080e7          	jalr	-140(ra) # 80001cc0 <_ZdlPv>
    80001d54:	01813083          	ld	ra,24(sp)
    80001d58:	01013403          	ld	s0,16(sp)
    80001d5c:	00813483          	ld	s1,8(sp)
    80001d60:	02010113          	addi	sp,sp,32
    80001d64:	00008067          	ret

0000000080001d68 <_ZdaPv>:
{
    80001d68:	ff010113          	addi	sp,sp,-16
    80001d6c:	00113423          	sd	ra,8(sp)
    80001d70:	00813023          	sd	s0,0(sp)
    80001d74:	01010413          	addi	s0,sp,16
    mem_free(p);
    80001d78:	fffff097          	auipc	ra,0xfffff
    80001d7c:	41c080e7          	jalr	1052(ra) # 80001194 <_Z8mem_freePv>
}
    80001d80:	00813083          	ld	ra,8(sp)
    80001d84:	00013403          	ld	s0,0(sp)
    80001d88:	01010113          	addi	sp,sp,16
    80001d8c:	00008067          	ret

0000000080001d90 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80001d90:	fd010113          	addi	sp,sp,-48
    80001d94:	02113423          	sd	ra,40(sp)
    80001d98:	02813023          	sd	s0,32(sp)
    80001d9c:	00913c23          	sd	s1,24(sp)
    80001da0:	01213823          	sd	s2,16(sp)
    80001da4:	01313423          	sd	s3,8(sp)
    80001da8:	03010413          	addi	s0,sp,48
    80001dac:	00050493          	mv	s1,a0
    80001db0:	00058913          	mv	s2,a1
    80001db4:	00060993          	mv	s3,a2
    80001db8:	00005797          	auipc	a5,0x5
    80001dbc:	3c078793          	addi	a5,a5,960 # 80007178 <_ZTV6Thread+0x10>
    80001dc0:	00f53023          	sd	a5,0(a0)
    __asm__ volatile("mv a4, %0" : : "r" (mem_alloc(DEFAULT_STACK_SIZE)));
    80001dc4:	00001537          	lui	a0,0x1
    80001dc8:	fffff097          	auipc	ra,0xfffff
    80001dcc:	388080e7          	jalr	904(ra) # 80001150 <_Z9mem_allocm>
    80001dd0:	00050713          	mv	a4,a0
    __asm__ volatile("mv a3, %0" : : "r" (arg));
    80001dd4:	00098693          	mv	a3,s3
    __asm__ volatile("mv a2, %0" : : "r" (body));
    80001dd8:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %0" : : "r" (&myHandle));
    80001ddc:	00848493          	addi	s1,s1,8
    80001de0:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x11");
    80001de4:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    80001de8:	00000073          	ecall
}
    80001dec:	02813083          	ld	ra,40(sp)
    80001df0:	02013403          	ld	s0,32(sp)
    80001df4:	01813483          	ld	s1,24(sp)
    80001df8:	01013903          	ld	s2,16(sp)
    80001dfc:	00813983          	ld	s3,8(sp)
    80001e00:	03010113          	addi	sp,sp,48
    80001e04:	00008067          	ret

0000000080001e08 <_ZN6Thread5startEv>:
int Thread::start() {
    80001e08:	ff010113          	addi	sp,sp,-16
    80001e0c:	00813423          	sd	s0,8(sp)
    80001e10:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" ((void *)myHandle));
    80001e14:	00853783          	ld	a5,8(a0) # 1008 <_entry-0x7fffeff8>
    80001e18:	00078593          	mv	a1,a5
    __asm__ volatile("li a0, 0x14");
    80001e1c:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    80001e20:	00000073          	ecall
    __asm__ volatile("mv %0, a0" : "=r" (povr));
    80001e24:	00050513          	mv	a0,a0
}
    80001e28:	0005051b          	sext.w	a0,a0
    80001e2c:	00813403          	ld	s0,8(sp)
    80001e30:	01010113          	addi	sp,sp,16
    80001e34:	00008067          	ret

0000000080001e38 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80001e38:	ff010113          	addi	sp,sp,-16
    80001e3c:	00113423          	sd	ra,8(sp)
    80001e40:	00813023          	sd	s0,0(sp)
    80001e44:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80001e48:	fffff097          	auipc	ra,0xfffff
    80001e4c:	390080e7          	jalr	912(ra) # 800011d8 <_Z15thread_dispatchv>
}
    80001e50:	00813083          	ld	ra,8(sp)
    80001e54:	00013403          	ld	s0,0(sp)
    80001e58:	01010113          	addi	sp,sp,16
    80001e5c:	00008067          	ret

0000000080001e60 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t time) {
    80001e60:	ff010113          	addi	sp,sp,-16
    80001e64:	00113423          	sd	ra,8(sp)
    80001e68:	00813023          	sd	s0,0(sp)
    80001e6c:	01010413          	addi	s0,sp,16
    return time_sleep(time);
    80001e70:	fffff097          	auipc	ra,0xfffff
    80001e74:	4f8080e7          	jalr	1272(ra) # 80001368 <_Z10time_sleepm>
}
    80001e78:	00813083          	ld	ra,8(sp)
    80001e7c:	00013403          	ld	s0,0(sp)
    80001e80:	01010113          	addi	sp,sp,16
    80001e84:	00008067          	ret

0000000080001e88 <_ZN14PeriodicThread18periodicwrapperfunEPv>:
void Console::putc(char c) {
::putc(c);
}
PeriodicThread::PeriodicThread(time_t period):Thread(periodicwrapperfun,new argsfun{this,period}){}

void PeriodicThread::periodicwrapperfun(void *args) {
    80001e88:	fe010113          	addi	sp,sp,-32
    80001e8c:	00113c23          	sd	ra,24(sp)
    80001e90:	00813823          	sd	s0,16(sp)
    80001e94:	00913423          	sd	s1,8(sp)
    80001e98:	02010413          	addi	s0,sp,32
    80001e9c:	00050493          	mv	s1,a0
    argsfun *tmp = (argsfun*) args;
    while(true){
        tmp->p->periodicActivation();
    80001ea0:	0004b503          	ld	a0,0(s1)
    80001ea4:	00053783          	ld	a5,0(a0)
    80001ea8:	0187b783          	ld	a5,24(a5)
    80001eac:	000780e7          	jalr	a5
        sleep(tmp->per);
    80001eb0:	0084b503          	ld	a0,8(s1)
    80001eb4:	00000097          	auipc	ra,0x0
    80001eb8:	fac080e7          	jalr	-84(ra) # 80001e60 <_ZN6Thread5sleepEm>
    while(true){
    80001ebc:	fe5ff06f          	j	80001ea0 <_ZN14PeriodicThread18periodicwrapperfunEPv+0x18>

0000000080001ec0 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80001ec0:	fe010113          	addi	sp,sp,-32
    80001ec4:	00113c23          	sd	ra,24(sp)
    80001ec8:	00813823          	sd	s0,16(sp)
    80001ecc:	00913423          	sd	s1,8(sp)
    80001ed0:	02010413          	addi	s0,sp,32
    80001ed4:	00050493          	mv	s1,a0
    80001ed8:	00005797          	auipc	a5,0x5
    80001edc:	2a078793          	addi	a5,a5,672 # 80007178 <_ZTV6Thread+0x10>
    80001ee0:	00f53023          	sd	a5,0(a0)
    __asm__ volatile("mv a4, %0" : : "r" (mem_alloc(DEFAULT_STACK_SIZE)));
    80001ee4:	00001537          	lui	a0,0x1
    80001ee8:	fffff097          	auipc	ra,0xfffff
    80001eec:	268080e7          	jalr	616(ra) # 80001150 <_Z9mem_allocm>
    80001ef0:	00050713          	mv	a4,a0
    __asm__ volatile("mv a3,%0"  : : "r"(this));
    80001ef4:	00048693          	mv	a3,s1
    __asm__ volatile("mv a2, %0" : : "r" (wrapperrun));
    80001ef8:	00000797          	auipc	a5,0x0
    80001efc:	19878793          	addi	a5,a5,408 # 80002090 <_ZN6Thread10wrapperrunEPv>
    80001f00:	00078613          	mv	a2,a5
    __asm__ volatile("mv a1, %0" : : "r" (&myHandle));
    80001f04:	00848493          	addi	s1,s1,8
    80001f08:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x11");
    80001f0c:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    80001f10:	00000073          	ecall
}
    80001f14:	01813083          	ld	ra,24(sp)
    80001f18:	01013403          	ld	s0,16(sp)
    80001f1c:	00813483          	ld	s1,8(sp)
    80001f20:	02010113          	addi	sp,sp,32
    80001f24:	00008067          	ret

0000000080001f28 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore (unsigned init){
    80001f28:	ff010113          	addi	sp,sp,-16
    80001f2c:	00113423          	sd	ra,8(sp)
    80001f30:	00813023          	sd	s0,0(sp)
    80001f34:	01010413          	addi	s0,sp,16
    80001f38:	00005797          	auipc	a5,0x5
    80001f3c:	26878793          	addi	a5,a5,616 # 800071a0 <_ZTV9Semaphore+0x10>
    80001f40:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
    sem_open(&myHandle,init);
    80001f44:	00850513          	addi	a0,a0,8
    80001f48:	fffff097          	auipc	ra,0xfffff
    80001f4c:	36c080e7          	jalr	876(ra) # 800012b4 <_Z8sem_openPP12SemaphoreABIj>
}
    80001f50:	00813083          	ld	ra,8(sp)
    80001f54:	00013403          	ld	s0,0(sp)
    80001f58:	01010113          	addi	sp,sp,16
    80001f5c:	00008067          	ret

0000000080001f60 <_ZN9Semaphore4waitEv>:
int  Semaphore::wait (){
    80001f60:	ff010113          	addi	sp,sp,-16
    80001f64:	00113423          	sd	ra,8(sp)
    80001f68:	00813023          	sd	s0,0(sp)
    80001f6c:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80001f70:	00853503          	ld	a0,8(a0)
    80001f74:	fffff097          	auipc	ra,0xfffff
    80001f78:	39c080e7          	jalr	924(ra) # 80001310 <_Z8sem_waitP12SemaphoreABI>
}
    80001f7c:	00813083          	ld	ra,8(sp)
    80001f80:	00013403          	ld	s0,0(sp)
    80001f84:	01010113          	addi	sp,sp,16
    80001f88:	00008067          	ret

0000000080001f8c <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80001f8c:	ff010113          	addi	sp,sp,-16
    80001f90:	00113423          	sd	ra,8(sp)
    80001f94:	00813023          	sd	s0,0(sp)
    80001f98:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80001f9c:	00853503          	ld	a0,8(a0)
    80001fa0:	fffff097          	auipc	ra,0xfffff
    80001fa4:	39c080e7          	jalr	924(ra) # 8000133c <_Z10sem_signalP12SemaphoreABI>
}
    80001fa8:	00813083          	ld	ra,8(sp)
    80001fac:	00013403          	ld	s0,0(sp)
    80001fb0:	01010113          	addi	sp,sp,16
    80001fb4:	00008067          	ret

0000000080001fb8 <_ZN7Console4getcEv>:
char Console::getc() {
    80001fb8:	ff010113          	addi	sp,sp,-16
    80001fbc:	00113423          	sd	ra,8(sp)
    80001fc0:	00813023          	sd	s0,0(sp)
    80001fc4:	01010413          	addi	s0,sp,16
    return ::getc();
    80001fc8:	fffff097          	auipc	ra,0xfffff
    80001fcc:	3d8080e7          	jalr	984(ra) # 800013a0 <_Z4getcv>
}
    80001fd0:	00813083          	ld	ra,8(sp)
    80001fd4:	00013403          	ld	s0,0(sp)
    80001fd8:	01010113          	addi	sp,sp,16
    80001fdc:	00008067          	ret

0000000080001fe0 <_ZN7Console4putcEc>:
void Console::putc(char c) {
    80001fe0:	ff010113          	addi	sp,sp,-16
    80001fe4:	00113423          	sd	ra,8(sp)
    80001fe8:	00813023          	sd	s0,0(sp)
    80001fec:	01010413          	addi	s0,sp,16
::putc(c);
    80001ff0:	fffff097          	auipc	ra,0xfffff
    80001ff4:	3ec080e7          	jalr	1004(ra) # 800013dc <_Z4putcc>
}
    80001ff8:	00813083          	ld	ra,8(sp)
    80001ffc:	00013403          	ld	s0,0(sp)
    80002000:	01010113          	addi	sp,sp,16
    80002004:	00008067          	ret

0000000080002008 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period):Thread(periodicwrapperfun,new argsfun{this,period}){}
    80002008:	fe010113          	addi	sp,sp,-32
    8000200c:	00113c23          	sd	ra,24(sp)
    80002010:	00813823          	sd	s0,16(sp)
    80002014:	00913423          	sd	s1,8(sp)
    80002018:	01213023          	sd	s2,0(sp)
    8000201c:	02010413          	addi	s0,sp,32
    80002020:	00050493          	mv	s1,a0
    80002024:	00058913          	mv	s2,a1
    80002028:	01000513          	li	a0,16
    8000202c:	00000097          	auipc	ra,0x0
    80002030:	c44080e7          	jalr	-956(ra) # 80001c70 <_Znwm>
    80002034:	00050613          	mv	a2,a0
    80002038:	00953023          	sd	s1,0(a0)
    8000203c:	01253423          	sd	s2,8(a0)
    80002040:	00000597          	auipc	a1,0x0
    80002044:	e4858593          	addi	a1,a1,-440 # 80001e88 <_ZN14PeriodicThread18periodicwrapperfunEPv>
    80002048:	00048513          	mv	a0,s1
    8000204c:	00000097          	auipc	ra,0x0
    80002050:	d44080e7          	jalr	-700(ra) # 80001d90 <_ZN6ThreadC1EPFvPvES0_>
    80002054:	00005797          	auipc	a5,0x5
    80002058:	0f478793          	addi	a5,a5,244 # 80007148 <_ZTV14PeriodicThread+0x10>
    8000205c:	00f4b023          	sd	a5,0(s1)
    80002060:	01813083          	ld	ra,24(sp)
    80002064:	01013403          	ld	s0,16(sp)
    80002068:	00813483          	ld	s1,8(sp)
    8000206c:	00013903          	ld	s2,0(sp)
    80002070:	02010113          	addi	sp,sp,32
    80002074:	00008067          	ret

0000000080002078 <_ZN6Thread3runEv>:
    int start ();
    static void dispatch ();
    static int sleep (time_t);
protected:
    Thread ();
    virtual void run () {};
    80002078:	ff010113          	addi	sp,sp,-16
    8000207c:	00813423          	sd	s0,8(sp)
    80002080:	01010413          	addi	s0,sp,16
    80002084:	00813403          	ld	s0,8(sp)
    80002088:	01010113          	addi	sp,sp,16
    8000208c:	00008067          	ret

0000000080002090 <_ZN6Thread10wrapperrunEPv>:

private:
    thread_t myHandle;
    static void wrapperrun(void *args)
    80002090:	ff010113          	addi	sp,sp,-16
    80002094:	00113423          	sd	ra,8(sp)
    80002098:	00813023          	sd	s0,0(sp)
    8000209c:	01010413          	addi	s0,sp,16
    {
        Thread *t=(Thread*)args;
        t->run();
    800020a0:	00053783          	ld	a5,0(a0)
    800020a4:	0107b783          	ld	a5,16(a5)
    800020a8:	000780e7          	jalr	a5
    }
    800020ac:	00813083          	ld	ra,8(sp)
    800020b0:	00013403          	ld	s0,0(sp)
    800020b4:	01010113          	addi	sp,sp,16
    800020b8:	00008067          	ret

00000000800020bc <_ZN14PeriodicThread18periodicActivationEv>:


class PeriodicThread : public Thread {
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    800020bc:	ff010113          	addi	sp,sp,-16
    800020c0:	00813423          	sd	s0,8(sp)
    800020c4:	01010413          	addi	s0,sp,16
    800020c8:	00813403          	ld	s0,8(sp)
    800020cc:	01010113          	addi	sp,sp,16
    800020d0:	00008067          	ret

00000000800020d4 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    800020d4:	ff010113          	addi	sp,sp,-16
    800020d8:	00113423          	sd	ra,8(sp)
    800020dc:	00813023          	sd	s0,0(sp)
    800020e0:	01010413          	addi	s0,sp,16
    800020e4:	00005797          	auipc	a5,0x5
    800020e8:	06478793          	addi	a5,a5,100 # 80007148 <_ZTV14PeriodicThread+0x10>
    800020ec:	00f53023          	sd	a5,0(a0)
    800020f0:	00000097          	auipc	ra,0x0
    800020f4:	b10080e7          	jalr	-1264(ra) # 80001c00 <_ZN6ThreadD1Ev>
    800020f8:	00813083          	ld	ra,8(sp)
    800020fc:	00013403          	ld	s0,0(sp)
    80002100:	01010113          	addi	sp,sp,16
    80002104:	00008067          	ret

0000000080002108 <_ZN14PeriodicThreadD0Ev>:
    80002108:	fe010113          	addi	sp,sp,-32
    8000210c:	00113c23          	sd	ra,24(sp)
    80002110:	00813823          	sd	s0,16(sp)
    80002114:	00913423          	sd	s1,8(sp)
    80002118:	02010413          	addi	s0,sp,32
    8000211c:	00050493          	mv	s1,a0
    80002120:	00005797          	auipc	a5,0x5
    80002124:	02878793          	addi	a5,a5,40 # 80007148 <_ZTV14PeriodicThread+0x10>
    80002128:	00f53023          	sd	a5,0(a0)
    8000212c:	00000097          	auipc	ra,0x0
    80002130:	ad4080e7          	jalr	-1324(ra) # 80001c00 <_ZN6ThreadD1Ev>
    80002134:	00048513          	mv	a0,s1
    80002138:	00000097          	auipc	ra,0x0
    8000213c:	b88080e7          	jalr	-1144(ra) # 80001cc0 <_ZdlPv>
    80002140:	01813083          	ld	ra,24(sp)
    80002144:	01013403          	ld	s0,16(sp)
    80002148:	00813483          	ld	s1,8(sp)
    8000214c:	02010113          	addi	sp,sp,32
    80002150:	00008067          	ret

0000000080002154 <_ZN9ThreadABI10popSppSpieEv>:
#include "../h/ThreadABI.hpp"
#include "../h/SemaphoreABI.hpp"
#include "../h/BufferPrinting.hpp"
#include "../test/printing.hpp"
//ovo treba za prekidna rutina yield da nasilno izadje iz prekidne rutine kad se prvi put nitr poziva
void ThreadABI::popSppSpie()     {
    80002154:	ff010113          	addi	sp,sp,-16
    80002158:	00813423          	sd	s0,8(sp)
    8000215c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra" );
    80002160:	14109073          	csrw	sepc,ra
    __asm__ volatile("csrc sip,0x02");
    80002164:	14417073          	csrci	sip,2
    __asm__ volatile ("sret");
    80002168:	10200073          	sret
}
    8000216c:	00813403          	ld	s0,8(sp)
    80002170:	01010113          	addi	sp,sp,16
    80002174:	00008067          	ret

0000000080002178 <handleSupervisorTrap>:

extern "C" void handleSupervisorTrap(){
    80002178:	f8010113          	addi	sp,sp,-128
    8000217c:	06113c23          	sd	ra,120(sp)
    80002180:	06813823          	sd	s0,112(sp)
    80002184:	06913423          	sd	s1,104(sp)
    80002188:	07213023          	sd	s2,96(sp)
    8000218c:	05313c23          	sd	s3,88(sp)
    80002190:	05413823          	sd	s4,80(sp)
    80002194:	05513423          	sd	s5,72(sp)
    80002198:	08010413          	addi	s0,sp,128
    // Array of arguments
    uint64 A[8];
    {
        asm volatile("sd a0, %0" : "=m"(A[0]));
    8000219c:	f8a43023          	sd	a0,-128(s0)
        asm volatile("sd a1, %0" : "=m"(A[1]));
    800021a0:	f8b43423          	sd	a1,-120(s0)
        asm volatile("sd a2, %0" : "=m"(A[2]));
    800021a4:	f8c43823          	sd	a2,-112(s0)
        asm volatile("sd a3, %0" : "=m"(A[3]));
    800021a8:	f8d43c23          	sd	a3,-104(s0)
        asm volatile("sd a4, %0" : "=m"(A[4]));
    800021ac:	fae43023          	sd	a4,-96(s0)
        asm volatile("sd a5, %0" : "=m"(A[5]));
    800021b0:	faf43423          	sd	a5,-88(s0)
        asm volatile("sd a6, %0" : "=m"(A[6]));
    800021b4:	fb043823          	sd	a6,-80(s0)
        asm volatile("sd a7, %0" : "=m"(A[7]));
    800021b8:	fb143c23          	sd	a7,-72(s0)
    }
    uint64* a = A;
    //poseban reg za cuvanje sp da umetnem a0
    void* retsp;
    asm volatile("csrr %0, sscratch" : "=r"(retsp));
    800021bc:	140029f3          	csrr	s3,sscratch
    //uzimam pc
    unsigned long int incrementedpc;
    __asm__ volatile("csrr %0,sepc": "=r" (incrementedpc));
    800021c0:	14102973          	csrr	s2,sepc
    //uzmi scause
    uint64 causevalue;
    uint8 a0val=a[0];
    800021c4:	f8044483          	lbu	s1,-128(s0)
    __asm__ volatile("csrr %0,scause" : "=r" (causevalue) );
    800021c8:	14202773          	csrr	a4,scause
    // ako je ecall
    if(causevalue==(0x09UL) ||causevalue==(0x08UL)){
    800021cc:	ff870693          	addi	a3,a4,-8
    800021d0:	00100793          	li	a5,1
    800021d4:	04d7f463          	bgeu	a5,a3,8000221c <handleSupervisorTrap+0xa4>
//            __asm__ volatile ("csrw sstatus, %0" : : "r"(sstatus));
//            __asm__ volatile ("csrw sepc, %0" : :  "r"(sepc));
//
//        }
    }
    else if (causevalue == 0x8000000000000009UL)
    800021d8:	fff00793          	li	a5,-1
    800021dc:	03f79793          	slli	a5,a5,0x3f
    800021e0:	00978793          	addi	a5,a5,9
    800021e4:	34f70c63          	beq	a4,a5,8000253c <handleSupervisorTrap+0x3c4>
            }

            plic_complete(0x0a);
        }
    }
    else if (causevalue == 0x8000000000000001UL)
    800021e8:	fff00793          	li	a5,-1
    800021ec:	03f79793          	slli	a5,a5,0x3f
    800021f0:	00178793          	addi	a5,a5,1
    800021f4:	3af70e63          	beq	a4,a5,800025b0 <handleSupervisorTrap+0x438>

    }

    //__asm__ volatile("csrc sip, 0x02");
//    __asm__ volatile("csrc sip, 0x0A");
}
    800021f8:	07813083          	ld	ra,120(sp)
    800021fc:	07013403          	ld	s0,112(sp)
    80002200:	06813483          	ld	s1,104(sp)
    80002204:	06013903          	ld	s2,96(sp)
    80002208:	05813983          	ld	s3,88(sp)
    8000220c:	05013a03          	ld	s4,80(sp)
    80002210:	04813a83          	ld	s5,72(sp)
    80002214:	08010113          	addi	sp,sp,128
    80002218:	00008067          	ret
        if(a0val==(0x01)){
    8000221c:	08f48663          	beq	s1,a5,800022a8 <handleSupervisorTrap+0x130>
        if(a0val==(0x02)){
    80002220:	00200793          	li	a5,2
    80002224:	0af48c63          	beq	s1,a5,800022dc <handleSupervisorTrap+0x164>
        if(a0val==(0x11)){
    80002228:	01100793          	li	a5,17
    8000222c:	0ef48663          	beq	s1,a5,80002318 <handleSupervisorTrap+0x1a0>
        if(a0val==(0x12)) {
    80002230:	01200793          	li	a5,18
    80002234:	12f48863          	beq	s1,a5,80002364 <handleSupervisorTrap+0x1ec>
        if(a0val==(0x13)) {
    80002238:	01300793          	li	a5,19
    8000223c:	14f48c63          	beq	s1,a5,80002394 <handleSupervisorTrap+0x21c>
        if(a0val==(0x14)){
    80002240:	01400793          	li	a5,20
    80002244:	16f48863          	beq	s1,a5,800023b4 <handleSupervisorTrap+0x23c>
        if(a0val==(0x21)) {
    80002248:	02100793          	li	a5,33
    8000224c:	1af48663          	beq	s1,a5,800023f8 <handleSupervisorTrap+0x280>
        if(a0val==(0x22)) {
    80002250:	02200793          	li	a5,34
    80002254:	1cf48863          	beq	s1,a5,80002424 <handleSupervisorTrap+0x2ac>
        if(a0val==(0x23)) {
    80002258:	02300793          	li	a5,35
    8000225c:	1ef48863          	beq	s1,a5,8000244c <handleSupervisorTrap+0x2d4>
        if(a0val==(0x24)) {
    80002260:	02400793          	li	a5,36
    80002264:	20f48863          	beq	s1,a5,80002474 <handleSupervisorTrap+0x2fc>
        if(a0val==(0x31)) {
    80002268:	03100793          	li	a5,49
    8000226c:	22f48863          	beq	s1,a5,8000249c <handleSupervisorTrap+0x324>
        if(a0val==(0x41)) {
    80002270:	04100793          	li	a5,65
    80002274:	24f48a63          	beq	s1,a5,800024c8 <handleSupervisorTrap+0x350>
        if(a0val==(0x42)) {
    80002278:	04200793          	li	a5,66
    8000227c:	26f48e63          	beq	s1,a5,800024f8 <handleSupervisorTrap+0x380>
        if(a0val==0xff)
    80002280:	0ff00793          	li	a5,255
    80002284:	2af48063          	beq	s1,a5,80002524 <handleSupervisorTrap+0x3ac>
        if(a0val==0xfe)
    80002288:	0fe00793          	li	a5,254
    8000228c:	f6f496e3          	bne	s1,a5,800021f8 <handleSupervisorTrap+0x80>
            asm volatile("csrr %0, sstatus" : "=r" (temp));
    80002290:	100027f3          	csrr	a5,sstatus
            temp |= 0x100;
    80002294:	1007e793          	ori	a5,a5,256
            asm volatile("csrw sstatus, %0" : : "r" (temp));
    80002298:	10079073          	csrw	sstatus,a5
            incrementedpc+=4;
    8000229c:	00490913          	addi	s2,s2,4
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));
    800022a0:	14191073          	csrw	sepc,s2
    800022a4:	f55ff06f          	j	800021f8 <handleSupervisorTrap+0x80>
            size_t bytes=a[1];
    800022a8:	f8843a83          	ld	s5,-120(s0)
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));
    800022ac:	10002a73          	csrr	s4,sstatus
            void * retformalloc=MemoryAllocator::getInstance().MemoryAlloc(bytes);
    800022b0:	00000097          	auipc	ra,0x0
    800022b4:	6b4080e7          	jalr	1716(ra) # 80002964 <_ZN15MemoryAllocator11getInstanceEv>
    800022b8:	000a8593          	mv	a1,s5
    800022bc:	00000097          	auipc	ra,0x0
    800022c0:	704080e7          	jalr	1796(ra) # 800029c0 <_ZN15MemoryAllocator11MemoryAllocEm>
            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));
    800022c4:	100a1073          	csrw	sstatus,s4
            __asm__ volatile("mv a0, %0" : : "r" ( retformalloc));
    800022c8:	00050513          	mv	a0,a0
            __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));
    800022cc:	04a9b823          	sd	a0,80(s3)
            incrementedpc+=4;
    800022d0:	00490913          	addi	s2,s2,4
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));
    800022d4:	14191073          	csrw	sepc,s2
    800022d8:	f49ff06f          	j	80002220 <handleSupervisorTrap+0xa8>
            incrementedpc+=4;
    800022dc:	00490913          	addi	s2,s2,4
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));
    800022e0:	14191073          	csrw	sepc,s2
            void* handler= reinterpret_cast<void *>(a[1]);
    800022e4:	f8843a83          	ld	s5,-120(s0)
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));
    800022e8:	10002a73          	csrr	s4,sstatus
            MemoryAllocator::getInstance().MemoryFree(handler);
    800022ec:	00000097          	auipc	ra,0x0
    800022f0:	678080e7          	jalr	1656(ra) # 80002964 <_ZN15MemoryAllocator11getInstanceEv>
    800022f4:	000a8593          	mv	a1,s5
    800022f8:	00000097          	auipc	ra,0x0
    800022fc:	7d0080e7          	jalr	2000(ra) # 80002ac8 <_ZN15MemoryAllocator10MemoryFreeEPv>
            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));
    80002300:	100a1073          	csrw	sstatus,s4
            __asm__ volatile("mv a0, %0" : : "r" (returngflag));
    80002304:	006977b7          	lui	a5,0x697
    80002308:	96978793          	addi	a5,a5,-1687 # 696969 <_entry-0x7f969697>
    8000230c:	00078513          	mv	a0,a5
            __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));
    80002310:	04a9b823          	sd	a0,80(s3)
    80002314:	f15ff06f          	j	80002228 <handleSupervisorTrap+0xb0>
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));
    80002318:	10002a73          	csrr	s4,sstatus
            if(ThreadABI::thread_create(handle,fun,arg,stack)<0){
    8000231c:	fa043683          	ld	a3,-96(s0)
    80002320:	f9843603          	ld	a2,-104(s0)
    80002324:	f9043583          	ld	a1,-112(s0)
    80002328:	f8843503          	ld	a0,-120(s0)
    8000232c:	fffff097          	auipc	ra,0xfffff
    80002330:	3b0080e7          	jalr	944(ra) # 800016dc <_ZN9ThreadABI13thread_createEPPS_PFvPvES2_S2_>
    80002334:	02054063          	bltz	a0,80002354 <handleSupervisorTrap+0x1dc>
            __asm__ volatile("mv a0, %0" : : "r" (returngflag));
    80002338:	00000793          	li	a5,0
    8000233c:	00078513          	mv	a0,a5
            __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));
    80002340:	04a9b823          	sd	a0,80(s3)
            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));
    80002344:	100a1073          	csrw	sstatus,s4
            incrementedpc+=4;
    80002348:	00490913          	addi	s2,s2,4
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));
    8000234c:	14191073          	csrw	sepc,s2
    80002350:	ee1ff06f          	j	80002230 <handleSupervisorTrap+0xb8>
                __asm__ volatile("mv a0, %0" : : "r" (returngflag));
    80002354:	fff00793          	li	a5,-1
    80002358:	00078513          	mv	a0,a5
                __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));
    8000235c:	04a9b823          	sd	a0,80(s3)
    80002360:	fd9ff06f          	j	80002338 <handleSupervisorTrap+0x1c0>
            ThreadABI::running->setState(ThreadABI::FINISHED);
    80002364:	00005797          	auipc	a5,0x5
    80002368:	e947b783          	ld	a5,-364(a5) # 800071f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000236c:	0007b783          	ld	a5,0(a5)
    void setState(State value) { state = value; }
    80002370:	00400713          	li	a4,4
    80002374:	00e7a623          	sw	a4,12(a5)
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));
    80002378:	10002a73          	csrr	s4,sstatus
            ThreadABI::yield();
    8000237c:	fffff097          	auipc	ra,0xfffff
    80002380:	2cc080e7          	jalr	716(ra) # 80001648 <_ZN9ThreadABI5yieldEv>
            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));
    80002384:	100a1073          	csrw	sstatus,s4
            incrementedpc+=4;
    80002388:	00490913          	addi	s2,s2,4
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));
    8000238c:	14191073          	csrw	sepc,s2
    80002390:	ea9ff06f          	j	80002238 <handleSupervisorTrap+0xc0>
            asm volatile("csrr %0, sepc" : "=r"(savedSEPC));
    80002394:	14102a73          	csrr	s4,sepc
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));
    80002398:	10002af3          	csrr	s5,sstatus
            ThreadABI::yield();
    8000239c:	fffff097          	auipc	ra,0xfffff
    800023a0:	2ac080e7          	jalr	684(ra) # 80001648 <_ZN9ThreadABI5yieldEv>
            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));
    800023a4:	100a9073          	csrw	sstatus,s5
            savedSEPC+=4;
    800023a8:	004a0a13          	addi	s4,s4,4
            asm volatile("csrw sepc, %0" : : "r"(savedSEPC));
    800023ac:	141a1073          	csrw	sepc,s4
    800023b0:	e91ff06f          	j	80002240 <handleSupervisorTrap+0xc8>
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));
    800023b4:	10002af3          	csrr	s5,sstatus
            ThreadABI *handle= reinterpret_cast<ThreadABI *>(a[1]);
    800023b8:	f8843a03          	ld	s4,-120(s0)
            if(handle!= nullptr){
    800023bc:	020a1063          	bnez	s4,800023dc <handleSupervisorTrap+0x264>
            returngflag= -1;
    800023c0:	fff00793          	li	a5,-1
            __asm__ volatile("mv a0, %0" : : "r" (returngflag));
    800023c4:	00078513          	mv	a0,a5
            __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));
    800023c8:	04a9b823          	sd	a0,80(s3)
            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));
    800023cc:	100a9073          	csrw	sstatus,s5
            incrementedpc+=4;
    800023d0:	00490913          	addi	s2,s2,4
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));
    800023d4:	14191073          	csrw	sepc,s2
    800023d8:	e71ff06f          	j	80002248 <handleSupervisorTrap+0xd0>
                SchedulerABI::getInstanceScheduler().put(handle);
    800023dc:	00001097          	auipc	ra,0x1
    800023e0:	ab8080e7          	jalr	-1352(ra) # 80002e94 <_ZN12SchedulerABI20getInstanceSchedulerEv>
    800023e4:	000a0593          	mv	a1,s4
    800023e8:	00001097          	auipc	ra,0x1
    800023ec:	9b4080e7          	jalr	-1612(ra) # 80002d9c <_ZN12SchedulerABI3putEP9ThreadABI>
                returngflag= 1;
    800023f0:	00100793          	li	a5,1
    800023f4:	fd1ff06f          	j	800023c4 <handleSupervisorTrap+0x24c>
            int val=a[1];
    800023f8:	f8842583          	lw	a1,-120(s0)
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));
    800023fc:	10002a73          	csrr	s4,sstatus
            int retvalfromsem=SemaphoreABI::semopenABI(sem, val);
    80002400:	f9043503          	ld	a0,-112(s0)
    80002404:	00000097          	auipc	ra,0x0
    80002408:	24c080e7          	jalr	588(ra) # 80002650 <_ZN12SemaphoreABI10semopenABIEPPS_i>
            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));
    8000240c:	100a1073          	csrw	sstatus,s4
            __asm__ volatile("mv a0, %0" : : "r" ( retvalfromsem));
    80002410:	00050513          	mv	a0,a0
            __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));
    80002414:	04a9b823          	sd	a0,80(s3)
            incrementedpc+=4;
    80002418:	00490913          	addi	s2,s2,4
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));
    8000241c:	14191073          	csrw	sepc,s2
    80002420:	e31ff06f          	j	80002250 <handleSupervisorTrap+0xd8>
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));
    80002424:	10002a73          	csrr	s4,sstatus
            int retvalfromsem=SemaphoreABI::semcloseABI(sem);
    80002428:	f8843503          	ld	a0,-120(s0)
    8000242c:	00000097          	auipc	ra,0x0
    80002430:	434080e7          	jalr	1076(ra) # 80002860 <_ZN12SemaphoreABI11semcloseABIEPS_>
            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));
    80002434:	100a1073          	csrw	sstatus,s4
            __asm__ volatile("mv a0, %0" : : "r" ( retvalfromsem));
    80002438:	00050513          	mv	a0,a0
            __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));
    8000243c:	04a9b823          	sd	a0,80(s3)
            incrementedpc+=4;
    80002440:	00490913          	addi	s2,s2,4
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));
    80002444:	14191073          	csrw	sepc,s2
    80002448:	e11ff06f          	j	80002258 <handleSupervisorTrap+0xe0>
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));
    8000244c:	10002a73          	csrr	s4,sstatus
            int retvalfromsem=SemaphoreABI::semwaitABI(sem);
    80002450:	f8843503          	ld	a0,-120(s0)
    80002454:	00000097          	auipc	ra,0x0
    80002458:	268080e7          	jalr	616(ra) # 800026bc <_ZN12SemaphoreABI10semwaitABIEPS_>
            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));
    8000245c:	100a1073          	csrw	sstatus,s4
            __asm__ volatile("mv a0, %0" : : "r" ( retvalfromsem));
    80002460:	00050513          	mv	a0,a0
            __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));
    80002464:	04a9b823          	sd	a0,80(s3)
            incrementedpc+=4;
    80002468:	00490913          	addi	s2,s2,4
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));
    8000246c:	14191073          	csrw	sepc,s2
    80002470:	df1ff06f          	j	80002260 <handleSupervisorTrap+0xe8>
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));
    80002474:	10002a73          	csrr	s4,sstatus
            uint64 retvalfromsem=SemaphoreABI::semsignalABI(sem);
    80002478:	f8843503          	ld	a0,-120(s0)
    8000247c:	00000097          	auipc	ra,0x0
    80002480:	33c080e7          	jalr	828(ra) # 800027b8 <_ZN12SemaphoreABI12semsignalABIEPS_>
            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));
    80002484:	100a1073          	csrw	sstatus,s4
            __asm__ volatile("mv a0, %0" : : "r" ( retvalfromsem));
    80002488:	00050513          	mv	a0,a0
            __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));
    8000248c:	04a9b823          	sd	a0,80(s3)
            incrementedpc+=4;
    80002490:	00490913          	addi	s2,s2,4
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));
    80002494:	14191073          	csrw	sepc,s2
    80002498:	dd1ff06f          	j	80002268 <handleSupervisorTrap+0xf0>
            time_t time=a[1];
    8000249c:	f8843a83          	ld	s5,-120(s0)
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));
    800024a0:	10002a73          	csrr	s4,sstatus
            SchedulerABI::getInstanceScheduler().sleep(time);
    800024a4:	00001097          	auipc	ra,0x1
    800024a8:	9f0080e7          	jalr	-1552(ra) # 80002e94 <_ZN12SchedulerABI20getInstanceSchedulerEv>
    800024ac:	000a8513          	mv	a0,s5
    800024b0:	00001097          	auipc	ra,0x1
    800024b4:	964080e7          	jalr	-1692(ra) # 80002e14 <_ZN12SchedulerABI5sleepEm>
            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));
    800024b8:	100a1073          	csrw	sstatus,s4
            incrementedpc+=4;
    800024bc:	00490913          	addi	s2,s2,4
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));
    800024c0:	14191073          	csrw	sepc,s2
    800024c4:	dadff06f          	j	80002270 <handleSupervisorTrap+0xf8>
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));
    800024c8:	10002a73          	csrr	s4,sstatus
            char ret=BufferPrinting::bout->get();
    800024cc:	00005797          	auipc	a5,0x5
    800024d0:	d3c7b783          	ld	a5,-708(a5) # 80007208 <_GLOBAL_OFFSET_TABLE_+0x40>
    800024d4:	0007b503          	ld	a0,0(a5)
    800024d8:	00000097          	auipc	ra,0x0
    800024dc:	6b4080e7          	jalr	1716(ra) # 80002b8c <_ZN14BufferPrinting3getEv>
            __asm__ volatile("mv a0, %0" : : "r" ( ret));
    800024e0:	00050513          	mv	a0,a0
            __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));
    800024e4:	04a9b823          	sd	a0,80(s3)
            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));
    800024e8:	100a1073          	csrw	sstatus,s4
            incrementedpc+=4;
    800024ec:	00490913          	addi	s2,s2,4
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));
    800024f0:	14191073          	csrw	sepc,s2
    800024f4:	d85ff06f          	j	80002278 <handleSupervisorTrap+0x100>
            char c =a[1];
    800024f8:	f8844583          	lbu	a1,-120(s0)
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));
    800024fc:	100029f3          	csrr	s3,sstatus
            BufferPrinting::bin->put(c);
    80002500:	00005797          	auipc	a5,0x5
    80002504:	d387b783          	ld	a5,-712(a5) # 80007238 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002508:	0007b503          	ld	a0,0(a5)
    8000250c:	00000097          	auipc	ra,0x0
    80002510:	6f0080e7          	jalr	1776(ra) # 80002bfc <_ZN14BufferPrinting3putEc>
            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));
    80002514:	10099073          	csrw	sstatus,s3
            incrementedpc+=4;
    80002518:	00490913          	addi	s2,s2,4
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));
    8000251c:	14191073          	csrw	sepc,s2
    80002520:	d61ff06f          	j	80002280 <handleSupervisorTrap+0x108>
            asm volatile("csrr %0, sstatus" : "=r" (temp));
    80002524:	100027f3          	csrr	a5,sstatus
            temp &= ~0x100;
    80002528:	eff7f793          	andi	a5,a5,-257
            asm volatile("csrw sstatus, %0" : : "r" (temp));
    8000252c:	10079073          	csrw	sstatus,a5
            incrementedpc+=4;
    80002530:	00490913          	addi	s2,s2,4
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));
    80002534:	14191073          	csrw	sepc,s2
    80002538:	d51ff06f          	j	80002288 <handleSupervisorTrap+0x110>
        if(plic_claim()==0x0a){
    8000253c:	00002097          	auipc	ra,0x2
    80002540:	888080e7          	jalr	-1912(ra) # 80003dc4 <plic_claim>
    80002544:	00a00793          	li	a5,10
    80002548:	caf518e3          	bne	a0,a5,800021f8 <handleSupervisorTrap+0x80>
            uint8 *num=(uint8*)CONSOLE_STATUS;
    8000254c:	00005797          	auipc	a5,0x5
    80002550:	c8c7b783          	ld	a5,-884(a5) # 800071d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002554:	0007b483          	ld	s1,0(a5)
            if (*num & CONSOLE_RX_STATUS_BIT){
    80002558:	0004c783          	lbu	a5,0(s1)
    8000255c:	0017f793          	andi	a5,a5,1
    80002560:	02079063          	bnez	a5,80002580 <handleSupervisorTrap+0x408>
            if (*num & CONSOLE_TX_STATUS_BIT){
    80002564:	0004c783          	lbu	a5,0(s1)
    80002568:	0207f793          	andi	a5,a5,32
    8000256c:	02079663          	bnez	a5,80002598 <handleSupervisorTrap+0x420>
            plic_complete(0x0a);
    80002570:	00a00513          	li	a0,10
    80002574:	00002097          	auipc	ra,0x2
    80002578:	888080e7          	jalr	-1912(ra) # 80003dfc <plic_complete>
    8000257c:	c7dff06f          	j	800021f8 <handleSupervisorTrap+0x80>
                SemaphoreABI::semsignalABI(BufferPrinting::out);
    80002580:	00005797          	auipc	a5,0x5
    80002584:	c987b783          	ld	a5,-872(a5) # 80007218 <_GLOBAL_OFFSET_TABLE_+0x50>
    80002588:	0007b503          	ld	a0,0(a5)
    8000258c:	00000097          	auipc	ra,0x0
    80002590:	22c080e7          	jalr	556(ra) # 800027b8 <_ZN12SemaphoreABI12semsignalABIEPS_>
    80002594:	fd1ff06f          	j	80002564 <handleSupervisorTrap+0x3ec>
               SemaphoreABI::semsignalABI(BufferPrinting::in);
    80002598:	00005797          	auipc	a5,0x5
    8000259c:	ca87b783          	ld	a5,-856(a5) # 80007240 <_GLOBAL_OFFSET_TABLE_+0x78>
    800025a0:	0007b503          	ld	a0,0(a5)
    800025a4:	00000097          	auipc	ra,0x0
    800025a8:	214080e7          	jalr	532(ra) # 800027b8 <_ZN12SemaphoreABI12semsignalABIEPS_>
    800025ac:	fc5ff06f          	j	80002570 <handleSupervisorTrap+0x3f8>
        asm volatile("csrc sip,0x02");
    800025b0:	14417073          	csrci	sip,2
        asm volatile("csrr %0, sepc" : "=r"(savedSEPC));
    800025b4:	14102973          	csrr	s2,sepc
        asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));
    800025b8:	100029f3          	csrr	s3,sstatus
        ThreadABI *tmp=SchedulerABI::headsleep;
    800025bc:	00005797          	auipc	a5,0x5
    800025c0:	c2c7b783          	ld	a5,-980(a5) # 800071e8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800025c4:	0007b483          	ld	s1,0(a5)
    800025c8:	0300006f          	j	800025f8 <handleSupervisorTrap+0x480>
                SchedulerABI::headsleep=SchedulerABI::headsleep->next;
    800025cc:	00005797          	auipc	a5,0x5
    800025d0:	c1c7b783          	ld	a5,-996(a5) # 800071e8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800025d4:	0007b703          	ld	a4,0(a5)
    800025d8:	00073703          	ld	a4,0(a4)
    800025dc:	00e7b023          	sd	a4,0(a5)
                SchedulerABI::getInstanceScheduler().put(tmp);
    800025e0:	00001097          	auipc	ra,0x1
    800025e4:	8b4080e7          	jalr	-1868(ra) # 80002e94 <_ZN12SchedulerABI20getInstanceSchedulerEv>
    800025e8:	00048593          	mv	a1,s1
    800025ec:	00000097          	auipc	ra,0x0
    800025f0:	7b0080e7          	jalr	1968(ra) # 80002d9c <_ZN12SchedulerABI3putEP9ThreadABI>
            tmp=tmp->next;
    800025f4:	0004b483          	ld	s1,0(s1)
        while (tmp){
    800025f8:	00048c63          	beqz	s1,80002610 <handleSupervisorTrap+0x498>
            if(tmp->decrementsleep()==0){
    800025fc:	00048513          	mv	a0,s1
    80002600:	fffff097          	auipc	ra,0xfffff
    80002604:	220080e7          	jalr	544(ra) # 80001820 <_ZN9ThreadABI14decrementsleepEv>
    80002608:	fe0516e3          	bnez	a0,800025f4 <handleSupervisorTrap+0x47c>
    8000260c:	fc1ff06f          	j	800025cc <handleSupervisorTrap+0x454>
        if(ThreadABI::running->timeSliceCounterDecrement()==0){
    80002610:	00005797          	auipc	a5,0x5
    80002614:	be87b783          	ld	a5,-1048(a5) # 800071f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002618:	0007b703          	ld	a4,0(a5)
     int timeSliceCounterDecrement(){return --timeSliceCounter;}
    8000261c:	04073783          	ld	a5,64(a4)
    80002620:	fff78793          	addi	a5,a5,-1
    80002624:	04f73023          	sd	a5,64(a4)
    80002628:	0007879b          	sext.w	a5,a5
    8000262c:	00078863          	beqz	a5,8000263c <handleSupervisorTrap+0x4c4>
        asm volatile("csrw sstatus, %0" : : "r"(savesstatus));
    80002630:	10099073          	csrw	sstatus,s3
        asm volatile("csrw sepc, %0" : : "r"(savedSEPC));
    80002634:	14191073          	csrw	sepc,s2
}
    80002638:	bc1ff06f          	j	800021f8 <handleSupervisorTrap+0x80>
     void timeSliceCounterSet(){timeSliceCounter=DEFAULT_TIME_SLICE;}
    8000263c:	00200793          	li	a5,2
    80002640:	04f73023          	sd	a5,64(a4)
            ThreadABI::yield();
    80002644:	fffff097          	auipc	ra,0xfffff
    80002648:	004080e7          	jalr	4(ra) # 80001648 <_ZN9ThreadABI5yieldEv>
    8000264c:	fe5ff06f          	j	80002630 <handleSupervisorTrap+0x4b8>

0000000080002650 <_ZN12SemaphoreABI10semopenABIEPPS_i>:
#include "../h/SemaphoreABI.hpp"
#include "../h/SchedulerABI.hpp"
#include "../h/ThreadABI.hpp"
#include "../lib/console.h"

int SemaphoreABI::semopenABI(SemaphoreABI **handler, int val){
    80002650:	fe010113          	addi	sp,sp,-32
    80002654:	00113c23          	sd	ra,24(sp)
    80002658:	00813823          	sd	s0,16(sp)
    8000265c:	00913423          	sd	s1,8(sp)
    80002660:	01213023          	sd	s2,0(sp)
    80002664:	02010413          	addi	s0,sp,32
    80002668:	00050493          	mv	s1,a0
    8000266c:	00058913          	mv	s2,a1
private:
    SemaphoreABI(int valu): value(valu){}
        ThreadABI* headblocked= nullptr;
        ThreadABI* tailblocked= nullptr;
public:
    MEM_ALLOC;
    80002670:	00000097          	auipc	ra,0x0
    80002674:	2f4080e7          	jalr	756(ra) # 80002964 <_ZN15MemoryAllocator11getInstanceEv>
    80002678:	04000593          	li	a1,64
    8000267c:	00000097          	auipc	ra,0x0
    80002680:	344080e7          	jalr	836(ra) # 800029c0 <_ZN15MemoryAllocator11MemoryAllocEm>
    SemaphoreABI(int valu): value(valu){}
    80002684:	01252023          	sw	s2,0(a0)
    80002688:	00053423          	sd	zero,8(a0)
    8000268c:	00053823          	sd	zero,16(a0)

        *handler=new SemaphoreABI(val);
    80002690:	00a4b023          	sd	a0,0(s1)

    if(*handler == nullptr)return -2;
    80002694:	02050063          	beqz	a0,800026b4 <_ZN12SemaphoreABI10semopenABIEPPS_i+0x64>
    else return 0;
    80002698:	00000513          	li	a0,0
}
    8000269c:	01813083          	ld	ra,24(sp)
    800026a0:	01013403          	ld	s0,16(sp)
    800026a4:	00813483          	ld	s1,8(sp)
    800026a8:	00013903          	ld	s2,0(sp)
    800026ac:	02010113          	addi	sp,sp,32
    800026b0:	00008067          	ret
    if(*handler == nullptr)return -2;
    800026b4:	ffe00513          	li	a0,-2
    800026b8:	fe5ff06f          	j	8000269c <_ZN12SemaphoreABI10semopenABIEPPS_i+0x4c>

00000000800026bc <_ZN12SemaphoreABI10semwaitABIEPS_>:
    }
    MemoryAllocator::getInstance().MemoryFree(handler);
    return 0;
}
int SemaphoreABI::semwaitABI(SemaphoreABI *id){
    if(ThreadABI::running==ThreadABI::idle)return -1;
    800026bc:	00005797          	auipc	a5,0x5
    800026c0:	b3c7b783          	ld	a5,-1220(a5) # 800071f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800026c4:	0007b783          	ld	a5,0(a5)
    800026c8:	00005717          	auipc	a4,0x5
    800026cc:	b5873703          	ld	a4,-1192(a4) # 80007220 <_GLOBAL_OFFSET_TABLE_+0x58>
    800026d0:	00073703          	ld	a4,0(a4)
    800026d4:	0ce78a63          	beq	a5,a4,800027a8 <_ZN12SemaphoreABI10semwaitABIEPS_+0xec>
    if(ThreadABI::running->errorsem)return -3;
    800026d8:	0087c783          	lbu	a5,8(a5)
    800026dc:	0c079a63          	bnez	a5,800027b0 <_ZN12SemaphoreABI10semwaitABIEPS_+0xf4>
    if(--id->value<0) {
    800026e0:	00052783          	lw	a5,0(a0)
    800026e4:	fff7879b          	addiw	a5,a5,-1
    800026e8:	00f52023          	sw	a5,0(a0)
    800026ec:	02079713          	slli	a4,a5,0x20
    800026f0:	00074663          	bltz	a4,800026fc <_ZN12SemaphoreABI10semwaitABIEPS_+0x40>
        id->tailblocked=id->tailblocked->next;
        ThreadABI::yield();
        if(ThreadABI::running->errorsem)return -1;
        return 1;
    }
    return 0;
    800026f4:	00000513          	li	a0,0
}
    800026f8:	00008067          	ret
int SemaphoreABI::semwaitABI(SemaphoreABI *id){
    800026fc:	ff010113          	addi	sp,sp,-16
    80002700:	00113423          	sd	ra,8(sp)
    80002704:	00813023          	sd	s0,0(sp)
    80002708:	01010413          	addi	s0,sp,16
        ThreadABI::running->setState(ThreadABI::BLOCKED);
    8000270c:	00005797          	auipc	a5,0x5
    80002710:	aec7b783          	ld	a5,-1300(a5) # 800071f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002714:	0007b783          	ld	a5,0(a5)
    void setState(State value) { state = value; }
    80002718:	00300713          	li	a4,3
    8000271c:	00e7a623          	sw	a4,12(a5)
        if (id->headblocked == nullptr) {
    80002720:	00853703          	ld	a4,8(a0)
    80002724:	04070463          	beqz	a4,8000276c <_ZN12SemaphoreABI10semwaitABIEPS_+0xb0>
        id->tailblocked->next=ThreadABI::running;
    80002728:	01053703          	ld	a4,16(a0)
    8000272c:	00f73023          	sd	a5,0(a4)
        id->tailblocked=id->tailblocked->next;
    80002730:	01053783          	ld	a5,16(a0)
    80002734:	0007b783          	ld	a5,0(a5)
    80002738:	00f53823          	sd	a5,16(a0)
        ThreadABI::yield();
    8000273c:	fffff097          	auipc	ra,0xfffff
    80002740:	f0c080e7          	jalr	-244(ra) # 80001648 <_ZN9ThreadABI5yieldEv>
        if(ThreadABI::running->errorsem)return -1;
    80002744:	00005797          	auipc	a5,0x5
    80002748:	ab47b783          	ld	a5,-1356(a5) # 800071f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000274c:	0007b783          	ld	a5,0(a5)
    80002750:	0087c783          	lbu	a5,8(a5)
    80002754:	04079663          	bnez	a5,800027a0 <_ZN12SemaphoreABI10semwaitABIEPS_+0xe4>
        return 1;
    80002758:	00100513          	li	a0,1
}
    8000275c:	00813083          	ld	ra,8(sp)
    80002760:	00013403          	ld	s0,0(sp)
    80002764:	01010113          	addi	sp,sp,16
    80002768:	00008067          	ret
            id->headblocked = ThreadABI::running;
    8000276c:	00f53423          	sd	a5,8(a0)
            id->tailblocked = ThreadABI::running;
    80002770:	00f53823          	sd	a5,16(a0)
            ThreadABI::yield();
    80002774:	fffff097          	auipc	ra,0xfffff
    80002778:	ed4080e7          	jalr	-300(ra) # 80001648 <_ZN9ThreadABI5yieldEv>
            if(ThreadABI::running->errorsem){
    8000277c:	00005797          	auipc	a5,0x5
    80002780:	a7c7b783          	ld	a5,-1412(a5) # 800071f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002784:	0007b783          	ld	a5,0(a5)
    80002788:	0087c783          	lbu	a5,8(a5)
    8000278c:	00079663          	bnez	a5,80002798 <_ZN12SemaphoreABI10semwaitABIEPS_+0xdc>
            return 1;
    80002790:	00100513          	li	a0,1
    80002794:	fc9ff06f          	j	8000275c <_ZN12SemaphoreABI10semwaitABIEPS_+0xa0>
                return -1;
    80002798:	fff00513          	li	a0,-1
    8000279c:	fc1ff06f          	j	8000275c <_ZN12SemaphoreABI10semwaitABIEPS_+0xa0>
        if(ThreadABI::running->errorsem)return -1;
    800027a0:	fff00513          	li	a0,-1
    800027a4:	fb9ff06f          	j	8000275c <_ZN12SemaphoreABI10semwaitABIEPS_+0xa0>
    if(ThreadABI::running==ThreadABI::idle)return -1;
    800027a8:	fff00513          	li	a0,-1
    800027ac:	00008067          	ret
    if(ThreadABI::running->errorsem)return -3;
    800027b0:	ffd00513          	li	a0,-3
    800027b4:	00008067          	ret

00000000800027b8 <_ZN12SemaphoreABI12semsignalABIEPS_>:
int SemaphoreABI::semsignalABI(SemaphoreABI *id){
    if(++id->value<=0){
    800027b8:	00052783          	lw	a5,0(a0)
    800027bc:	0017879b          	addiw	a5,a5,1
    800027c0:	0007871b          	sext.w	a4,a5
    800027c4:	00f52023          	sw	a5,0(a0)
    800027c8:	00e05663          	blez	a4,800027d4 <_ZN12SemaphoreABI12semsignalABIEPS_+0x1c>
//    ThreadABI::running=tmp;
        tmp->next= nullptr;
        SchedulerABI::getInstanceScheduler().put(tmp);
        return 1;
    }
    return 0;
    800027cc:	00000513          	li	a0,0
}
    800027d0:	00008067          	ret
int SemaphoreABI::semsignalABI(SemaphoreABI *id){
    800027d4:	fe010113          	addi	sp,sp,-32
    800027d8:	00113c23          	sd	ra,24(sp)
    800027dc:	00813823          	sd	s0,16(sp)
    800027e0:	00913423          	sd	s1,8(sp)
    800027e4:	02010413          	addi	s0,sp,32
        if (id->headblocked == nullptr)return 0;
    800027e8:	00853483          	ld	s1,8(a0)
    800027ec:	06048663          	beqz	s1,80002858 <_ZN12SemaphoreABI12semsignalABIEPS_+0xa0>
        if (id->tailblocked == id->headblocked) {
    800027f0:	01053783          	ld	a5,16(a0)
    800027f4:	02f48e63          	beq	s1,a5,80002830 <_ZN12SemaphoreABI12semsignalABIEPS_+0x78>
        id->headblocked = id->headblocked->next;
    800027f8:	0004b783          	ld	a5,0(s1)
    800027fc:	00f53423          	sd	a5,8(a0)
        tmp->next= nullptr;
    80002800:	0004b023          	sd	zero,0(s1)
        SchedulerABI::getInstanceScheduler().put(tmp);
    80002804:	00000097          	auipc	ra,0x0
    80002808:	690080e7          	jalr	1680(ra) # 80002e94 <_ZN12SchedulerABI20getInstanceSchedulerEv>
    8000280c:	00048593          	mv	a1,s1
    80002810:	00000097          	auipc	ra,0x0
    80002814:	58c080e7          	jalr	1420(ra) # 80002d9c <_ZN12SchedulerABI3putEP9ThreadABI>
        return 1;
    80002818:	00100513          	li	a0,1
}
    8000281c:	01813083          	ld	ra,24(sp)
    80002820:	01013403          	ld	s0,16(sp)
    80002824:	00813483          	ld	s1,8(sp)
    80002828:	02010113          	addi	sp,sp,32
    8000282c:	00008067          	ret
            id->headblocked = nullptr;
    80002830:	00053423          	sd	zero,8(a0)
            id->tailblocked = nullptr;
    80002834:	00053823          	sd	zero,16(a0)
            tmp->next= nullptr;
    80002838:	0004b023          	sd	zero,0(s1)
            SchedulerABI::getInstanceScheduler().put(tmp);
    8000283c:	00000097          	auipc	ra,0x0
    80002840:	658080e7          	jalr	1624(ra) # 80002e94 <_ZN12SchedulerABI20getInstanceSchedulerEv>
    80002844:	00048593          	mv	a1,s1
    80002848:	00000097          	auipc	ra,0x0
    8000284c:	554080e7          	jalr	1364(ra) # 80002d9c <_ZN12SchedulerABI3putEP9ThreadABI>
            return 1;
    80002850:	00100513          	li	a0,1
    80002854:	fc9ff06f          	j	8000281c <_ZN12SemaphoreABI12semsignalABIEPS_+0x64>
        if (id->headblocked == nullptr)return 0;
    80002858:	00000513          	li	a0,0
    8000285c:	fc1ff06f          	j	8000281c <_ZN12SemaphoreABI12semsignalABIEPS_+0x64>

0000000080002860 <_ZN12SemaphoreABI11semcloseABIEPS_>:
    if(handler == nullptr)return -1;
    80002860:	06050863          	beqz	a0,800028d0 <_ZN12SemaphoreABI11semcloseABIEPS_+0x70>
int SemaphoreABI::semcloseABI(SemaphoreABI *handler){
    80002864:	fe010113          	addi	sp,sp,-32
    80002868:	00113c23          	sd	ra,24(sp)
    8000286c:	00813823          	sd	s0,16(sp)
    80002870:	00913423          	sd	s1,8(sp)
    80002874:	02010413          	addi	s0,sp,32
    80002878:	00050493          	mv	s1,a0
    if(handler->headblocked!= nullptr){
    8000287c:	00853783          	ld	a5,8(a0)
    80002880:	02078263          	beqz	a5,800028a4 <_ZN12SemaphoreABI11semcloseABIEPS_+0x44>
        while(handler->headblocked){
    80002884:	0084b783          	ld	a5,8(s1)
    80002888:	00078e63          	beqz	a5,800028a4 <_ZN12SemaphoreABI11semcloseABIEPS_+0x44>
            handler->headblocked->errorsem= true;
    8000288c:	00100713          	li	a4,1
    80002890:	00e78423          	sb	a4,8(a5)
            semsignalABI(handler);
    80002894:	00048513          	mv	a0,s1
    80002898:	00000097          	auipc	ra,0x0
    8000289c:	f20080e7          	jalr	-224(ra) # 800027b8 <_ZN12SemaphoreABI12semsignalABIEPS_>
        while(handler->headblocked){
    800028a0:	fe5ff06f          	j	80002884 <_ZN12SemaphoreABI11semcloseABIEPS_+0x24>
    MemoryAllocator::getInstance().MemoryFree(handler);
    800028a4:	00000097          	auipc	ra,0x0
    800028a8:	0c0080e7          	jalr	192(ra) # 80002964 <_ZN15MemoryAllocator11getInstanceEv>
    800028ac:	00048593          	mv	a1,s1
    800028b0:	00000097          	auipc	ra,0x0
    800028b4:	218080e7          	jalr	536(ra) # 80002ac8 <_ZN15MemoryAllocator10MemoryFreeEPv>
    return 0;
    800028b8:	00000513          	li	a0,0
}
    800028bc:	01813083          	ld	ra,24(sp)
    800028c0:	01013403          	ld	s0,16(sp)
    800028c4:	00813483          	ld	s1,8(sp)
    800028c8:	02010113          	addi	sp,sp,32
    800028cc:	00008067          	ret
    if(handler == nullptr)return -1;
    800028d0:	fff00513          	li	a0,-1
}
    800028d4:	00008067          	ret

00000000800028d8 <_ZNK12SemaphoreABI8getValueEv>:

int SemaphoreABI::getValue() const {
    800028d8:	ff010113          	addi	sp,sp,-16
    800028dc:	00813423          	sd	s0,8(sp)
    800028e0:	01010413          	addi	s0,sp,16
    return value;
}
    800028e4:	00052503          	lw	a0,0(a0)
    800028e8:	00813403          	ld	s0,8(sp)
    800028ec:	01010113          	addi	sp,sp,16
    800028f0:	00008067          	ret

00000000800028f4 <_ZN12SemaphoreABI8setValueEi>:

void SemaphoreABI::setValue(int value) {
    800028f4:	ff010113          	addi	sp,sp,-16
    800028f8:	00813423          	sd	s0,8(sp)
    800028fc:	01010413          	addi	s0,sp,16
    SemaphoreABI::value = value;
    80002900:	00b52023          	sw	a1,0(a0)
}
    80002904:	00813403          	ld	s0,8(sp)
    80002908:	01010113          	addi	sp,sp,16
    8000290c:	00008067          	ret

0000000080002910 <_ZN15MemoryAllocatorC1Ev>:
MemoryAllocator& MemoryAllocator::getInstance() {
    static MemoryAllocator instance;
    return instance;
}

MemoryAllocator::MemoryAllocator() {
    80002910:	ff010113          	addi	sp,sp,-16
    80002914:	00813423          	sd	s0,8(sp)
    80002918:	01010413          	addi	s0,sp,16
    8000291c:	00053023          	sd	zero,0(a0)
    head = (FreeMem*)HEAP_START_ADDR;
    80002920:	00005717          	auipc	a4,0x5
    80002924:	8c073703          	ld	a4,-1856(a4) # 800071e0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002928:	00073783          	ld	a5,0(a4)
    8000292c:	00f53023          	sd	a5,0(a0)
    head->prev = head->next = nullptr;
    80002930:	0007b023          	sd	zero,0(a5)
    80002934:	00053783          	ld	a5,0(a0)
    80002938:	0007b423          	sd	zero,8(a5)
    head->sizeofblock = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
    8000293c:	00005797          	auipc	a5,0x5
    80002940:	91c7b783          	ld	a5,-1764(a5) # 80007258 <_GLOBAL_OFFSET_TABLE_+0x90>
    80002944:	0007b783          	ld	a5,0(a5)
    80002948:	00073683          	ld	a3,0(a4)
    8000294c:	00053703          	ld	a4,0(a0)
    80002950:	40d787b3          	sub	a5,a5,a3
    80002954:	00f73823          	sd	a5,16(a4)
}
    80002958:	00813403          	ld	s0,8(sp)
    8000295c:	01010113          	addi	sp,sp,16
    80002960:	00008067          	ret

0000000080002964 <_ZN15MemoryAllocator11getInstanceEv>:
    static MemoryAllocator instance;
    80002964:	00005797          	auipc	a5,0x5
    80002968:	9547c783          	lbu	a5,-1708(a5) # 800072b8 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
    8000296c:	00078863          	beqz	a5,8000297c <_ZN15MemoryAllocator11getInstanceEv+0x18>
}
    80002970:	00005517          	auipc	a0,0x5
    80002974:	95050513          	addi	a0,a0,-1712 # 800072c0 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80002978:	00008067          	ret
MemoryAllocator& MemoryAllocator::getInstance() {
    8000297c:	ff010113          	addi	sp,sp,-16
    80002980:	00113423          	sd	ra,8(sp)
    80002984:	00813023          	sd	s0,0(sp)
    80002988:	01010413          	addi	s0,sp,16
    static MemoryAllocator instance;
    8000298c:	00005517          	auipc	a0,0x5
    80002990:	93450513          	addi	a0,a0,-1740 # 800072c0 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80002994:	00000097          	auipc	ra,0x0
    80002998:	f7c080e7          	jalr	-132(ra) # 80002910 <_ZN15MemoryAllocatorC1Ev>
    8000299c:	00100793          	li	a5,1
    800029a0:	00005717          	auipc	a4,0x5
    800029a4:	90f70c23          	sb	a5,-1768(a4) # 800072b8 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
}
    800029a8:	00005517          	auipc	a0,0x5
    800029ac:	91850513          	addi	a0,a0,-1768 # 800072c0 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    800029b0:	00813083          	ld	ra,8(sp)
    800029b4:	00013403          	ld	s0,0(sp)
    800029b8:	01010113          	addi	sp,sp,16
    800029bc:	00008067          	ret

00000000800029c0 <_ZN15MemoryAllocator11MemoryAllocEm>:

void * MemoryAllocator::MemoryAlloc(size_t bytes) {
    800029c0:	ff010113          	addi	sp,sp,-16
    800029c4:	00813423          	sd	s0,8(sp)
    800029c8:	01010413          	addi	s0,sp,16
    800029cc:	00050693          	mv	a3,a0
    // Try to find an existing free block in the list (first fit):
    FreeMem *blk = head, *prev = nullptr;
    800029d0:	00053503          	ld	a0,0(a0)
    800029d4:	00000713          	li	a4,0
    for (; blk!=nullptr; prev=blk, blk=blk->next)
    800029d8:	00050c63          	beqz	a0,800029f0 <_ZN15MemoryAllocator11MemoryAllocEm+0x30>
        if (blk->sizeofblock>=bytes) break;
    800029dc:	01053783          	ld	a5,16(a0)
    800029e0:	00b7f863          	bgeu	a5,a1,800029f0 <_ZN15MemoryAllocator11MemoryAllocEm+0x30>
    for (; blk!=nullptr; prev=blk, blk=blk->next)
    800029e4:	00050713          	mv	a4,a0
    800029e8:	00053503          	ld	a0,0(a0)
    800029ec:	fedff06f          	j	800029d8 <_ZN15MemoryAllocator11MemoryAllocEm+0x18>
    if (blk == nullptr) {
    800029f0:	02050e63          	beqz	a0,80002a2c <_ZN15MemoryAllocator11MemoryAllocEm+0x6c>
        return nullptr;
    }
// Allocate the requested block:
    size_t remainingSize = blk->sizeofblock - bytes;
    800029f4:	01053783          	ld	a5,16(a0)
    800029f8:	40b78633          	sub	a2,a5,a1
    if (remainingSize > 0) {
    800029fc:	04b78463          	beq	a5,a1,80002a44 <_ZN15MemoryAllocator11MemoryAllocEm+0x84>
// A fragment remains
        FreeMem* newBlk = (FreeMem*)((char*)blk + bytes);
    80002a00:	00b507b3          	add	a5,a0,a1
        if (prev) {
    80002a04:	02070a63          	beqz	a4,80002a38 <_ZN15MemoryAllocator11MemoryAllocEm+0x78>
            prev->next = newBlk;
    80002a08:	00f73023          	sd	a5,0(a4)
            newBlk->prev = prev;
    80002a0c:	00e7b423          	sd	a4,8(a5)
        } else {
            head = newBlk;
            newBlk->prev = nullptr;
        }

        newBlk->next = blk->next;
    80002a10:	00053703          	ld	a4,0(a0)
    80002a14:	00e7b023          	sd	a4,0(a5)
        if(blk->next) {
    80002a18:	00070463          	beqz	a4,80002a20 <_ZN15MemoryAllocator11MemoryAllocEm+0x60>
            blk->next->prev = newBlk;
    80002a1c:	00f73423          	sd	a5,8(a4)
        }
        newBlk->sizeofblock = remainingSize;
    80002a20:	00c7b823          	sd	a2,16(a5)
                blk->next->prev=nullptr;
        }
    }

    size_t* newPtr = (size_t*)blk;
    *newPtr = bytes;
    80002a24:	00b53023          	sd	a1,0(a0)

    return newPtr+1;
    80002a28:	00850513          	addi	a0,a0,8
}
    80002a2c:	00813403          	ld	s0,8(sp)
    80002a30:	01010113          	addi	sp,sp,16
    80002a34:	00008067          	ret
            head = newBlk;
    80002a38:	00f6b023          	sd	a5,0(a3)
            newBlk->prev = nullptr;
    80002a3c:	0007b423          	sd	zero,8(a5)
    80002a40:	fd1ff06f          	j	80002a10 <_ZN15MemoryAllocator11MemoryAllocEm+0x50>
        if (prev) {
    80002a44:	00070e63          	beqz	a4,80002a60 <_ZN15MemoryAllocator11MemoryAllocEm+0xa0>
            prev->next = blk->next;
    80002a48:	00053783          	ld	a5,0(a0)
    80002a4c:	00f73023          	sd	a5,0(a4)
            if(blk->next)
    80002a50:	00053783          	ld	a5,0(a0)
    80002a54:	fc0788e3          	beqz	a5,80002a24 <_ZN15MemoryAllocator11MemoryAllocEm+0x64>
                blk->next->prev=prev;
    80002a58:	00e7b423          	sd	a4,8(a5)
    80002a5c:	fc9ff06f          	j	80002a24 <_ZN15MemoryAllocator11MemoryAllocEm+0x64>
            head = blk->next;
    80002a60:	00053783          	ld	a5,0(a0)
    80002a64:	00f6b023          	sd	a5,0(a3)
            if(blk->next)
    80002a68:	00053783          	ld	a5,0(a0)
    80002a6c:	fa078ce3          	beqz	a5,80002a24 <_ZN15MemoryAllocator11MemoryAllocEm+0x64>
                blk->next->prev=nullptr;
    80002a70:	0007b423          	sd	zero,8(a5)
    80002a74:	fb1ff06f          	j	80002a24 <_ZN15MemoryAllocator11MemoryAllocEm+0x64>

0000000080002a78 <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE>:
    tryToJoin(newSeg);
    tryToJoin(cur);
}


void MemoryAllocator::tryToJoin (FreeMem* cur) {
    80002a78:	ff010113          	addi	sp,sp,-16
    80002a7c:	00813423          	sd	s0,8(sp)
    80002a80:	01010413          	addi	s0,sp,16
    if (!cur) return;
    80002a84:	00058c63          	beqz	a1,80002a9c <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE+0x24>
    if (cur->next && (char*)cur+cur->sizeofblock == (char*)(cur->next)) {
    80002a88:	0005b783          	ld	a5,0(a1)
    80002a8c:	00078863          	beqz	a5,80002a9c <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE+0x24>
    80002a90:	0105b703          	ld	a4,16(a1)
    80002a94:	00e586b3          	add	a3,a1,a4
    80002a98:	00d78863          	beq	a5,a3,80002aa8 <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE+0x30>
        cur->sizeofblock += cur->next->sizeofblock;
        cur->next = cur->next->next;
        if (cur->next) cur->next->prev = cur;
    }
}
    80002a9c:	00813403          	ld	s0,8(sp)
    80002aa0:	01010113          	addi	sp,sp,16
    80002aa4:	00008067          	ret
        cur->sizeofblock += cur->next->sizeofblock;
    80002aa8:	0107b683          	ld	a3,16(a5)
    80002aac:	00d70733          	add	a4,a4,a3
    80002ab0:	00e5b823          	sd	a4,16(a1)
        cur->next = cur->next->next;
    80002ab4:	0007b783          	ld	a5,0(a5)
    80002ab8:	00f5b023          	sd	a5,0(a1)
        if (cur->next) cur->next->prev = cur;
    80002abc:	fe0780e3          	beqz	a5,80002a9c <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE+0x24>
    80002ac0:	00b7b423          	sd	a1,8(a5)
    80002ac4:	fd9ff06f          	j	80002a9c <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE+0x24>

0000000080002ac8 <_ZN15MemoryAllocator10MemoryFreeEPv>:
void MemoryAllocator::MemoryFree(void * ptr) {
    80002ac8:	fe010113          	addi	sp,sp,-32
    80002acc:	00113c23          	sd	ra,24(sp)
    80002ad0:	00813823          	sd	s0,16(sp)
    80002ad4:	00913423          	sd	s1,8(sp)
    80002ad8:	01213023          	sd	s2,0(sp)
    80002adc:	02010413          	addi	s0,sp,32
    80002ae0:	00050913          	mv	s2,a0
    80002ae4:	00058713          	mv	a4,a1
    size_t* realStart = (size_t*)(ptr) - 1;
    80002ae8:	ff858593          	addi	a1,a1,-8
    size_t bytes = *realStart;
    80002aec:	ff873683          	ld	a3,-8(a4)
    if (!head || realStart<(size_t *)head)
    80002af0:	00053783          	ld	a5,0(a0)
    80002af4:	00078e63          	beqz	a5,80002b10 <_ZN15MemoryAllocator10MemoryFreeEPv+0x48>
    80002af8:	02f5e063          	bltu	a1,a5,80002b18 <_ZN15MemoryAllocator10MemoryFreeEPv+0x50>
        for (cur=head; cur->next!=0 && realStart>(size_t *)(cur->next); cur=cur->next);
    80002afc:	00078493          	mv	s1,a5
    80002b00:	0007b783          	ld	a5,0(a5)
    80002b04:	00078c63          	beqz	a5,80002b1c <_ZN15MemoryAllocator10MemoryFreeEPv+0x54>
    80002b08:	feb7eae3          	bltu	a5,a1,80002afc <_ZN15MemoryAllocator10MemoryFreeEPv+0x34>
    80002b0c:	0100006f          	j	80002b1c <_ZN15MemoryAllocator10MemoryFreeEPv+0x54>
        cur = 0;
    80002b10:	00078493          	mv	s1,a5
    80002b14:	0080006f          	j	80002b1c <_ZN15MemoryAllocator10MemoryFreeEPv+0x54>
    80002b18:	00000493          	li	s1,0
    newSeg->sizeofblock = bytes;
    80002b1c:	00d73423          	sd	a3,8(a4)
    newSeg->prev = cur;
    80002b20:	00973023          	sd	s1,0(a4)
    if (cur) newSeg->next = cur->next;
    80002b24:	04048a63          	beqz	s1,80002b78 <_ZN15MemoryAllocator10MemoryFreeEPv+0xb0>
    80002b28:	0004b783          	ld	a5,0(s1)
    80002b2c:	fef73c23          	sd	a5,-8(a4)
    if (newSeg->next) newSeg->next->prev = newSeg;
    80002b30:	ff873783          	ld	a5,-8(a4)
    80002b34:	00078463          	beqz	a5,80002b3c <_ZN15MemoryAllocator10MemoryFreeEPv+0x74>
    80002b38:	00b7b423          	sd	a1,8(a5)
    if (cur) cur->next = newSeg;
    80002b3c:	04048463          	beqz	s1,80002b84 <_ZN15MemoryAllocator10MemoryFreeEPv+0xbc>
    80002b40:	00b4b023          	sd	a1,0(s1)
    tryToJoin(newSeg);
    80002b44:	00090513          	mv	a0,s2
    80002b48:	00000097          	auipc	ra,0x0
    80002b4c:	f30080e7          	jalr	-208(ra) # 80002a78 <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE>
    tryToJoin(cur);
    80002b50:	00048593          	mv	a1,s1
    80002b54:	00090513          	mv	a0,s2
    80002b58:	00000097          	auipc	ra,0x0
    80002b5c:	f20080e7          	jalr	-224(ra) # 80002a78 <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE>
}
    80002b60:	01813083          	ld	ra,24(sp)
    80002b64:	01013403          	ld	s0,16(sp)
    80002b68:	00813483          	ld	s1,8(sp)
    80002b6c:	00013903          	ld	s2,0(sp)
    80002b70:	02010113          	addi	sp,sp,32
    80002b74:	00008067          	ret
    else newSeg->next = head;
    80002b78:	00093783          	ld	a5,0(s2)
    80002b7c:	fef73c23          	sd	a5,-8(a4)
    80002b80:	fb1ff06f          	j	80002b30 <_ZN15MemoryAllocator10MemoryFreeEPv+0x68>
    else head = newSeg;
    80002b84:	00b93023          	sd	a1,0(s2)
    80002b88:	fbdff06f          	j	80002b44 <_ZN15MemoryAllocator10MemoryFreeEPv+0x7c>

0000000080002b8c <_ZN14BufferPrinting3getEv>:
sem_t BufferPrinting::in= nullptr;
sem_t BufferPrinting::out= nullptr;
int BufferPrinting::tmpput=0;
int BufferPrinting::tmpget=0;

char BufferPrinting::get() {
    80002b8c:	fe010113          	addi	sp,sp,-32
    80002b90:	00113c23          	sd	ra,24(sp)
    80002b94:	00813823          	sd	s0,16(sp)
    80002b98:	00913423          	sd	s1,8(sp)
    80002b9c:	01213023          	sd	s2,0(sp)
    80002ba0:	02010413          	addi	s0,sp,32
    80002ba4:	00050493          	mv	s1,a0
    SemaphoreABI::semwaitABI(itemAvailable);
    80002ba8:	00053503          	ld	a0,0(a0)
    80002bac:	00000097          	auipc	ra,0x0
    80002bb0:	b10080e7          	jalr	-1264(ra) # 800026bc <_ZN12SemaphoreABI10semwaitABIEPS_>

    char ret = buffer[head];
    80002bb4:	0104b703          	ld	a4,16(s1)
    80002bb8:	0184a783          	lw	a5,24(s1)
    80002bbc:	00f70733          	add	a4,a4,a5
    80002bc0:	00074903          	lbu	s2,0(a4)
    head = (head + 1) % cap;
    80002bc4:	0017879b          	addiw	a5,a5,1
    80002bc8:	0204a703          	lw	a4,32(s1)
    80002bcc:	02e7e7bb          	remw	a5,a5,a4
    80002bd0:	00f4ac23          	sw	a5,24(s1)

    SemaphoreABI::semsignalABI(spaceAvailable);
    80002bd4:	0084b503          	ld	a0,8(s1)
    80002bd8:	00000097          	auipc	ra,0x0
    80002bdc:	be0080e7          	jalr	-1056(ra) # 800027b8 <_ZN12SemaphoreABI12semsignalABIEPS_>

    return ret;
}
    80002be0:	00090513          	mv	a0,s2
    80002be4:	01813083          	ld	ra,24(sp)
    80002be8:	01013403          	ld	s0,16(sp)
    80002bec:	00813483          	ld	s1,8(sp)
    80002bf0:	00013903          	ld	s2,0(sp)
    80002bf4:	02010113          	addi	sp,sp,32
    80002bf8:	00008067          	ret

0000000080002bfc <_ZN14BufferPrinting3putEc>:

void BufferPrinting::put(char val) {
    80002bfc:	fe010113          	addi	sp,sp,-32
    80002c00:	00113c23          	sd	ra,24(sp)
    80002c04:	00813823          	sd	s0,16(sp)
    80002c08:	00913423          	sd	s1,8(sp)
    80002c0c:	01213023          	sd	s2,0(sp)
    80002c10:	02010413          	addi	s0,sp,32
    80002c14:	00050493          	mv	s1,a0
    80002c18:	00058913          	mv	s2,a1
    SemaphoreABI::semwaitABI(spaceAvailable);
    80002c1c:	00853503          	ld	a0,8(a0)
    80002c20:	00000097          	auipc	ra,0x0
    80002c24:	a9c080e7          	jalr	-1380(ra) # 800026bc <_ZN12SemaphoreABI10semwaitABIEPS_>

    buffer[tail] = val;
    80002c28:	0104b783          	ld	a5,16(s1)
    80002c2c:	01c4a703          	lw	a4,28(s1)
    80002c30:	00e787b3          	add	a5,a5,a4
    80002c34:	01278023          	sb	s2,0(a5)
    tail = (tail + 1) % cap;
    80002c38:	01c4a783          	lw	a5,28(s1)
    80002c3c:	0017879b          	addiw	a5,a5,1
    80002c40:	0204a703          	lw	a4,32(s1)
    80002c44:	02e7e7bb          	remw	a5,a5,a4
    80002c48:	00f4ae23          	sw	a5,28(s1)

    SemaphoreABI::semsignalABI(itemAvailable);
    80002c4c:	0004b503          	ld	a0,0(s1)
    80002c50:	00000097          	auipc	ra,0x0
    80002c54:	b68080e7          	jalr	-1176(ra) # 800027b8 <_ZN12SemaphoreABI12semsignalABIEPS_>
}
    80002c58:	01813083          	ld	ra,24(sp)
    80002c5c:	01013403          	ld	s0,16(sp)
    80002c60:	00813483          	ld	s1,8(sp)
    80002c64:	00013903          	ld	s2,0(sp)
    80002c68:	02010113          	addi	sp,sp,32
    80002c6c:	00008067          	ret

0000000080002c70 <_ZN14BufferPrintingD1Ev>:

BufferPrinting::~BufferPrinting() {
    80002c70:	fe010113          	addi	sp,sp,-32
    80002c74:	00113c23          	sd	ra,24(sp)
    80002c78:	00813823          	sd	s0,16(sp)
    80002c7c:	00913423          	sd	s1,8(sp)
    80002c80:	02010413          	addi	s0,sp,32
    80002c84:	00050493          	mv	s1,a0
    delete buffer;
    80002c88:	01053503          	ld	a0,16(a0)
    80002c8c:	00050663          	beqz	a0,80002c98 <_ZN14BufferPrintingD1Ev+0x28>
    80002c90:	fffff097          	auipc	ra,0xfffff
    80002c94:	030080e7          	jalr	48(ra) # 80001cc0 <_ZdlPv>
    SemaphoreABI::semcloseABI(itemAvailable);
    80002c98:	0004b503          	ld	a0,0(s1)
    80002c9c:	00000097          	auipc	ra,0x0
    80002ca0:	bc4080e7          	jalr	-1084(ra) # 80002860 <_ZN12SemaphoreABI11semcloseABIEPS_>
    SemaphoreABI::semcloseABI(spaceAvailable);
    80002ca4:	0084b503          	ld	a0,8(s1)
    80002ca8:	00000097          	auipc	ra,0x0
    80002cac:	bb8080e7          	jalr	-1096(ra) # 80002860 <_ZN12SemaphoreABI11semcloseABIEPS_>
  }
    80002cb0:	01813083          	ld	ra,24(sp)
    80002cb4:	01013403          	ld	s0,16(sp)
    80002cb8:	00813483          	ld	s1,8(sp)
    80002cbc:	02010113          	addi	sp,sp,32
    80002cc0:	00008067          	ret

0000000080002cc4 <_ZN14BufferPrintingC1Ei>:

BufferPrinting::BufferPrinting(int cap) {
    80002cc4:	fe010113          	addi	sp,sp,-32
    80002cc8:	00113c23          	sd	ra,24(sp)
    80002ccc:	00813823          	sd	s0,16(sp)
    80002cd0:	00913423          	sd	s1,8(sp)
    80002cd4:	01213023          	sd	s2,0(sp)
    80002cd8:	02010413          	addi	s0,sp,32
    80002cdc:	00050493          	mv	s1,a0
    80002ce0:	00058913          	mv	s2,a1
    this->cap=cap;
    80002ce4:	02b52023          	sw	a1,32(a0)
    buffer = new char[cap];
    80002ce8:	00058513          	mv	a0,a1
    80002cec:	fffff097          	auipc	ra,0xfffff
    80002cf0:	fac080e7          	jalr	-84(ra) # 80001c98 <_Znam>
    80002cf4:	00a4b823          	sd	a0,16(s1)
    SemaphoreABI::semopenABI(&itemAvailable, 0);
    80002cf8:	00000593          	li	a1,0
    80002cfc:	00048513          	mv	a0,s1
    80002d00:	00000097          	auipc	ra,0x0
    80002d04:	950080e7          	jalr	-1712(ra) # 80002650 <_ZN12SemaphoreABI10semopenABIEPPS_i>
    SemaphoreABI::semopenABI(&spaceAvailable, cap);
    80002d08:	00090593          	mv	a1,s2
    80002d0c:	00848513          	addi	a0,s1,8
    80002d10:	00000097          	auipc	ra,0x0
    80002d14:	940080e7          	jalr	-1728(ra) # 80002650 <_ZN12SemaphoreABI10semopenABIEPPS_i>
    head=tail=0;
    80002d18:	0004ae23          	sw	zero,28(s1)
    80002d1c:	0004ac23          	sw	zero,24(s1)
}
    80002d20:	01813083          	ld	ra,24(sp)
    80002d24:	01013403          	ld	s0,16(sp)
    80002d28:	00813483          	ld	s1,8(sp)
    80002d2c:	00013903          	ld	s2,0(sp)
    80002d30:	02010113          	addi	sp,sp,32
    80002d34:	00008067          	ret

0000000080002d38 <_ZN12SchedulerABI3getEv>:

ThreadABI *SchedulerABI::headsleep = nullptr;
ThreadABI *SchedulerABI::headready = nullptr;
ThreadABI *SchedulerABI::tailready = nullptr;

ThreadABI *SchedulerABI::get() {
    80002d38:	ff010113          	addi	sp,sp,-16
    80002d3c:	00813423          	sd	s0,8(sp)
    80002d40:	01010413          	addi	s0,sp,16

    if (headready == nullptr)return ThreadABI::idle;
    80002d44:	00004517          	auipc	a0,0x4
    80002d48:	5ac53503          	ld	a0,1452(a0) # 800072f0 <_ZN12SchedulerABI9headreadyE>
    80002d4c:	02050663          	beqz	a0,80002d78 <_ZN12SchedulerABI3getEv+0x40>
    if (tailready == headready) {
    80002d50:	00004797          	auipc	a5,0x4
    80002d54:	5a87b783          	ld	a5,1448(a5) # 800072f8 <_ZN12SchedulerABI9tailreadyE>
    80002d58:	02f50863          	beq	a0,a5,80002d88 <_ZN12SchedulerABI3getEv+0x50>
        tailready = nullptr;
        headready = nullptr;
        return tmp;
    }
    ThreadABI *tmp = headready;
    headready = headready->next;
    80002d5c:	00053783          	ld	a5,0(a0)
    80002d60:	00004717          	auipc	a4,0x4
    80002d64:	58f73823          	sd	a5,1424(a4) # 800072f0 <_ZN12SchedulerABI9headreadyE>
//    ThreadABI::running=tmp;
    tmp->next= nullptr;
    80002d68:	00053023          	sd	zero,0(a0)

    return tmp;
}
    80002d6c:	00813403          	ld	s0,8(sp)
    80002d70:	01010113          	addi	sp,sp,16
    80002d74:	00008067          	ret
    if (headready == nullptr)return ThreadABI::idle;
    80002d78:	00004797          	auipc	a5,0x4
    80002d7c:	4a87b783          	ld	a5,1192(a5) # 80007220 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002d80:	0007b503          	ld	a0,0(a5)
    80002d84:	fe9ff06f          	j	80002d6c <_ZN12SchedulerABI3getEv+0x34>
        tailready = nullptr;
    80002d88:	00004797          	auipc	a5,0x4
    80002d8c:	56878793          	addi	a5,a5,1384 # 800072f0 <_ZN12SchedulerABI9headreadyE>
    80002d90:	0007b423          	sd	zero,8(a5)
        headready = nullptr;
    80002d94:	0007b023          	sd	zero,0(a5)
        return tmp;
    80002d98:	fd5ff06f          	j	80002d6c <_ZN12SchedulerABI3getEv+0x34>

0000000080002d9c <_ZN12SchedulerABI3putEP9ThreadABI>:

void SchedulerABI::put(ThreadABI *t) {
    80002d9c:	ff010113          	addi	sp,sp,-16
    80002da0:	00813423          	sd	s0,8(sp)
    80002da4:	01010413          	addi	s0,sp,16
    t->state=ThreadABI::READY;
    80002da8:	00100793          	li	a5,1
    80002dac:	00f5a623          	sw	a5,12(a1)
    if(t==ThreadABI::idle)return;
    80002db0:	00004797          	auipc	a5,0x4
    80002db4:	4707b783          	ld	a5,1136(a5) # 80007220 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002db8:	0007b783          	ld	a5,0(a5)
    80002dbc:	02b78a63          	beq	a5,a1,80002df0 <_ZN12SchedulerABI3putEP9ThreadABI+0x54>
    if (t == nullptr)return;
    80002dc0:	02058863          	beqz	a1,80002df0 <_ZN12SchedulerABI3putEP9ThreadABI+0x54>
    if (headready == nullptr) {
    80002dc4:	00004797          	auipc	a5,0x4
    80002dc8:	52c7b783          	ld	a5,1324(a5) # 800072f0 <_ZN12SchedulerABI9headreadyE>
    80002dcc:	02078863          	beqz	a5,80002dfc <_ZN12SchedulerABI3putEP9ThreadABI+0x60>
        tailready = t;
        t->next= nullptr;
        return;
    }

    tailready->next=t;
    80002dd0:	00004797          	auipc	a5,0x4
    80002dd4:	52078793          	addi	a5,a5,1312 # 800072f0 <_ZN12SchedulerABI9headreadyE>
    80002dd8:	0087b703          	ld	a4,8(a5)
    80002ddc:	00b73023          	sd	a1,0(a4)
    tailready=tailready->next;
    80002de0:	0087b703          	ld	a4,8(a5)
    80002de4:	00073703          	ld	a4,0(a4)
    80002de8:	00e7b423          	sd	a4,8(a5)
    tailready->next= nullptr;
    80002dec:	00073023          	sd	zero,0(a4)

}
    80002df0:	00813403          	ld	s0,8(sp)
    80002df4:	01010113          	addi	sp,sp,16
    80002df8:	00008067          	ret
        headready = t;
    80002dfc:	00004797          	auipc	a5,0x4
    80002e00:	4f478793          	addi	a5,a5,1268 # 800072f0 <_ZN12SchedulerABI9headreadyE>
    80002e04:	00b7b023          	sd	a1,0(a5)
        tailready = t;
    80002e08:	00b7b423          	sd	a1,8(a5)
        t->next= nullptr;
    80002e0c:	0005b023          	sd	zero,0(a1)
        return;
    80002e10:	fe1ff06f          	j	80002df0 <_ZN12SchedulerABI3putEP9ThreadABI+0x54>

0000000080002e14 <_ZN12SchedulerABI5sleepEm>:

void SchedulerABI::sleep(time_t time) {
    80002e14:	ff010113          	addi	sp,sp,-16
    80002e18:	00113423          	sd	ra,8(sp)
    80002e1c:	00813023          	sd	s0,0(sp)
    80002e20:	01010413          	addi	s0,sp,16

    ThreadABI *tmp2=ThreadABI::running;
    80002e24:	00004797          	auipc	a5,0x4
    80002e28:	3d47b783          	ld	a5,980(a5) # 800071f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002e2c:	0007b683          	ld	a3,0(a5)
    tmp2->state=ThreadABI::State::SLEEP;
    80002e30:	00200793          	li	a5,2
    80002e34:	00f6a623          	sw	a5,12(a3)
    tmp2->sleeptime=time;
    80002e38:	02a6bc23          	sd	a0,56(a3)
//            tmp2->next=tmp;
//            onebehind->next=tmp2;
//            break;
//        }
//    }
    if (headsleep == nullptr || headsleep->sleeptime > tmp2->sleeptime) {
    80002e3c:	00004797          	auipc	a5,0x4
    80002e40:	4c47b783          	ld	a5,1220(a5) # 80007300 <_ZN12SchedulerABI9headsleepE>
    80002e44:	00078663          	beqz	a5,80002e50 <_ZN12SchedulerABI5sleepEm+0x3c>
    80002e48:	0387b703          	ld	a4,56(a5)
    80002e4c:	02e57463          	bgeu	a0,a4,80002e74 <_ZN12SchedulerABI5sleepEm+0x60>
        tmp2->next = headsleep;
    80002e50:	00f6b023          	sd	a5,0(a3)
        headsleep = tmp2;
    80002e54:	00004797          	auipc	a5,0x4
    80002e58:	4ad7b623          	sd	a3,1196(a5) # 80007300 <_ZN12SchedulerABI9headsleepE>
        }
        tmp2->next = tmp->next;
        tmp->next = tmp2;
    }
    //ostala promjena kontexta;
    ThreadABI::yield();
    80002e5c:	ffffe097          	auipc	ra,0xffffe
    80002e60:	7ec080e7          	jalr	2028(ra) # 80001648 <_ZN9ThreadABI5yieldEv>
}
    80002e64:	00813083          	ld	ra,8(sp)
    80002e68:	00013403          	ld	s0,0(sp)
    80002e6c:	01010113          	addi	sp,sp,16
    80002e70:	00008067          	ret
        while (tmp->next != nullptr && tmp->next->sleeptime < tmp2->sleeptime) {
    80002e74:	00078613          	mv	a2,a5
    80002e78:	0007b783          	ld	a5,0(a5)
    80002e7c:	00078663          	beqz	a5,80002e88 <_ZN12SchedulerABI5sleepEm+0x74>
    80002e80:	0387b703          	ld	a4,56(a5)
    80002e84:	fea768e3          	bltu	a4,a0,80002e74 <_ZN12SchedulerABI5sleepEm+0x60>
        tmp2->next = tmp->next;
    80002e88:	00f6b023          	sd	a5,0(a3)
        tmp->next = tmp2;
    80002e8c:	00d63023          	sd	a3,0(a2)
    80002e90:	fcdff06f          	j	80002e5c <_ZN12SchedulerABI5sleepEm+0x48>

0000000080002e94 <_ZN12SchedulerABI20getInstanceSchedulerEv>:

SchedulerABI &SchedulerABI::getInstanceScheduler() {
    80002e94:	ff010113          	addi	sp,sp,-16
    80002e98:	00813423          	sd	s0,8(sp)
    80002e9c:	01010413          	addi	s0,sp,16
    static SchedulerABI instance;
    80002ea0:	00004797          	auipc	a5,0x4
    80002ea4:	4687c783          	lbu	a5,1128(a5) # 80007308 <_ZGVZN12SchedulerABI20getInstanceSchedulerEvE8instance>
    80002ea8:	00079863          	bnez	a5,80002eb8 <_ZN12SchedulerABI20getInstanceSchedulerEv+0x24>
    80002eac:	00100793          	li	a5,1
    80002eb0:	00004717          	auipc	a4,0x4
    80002eb4:	44f70c23          	sb	a5,1112(a4) # 80007308 <_ZGVZN12SchedulerABI20getInstanceSchedulerEvE8instance>
    return instance;
}
    80002eb8:	00004517          	auipc	a0,0x4
    80002ebc:	45850513          	addi	a0,a0,1112 # 80007310 <_ZZN12SchedulerABI20getInstanceSchedulerEvE8instance>
    80002ec0:	00813403          	ld	s0,8(sp)
    80002ec4:	01010113          	addi	sp,sp,16
    80002ec8:	00008067          	ret

0000000080002ecc <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80002ecc:	fe010113          	addi	sp,sp,-32
    80002ed0:	00113c23          	sd	ra,24(sp)
    80002ed4:	00813823          	sd	s0,16(sp)
    80002ed8:	00913423          	sd	s1,8(sp)
    80002edc:	02010413          	addi	s0,sp,32
    80002ee0:	00050493          	mv	s1,a0
    LOCK();
    80002ee4:	00100613          	li	a2,1
    80002ee8:	00000593          	li	a1,0
    80002eec:	00004517          	auipc	a0,0x4
    80002ef0:	42c50513          	addi	a0,a0,1068 # 80007318 <lockPrint>
    80002ef4:	ffffe097          	auipc	ra,0xffffe
    80002ef8:	23c080e7          	jalr	572(ra) # 80001130 <copy_and_swap>
    80002efc:	fe0514e3          	bnez	a0,80002ee4 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80002f00:	0004c503          	lbu	a0,0(s1)
    80002f04:	00050a63          	beqz	a0,80002f18 <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    80002f08:	ffffe097          	auipc	ra,0xffffe
    80002f0c:	4d4080e7          	jalr	1236(ra) # 800013dc <_Z4putcc>
        string++;
    80002f10:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80002f14:	fedff06f          	j	80002f00 <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80002f18:	00000613          	li	a2,0
    80002f1c:	00100593          	li	a1,1
    80002f20:	00004517          	auipc	a0,0x4
    80002f24:	3f850513          	addi	a0,a0,1016 # 80007318 <lockPrint>
    80002f28:	ffffe097          	auipc	ra,0xffffe
    80002f2c:	208080e7          	jalr	520(ra) # 80001130 <copy_and_swap>
    80002f30:	fe0514e3          	bnez	a0,80002f18 <_Z11printStringPKc+0x4c>
}
    80002f34:	01813083          	ld	ra,24(sp)
    80002f38:	01013403          	ld	s0,16(sp)
    80002f3c:	00813483          	ld	s1,8(sp)
    80002f40:	02010113          	addi	sp,sp,32
    80002f44:	00008067          	ret

0000000080002f48 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80002f48:	fd010113          	addi	sp,sp,-48
    80002f4c:	02113423          	sd	ra,40(sp)
    80002f50:	02813023          	sd	s0,32(sp)
    80002f54:	00913c23          	sd	s1,24(sp)
    80002f58:	01213823          	sd	s2,16(sp)
    80002f5c:	01313423          	sd	s3,8(sp)
    80002f60:	01413023          	sd	s4,0(sp)
    80002f64:	03010413          	addi	s0,sp,48
    80002f68:	00050993          	mv	s3,a0
    80002f6c:	00058a13          	mv	s4,a1
    LOCK();
    80002f70:	00100613          	li	a2,1
    80002f74:	00000593          	li	a1,0
    80002f78:	00004517          	auipc	a0,0x4
    80002f7c:	3a050513          	addi	a0,a0,928 # 80007318 <lockPrint>
    80002f80:	ffffe097          	auipc	ra,0xffffe
    80002f84:	1b0080e7          	jalr	432(ra) # 80001130 <copy_and_swap>
    80002f88:	fe0514e3          	bnez	a0,80002f70 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80002f8c:	00000913          	li	s2,0
    80002f90:	00090493          	mv	s1,s2
    80002f94:	0019091b          	addiw	s2,s2,1
    80002f98:	03495a63          	bge	s2,s4,80002fcc <_Z9getStringPci+0x84>
        cc = getc();
    80002f9c:	ffffe097          	auipc	ra,0xffffe
    80002fa0:	404080e7          	jalr	1028(ra) # 800013a0 <_Z4getcv>
        if(cc < 1)
    80002fa4:	02050463          	beqz	a0,80002fcc <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    80002fa8:	009984b3          	add	s1,s3,s1
    80002fac:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80002fb0:	00a00793          	li	a5,10
    80002fb4:	00f50a63          	beq	a0,a5,80002fc8 <_Z9getStringPci+0x80>
    80002fb8:	00d00793          	li	a5,13
    80002fbc:	fcf51ae3          	bne	a0,a5,80002f90 <_Z9getStringPci+0x48>
        buf[i++] = c;
    80002fc0:	00090493          	mv	s1,s2
    80002fc4:	0080006f          	j	80002fcc <_Z9getStringPci+0x84>
    80002fc8:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80002fcc:	009984b3          	add	s1,s3,s1
    80002fd0:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80002fd4:	00000613          	li	a2,0
    80002fd8:	00100593          	li	a1,1
    80002fdc:	00004517          	auipc	a0,0x4
    80002fe0:	33c50513          	addi	a0,a0,828 # 80007318 <lockPrint>
    80002fe4:	ffffe097          	auipc	ra,0xffffe
    80002fe8:	14c080e7          	jalr	332(ra) # 80001130 <copy_and_swap>
    80002fec:	fe0514e3          	bnez	a0,80002fd4 <_Z9getStringPci+0x8c>
    return buf;
}
    80002ff0:	00098513          	mv	a0,s3
    80002ff4:	02813083          	ld	ra,40(sp)
    80002ff8:	02013403          	ld	s0,32(sp)
    80002ffc:	01813483          	ld	s1,24(sp)
    80003000:	01013903          	ld	s2,16(sp)
    80003004:	00813983          	ld	s3,8(sp)
    80003008:	00013a03          	ld	s4,0(sp)
    8000300c:	03010113          	addi	sp,sp,48
    80003010:	00008067          	ret

0000000080003014 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80003014:	ff010113          	addi	sp,sp,-16
    80003018:	00813423          	sd	s0,8(sp)
    8000301c:	01010413          	addi	s0,sp,16
    80003020:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80003024:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80003028:	0006c603          	lbu	a2,0(a3)
    8000302c:	fd06071b          	addiw	a4,a2,-48
    80003030:	0ff77713          	andi	a4,a4,255
    80003034:	00900793          	li	a5,9
    80003038:	02e7e063          	bltu	a5,a4,80003058 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    8000303c:	0025179b          	slliw	a5,a0,0x2
    80003040:	00a787bb          	addw	a5,a5,a0
    80003044:	0017979b          	slliw	a5,a5,0x1
    80003048:	00168693          	addi	a3,a3,1
    8000304c:	00c787bb          	addw	a5,a5,a2
    80003050:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80003054:	fd5ff06f          	j	80003028 <_Z11stringToIntPKc+0x14>
    return n;
}
    80003058:	00813403          	ld	s0,8(sp)
    8000305c:	01010113          	addi	sp,sp,16
    80003060:	00008067          	ret

0000000080003064 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80003064:	fc010113          	addi	sp,sp,-64
    80003068:	02113c23          	sd	ra,56(sp)
    8000306c:	02813823          	sd	s0,48(sp)
    80003070:	02913423          	sd	s1,40(sp)
    80003074:	03213023          	sd	s2,32(sp)
    80003078:	01313c23          	sd	s3,24(sp)
    8000307c:	04010413          	addi	s0,sp,64
    80003080:	00050493          	mv	s1,a0
    80003084:	00058913          	mv	s2,a1
    80003088:	00060993          	mv	s3,a2
    LOCK();
    8000308c:	00100613          	li	a2,1
    80003090:	00000593          	li	a1,0
    80003094:	00004517          	auipc	a0,0x4
    80003098:	28450513          	addi	a0,a0,644 # 80007318 <lockPrint>
    8000309c:	ffffe097          	auipc	ra,0xffffe
    800030a0:	094080e7          	jalr	148(ra) # 80001130 <copy_and_swap>
    800030a4:	fe0514e3          	bnez	a0,8000308c <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    800030a8:	00098463          	beqz	s3,800030b0 <_Z8printIntiii+0x4c>
    800030ac:	0804c463          	bltz	s1,80003134 <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800030b0:	0004851b          	sext.w	a0,s1
    neg = 0;
    800030b4:	00000593          	li	a1,0
    }

    i = 0;
    800030b8:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800030bc:	0009079b          	sext.w	a5,s2
    800030c0:	0325773b          	remuw	a4,a0,s2
    800030c4:	00048613          	mv	a2,s1
    800030c8:	0014849b          	addiw	s1,s1,1
    800030cc:	02071693          	slli	a3,a4,0x20
    800030d0:	0206d693          	srli	a3,a3,0x20
    800030d4:	00004717          	auipc	a4,0x4
    800030d8:	0dc70713          	addi	a4,a4,220 # 800071b0 <digits>
    800030dc:	00d70733          	add	a4,a4,a3
    800030e0:	00074683          	lbu	a3,0(a4)
    800030e4:	fd040713          	addi	a4,s0,-48
    800030e8:	00c70733          	add	a4,a4,a2
    800030ec:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800030f0:	0005071b          	sext.w	a4,a0
    800030f4:	0325553b          	divuw	a0,a0,s2
    800030f8:	fcf772e3          	bgeu	a4,a5,800030bc <_Z8printIntiii+0x58>
    if(neg)
    800030fc:	00058c63          	beqz	a1,80003114 <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    80003100:	fd040793          	addi	a5,s0,-48
    80003104:	009784b3          	add	s1,a5,s1
    80003108:	02d00793          	li	a5,45
    8000310c:	fef48823          	sb	a5,-16(s1)
    80003110:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80003114:	fff4849b          	addiw	s1,s1,-1
    80003118:	0204c463          	bltz	s1,80003140 <_Z8printIntiii+0xdc>
        putc(buf[i]);
    8000311c:	fd040793          	addi	a5,s0,-48
    80003120:	009787b3          	add	a5,a5,s1
    80003124:	ff07c503          	lbu	a0,-16(a5)
    80003128:	ffffe097          	auipc	ra,0xffffe
    8000312c:	2b4080e7          	jalr	692(ra) # 800013dc <_Z4putcc>
    80003130:	fe5ff06f          	j	80003114 <_Z8printIntiii+0xb0>
        x = -xx;
    80003134:	4090053b          	negw	a0,s1
        neg = 1;
    80003138:	00100593          	li	a1,1
        x = -xx;
    8000313c:	f7dff06f          	j	800030b8 <_Z8printIntiii+0x54>

    UNLOCK();
    80003140:	00000613          	li	a2,0
    80003144:	00100593          	li	a1,1
    80003148:	00004517          	auipc	a0,0x4
    8000314c:	1d050513          	addi	a0,a0,464 # 80007318 <lockPrint>
    80003150:	ffffe097          	auipc	ra,0xffffe
    80003154:	fe0080e7          	jalr	-32(ra) # 80001130 <copy_and_swap>
    80003158:	fe0514e3          	bnez	a0,80003140 <_Z8printIntiii+0xdc>
    8000315c:	03813083          	ld	ra,56(sp)
    80003160:	03013403          	ld	s0,48(sp)
    80003164:	02813483          	ld	s1,40(sp)
    80003168:	02013903          	ld	s2,32(sp)
    8000316c:	01813983          	ld	s3,24(sp)
    80003170:	04010113          	addi	sp,sp,64
    80003174:	00008067          	ret

0000000080003178 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80003178:	fd010113          	addi	sp,sp,-48
    8000317c:	02113423          	sd	ra,40(sp)
    80003180:	02813023          	sd	s0,32(sp)
    80003184:	00913c23          	sd	s1,24(sp)
    80003188:	01213823          	sd	s2,16(sp)
    8000318c:	01313423          	sd	s3,8(sp)
    80003190:	03010413          	addi	s0,sp,48
    80003194:	00050493          	mv	s1,a0
    80003198:	00058913          	mv	s2,a1
    8000319c:	0015879b          	addiw	a5,a1,1
    800031a0:	0007851b          	sext.w	a0,a5
    800031a4:	00f4a023          	sw	a5,0(s1)
    800031a8:	0004a823          	sw	zero,16(s1)
    800031ac:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800031b0:	00251513          	slli	a0,a0,0x2
    800031b4:	ffffe097          	auipc	ra,0xffffe
    800031b8:	f9c080e7          	jalr	-100(ra) # 80001150 <_Z9mem_allocm>
    800031bc:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    800031c0:	01000513          	li	a0,16
    800031c4:	fffff097          	auipc	ra,0xfffff
    800031c8:	aac080e7          	jalr	-1364(ra) # 80001c70 <_Znwm>
    800031cc:	00050993          	mv	s3,a0
    800031d0:	00000593          	li	a1,0
    800031d4:	fffff097          	auipc	ra,0xfffff
    800031d8:	d54080e7          	jalr	-684(ra) # 80001f28 <_ZN9SemaphoreC1Ej>
    800031dc:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800031e0:	01000513          	li	a0,16
    800031e4:	fffff097          	auipc	ra,0xfffff
    800031e8:	a8c080e7          	jalr	-1396(ra) # 80001c70 <_Znwm>
    800031ec:	00050993          	mv	s3,a0
    800031f0:	00090593          	mv	a1,s2
    800031f4:	fffff097          	auipc	ra,0xfffff
    800031f8:	d34080e7          	jalr	-716(ra) # 80001f28 <_ZN9SemaphoreC1Ej>
    800031fc:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80003200:	01000513          	li	a0,16
    80003204:	fffff097          	auipc	ra,0xfffff
    80003208:	a6c080e7          	jalr	-1428(ra) # 80001c70 <_Znwm>
    8000320c:	00050913          	mv	s2,a0
    80003210:	00100593          	li	a1,1
    80003214:	fffff097          	auipc	ra,0xfffff
    80003218:	d14080e7          	jalr	-748(ra) # 80001f28 <_ZN9SemaphoreC1Ej>
    8000321c:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80003220:	01000513          	li	a0,16
    80003224:	fffff097          	auipc	ra,0xfffff
    80003228:	a4c080e7          	jalr	-1460(ra) # 80001c70 <_Znwm>
    8000322c:	00050913          	mv	s2,a0
    80003230:	00100593          	li	a1,1
    80003234:	fffff097          	auipc	ra,0xfffff
    80003238:	cf4080e7          	jalr	-780(ra) # 80001f28 <_ZN9SemaphoreC1Ej>
    8000323c:	0324b823          	sd	s2,48(s1)
}
    80003240:	02813083          	ld	ra,40(sp)
    80003244:	02013403          	ld	s0,32(sp)
    80003248:	01813483          	ld	s1,24(sp)
    8000324c:	01013903          	ld	s2,16(sp)
    80003250:	00813983          	ld	s3,8(sp)
    80003254:	03010113          	addi	sp,sp,48
    80003258:	00008067          	ret
    8000325c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80003260:	00098513          	mv	a0,s3
    80003264:	fffff097          	auipc	ra,0xfffff
    80003268:	a5c080e7          	jalr	-1444(ra) # 80001cc0 <_ZdlPv>
    8000326c:	00048513          	mv	a0,s1
    80003270:	00005097          	auipc	ra,0x5
    80003274:	178080e7          	jalr	376(ra) # 800083e8 <_Unwind_Resume>
    80003278:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    8000327c:	00098513          	mv	a0,s3
    80003280:	fffff097          	auipc	ra,0xfffff
    80003284:	a40080e7          	jalr	-1472(ra) # 80001cc0 <_ZdlPv>
    80003288:	00048513          	mv	a0,s1
    8000328c:	00005097          	auipc	ra,0x5
    80003290:	15c080e7          	jalr	348(ra) # 800083e8 <_Unwind_Resume>
    80003294:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80003298:	00090513          	mv	a0,s2
    8000329c:	fffff097          	auipc	ra,0xfffff
    800032a0:	a24080e7          	jalr	-1500(ra) # 80001cc0 <_ZdlPv>
    800032a4:	00048513          	mv	a0,s1
    800032a8:	00005097          	auipc	ra,0x5
    800032ac:	140080e7          	jalr	320(ra) # 800083e8 <_Unwind_Resume>
    800032b0:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800032b4:	00090513          	mv	a0,s2
    800032b8:	fffff097          	auipc	ra,0xfffff
    800032bc:	a08080e7          	jalr	-1528(ra) # 80001cc0 <_ZdlPv>
    800032c0:	00048513          	mv	a0,s1
    800032c4:	00005097          	auipc	ra,0x5
    800032c8:	124080e7          	jalr	292(ra) # 800083e8 <_Unwind_Resume>

00000000800032cc <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800032cc:	fe010113          	addi	sp,sp,-32
    800032d0:	00113c23          	sd	ra,24(sp)
    800032d4:	00813823          	sd	s0,16(sp)
    800032d8:	00913423          	sd	s1,8(sp)
    800032dc:	01213023          	sd	s2,0(sp)
    800032e0:	02010413          	addi	s0,sp,32
    800032e4:	00050493          	mv	s1,a0
    800032e8:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800032ec:	01853503          	ld	a0,24(a0)
    800032f0:	fffff097          	auipc	ra,0xfffff
    800032f4:	c70080e7          	jalr	-912(ra) # 80001f60 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800032f8:	0304b503          	ld	a0,48(s1)
    800032fc:	fffff097          	auipc	ra,0xfffff
    80003300:	c64080e7          	jalr	-924(ra) # 80001f60 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80003304:	0084b783          	ld	a5,8(s1)
    80003308:	0144a703          	lw	a4,20(s1)
    8000330c:	00271713          	slli	a4,a4,0x2
    80003310:	00e787b3          	add	a5,a5,a4
    80003314:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80003318:	0144a783          	lw	a5,20(s1)
    8000331c:	0017879b          	addiw	a5,a5,1
    80003320:	0004a703          	lw	a4,0(s1)
    80003324:	02e7e7bb          	remw	a5,a5,a4
    80003328:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    8000332c:	0304b503          	ld	a0,48(s1)
    80003330:	fffff097          	auipc	ra,0xfffff
    80003334:	c5c080e7          	jalr	-932(ra) # 80001f8c <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80003338:	0204b503          	ld	a0,32(s1)
    8000333c:	fffff097          	auipc	ra,0xfffff
    80003340:	c50080e7          	jalr	-944(ra) # 80001f8c <_ZN9Semaphore6signalEv>

}
    80003344:	01813083          	ld	ra,24(sp)
    80003348:	01013403          	ld	s0,16(sp)
    8000334c:	00813483          	ld	s1,8(sp)
    80003350:	00013903          	ld	s2,0(sp)
    80003354:	02010113          	addi	sp,sp,32
    80003358:	00008067          	ret

000000008000335c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    8000335c:	fe010113          	addi	sp,sp,-32
    80003360:	00113c23          	sd	ra,24(sp)
    80003364:	00813823          	sd	s0,16(sp)
    80003368:	00913423          	sd	s1,8(sp)
    8000336c:	01213023          	sd	s2,0(sp)
    80003370:	02010413          	addi	s0,sp,32
    80003374:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80003378:	02053503          	ld	a0,32(a0)
    8000337c:	fffff097          	auipc	ra,0xfffff
    80003380:	be4080e7          	jalr	-1052(ra) # 80001f60 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80003384:	0284b503          	ld	a0,40(s1)
    80003388:	fffff097          	auipc	ra,0xfffff
    8000338c:	bd8080e7          	jalr	-1064(ra) # 80001f60 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80003390:	0084b703          	ld	a4,8(s1)
    80003394:	0104a783          	lw	a5,16(s1)
    80003398:	00279693          	slli	a3,a5,0x2
    8000339c:	00d70733          	add	a4,a4,a3
    800033a0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800033a4:	0017879b          	addiw	a5,a5,1
    800033a8:	0004a703          	lw	a4,0(s1)
    800033ac:	02e7e7bb          	remw	a5,a5,a4
    800033b0:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800033b4:	0284b503          	ld	a0,40(s1)
    800033b8:	fffff097          	auipc	ra,0xfffff
    800033bc:	bd4080e7          	jalr	-1068(ra) # 80001f8c <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800033c0:	0184b503          	ld	a0,24(s1)
    800033c4:	fffff097          	auipc	ra,0xfffff
    800033c8:	bc8080e7          	jalr	-1080(ra) # 80001f8c <_ZN9Semaphore6signalEv>

    return ret;
}
    800033cc:	00090513          	mv	a0,s2
    800033d0:	01813083          	ld	ra,24(sp)
    800033d4:	01013403          	ld	s0,16(sp)
    800033d8:	00813483          	ld	s1,8(sp)
    800033dc:	00013903          	ld	s2,0(sp)
    800033e0:	02010113          	addi	sp,sp,32
    800033e4:	00008067          	ret

00000000800033e8 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800033e8:	fe010113          	addi	sp,sp,-32
    800033ec:	00113c23          	sd	ra,24(sp)
    800033f0:	00813823          	sd	s0,16(sp)
    800033f4:	00913423          	sd	s1,8(sp)
    800033f8:	01213023          	sd	s2,0(sp)
    800033fc:	02010413          	addi	s0,sp,32
    80003400:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80003404:	02853503          	ld	a0,40(a0)
    80003408:	fffff097          	auipc	ra,0xfffff
    8000340c:	b58080e7          	jalr	-1192(ra) # 80001f60 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80003410:	0304b503          	ld	a0,48(s1)
    80003414:	fffff097          	auipc	ra,0xfffff
    80003418:	b4c080e7          	jalr	-1204(ra) # 80001f60 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    8000341c:	0144a783          	lw	a5,20(s1)
    80003420:	0104a903          	lw	s2,16(s1)
    80003424:	0327ce63          	blt	a5,s2,80003460 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80003428:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    8000342c:	0304b503          	ld	a0,48(s1)
    80003430:	fffff097          	auipc	ra,0xfffff
    80003434:	b5c080e7          	jalr	-1188(ra) # 80001f8c <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80003438:	0284b503          	ld	a0,40(s1)
    8000343c:	fffff097          	auipc	ra,0xfffff
    80003440:	b50080e7          	jalr	-1200(ra) # 80001f8c <_ZN9Semaphore6signalEv>

    return ret;
}
    80003444:	00090513          	mv	a0,s2
    80003448:	01813083          	ld	ra,24(sp)
    8000344c:	01013403          	ld	s0,16(sp)
    80003450:	00813483          	ld	s1,8(sp)
    80003454:	00013903          	ld	s2,0(sp)
    80003458:	02010113          	addi	sp,sp,32
    8000345c:	00008067          	ret
        ret = cap - head + tail;
    80003460:	0004a703          	lw	a4,0(s1)
    80003464:	4127093b          	subw	s2,a4,s2
    80003468:	00f9093b          	addw	s2,s2,a5
    8000346c:	fc1ff06f          	j	8000342c <_ZN9BufferCPP6getCntEv+0x44>

0000000080003470 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80003470:	fe010113          	addi	sp,sp,-32
    80003474:	00113c23          	sd	ra,24(sp)
    80003478:	00813823          	sd	s0,16(sp)
    8000347c:	00913423          	sd	s1,8(sp)
    80003480:	02010413          	addi	s0,sp,32
    80003484:	00050493          	mv	s1,a0
    Console::putc('\n');
    80003488:	00a00513          	li	a0,10
    8000348c:	fffff097          	auipc	ra,0xfffff
    80003490:	b54080e7          	jalr	-1196(ra) # 80001fe0 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80003494:	00003517          	auipc	a0,0x3
    80003498:	b8c50513          	addi	a0,a0,-1140 # 80006020 <CONSOLE_STATUS+0x10>
    8000349c:	00000097          	auipc	ra,0x0
    800034a0:	a30080e7          	jalr	-1488(ra) # 80002ecc <_Z11printStringPKc>
    while (getCnt()) {
    800034a4:	00048513          	mv	a0,s1
    800034a8:	00000097          	auipc	ra,0x0
    800034ac:	f40080e7          	jalr	-192(ra) # 800033e8 <_ZN9BufferCPP6getCntEv>
    800034b0:	02050c63          	beqz	a0,800034e8 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800034b4:	0084b783          	ld	a5,8(s1)
    800034b8:	0104a703          	lw	a4,16(s1)
    800034bc:	00271713          	slli	a4,a4,0x2
    800034c0:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    800034c4:	0007c503          	lbu	a0,0(a5)
    800034c8:	fffff097          	auipc	ra,0xfffff
    800034cc:	b18080e7          	jalr	-1256(ra) # 80001fe0 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800034d0:	0104a783          	lw	a5,16(s1)
    800034d4:	0017879b          	addiw	a5,a5,1
    800034d8:	0004a703          	lw	a4,0(s1)
    800034dc:	02e7e7bb          	remw	a5,a5,a4
    800034e0:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800034e4:	fc1ff06f          	j	800034a4 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800034e8:	02100513          	li	a0,33
    800034ec:	fffff097          	auipc	ra,0xfffff
    800034f0:	af4080e7          	jalr	-1292(ra) # 80001fe0 <_ZN7Console4putcEc>
    Console::putc('\n');
    800034f4:	00a00513          	li	a0,10
    800034f8:	fffff097          	auipc	ra,0xfffff
    800034fc:	ae8080e7          	jalr	-1304(ra) # 80001fe0 <_ZN7Console4putcEc>
    mem_free(buffer);
    80003500:	0084b503          	ld	a0,8(s1)
    80003504:	ffffe097          	auipc	ra,0xffffe
    80003508:	c90080e7          	jalr	-880(ra) # 80001194 <_Z8mem_freePv>
    delete itemAvailable;
    8000350c:	0204b503          	ld	a0,32(s1)
    80003510:	00050863          	beqz	a0,80003520 <_ZN9BufferCPPD1Ev+0xb0>
    80003514:	00053783          	ld	a5,0(a0)
    80003518:	0087b783          	ld	a5,8(a5)
    8000351c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80003520:	0184b503          	ld	a0,24(s1)
    80003524:	00050863          	beqz	a0,80003534 <_ZN9BufferCPPD1Ev+0xc4>
    80003528:	00053783          	ld	a5,0(a0)
    8000352c:	0087b783          	ld	a5,8(a5)
    80003530:	000780e7          	jalr	a5
    delete mutexTail;
    80003534:	0304b503          	ld	a0,48(s1)
    80003538:	00050863          	beqz	a0,80003548 <_ZN9BufferCPPD1Ev+0xd8>
    8000353c:	00053783          	ld	a5,0(a0)
    80003540:	0087b783          	ld	a5,8(a5)
    80003544:	000780e7          	jalr	a5
    delete mutexHead;
    80003548:	0284b503          	ld	a0,40(s1)
    8000354c:	00050863          	beqz	a0,8000355c <_ZN9BufferCPPD1Ev+0xec>
    80003550:	00053783          	ld	a5,0(a0)
    80003554:	0087b783          	ld	a5,8(a5)
    80003558:	000780e7          	jalr	a5
}
    8000355c:	01813083          	ld	ra,24(sp)
    80003560:	01013403          	ld	s0,16(sp)
    80003564:	00813483          	ld	s1,8(sp)
    80003568:	02010113          	addi	sp,sp,32
    8000356c:	00008067          	ret

0000000080003570 <start>:
    80003570:	ff010113          	addi	sp,sp,-16
    80003574:	00813423          	sd	s0,8(sp)
    80003578:	01010413          	addi	s0,sp,16
    8000357c:	300027f3          	csrr	a5,mstatus
    80003580:	ffffe737          	lui	a4,0xffffe
    80003584:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff627f>
    80003588:	00e7f7b3          	and	a5,a5,a4
    8000358c:	00001737          	lui	a4,0x1
    80003590:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80003594:	00e7e7b3          	or	a5,a5,a4
    80003598:	30079073          	csrw	mstatus,a5
    8000359c:	00000797          	auipc	a5,0x0
    800035a0:	16078793          	addi	a5,a5,352 # 800036fc <system_main>
    800035a4:	34179073          	csrw	mepc,a5
    800035a8:	00000793          	li	a5,0
    800035ac:	18079073          	csrw	satp,a5
    800035b0:	000107b7          	lui	a5,0x10
    800035b4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800035b8:	30279073          	csrw	medeleg,a5
    800035bc:	30379073          	csrw	mideleg,a5
    800035c0:	104027f3          	csrr	a5,sie
    800035c4:	2227e793          	ori	a5,a5,546
    800035c8:	10479073          	csrw	sie,a5
    800035cc:	fff00793          	li	a5,-1
    800035d0:	00a7d793          	srli	a5,a5,0xa
    800035d4:	3b079073          	csrw	pmpaddr0,a5
    800035d8:	00f00793          	li	a5,15
    800035dc:	3a079073          	csrw	pmpcfg0,a5
    800035e0:	f14027f3          	csrr	a5,mhartid
    800035e4:	0200c737          	lui	a4,0x200c
    800035e8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800035ec:	0007869b          	sext.w	a3,a5
    800035f0:	00269713          	slli	a4,a3,0x2
    800035f4:	000f4637          	lui	a2,0xf4
    800035f8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800035fc:	00d70733          	add	a4,a4,a3
    80003600:	0037979b          	slliw	a5,a5,0x3
    80003604:	020046b7          	lui	a3,0x2004
    80003608:	00d787b3          	add	a5,a5,a3
    8000360c:	00c585b3          	add	a1,a1,a2
    80003610:	00371693          	slli	a3,a4,0x3
    80003614:	00004717          	auipc	a4,0x4
    80003618:	d0c70713          	addi	a4,a4,-756 # 80007320 <timer_scratch>
    8000361c:	00b7b023          	sd	a1,0(a5)
    80003620:	00d70733          	add	a4,a4,a3
    80003624:	00f73c23          	sd	a5,24(a4)
    80003628:	02c73023          	sd	a2,32(a4)
    8000362c:	34071073          	csrw	mscratch,a4
    80003630:	00000797          	auipc	a5,0x0
    80003634:	6e078793          	addi	a5,a5,1760 # 80003d10 <timervec>
    80003638:	30579073          	csrw	mtvec,a5
    8000363c:	300027f3          	csrr	a5,mstatus
    80003640:	0087e793          	ori	a5,a5,8
    80003644:	30079073          	csrw	mstatus,a5
    80003648:	304027f3          	csrr	a5,mie
    8000364c:	0807e793          	ori	a5,a5,128
    80003650:	30479073          	csrw	mie,a5
    80003654:	f14027f3          	csrr	a5,mhartid
    80003658:	0007879b          	sext.w	a5,a5
    8000365c:	00078213          	mv	tp,a5
    80003660:	30200073          	mret
    80003664:	00813403          	ld	s0,8(sp)
    80003668:	01010113          	addi	sp,sp,16
    8000366c:	00008067          	ret

0000000080003670 <timerinit>:
    80003670:	ff010113          	addi	sp,sp,-16
    80003674:	00813423          	sd	s0,8(sp)
    80003678:	01010413          	addi	s0,sp,16
    8000367c:	f14027f3          	csrr	a5,mhartid
    80003680:	0200c737          	lui	a4,0x200c
    80003684:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003688:	0007869b          	sext.w	a3,a5
    8000368c:	00269713          	slli	a4,a3,0x2
    80003690:	000f4637          	lui	a2,0xf4
    80003694:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003698:	00d70733          	add	a4,a4,a3
    8000369c:	0037979b          	slliw	a5,a5,0x3
    800036a0:	020046b7          	lui	a3,0x2004
    800036a4:	00d787b3          	add	a5,a5,a3
    800036a8:	00c585b3          	add	a1,a1,a2
    800036ac:	00371693          	slli	a3,a4,0x3
    800036b0:	00004717          	auipc	a4,0x4
    800036b4:	c7070713          	addi	a4,a4,-912 # 80007320 <timer_scratch>
    800036b8:	00b7b023          	sd	a1,0(a5)
    800036bc:	00d70733          	add	a4,a4,a3
    800036c0:	00f73c23          	sd	a5,24(a4)
    800036c4:	02c73023          	sd	a2,32(a4)
    800036c8:	34071073          	csrw	mscratch,a4
    800036cc:	00000797          	auipc	a5,0x0
    800036d0:	64478793          	addi	a5,a5,1604 # 80003d10 <timervec>
    800036d4:	30579073          	csrw	mtvec,a5
    800036d8:	300027f3          	csrr	a5,mstatus
    800036dc:	0087e793          	ori	a5,a5,8
    800036e0:	30079073          	csrw	mstatus,a5
    800036e4:	304027f3          	csrr	a5,mie
    800036e8:	0807e793          	ori	a5,a5,128
    800036ec:	30479073          	csrw	mie,a5
    800036f0:	00813403          	ld	s0,8(sp)
    800036f4:	01010113          	addi	sp,sp,16
    800036f8:	00008067          	ret

00000000800036fc <system_main>:
    800036fc:	fe010113          	addi	sp,sp,-32
    80003700:	00813823          	sd	s0,16(sp)
    80003704:	00913423          	sd	s1,8(sp)
    80003708:	00113c23          	sd	ra,24(sp)
    8000370c:	02010413          	addi	s0,sp,32
    80003710:	00000097          	auipc	ra,0x0
    80003714:	0c4080e7          	jalr	196(ra) # 800037d4 <cpuid>
    80003718:	00004497          	auipc	s1,0x4
    8000371c:	b5848493          	addi	s1,s1,-1192 # 80007270 <started>
    80003720:	02050263          	beqz	a0,80003744 <system_main+0x48>
    80003724:	0004a783          	lw	a5,0(s1)
    80003728:	0007879b          	sext.w	a5,a5
    8000372c:	fe078ce3          	beqz	a5,80003724 <system_main+0x28>
    80003730:	0ff0000f          	fence
    80003734:	00003517          	auipc	a0,0x3
    80003738:	93450513          	addi	a0,a0,-1740 # 80006068 <CONSOLE_STATUS+0x58>
    8000373c:	00001097          	auipc	ra,0x1
    80003740:	a70080e7          	jalr	-1424(ra) # 800041ac <panic>
    80003744:	00001097          	auipc	ra,0x1
    80003748:	9c4080e7          	jalr	-1596(ra) # 80004108 <consoleinit>
    8000374c:	00001097          	auipc	ra,0x1
    80003750:	150080e7          	jalr	336(ra) # 8000489c <printfinit>
    80003754:	00003517          	auipc	a0,0x3
    80003758:	9f450513          	addi	a0,a0,-1548 # 80006148 <CONSOLE_STATUS+0x138>
    8000375c:	00001097          	auipc	ra,0x1
    80003760:	aac080e7          	jalr	-1364(ra) # 80004208 <__printf>
    80003764:	00003517          	auipc	a0,0x3
    80003768:	8d450513          	addi	a0,a0,-1836 # 80006038 <CONSOLE_STATUS+0x28>
    8000376c:	00001097          	auipc	ra,0x1
    80003770:	a9c080e7          	jalr	-1380(ra) # 80004208 <__printf>
    80003774:	00003517          	auipc	a0,0x3
    80003778:	9d450513          	addi	a0,a0,-1580 # 80006148 <CONSOLE_STATUS+0x138>
    8000377c:	00001097          	auipc	ra,0x1
    80003780:	a8c080e7          	jalr	-1396(ra) # 80004208 <__printf>
    80003784:	00001097          	auipc	ra,0x1
    80003788:	4a4080e7          	jalr	1188(ra) # 80004c28 <kinit>
    8000378c:	00000097          	auipc	ra,0x0
    80003790:	148080e7          	jalr	328(ra) # 800038d4 <trapinit>
    80003794:	00000097          	auipc	ra,0x0
    80003798:	16c080e7          	jalr	364(ra) # 80003900 <trapinithart>
    8000379c:	00000097          	auipc	ra,0x0
    800037a0:	5b4080e7          	jalr	1460(ra) # 80003d50 <plicinit>
    800037a4:	00000097          	auipc	ra,0x0
    800037a8:	5d4080e7          	jalr	1492(ra) # 80003d78 <plicinithart>
    800037ac:	00000097          	auipc	ra,0x0
    800037b0:	078080e7          	jalr	120(ra) # 80003824 <userinit>
    800037b4:	0ff0000f          	fence
    800037b8:	00100793          	li	a5,1
    800037bc:	00003517          	auipc	a0,0x3
    800037c0:	89450513          	addi	a0,a0,-1900 # 80006050 <CONSOLE_STATUS+0x40>
    800037c4:	00f4a023          	sw	a5,0(s1)
    800037c8:	00001097          	auipc	ra,0x1
    800037cc:	a40080e7          	jalr	-1472(ra) # 80004208 <__printf>
    800037d0:	0000006f          	j	800037d0 <system_main+0xd4>

00000000800037d4 <cpuid>:
    800037d4:	ff010113          	addi	sp,sp,-16
    800037d8:	00813423          	sd	s0,8(sp)
    800037dc:	01010413          	addi	s0,sp,16
    800037e0:	00020513          	mv	a0,tp
    800037e4:	00813403          	ld	s0,8(sp)
    800037e8:	0005051b          	sext.w	a0,a0
    800037ec:	01010113          	addi	sp,sp,16
    800037f0:	00008067          	ret

00000000800037f4 <mycpu>:
    800037f4:	ff010113          	addi	sp,sp,-16
    800037f8:	00813423          	sd	s0,8(sp)
    800037fc:	01010413          	addi	s0,sp,16
    80003800:	00020793          	mv	a5,tp
    80003804:	00813403          	ld	s0,8(sp)
    80003808:	0007879b          	sext.w	a5,a5
    8000380c:	00779793          	slli	a5,a5,0x7
    80003810:	00005517          	auipc	a0,0x5
    80003814:	b4050513          	addi	a0,a0,-1216 # 80008350 <cpus>
    80003818:	00f50533          	add	a0,a0,a5
    8000381c:	01010113          	addi	sp,sp,16
    80003820:	00008067          	ret

0000000080003824 <userinit>:
    80003824:	ff010113          	addi	sp,sp,-16
    80003828:	00813423          	sd	s0,8(sp)
    8000382c:	01010413          	addi	s0,sp,16
    80003830:	00813403          	ld	s0,8(sp)
    80003834:	01010113          	addi	sp,sp,16
    80003838:	ffffe317          	auipc	t1,0xffffe
    8000383c:	16030067          	jr	352(t1) # 80001998 <main>

0000000080003840 <either_copyout>:
    80003840:	ff010113          	addi	sp,sp,-16
    80003844:	00813023          	sd	s0,0(sp)
    80003848:	00113423          	sd	ra,8(sp)
    8000384c:	01010413          	addi	s0,sp,16
    80003850:	02051663          	bnez	a0,8000387c <either_copyout+0x3c>
    80003854:	00058513          	mv	a0,a1
    80003858:	00060593          	mv	a1,a2
    8000385c:	0006861b          	sext.w	a2,a3
    80003860:	00002097          	auipc	ra,0x2
    80003864:	c54080e7          	jalr	-940(ra) # 800054b4 <__memmove>
    80003868:	00813083          	ld	ra,8(sp)
    8000386c:	00013403          	ld	s0,0(sp)
    80003870:	00000513          	li	a0,0
    80003874:	01010113          	addi	sp,sp,16
    80003878:	00008067          	ret
    8000387c:	00003517          	auipc	a0,0x3
    80003880:	81450513          	addi	a0,a0,-2028 # 80006090 <CONSOLE_STATUS+0x80>
    80003884:	00001097          	auipc	ra,0x1
    80003888:	928080e7          	jalr	-1752(ra) # 800041ac <panic>

000000008000388c <either_copyin>:
    8000388c:	ff010113          	addi	sp,sp,-16
    80003890:	00813023          	sd	s0,0(sp)
    80003894:	00113423          	sd	ra,8(sp)
    80003898:	01010413          	addi	s0,sp,16
    8000389c:	02059463          	bnez	a1,800038c4 <either_copyin+0x38>
    800038a0:	00060593          	mv	a1,a2
    800038a4:	0006861b          	sext.w	a2,a3
    800038a8:	00002097          	auipc	ra,0x2
    800038ac:	c0c080e7          	jalr	-1012(ra) # 800054b4 <__memmove>
    800038b0:	00813083          	ld	ra,8(sp)
    800038b4:	00013403          	ld	s0,0(sp)
    800038b8:	00000513          	li	a0,0
    800038bc:	01010113          	addi	sp,sp,16
    800038c0:	00008067          	ret
    800038c4:	00002517          	auipc	a0,0x2
    800038c8:	7f450513          	addi	a0,a0,2036 # 800060b8 <CONSOLE_STATUS+0xa8>
    800038cc:	00001097          	auipc	ra,0x1
    800038d0:	8e0080e7          	jalr	-1824(ra) # 800041ac <panic>

00000000800038d4 <trapinit>:
    800038d4:	ff010113          	addi	sp,sp,-16
    800038d8:	00813423          	sd	s0,8(sp)
    800038dc:	01010413          	addi	s0,sp,16
    800038e0:	00813403          	ld	s0,8(sp)
    800038e4:	00002597          	auipc	a1,0x2
    800038e8:	7fc58593          	addi	a1,a1,2044 # 800060e0 <CONSOLE_STATUS+0xd0>
    800038ec:	00005517          	auipc	a0,0x5
    800038f0:	ae450513          	addi	a0,a0,-1308 # 800083d0 <tickslock>
    800038f4:	01010113          	addi	sp,sp,16
    800038f8:	00001317          	auipc	t1,0x1
    800038fc:	5c030067          	jr	1472(t1) # 80004eb8 <initlock>

0000000080003900 <trapinithart>:
    80003900:	ff010113          	addi	sp,sp,-16
    80003904:	00813423          	sd	s0,8(sp)
    80003908:	01010413          	addi	s0,sp,16
    8000390c:	00000797          	auipc	a5,0x0
    80003910:	2f478793          	addi	a5,a5,756 # 80003c00 <kernelvec>
    80003914:	10579073          	csrw	stvec,a5
    80003918:	00813403          	ld	s0,8(sp)
    8000391c:	01010113          	addi	sp,sp,16
    80003920:	00008067          	ret

0000000080003924 <usertrap>:
    80003924:	ff010113          	addi	sp,sp,-16
    80003928:	00813423          	sd	s0,8(sp)
    8000392c:	01010413          	addi	s0,sp,16
    80003930:	00813403          	ld	s0,8(sp)
    80003934:	01010113          	addi	sp,sp,16
    80003938:	00008067          	ret

000000008000393c <usertrapret>:
    8000393c:	ff010113          	addi	sp,sp,-16
    80003940:	00813423          	sd	s0,8(sp)
    80003944:	01010413          	addi	s0,sp,16
    80003948:	00813403          	ld	s0,8(sp)
    8000394c:	01010113          	addi	sp,sp,16
    80003950:	00008067          	ret

0000000080003954 <kerneltrap>:
    80003954:	fe010113          	addi	sp,sp,-32
    80003958:	00813823          	sd	s0,16(sp)
    8000395c:	00113c23          	sd	ra,24(sp)
    80003960:	00913423          	sd	s1,8(sp)
    80003964:	02010413          	addi	s0,sp,32
    80003968:	142025f3          	csrr	a1,scause
    8000396c:	100027f3          	csrr	a5,sstatus
    80003970:	0027f793          	andi	a5,a5,2
    80003974:	10079c63          	bnez	a5,80003a8c <kerneltrap+0x138>
    80003978:	142027f3          	csrr	a5,scause
    8000397c:	0207ce63          	bltz	a5,800039b8 <kerneltrap+0x64>
    80003980:	00002517          	auipc	a0,0x2
    80003984:	7a850513          	addi	a0,a0,1960 # 80006128 <CONSOLE_STATUS+0x118>
    80003988:	00001097          	auipc	ra,0x1
    8000398c:	880080e7          	jalr	-1920(ra) # 80004208 <__printf>
    80003990:	141025f3          	csrr	a1,sepc
    80003994:	14302673          	csrr	a2,stval
    80003998:	00002517          	auipc	a0,0x2
    8000399c:	7a050513          	addi	a0,a0,1952 # 80006138 <CONSOLE_STATUS+0x128>
    800039a0:	00001097          	auipc	ra,0x1
    800039a4:	868080e7          	jalr	-1944(ra) # 80004208 <__printf>
    800039a8:	00002517          	auipc	a0,0x2
    800039ac:	7a850513          	addi	a0,a0,1960 # 80006150 <CONSOLE_STATUS+0x140>
    800039b0:	00000097          	auipc	ra,0x0
    800039b4:	7fc080e7          	jalr	2044(ra) # 800041ac <panic>
    800039b8:	0ff7f713          	andi	a4,a5,255
    800039bc:	00900693          	li	a3,9
    800039c0:	04d70063          	beq	a4,a3,80003a00 <kerneltrap+0xac>
    800039c4:	fff00713          	li	a4,-1
    800039c8:	03f71713          	slli	a4,a4,0x3f
    800039cc:	00170713          	addi	a4,a4,1
    800039d0:	fae798e3          	bne	a5,a4,80003980 <kerneltrap+0x2c>
    800039d4:	00000097          	auipc	ra,0x0
    800039d8:	e00080e7          	jalr	-512(ra) # 800037d4 <cpuid>
    800039dc:	06050663          	beqz	a0,80003a48 <kerneltrap+0xf4>
    800039e0:	144027f3          	csrr	a5,sip
    800039e4:	ffd7f793          	andi	a5,a5,-3
    800039e8:	14479073          	csrw	sip,a5
    800039ec:	01813083          	ld	ra,24(sp)
    800039f0:	01013403          	ld	s0,16(sp)
    800039f4:	00813483          	ld	s1,8(sp)
    800039f8:	02010113          	addi	sp,sp,32
    800039fc:	00008067          	ret
    80003a00:	00000097          	auipc	ra,0x0
    80003a04:	3c4080e7          	jalr	964(ra) # 80003dc4 <plic_claim>
    80003a08:	00a00793          	li	a5,10
    80003a0c:	00050493          	mv	s1,a0
    80003a10:	06f50863          	beq	a0,a5,80003a80 <kerneltrap+0x12c>
    80003a14:	fc050ce3          	beqz	a0,800039ec <kerneltrap+0x98>
    80003a18:	00050593          	mv	a1,a0
    80003a1c:	00002517          	auipc	a0,0x2
    80003a20:	6ec50513          	addi	a0,a0,1772 # 80006108 <CONSOLE_STATUS+0xf8>
    80003a24:	00000097          	auipc	ra,0x0
    80003a28:	7e4080e7          	jalr	2020(ra) # 80004208 <__printf>
    80003a2c:	01013403          	ld	s0,16(sp)
    80003a30:	01813083          	ld	ra,24(sp)
    80003a34:	00048513          	mv	a0,s1
    80003a38:	00813483          	ld	s1,8(sp)
    80003a3c:	02010113          	addi	sp,sp,32
    80003a40:	00000317          	auipc	t1,0x0
    80003a44:	3bc30067          	jr	956(t1) # 80003dfc <plic_complete>
    80003a48:	00005517          	auipc	a0,0x5
    80003a4c:	98850513          	addi	a0,a0,-1656 # 800083d0 <tickslock>
    80003a50:	00001097          	auipc	ra,0x1
    80003a54:	48c080e7          	jalr	1164(ra) # 80004edc <acquire>
    80003a58:	00004717          	auipc	a4,0x4
    80003a5c:	81c70713          	addi	a4,a4,-2020 # 80007274 <ticks>
    80003a60:	00072783          	lw	a5,0(a4)
    80003a64:	00005517          	auipc	a0,0x5
    80003a68:	96c50513          	addi	a0,a0,-1684 # 800083d0 <tickslock>
    80003a6c:	0017879b          	addiw	a5,a5,1
    80003a70:	00f72023          	sw	a5,0(a4)
    80003a74:	00001097          	auipc	ra,0x1
    80003a78:	534080e7          	jalr	1332(ra) # 80004fa8 <release>
    80003a7c:	f65ff06f          	j	800039e0 <kerneltrap+0x8c>
    80003a80:	00001097          	auipc	ra,0x1
    80003a84:	090080e7          	jalr	144(ra) # 80004b10 <uartintr>
    80003a88:	fa5ff06f          	j	80003a2c <kerneltrap+0xd8>
    80003a8c:	00002517          	auipc	a0,0x2
    80003a90:	65c50513          	addi	a0,a0,1628 # 800060e8 <CONSOLE_STATUS+0xd8>
    80003a94:	00000097          	auipc	ra,0x0
    80003a98:	718080e7          	jalr	1816(ra) # 800041ac <panic>

0000000080003a9c <clockintr>:
    80003a9c:	fe010113          	addi	sp,sp,-32
    80003aa0:	00813823          	sd	s0,16(sp)
    80003aa4:	00913423          	sd	s1,8(sp)
    80003aa8:	00113c23          	sd	ra,24(sp)
    80003aac:	02010413          	addi	s0,sp,32
    80003ab0:	00005497          	auipc	s1,0x5
    80003ab4:	92048493          	addi	s1,s1,-1760 # 800083d0 <tickslock>
    80003ab8:	00048513          	mv	a0,s1
    80003abc:	00001097          	auipc	ra,0x1
    80003ac0:	420080e7          	jalr	1056(ra) # 80004edc <acquire>
    80003ac4:	00003717          	auipc	a4,0x3
    80003ac8:	7b070713          	addi	a4,a4,1968 # 80007274 <ticks>
    80003acc:	00072783          	lw	a5,0(a4)
    80003ad0:	01013403          	ld	s0,16(sp)
    80003ad4:	01813083          	ld	ra,24(sp)
    80003ad8:	00048513          	mv	a0,s1
    80003adc:	0017879b          	addiw	a5,a5,1
    80003ae0:	00813483          	ld	s1,8(sp)
    80003ae4:	00f72023          	sw	a5,0(a4)
    80003ae8:	02010113          	addi	sp,sp,32
    80003aec:	00001317          	auipc	t1,0x1
    80003af0:	4bc30067          	jr	1212(t1) # 80004fa8 <release>

0000000080003af4 <devintr>:
    80003af4:	142027f3          	csrr	a5,scause
    80003af8:	00000513          	li	a0,0
    80003afc:	0007c463          	bltz	a5,80003b04 <devintr+0x10>
    80003b00:	00008067          	ret
    80003b04:	fe010113          	addi	sp,sp,-32
    80003b08:	00813823          	sd	s0,16(sp)
    80003b0c:	00113c23          	sd	ra,24(sp)
    80003b10:	00913423          	sd	s1,8(sp)
    80003b14:	02010413          	addi	s0,sp,32
    80003b18:	0ff7f713          	andi	a4,a5,255
    80003b1c:	00900693          	li	a3,9
    80003b20:	04d70c63          	beq	a4,a3,80003b78 <devintr+0x84>
    80003b24:	fff00713          	li	a4,-1
    80003b28:	03f71713          	slli	a4,a4,0x3f
    80003b2c:	00170713          	addi	a4,a4,1
    80003b30:	00e78c63          	beq	a5,a4,80003b48 <devintr+0x54>
    80003b34:	01813083          	ld	ra,24(sp)
    80003b38:	01013403          	ld	s0,16(sp)
    80003b3c:	00813483          	ld	s1,8(sp)
    80003b40:	02010113          	addi	sp,sp,32
    80003b44:	00008067          	ret
    80003b48:	00000097          	auipc	ra,0x0
    80003b4c:	c8c080e7          	jalr	-884(ra) # 800037d4 <cpuid>
    80003b50:	06050663          	beqz	a0,80003bbc <devintr+0xc8>
    80003b54:	144027f3          	csrr	a5,sip
    80003b58:	ffd7f793          	andi	a5,a5,-3
    80003b5c:	14479073          	csrw	sip,a5
    80003b60:	01813083          	ld	ra,24(sp)
    80003b64:	01013403          	ld	s0,16(sp)
    80003b68:	00813483          	ld	s1,8(sp)
    80003b6c:	00200513          	li	a0,2
    80003b70:	02010113          	addi	sp,sp,32
    80003b74:	00008067          	ret
    80003b78:	00000097          	auipc	ra,0x0
    80003b7c:	24c080e7          	jalr	588(ra) # 80003dc4 <plic_claim>
    80003b80:	00a00793          	li	a5,10
    80003b84:	00050493          	mv	s1,a0
    80003b88:	06f50663          	beq	a0,a5,80003bf4 <devintr+0x100>
    80003b8c:	00100513          	li	a0,1
    80003b90:	fa0482e3          	beqz	s1,80003b34 <devintr+0x40>
    80003b94:	00048593          	mv	a1,s1
    80003b98:	00002517          	auipc	a0,0x2
    80003b9c:	57050513          	addi	a0,a0,1392 # 80006108 <CONSOLE_STATUS+0xf8>
    80003ba0:	00000097          	auipc	ra,0x0
    80003ba4:	668080e7          	jalr	1640(ra) # 80004208 <__printf>
    80003ba8:	00048513          	mv	a0,s1
    80003bac:	00000097          	auipc	ra,0x0
    80003bb0:	250080e7          	jalr	592(ra) # 80003dfc <plic_complete>
    80003bb4:	00100513          	li	a0,1
    80003bb8:	f7dff06f          	j	80003b34 <devintr+0x40>
    80003bbc:	00005517          	auipc	a0,0x5
    80003bc0:	81450513          	addi	a0,a0,-2028 # 800083d0 <tickslock>
    80003bc4:	00001097          	auipc	ra,0x1
    80003bc8:	318080e7          	jalr	792(ra) # 80004edc <acquire>
    80003bcc:	00003717          	auipc	a4,0x3
    80003bd0:	6a870713          	addi	a4,a4,1704 # 80007274 <ticks>
    80003bd4:	00072783          	lw	a5,0(a4)
    80003bd8:	00004517          	auipc	a0,0x4
    80003bdc:	7f850513          	addi	a0,a0,2040 # 800083d0 <tickslock>
    80003be0:	0017879b          	addiw	a5,a5,1
    80003be4:	00f72023          	sw	a5,0(a4)
    80003be8:	00001097          	auipc	ra,0x1
    80003bec:	3c0080e7          	jalr	960(ra) # 80004fa8 <release>
    80003bf0:	f65ff06f          	j	80003b54 <devintr+0x60>
    80003bf4:	00001097          	auipc	ra,0x1
    80003bf8:	f1c080e7          	jalr	-228(ra) # 80004b10 <uartintr>
    80003bfc:	fadff06f          	j	80003ba8 <devintr+0xb4>

0000000080003c00 <kernelvec>:
    80003c00:	f0010113          	addi	sp,sp,-256
    80003c04:	00113023          	sd	ra,0(sp)
    80003c08:	00213423          	sd	sp,8(sp)
    80003c0c:	00313823          	sd	gp,16(sp)
    80003c10:	00413c23          	sd	tp,24(sp)
    80003c14:	02513023          	sd	t0,32(sp)
    80003c18:	02613423          	sd	t1,40(sp)
    80003c1c:	02713823          	sd	t2,48(sp)
    80003c20:	02813c23          	sd	s0,56(sp)
    80003c24:	04913023          	sd	s1,64(sp)
    80003c28:	04a13423          	sd	a0,72(sp)
    80003c2c:	04b13823          	sd	a1,80(sp)
    80003c30:	04c13c23          	sd	a2,88(sp)
    80003c34:	06d13023          	sd	a3,96(sp)
    80003c38:	06e13423          	sd	a4,104(sp)
    80003c3c:	06f13823          	sd	a5,112(sp)
    80003c40:	07013c23          	sd	a6,120(sp)
    80003c44:	09113023          	sd	a7,128(sp)
    80003c48:	09213423          	sd	s2,136(sp)
    80003c4c:	09313823          	sd	s3,144(sp)
    80003c50:	09413c23          	sd	s4,152(sp)
    80003c54:	0b513023          	sd	s5,160(sp)
    80003c58:	0b613423          	sd	s6,168(sp)
    80003c5c:	0b713823          	sd	s7,176(sp)
    80003c60:	0b813c23          	sd	s8,184(sp)
    80003c64:	0d913023          	sd	s9,192(sp)
    80003c68:	0da13423          	sd	s10,200(sp)
    80003c6c:	0db13823          	sd	s11,208(sp)
    80003c70:	0dc13c23          	sd	t3,216(sp)
    80003c74:	0fd13023          	sd	t4,224(sp)
    80003c78:	0fe13423          	sd	t5,232(sp)
    80003c7c:	0ff13823          	sd	t6,240(sp)
    80003c80:	cd5ff0ef          	jal	ra,80003954 <kerneltrap>
    80003c84:	00013083          	ld	ra,0(sp)
    80003c88:	00813103          	ld	sp,8(sp)
    80003c8c:	01013183          	ld	gp,16(sp)
    80003c90:	02013283          	ld	t0,32(sp)
    80003c94:	02813303          	ld	t1,40(sp)
    80003c98:	03013383          	ld	t2,48(sp)
    80003c9c:	03813403          	ld	s0,56(sp)
    80003ca0:	04013483          	ld	s1,64(sp)
    80003ca4:	04813503          	ld	a0,72(sp)
    80003ca8:	05013583          	ld	a1,80(sp)
    80003cac:	05813603          	ld	a2,88(sp)
    80003cb0:	06013683          	ld	a3,96(sp)
    80003cb4:	06813703          	ld	a4,104(sp)
    80003cb8:	07013783          	ld	a5,112(sp)
    80003cbc:	07813803          	ld	a6,120(sp)
    80003cc0:	08013883          	ld	a7,128(sp)
    80003cc4:	08813903          	ld	s2,136(sp)
    80003cc8:	09013983          	ld	s3,144(sp)
    80003ccc:	09813a03          	ld	s4,152(sp)
    80003cd0:	0a013a83          	ld	s5,160(sp)
    80003cd4:	0a813b03          	ld	s6,168(sp)
    80003cd8:	0b013b83          	ld	s7,176(sp)
    80003cdc:	0b813c03          	ld	s8,184(sp)
    80003ce0:	0c013c83          	ld	s9,192(sp)
    80003ce4:	0c813d03          	ld	s10,200(sp)
    80003ce8:	0d013d83          	ld	s11,208(sp)
    80003cec:	0d813e03          	ld	t3,216(sp)
    80003cf0:	0e013e83          	ld	t4,224(sp)
    80003cf4:	0e813f03          	ld	t5,232(sp)
    80003cf8:	0f013f83          	ld	t6,240(sp)
    80003cfc:	10010113          	addi	sp,sp,256
    80003d00:	10200073          	sret
    80003d04:	00000013          	nop
    80003d08:	00000013          	nop
    80003d0c:	00000013          	nop

0000000080003d10 <timervec>:
    80003d10:	34051573          	csrrw	a0,mscratch,a0
    80003d14:	00b53023          	sd	a1,0(a0)
    80003d18:	00c53423          	sd	a2,8(a0)
    80003d1c:	00d53823          	sd	a3,16(a0)
    80003d20:	01853583          	ld	a1,24(a0)
    80003d24:	02053603          	ld	a2,32(a0)
    80003d28:	0005b683          	ld	a3,0(a1)
    80003d2c:	00c686b3          	add	a3,a3,a2
    80003d30:	00d5b023          	sd	a3,0(a1)
    80003d34:	00200593          	li	a1,2
    80003d38:	14459073          	csrw	sip,a1
    80003d3c:	01053683          	ld	a3,16(a0)
    80003d40:	00853603          	ld	a2,8(a0)
    80003d44:	00053583          	ld	a1,0(a0)
    80003d48:	34051573          	csrrw	a0,mscratch,a0
    80003d4c:	30200073          	mret

0000000080003d50 <plicinit>:
    80003d50:	ff010113          	addi	sp,sp,-16
    80003d54:	00813423          	sd	s0,8(sp)
    80003d58:	01010413          	addi	s0,sp,16
    80003d5c:	00813403          	ld	s0,8(sp)
    80003d60:	0c0007b7          	lui	a5,0xc000
    80003d64:	00100713          	li	a4,1
    80003d68:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80003d6c:	00e7a223          	sw	a4,4(a5)
    80003d70:	01010113          	addi	sp,sp,16
    80003d74:	00008067          	ret

0000000080003d78 <plicinithart>:
    80003d78:	ff010113          	addi	sp,sp,-16
    80003d7c:	00813023          	sd	s0,0(sp)
    80003d80:	00113423          	sd	ra,8(sp)
    80003d84:	01010413          	addi	s0,sp,16
    80003d88:	00000097          	auipc	ra,0x0
    80003d8c:	a4c080e7          	jalr	-1460(ra) # 800037d4 <cpuid>
    80003d90:	0085171b          	slliw	a4,a0,0x8
    80003d94:	0c0027b7          	lui	a5,0xc002
    80003d98:	00e787b3          	add	a5,a5,a4
    80003d9c:	40200713          	li	a4,1026
    80003da0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003da4:	00813083          	ld	ra,8(sp)
    80003da8:	00013403          	ld	s0,0(sp)
    80003dac:	00d5151b          	slliw	a0,a0,0xd
    80003db0:	0c2017b7          	lui	a5,0xc201
    80003db4:	00a78533          	add	a0,a5,a0
    80003db8:	00052023          	sw	zero,0(a0)
    80003dbc:	01010113          	addi	sp,sp,16
    80003dc0:	00008067          	ret

0000000080003dc4 <plic_claim>:
    80003dc4:	ff010113          	addi	sp,sp,-16
    80003dc8:	00813023          	sd	s0,0(sp)
    80003dcc:	00113423          	sd	ra,8(sp)
    80003dd0:	01010413          	addi	s0,sp,16
    80003dd4:	00000097          	auipc	ra,0x0
    80003dd8:	a00080e7          	jalr	-1536(ra) # 800037d4 <cpuid>
    80003ddc:	00813083          	ld	ra,8(sp)
    80003de0:	00013403          	ld	s0,0(sp)
    80003de4:	00d5151b          	slliw	a0,a0,0xd
    80003de8:	0c2017b7          	lui	a5,0xc201
    80003dec:	00a78533          	add	a0,a5,a0
    80003df0:	00452503          	lw	a0,4(a0)
    80003df4:	01010113          	addi	sp,sp,16
    80003df8:	00008067          	ret

0000000080003dfc <plic_complete>:
    80003dfc:	fe010113          	addi	sp,sp,-32
    80003e00:	00813823          	sd	s0,16(sp)
    80003e04:	00913423          	sd	s1,8(sp)
    80003e08:	00113c23          	sd	ra,24(sp)
    80003e0c:	02010413          	addi	s0,sp,32
    80003e10:	00050493          	mv	s1,a0
    80003e14:	00000097          	auipc	ra,0x0
    80003e18:	9c0080e7          	jalr	-1600(ra) # 800037d4 <cpuid>
    80003e1c:	01813083          	ld	ra,24(sp)
    80003e20:	01013403          	ld	s0,16(sp)
    80003e24:	00d5179b          	slliw	a5,a0,0xd
    80003e28:	0c201737          	lui	a4,0xc201
    80003e2c:	00f707b3          	add	a5,a4,a5
    80003e30:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80003e34:	00813483          	ld	s1,8(sp)
    80003e38:	02010113          	addi	sp,sp,32
    80003e3c:	00008067          	ret

0000000080003e40 <consolewrite>:
    80003e40:	fb010113          	addi	sp,sp,-80
    80003e44:	04813023          	sd	s0,64(sp)
    80003e48:	04113423          	sd	ra,72(sp)
    80003e4c:	02913c23          	sd	s1,56(sp)
    80003e50:	03213823          	sd	s2,48(sp)
    80003e54:	03313423          	sd	s3,40(sp)
    80003e58:	03413023          	sd	s4,32(sp)
    80003e5c:	01513c23          	sd	s5,24(sp)
    80003e60:	05010413          	addi	s0,sp,80
    80003e64:	06c05c63          	blez	a2,80003edc <consolewrite+0x9c>
    80003e68:	00060993          	mv	s3,a2
    80003e6c:	00050a13          	mv	s4,a0
    80003e70:	00058493          	mv	s1,a1
    80003e74:	00000913          	li	s2,0
    80003e78:	fff00a93          	li	s5,-1
    80003e7c:	01c0006f          	j	80003e98 <consolewrite+0x58>
    80003e80:	fbf44503          	lbu	a0,-65(s0)
    80003e84:	0019091b          	addiw	s2,s2,1
    80003e88:	00148493          	addi	s1,s1,1
    80003e8c:	00001097          	auipc	ra,0x1
    80003e90:	a9c080e7          	jalr	-1380(ra) # 80004928 <uartputc>
    80003e94:	03298063          	beq	s3,s2,80003eb4 <consolewrite+0x74>
    80003e98:	00048613          	mv	a2,s1
    80003e9c:	00100693          	li	a3,1
    80003ea0:	000a0593          	mv	a1,s4
    80003ea4:	fbf40513          	addi	a0,s0,-65
    80003ea8:	00000097          	auipc	ra,0x0
    80003eac:	9e4080e7          	jalr	-1564(ra) # 8000388c <either_copyin>
    80003eb0:	fd5518e3          	bne	a0,s5,80003e80 <consolewrite+0x40>
    80003eb4:	04813083          	ld	ra,72(sp)
    80003eb8:	04013403          	ld	s0,64(sp)
    80003ebc:	03813483          	ld	s1,56(sp)
    80003ec0:	02813983          	ld	s3,40(sp)
    80003ec4:	02013a03          	ld	s4,32(sp)
    80003ec8:	01813a83          	ld	s5,24(sp)
    80003ecc:	00090513          	mv	a0,s2
    80003ed0:	03013903          	ld	s2,48(sp)
    80003ed4:	05010113          	addi	sp,sp,80
    80003ed8:	00008067          	ret
    80003edc:	00000913          	li	s2,0
    80003ee0:	fd5ff06f          	j	80003eb4 <consolewrite+0x74>

0000000080003ee4 <consoleread>:
    80003ee4:	f9010113          	addi	sp,sp,-112
    80003ee8:	06813023          	sd	s0,96(sp)
    80003eec:	04913c23          	sd	s1,88(sp)
    80003ef0:	05213823          	sd	s2,80(sp)
    80003ef4:	05313423          	sd	s3,72(sp)
    80003ef8:	05413023          	sd	s4,64(sp)
    80003efc:	03513c23          	sd	s5,56(sp)
    80003f00:	03613823          	sd	s6,48(sp)
    80003f04:	03713423          	sd	s7,40(sp)
    80003f08:	03813023          	sd	s8,32(sp)
    80003f0c:	06113423          	sd	ra,104(sp)
    80003f10:	01913c23          	sd	s9,24(sp)
    80003f14:	07010413          	addi	s0,sp,112
    80003f18:	00060b93          	mv	s7,a2
    80003f1c:	00050913          	mv	s2,a0
    80003f20:	00058c13          	mv	s8,a1
    80003f24:	00060b1b          	sext.w	s6,a2
    80003f28:	00004497          	auipc	s1,0x4
    80003f2c:	4d048493          	addi	s1,s1,1232 # 800083f8 <cons>
    80003f30:	00400993          	li	s3,4
    80003f34:	fff00a13          	li	s4,-1
    80003f38:	00a00a93          	li	s5,10
    80003f3c:	05705e63          	blez	s7,80003f98 <consoleread+0xb4>
    80003f40:	09c4a703          	lw	a4,156(s1)
    80003f44:	0984a783          	lw	a5,152(s1)
    80003f48:	0007071b          	sext.w	a4,a4
    80003f4c:	08e78463          	beq	a5,a4,80003fd4 <consoleread+0xf0>
    80003f50:	07f7f713          	andi	a4,a5,127
    80003f54:	00e48733          	add	a4,s1,a4
    80003f58:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80003f5c:	0017869b          	addiw	a3,a5,1
    80003f60:	08d4ac23          	sw	a3,152(s1)
    80003f64:	00070c9b          	sext.w	s9,a4
    80003f68:	0b370663          	beq	a4,s3,80004014 <consoleread+0x130>
    80003f6c:	00100693          	li	a3,1
    80003f70:	f9f40613          	addi	a2,s0,-97
    80003f74:	000c0593          	mv	a1,s8
    80003f78:	00090513          	mv	a0,s2
    80003f7c:	f8e40fa3          	sb	a4,-97(s0)
    80003f80:	00000097          	auipc	ra,0x0
    80003f84:	8c0080e7          	jalr	-1856(ra) # 80003840 <either_copyout>
    80003f88:	01450863          	beq	a0,s4,80003f98 <consoleread+0xb4>
    80003f8c:	001c0c13          	addi	s8,s8,1
    80003f90:	fffb8b9b          	addiw	s7,s7,-1
    80003f94:	fb5c94e3          	bne	s9,s5,80003f3c <consoleread+0x58>
    80003f98:	000b851b          	sext.w	a0,s7
    80003f9c:	06813083          	ld	ra,104(sp)
    80003fa0:	06013403          	ld	s0,96(sp)
    80003fa4:	05813483          	ld	s1,88(sp)
    80003fa8:	05013903          	ld	s2,80(sp)
    80003fac:	04813983          	ld	s3,72(sp)
    80003fb0:	04013a03          	ld	s4,64(sp)
    80003fb4:	03813a83          	ld	s5,56(sp)
    80003fb8:	02813b83          	ld	s7,40(sp)
    80003fbc:	02013c03          	ld	s8,32(sp)
    80003fc0:	01813c83          	ld	s9,24(sp)
    80003fc4:	40ab053b          	subw	a0,s6,a0
    80003fc8:	03013b03          	ld	s6,48(sp)
    80003fcc:	07010113          	addi	sp,sp,112
    80003fd0:	00008067          	ret
    80003fd4:	00001097          	auipc	ra,0x1
    80003fd8:	1d8080e7          	jalr	472(ra) # 800051ac <push_on>
    80003fdc:	0984a703          	lw	a4,152(s1)
    80003fe0:	09c4a783          	lw	a5,156(s1)
    80003fe4:	0007879b          	sext.w	a5,a5
    80003fe8:	fef70ce3          	beq	a4,a5,80003fe0 <consoleread+0xfc>
    80003fec:	00001097          	auipc	ra,0x1
    80003ff0:	234080e7          	jalr	564(ra) # 80005220 <pop_on>
    80003ff4:	0984a783          	lw	a5,152(s1)
    80003ff8:	07f7f713          	andi	a4,a5,127
    80003ffc:	00e48733          	add	a4,s1,a4
    80004000:	01874703          	lbu	a4,24(a4)
    80004004:	0017869b          	addiw	a3,a5,1
    80004008:	08d4ac23          	sw	a3,152(s1)
    8000400c:	00070c9b          	sext.w	s9,a4
    80004010:	f5371ee3          	bne	a4,s3,80003f6c <consoleread+0x88>
    80004014:	000b851b          	sext.w	a0,s7
    80004018:	f96bf2e3          	bgeu	s7,s6,80003f9c <consoleread+0xb8>
    8000401c:	08f4ac23          	sw	a5,152(s1)
    80004020:	f7dff06f          	j	80003f9c <consoleread+0xb8>

0000000080004024 <consputc>:
    80004024:	10000793          	li	a5,256
    80004028:	00f50663          	beq	a0,a5,80004034 <consputc+0x10>
    8000402c:	00001317          	auipc	t1,0x1
    80004030:	9f430067          	jr	-1548(t1) # 80004a20 <uartputc_sync>
    80004034:	ff010113          	addi	sp,sp,-16
    80004038:	00113423          	sd	ra,8(sp)
    8000403c:	00813023          	sd	s0,0(sp)
    80004040:	01010413          	addi	s0,sp,16
    80004044:	00800513          	li	a0,8
    80004048:	00001097          	auipc	ra,0x1
    8000404c:	9d8080e7          	jalr	-1576(ra) # 80004a20 <uartputc_sync>
    80004050:	02000513          	li	a0,32
    80004054:	00001097          	auipc	ra,0x1
    80004058:	9cc080e7          	jalr	-1588(ra) # 80004a20 <uartputc_sync>
    8000405c:	00013403          	ld	s0,0(sp)
    80004060:	00813083          	ld	ra,8(sp)
    80004064:	00800513          	li	a0,8
    80004068:	01010113          	addi	sp,sp,16
    8000406c:	00001317          	auipc	t1,0x1
    80004070:	9b430067          	jr	-1612(t1) # 80004a20 <uartputc_sync>

0000000080004074 <consoleintr>:
    80004074:	fe010113          	addi	sp,sp,-32
    80004078:	00813823          	sd	s0,16(sp)
    8000407c:	00913423          	sd	s1,8(sp)
    80004080:	01213023          	sd	s2,0(sp)
    80004084:	00113c23          	sd	ra,24(sp)
    80004088:	02010413          	addi	s0,sp,32
    8000408c:	00004917          	auipc	s2,0x4
    80004090:	36c90913          	addi	s2,s2,876 # 800083f8 <cons>
    80004094:	00050493          	mv	s1,a0
    80004098:	00090513          	mv	a0,s2
    8000409c:	00001097          	auipc	ra,0x1
    800040a0:	e40080e7          	jalr	-448(ra) # 80004edc <acquire>
    800040a4:	02048c63          	beqz	s1,800040dc <consoleintr+0x68>
    800040a8:	0a092783          	lw	a5,160(s2)
    800040ac:	09892703          	lw	a4,152(s2)
    800040b0:	07f00693          	li	a3,127
    800040b4:	40e7873b          	subw	a4,a5,a4
    800040b8:	02e6e263          	bltu	a3,a4,800040dc <consoleintr+0x68>
    800040bc:	00d00713          	li	a4,13
    800040c0:	04e48063          	beq	s1,a4,80004100 <consoleintr+0x8c>
    800040c4:	07f7f713          	andi	a4,a5,127
    800040c8:	00e90733          	add	a4,s2,a4
    800040cc:	0017879b          	addiw	a5,a5,1
    800040d0:	0af92023          	sw	a5,160(s2)
    800040d4:	00970c23          	sb	s1,24(a4)
    800040d8:	08f92e23          	sw	a5,156(s2)
    800040dc:	01013403          	ld	s0,16(sp)
    800040e0:	01813083          	ld	ra,24(sp)
    800040e4:	00813483          	ld	s1,8(sp)
    800040e8:	00013903          	ld	s2,0(sp)
    800040ec:	00004517          	auipc	a0,0x4
    800040f0:	30c50513          	addi	a0,a0,780 # 800083f8 <cons>
    800040f4:	02010113          	addi	sp,sp,32
    800040f8:	00001317          	auipc	t1,0x1
    800040fc:	eb030067          	jr	-336(t1) # 80004fa8 <release>
    80004100:	00a00493          	li	s1,10
    80004104:	fc1ff06f          	j	800040c4 <consoleintr+0x50>

0000000080004108 <consoleinit>:
    80004108:	fe010113          	addi	sp,sp,-32
    8000410c:	00113c23          	sd	ra,24(sp)
    80004110:	00813823          	sd	s0,16(sp)
    80004114:	00913423          	sd	s1,8(sp)
    80004118:	02010413          	addi	s0,sp,32
    8000411c:	00004497          	auipc	s1,0x4
    80004120:	2dc48493          	addi	s1,s1,732 # 800083f8 <cons>
    80004124:	00048513          	mv	a0,s1
    80004128:	00002597          	auipc	a1,0x2
    8000412c:	03858593          	addi	a1,a1,56 # 80006160 <CONSOLE_STATUS+0x150>
    80004130:	00001097          	auipc	ra,0x1
    80004134:	d88080e7          	jalr	-632(ra) # 80004eb8 <initlock>
    80004138:	00000097          	auipc	ra,0x0
    8000413c:	7ac080e7          	jalr	1964(ra) # 800048e4 <uartinit>
    80004140:	01813083          	ld	ra,24(sp)
    80004144:	01013403          	ld	s0,16(sp)
    80004148:	00000797          	auipc	a5,0x0
    8000414c:	d9c78793          	addi	a5,a5,-612 # 80003ee4 <consoleread>
    80004150:	0af4bc23          	sd	a5,184(s1)
    80004154:	00000797          	auipc	a5,0x0
    80004158:	cec78793          	addi	a5,a5,-788 # 80003e40 <consolewrite>
    8000415c:	0cf4b023          	sd	a5,192(s1)
    80004160:	00813483          	ld	s1,8(sp)
    80004164:	02010113          	addi	sp,sp,32
    80004168:	00008067          	ret

000000008000416c <console_read>:
    8000416c:	ff010113          	addi	sp,sp,-16
    80004170:	00813423          	sd	s0,8(sp)
    80004174:	01010413          	addi	s0,sp,16
    80004178:	00813403          	ld	s0,8(sp)
    8000417c:	00004317          	auipc	t1,0x4
    80004180:	33433303          	ld	t1,820(t1) # 800084b0 <devsw+0x10>
    80004184:	01010113          	addi	sp,sp,16
    80004188:	00030067          	jr	t1

000000008000418c <console_write>:
    8000418c:	ff010113          	addi	sp,sp,-16
    80004190:	00813423          	sd	s0,8(sp)
    80004194:	01010413          	addi	s0,sp,16
    80004198:	00813403          	ld	s0,8(sp)
    8000419c:	00004317          	auipc	t1,0x4
    800041a0:	31c33303          	ld	t1,796(t1) # 800084b8 <devsw+0x18>
    800041a4:	01010113          	addi	sp,sp,16
    800041a8:	00030067          	jr	t1

00000000800041ac <panic>:
    800041ac:	fe010113          	addi	sp,sp,-32
    800041b0:	00113c23          	sd	ra,24(sp)
    800041b4:	00813823          	sd	s0,16(sp)
    800041b8:	00913423          	sd	s1,8(sp)
    800041bc:	02010413          	addi	s0,sp,32
    800041c0:	00050493          	mv	s1,a0
    800041c4:	00002517          	auipc	a0,0x2
    800041c8:	fa450513          	addi	a0,a0,-92 # 80006168 <CONSOLE_STATUS+0x158>
    800041cc:	00004797          	auipc	a5,0x4
    800041d0:	3807a623          	sw	zero,908(a5) # 80008558 <pr+0x18>
    800041d4:	00000097          	auipc	ra,0x0
    800041d8:	034080e7          	jalr	52(ra) # 80004208 <__printf>
    800041dc:	00048513          	mv	a0,s1
    800041e0:	00000097          	auipc	ra,0x0
    800041e4:	028080e7          	jalr	40(ra) # 80004208 <__printf>
    800041e8:	00002517          	auipc	a0,0x2
    800041ec:	f6050513          	addi	a0,a0,-160 # 80006148 <CONSOLE_STATUS+0x138>
    800041f0:	00000097          	auipc	ra,0x0
    800041f4:	018080e7          	jalr	24(ra) # 80004208 <__printf>
    800041f8:	00100793          	li	a5,1
    800041fc:	00003717          	auipc	a4,0x3
    80004200:	06f72e23          	sw	a5,124(a4) # 80007278 <panicked>
    80004204:	0000006f          	j	80004204 <panic+0x58>

0000000080004208 <__printf>:
    80004208:	f3010113          	addi	sp,sp,-208
    8000420c:	08813023          	sd	s0,128(sp)
    80004210:	07313423          	sd	s3,104(sp)
    80004214:	09010413          	addi	s0,sp,144
    80004218:	05813023          	sd	s8,64(sp)
    8000421c:	08113423          	sd	ra,136(sp)
    80004220:	06913c23          	sd	s1,120(sp)
    80004224:	07213823          	sd	s2,112(sp)
    80004228:	07413023          	sd	s4,96(sp)
    8000422c:	05513c23          	sd	s5,88(sp)
    80004230:	05613823          	sd	s6,80(sp)
    80004234:	05713423          	sd	s7,72(sp)
    80004238:	03913c23          	sd	s9,56(sp)
    8000423c:	03a13823          	sd	s10,48(sp)
    80004240:	03b13423          	sd	s11,40(sp)
    80004244:	00004317          	auipc	t1,0x4
    80004248:	2fc30313          	addi	t1,t1,764 # 80008540 <pr>
    8000424c:	01832c03          	lw	s8,24(t1)
    80004250:	00b43423          	sd	a1,8(s0)
    80004254:	00c43823          	sd	a2,16(s0)
    80004258:	00d43c23          	sd	a3,24(s0)
    8000425c:	02e43023          	sd	a4,32(s0)
    80004260:	02f43423          	sd	a5,40(s0)
    80004264:	03043823          	sd	a6,48(s0)
    80004268:	03143c23          	sd	a7,56(s0)
    8000426c:	00050993          	mv	s3,a0
    80004270:	4a0c1663          	bnez	s8,8000471c <__printf+0x514>
    80004274:	60098c63          	beqz	s3,8000488c <__printf+0x684>
    80004278:	0009c503          	lbu	a0,0(s3)
    8000427c:	00840793          	addi	a5,s0,8
    80004280:	f6f43c23          	sd	a5,-136(s0)
    80004284:	00000493          	li	s1,0
    80004288:	22050063          	beqz	a0,800044a8 <__printf+0x2a0>
    8000428c:	00002a37          	lui	s4,0x2
    80004290:	00018ab7          	lui	s5,0x18
    80004294:	000f4b37          	lui	s6,0xf4
    80004298:	00989bb7          	lui	s7,0x989
    8000429c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800042a0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800042a4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800042a8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800042ac:	00148c9b          	addiw	s9,s1,1
    800042b0:	02500793          	li	a5,37
    800042b4:	01998933          	add	s2,s3,s9
    800042b8:	38f51263          	bne	a0,a5,8000463c <__printf+0x434>
    800042bc:	00094783          	lbu	a5,0(s2)
    800042c0:	00078c9b          	sext.w	s9,a5
    800042c4:	1e078263          	beqz	a5,800044a8 <__printf+0x2a0>
    800042c8:	0024849b          	addiw	s1,s1,2
    800042cc:	07000713          	li	a4,112
    800042d0:	00998933          	add	s2,s3,s1
    800042d4:	38e78a63          	beq	a5,a4,80004668 <__printf+0x460>
    800042d8:	20f76863          	bltu	a4,a5,800044e8 <__printf+0x2e0>
    800042dc:	42a78863          	beq	a5,a0,8000470c <__printf+0x504>
    800042e0:	06400713          	li	a4,100
    800042e4:	40e79663          	bne	a5,a4,800046f0 <__printf+0x4e8>
    800042e8:	f7843783          	ld	a5,-136(s0)
    800042ec:	0007a603          	lw	a2,0(a5)
    800042f0:	00878793          	addi	a5,a5,8
    800042f4:	f6f43c23          	sd	a5,-136(s0)
    800042f8:	42064a63          	bltz	a2,8000472c <__printf+0x524>
    800042fc:	00a00713          	li	a4,10
    80004300:	02e677bb          	remuw	a5,a2,a4
    80004304:	00002d97          	auipc	s11,0x2
    80004308:	e8cd8d93          	addi	s11,s11,-372 # 80006190 <digits>
    8000430c:	00900593          	li	a1,9
    80004310:	0006051b          	sext.w	a0,a2
    80004314:	00000c93          	li	s9,0
    80004318:	02079793          	slli	a5,a5,0x20
    8000431c:	0207d793          	srli	a5,a5,0x20
    80004320:	00fd87b3          	add	a5,s11,a5
    80004324:	0007c783          	lbu	a5,0(a5)
    80004328:	02e656bb          	divuw	a3,a2,a4
    8000432c:	f8f40023          	sb	a5,-128(s0)
    80004330:	14c5d863          	bge	a1,a2,80004480 <__printf+0x278>
    80004334:	06300593          	li	a1,99
    80004338:	00100c93          	li	s9,1
    8000433c:	02e6f7bb          	remuw	a5,a3,a4
    80004340:	02079793          	slli	a5,a5,0x20
    80004344:	0207d793          	srli	a5,a5,0x20
    80004348:	00fd87b3          	add	a5,s11,a5
    8000434c:	0007c783          	lbu	a5,0(a5)
    80004350:	02e6d73b          	divuw	a4,a3,a4
    80004354:	f8f400a3          	sb	a5,-127(s0)
    80004358:	12a5f463          	bgeu	a1,a0,80004480 <__printf+0x278>
    8000435c:	00a00693          	li	a3,10
    80004360:	00900593          	li	a1,9
    80004364:	02d777bb          	remuw	a5,a4,a3
    80004368:	02079793          	slli	a5,a5,0x20
    8000436c:	0207d793          	srli	a5,a5,0x20
    80004370:	00fd87b3          	add	a5,s11,a5
    80004374:	0007c503          	lbu	a0,0(a5)
    80004378:	02d757bb          	divuw	a5,a4,a3
    8000437c:	f8a40123          	sb	a0,-126(s0)
    80004380:	48e5f263          	bgeu	a1,a4,80004804 <__printf+0x5fc>
    80004384:	06300513          	li	a0,99
    80004388:	02d7f5bb          	remuw	a1,a5,a3
    8000438c:	02059593          	slli	a1,a1,0x20
    80004390:	0205d593          	srli	a1,a1,0x20
    80004394:	00bd85b3          	add	a1,s11,a1
    80004398:	0005c583          	lbu	a1,0(a1)
    8000439c:	02d7d7bb          	divuw	a5,a5,a3
    800043a0:	f8b401a3          	sb	a1,-125(s0)
    800043a4:	48e57263          	bgeu	a0,a4,80004828 <__printf+0x620>
    800043a8:	3e700513          	li	a0,999
    800043ac:	02d7f5bb          	remuw	a1,a5,a3
    800043b0:	02059593          	slli	a1,a1,0x20
    800043b4:	0205d593          	srli	a1,a1,0x20
    800043b8:	00bd85b3          	add	a1,s11,a1
    800043bc:	0005c583          	lbu	a1,0(a1)
    800043c0:	02d7d7bb          	divuw	a5,a5,a3
    800043c4:	f8b40223          	sb	a1,-124(s0)
    800043c8:	46e57663          	bgeu	a0,a4,80004834 <__printf+0x62c>
    800043cc:	02d7f5bb          	remuw	a1,a5,a3
    800043d0:	02059593          	slli	a1,a1,0x20
    800043d4:	0205d593          	srli	a1,a1,0x20
    800043d8:	00bd85b3          	add	a1,s11,a1
    800043dc:	0005c583          	lbu	a1,0(a1)
    800043e0:	02d7d7bb          	divuw	a5,a5,a3
    800043e4:	f8b402a3          	sb	a1,-123(s0)
    800043e8:	46ea7863          	bgeu	s4,a4,80004858 <__printf+0x650>
    800043ec:	02d7f5bb          	remuw	a1,a5,a3
    800043f0:	02059593          	slli	a1,a1,0x20
    800043f4:	0205d593          	srli	a1,a1,0x20
    800043f8:	00bd85b3          	add	a1,s11,a1
    800043fc:	0005c583          	lbu	a1,0(a1)
    80004400:	02d7d7bb          	divuw	a5,a5,a3
    80004404:	f8b40323          	sb	a1,-122(s0)
    80004408:	3eeaf863          	bgeu	s5,a4,800047f8 <__printf+0x5f0>
    8000440c:	02d7f5bb          	remuw	a1,a5,a3
    80004410:	02059593          	slli	a1,a1,0x20
    80004414:	0205d593          	srli	a1,a1,0x20
    80004418:	00bd85b3          	add	a1,s11,a1
    8000441c:	0005c583          	lbu	a1,0(a1)
    80004420:	02d7d7bb          	divuw	a5,a5,a3
    80004424:	f8b403a3          	sb	a1,-121(s0)
    80004428:	42eb7e63          	bgeu	s6,a4,80004864 <__printf+0x65c>
    8000442c:	02d7f5bb          	remuw	a1,a5,a3
    80004430:	02059593          	slli	a1,a1,0x20
    80004434:	0205d593          	srli	a1,a1,0x20
    80004438:	00bd85b3          	add	a1,s11,a1
    8000443c:	0005c583          	lbu	a1,0(a1)
    80004440:	02d7d7bb          	divuw	a5,a5,a3
    80004444:	f8b40423          	sb	a1,-120(s0)
    80004448:	42ebfc63          	bgeu	s7,a4,80004880 <__printf+0x678>
    8000444c:	02079793          	slli	a5,a5,0x20
    80004450:	0207d793          	srli	a5,a5,0x20
    80004454:	00fd8db3          	add	s11,s11,a5
    80004458:	000dc703          	lbu	a4,0(s11)
    8000445c:	00a00793          	li	a5,10
    80004460:	00900c93          	li	s9,9
    80004464:	f8e404a3          	sb	a4,-119(s0)
    80004468:	00065c63          	bgez	a2,80004480 <__printf+0x278>
    8000446c:	f9040713          	addi	a4,s0,-112
    80004470:	00f70733          	add	a4,a4,a5
    80004474:	02d00693          	li	a3,45
    80004478:	fed70823          	sb	a3,-16(a4)
    8000447c:	00078c93          	mv	s9,a5
    80004480:	f8040793          	addi	a5,s0,-128
    80004484:	01978cb3          	add	s9,a5,s9
    80004488:	f7f40d13          	addi	s10,s0,-129
    8000448c:	000cc503          	lbu	a0,0(s9)
    80004490:	fffc8c93          	addi	s9,s9,-1
    80004494:	00000097          	auipc	ra,0x0
    80004498:	b90080e7          	jalr	-1136(ra) # 80004024 <consputc>
    8000449c:	ffac98e3          	bne	s9,s10,8000448c <__printf+0x284>
    800044a0:	00094503          	lbu	a0,0(s2)
    800044a4:	e00514e3          	bnez	a0,800042ac <__printf+0xa4>
    800044a8:	1a0c1663          	bnez	s8,80004654 <__printf+0x44c>
    800044ac:	08813083          	ld	ra,136(sp)
    800044b0:	08013403          	ld	s0,128(sp)
    800044b4:	07813483          	ld	s1,120(sp)
    800044b8:	07013903          	ld	s2,112(sp)
    800044bc:	06813983          	ld	s3,104(sp)
    800044c0:	06013a03          	ld	s4,96(sp)
    800044c4:	05813a83          	ld	s5,88(sp)
    800044c8:	05013b03          	ld	s6,80(sp)
    800044cc:	04813b83          	ld	s7,72(sp)
    800044d0:	04013c03          	ld	s8,64(sp)
    800044d4:	03813c83          	ld	s9,56(sp)
    800044d8:	03013d03          	ld	s10,48(sp)
    800044dc:	02813d83          	ld	s11,40(sp)
    800044e0:	0d010113          	addi	sp,sp,208
    800044e4:	00008067          	ret
    800044e8:	07300713          	li	a4,115
    800044ec:	1ce78a63          	beq	a5,a4,800046c0 <__printf+0x4b8>
    800044f0:	07800713          	li	a4,120
    800044f4:	1ee79e63          	bne	a5,a4,800046f0 <__printf+0x4e8>
    800044f8:	f7843783          	ld	a5,-136(s0)
    800044fc:	0007a703          	lw	a4,0(a5)
    80004500:	00878793          	addi	a5,a5,8
    80004504:	f6f43c23          	sd	a5,-136(s0)
    80004508:	28074263          	bltz	a4,8000478c <__printf+0x584>
    8000450c:	00002d97          	auipc	s11,0x2
    80004510:	c84d8d93          	addi	s11,s11,-892 # 80006190 <digits>
    80004514:	00f77793          	andi	a5,a4,15
    80004518:	00fd87b3          	add	a5,s11,a5
    8000451c:	0007c683          	lbu	a3,0(a5)
    80004520:	00f00613          	li	a2,15
    80004524:	0007079b          	sext.w	a5,a4
    80004528:	f8d40023          	sb	a3,-128(s0)
    8000452c:	0047559b          	srliw	a1,a4,0x4
    80004530:	0047569b          	srliw	a3,a4,0x4
    80004534:	00000c93          	li	s9,0
    80004538:	0ee65063          	bge	a2,a4,80004618 <__printf+0x410>
    8000453c:	00f6f693          	andi	a3,a3,15
    80004540:	00dd86b3          	add	a3,s11,a3
    80004544:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004548:	0087d79b          	srliw	a5,a5,0x8
    8000454c:	00100c93          	li	s9,1
    80004550:	f8d400a3          	sb	a3,-127(s0)
    80004554:	0cb67263          	bgeu	a2,a1,80004618 <__printf+0x410>
    80004558:	00f7f693          	andi	a3,a5,15
    8000455c:	00dd86b3          	add	a3,s11,a3
    80004560:	0006c583          	lbu	a1,0(a3)
    80004564:	00f00613          	li	a2,15
    80004568:	0047d69b          	srliw	a3,a5,0x4
    8000456c:	f8b40123          	sb	a1,-126(s0)
    80004570:	0047d593          	srli	a1,a5,0x4
    80004574:	28f67e63          	bgeu	a2,a5,80004810 <__printf+0x608>
    80004578:	00f6f693          	andi	a3,a3,15
    8000457c:	00dd86b3          	add	a3,s11,a3
    80004580:	0006c503          	lbu	a0,0(a3)
    80004584:	0087d813          	srli	a6,a5,0x8
    80004588:	0087d69b          	srliw	a3,a5,0x8
    8000458c:	f8a401a3          	sb	a0,-125(s0)
    80004590:	28b67663          	bgeu	a2,a1,8000481c <__printf+0x614>
    80004594:	00f6f693          	andi	a3,a3,15
    80004598:	00dd86b3          	add	a3,s11,a3
    8000459c:	0006c583          	lbu	a1,0(a3)
    800045a0:	00c7d513          	srli	a0,a5,0xc
    800045a4:	00c7d69b          	srliw	a3,a5,0xc
    800045a8:	f8b40223          	sb	a1,-124(s0)
    800045ac:	29067a63          	bgeu	a2,a6,80004840 <__printf+0x638>
    800045b0:	00f6f693          	andi	a3,a3,15
    800045b4:	00dd86b3          	add	a3,s11,a3
    800045b8:	0006c583          	lbu	a1,0(a3)
    800045bc:	0107d813          	srli	a6,a5,0x10
    800045c0:	0107d69b          	srliw	a3,a5,0x10
    800045c4:	f8b402a3          	sb	a1,-123(s0)
    800045c8:	28a67263          	bgeu	a2,a0,8000484c <__printf+0x644>
    800045cc:	00f6f693          	andi	a3,a3,15
    800045d0:	00dd86b3          	add	a3,s11,a3
    800045d4:	0006c683          	lbu	a3,0(a3)
    800045d8:	0147d79b          	srliw	a5,a5,0x14
    800045dc:	f8d40323          	sb	a3,-122(s0)
    800045e0:	21067663          	bgeu	a2,a6,800047ec <__printf+0x5e4>
    800045e4:	02079793          	slli	a5,a5,0x20
    800045e8:	0207d793          	srli	a5,a5,0x20
    800045ec:	00fd8db3          	add	s11,s11,a5
    800045f0:	000dc683          	lbu	a3,0(s11)
    800045f4:	00800793          	li	a5,8
    800045f8:	00700c93          	li	s9,7
    800045fc:	f8d403a3          	sb	a3,-121(s0)
    80004600:	00075c63          	bgez	a4,80004618 <__printf+0x410>
    80004604:	f9040713          	addi	a4,s0,-112
    80004608:	00f70733          	add	a4,a4,a5
    8000460c:	02d00693          	li	a3,45
    80004610:	fed70823          	sb	a3,-16(a4)
    80004614:	00078c93          	mv	s9,a5
    80004618:	f8040793          	addi	a5,s0,-128
    8000461c:	01978cb3          	add	s9,a5,s9
    80004620:	f7f40d13          	addi	s10,s0,-129
    80004624:	000cc503          	lbu	a0,0(s9)
    80004628:	fffc8c93          	addi	s9,s9,-1
    8000462c:	00000097          	auipc	ra,0x0
    80004630:	9f8080e7          	jalr	-1544(ra) # 80004024 <consputc>
    80004634:	ff9d18e3          	bne	s10,s9,80004624 <__printf+0x41c>
    80004638:	0100006f          	j	80004648 <__printf+0x440>
    8000463c:	00000097          	auipc	ra,0x0
    80004640:	9e8080e7          	jalr	-1560(ra) # 80004024 <consputc>
    80004644:	000c8493          	mv	s1,s9
    80004648:	00094503          	lbu	a0,0(s2)
    8000464c:	c60510e3          	bnez	a0,800042ac <__printf+0xa4>
    80004650:	e40c0ee3          	beqz	s8,800044ac <__printf+0x2a4>
    80004654:	00004517          	auipc	a0,0x4
    80004658:	eec50513          	addi	a0,a0,-276 # 80008540 <pr>
    8000465c:	00001097          	auipc	ra,0x1
    80004660:	94c080e7          	jalr	-1716(ra) # 80004fa8 <release>
    80004664:	e49ff06f          	j	800044ac <__printf+0x2a4>
    80004668:	f7843783          	ld	a5,-136(s0)
    8000466c:	03000513          	li	a0,48
    80004670:	01000d13          	li	s10,16
    80004674:	00878713          	addi	a4,a5,8
    80004678:	0007bc83          	ld	s9,0(a5)
    8000467c:	f6e43c23          	sd	a4,-136(s0)
    80004680:	00000097          	auipc	ra,0x0
    80004684:	9a4080e7          	jalr	-1628(ra) # 80004024 <consputc>
    80004688:	07800513          	li	a0,120
    8000468c:	00000097          	auipc	ra,0x0
    80004690:	998080e7          	jalr	-1640(ra) # 80004024 <consputc>
    80004694:	00002d97          	auipc	s11,0x2
    80004698:	afcd8d93          	addi	s11,s11,-1284 # 80006190 <digits>
    8000469c:	03ccd793          	srli	a5,s9,0x3c
    800046a0:	00fd87b3          	add	a5,s11,a5
    800046a4:	0007c503          	lbu	a0,0(a5)
    800046a8:	fffd0d1b          	addiw	s10,s10,-1
    800046ac:	004c9c93          	slli	s9,s9,0x4
    800046b0:	00000097          	auipc	ra,0x0
    800046b4:	974080e7          	jalr	-1676(ra) # 80004024 <consputc>
    800046b8:	fe0d12e3          	bnez	s10,8000469c <__printf+0x494>
    800046bc:	f8dff06f          	j	80004648 <__printf+0x440>
    800046c0:	f7843783          	ld	a5,-136(s0)
    800046c4:	0007bc83          	ld	s9,0(a5)
    800046c8:	00878793          	addi	a5,a5,8
    800046cc:	f6f43c23          	sd	a5,-136(s0)
    800046d0:	000c9a63          	bnez	s9,800046e4 <__printf+0x4dc>
    800046d4:	1080006f          	j	800047dc <__printf+0x5d4>
    800046d8:	001c8c93          	addi	s9,s9,1
    800046dc:	00000097          	auipc	ra,0x0
    800046e0:	948080e7          	jalr	-1720(ra) # 80004024 <consputc>
    800046e4:	000cc503          	lbu	a0,0(s9)
    800046e8:	fe0518e3          	bnez	a0,800046d8 <__printf+0x4d0>
    800046ec:	f5dff06f          	j	80004648 <__printf+0x440>
    800046f0:	02500513          	li	a0,37
    800046f4:	00000097          	auipc	ra,0x0
    800046f8:	930080e7          	jalr	-1744(ra) # 80004024 <consputc>
    800046fc:	000c8513          	mv	a0,s9
    80004700:	00000097          	auipc	ra,0x0
    80004704:	924080e7          	jalr	-1756(ra) # 80004024 <consputc>
    80004708:	f41ff06f          	j	80004648 <__printf+0x440>
    8000470c:	02500513          	li	a0,37
    80004710:	00000097          	auipc	ra,0x0
    80004714:	914080e7          	jalr	-1772(ra) # 80004024 <consputc>
    80004718:	f31ff06f          	j	80004648 <__printf+0x440>
    8000471c:	00030513          	mv	a0,t1
    80004720:	00000097          	auipc	ra,0x0
    80004724:	7bc080e7          	jalr	1980(ra) # 80004edc <acquire>
    80004728:	b4dff06f          	j	80004274 <__printf+0x6c>
    8000472c:	40c0053b          	negw	a0,a2
    80004730:	00a00713          	li	a4,10
    80004734:	02e576bb          	remuw	a3,a0,a4
    80004738:	00002d97          	auipc	s11,0x2
    8000473c:	a58d8d93          	addi	s11,s11,-1448 # 80006190 <digits>
    80004740:	ff700593          	li	a1,-9
    80004744:	02069693          	slli	a3,a3,0x20
    80004748:	0206d693          	srli	a3,a3,0x20
    8000474c:	00dd86b3          	add	a3,s11,a3
    80004750:	0006c683          	lbu	a3,0(a3)
    80004754:	02e557bb          	divuw	a5,a0,a4
    80004758:	f8d40023          	sb	a3,-128(s0)
    8000475c:	10b65e63          	bge	a2,a1,80004878 <__printf+0x670>
    80004760:	06300593          	li	a1,99
    80004764:	02e7f6bb          	remuw	a3,a5,a4
    80004768:	02069693          	slli	a3,a3,0x20
    8000476c:	0206d693          	srli	a3,a3,0x20
    80004770:	00dd86b3          	add	a3,s11,a3
    80004774:	0006c683          	lbu	a3,0(a3)
    80004778:	02e7d73b          	divuw	a4,a5,a4
    8000477c:	00200793          	li	a5,2
    80004780:	f8d400a3          	sb	a3,-127(s0)
    80004784:	bca5ece3          	bltu	a1,a0,8000435c <__printf+0x154>
    80004788:	ce5ff06f          	j	8000446c <__printf+0x264>
    8000478c:	40e007bb          	negw	a5,a4
    80004790:	00002d97          	auipc	s11,0x2
    80004794:	a00d8d93          	addi	s11,s11,-1536 # 80006190 <digits>
    80004798:	00f7f693          	andi	a3,a5,15
    8000479c:	00dd86b3          	add	a3,s11,a3
    800047a0:	0006c583          	lbu	a1,0(a3)
    800047a4:	ff100613          	li	a2,-15
    800047a8:	0047d69b          	srliw	a3,a5,0x4
    800047ac:	f8b40023          	sb	a1,-128(s0)
    800047b0:	0047d59b          	srliw	a1,a5,0x4
    800047b4:	0ac75e63          	bge	a4,a2,80004870 <__printf+0x668>
    800047b8:	00f6f693          	andi	a3,a3,15
    800047bc:	00dd86b3          	add	a3,s11,a3
    800047c0:	0006c603          	lbu	a2,0(a3)
    800047c4:	00f00693          	li	a3,15
    800047c8:	0087d79b          	srliw	a5,a5,0x8
    800047cc:	f8c400a3          	sb	a2,-127(s0)
    800047d0:	d8b6e4e3          	bltu	a3,a1,80004558 <__printf+0x350>
    800047d4:	00200793          	li	a5,2
    800047d8:	e2dff06f          	j	80004604 <__printf+0x3fc>
    800047dc:	00002c97          	auipc	s9,0x2
    800047e0:	994c8c93          	addi	s9,s9,-1644 # 80006170 <CONSOLE_STATUS+0x160>
    800047e4:	02800513          	li	a0,40
    800047e8:	ef1ff06f          	j	800046d8 <__printf+0x4d0>
    800047ec:	00700793          	li	a5,7
    800047f0:	00600c93          	li	s9,6
    800047f4:	e0dff06f          	j	80004600 <__printf+0x3f8>
    800047f8:	00700793          	li	a5,7
    800047fc:	00600c93          	li	s9,6
    80004800:	c69ff06f          	j	80004468 <__printf+0x260>
    80004804:	00300793          	li	a5,3
    80004808:	00200c93          	li	s9,2
    8000480c:	c5dff06f          	j	80004468 <__printf+0x260>
    80004810:	00300793          	li	a5,3
    80004814:	00200c93          	li	s9,2
    80004818:	de9ff06f          	j	80004600 <__printf+0x3f8>
    8000481c:	00400793          	li	a5,4
    80004820:	00300c93          	li	s9,3
    80004824:	dddff06f          	j	80004600 <__printf+0x3f8>
    80004828:	00400793          	li	a5,4
    8000482c:	00300c93          	li	s9,3
    80004830:	c39ff06f          	j	80004468 <__printf+0x260>
    80004834:	00500793          	li	a5,5
    80004838:	00400c93          	li	s9,4
    8000483c:	c2dff06f          	j	80004468 <__printf+0x260>
    80004840:	00500793          	li	a5,5
    80004844:	00400c93          	li	s9,4
    80004848:	db9ff06f          	j	80004600 <__printf+0x3f8>
    8000484c:	00600793          	li	a5,6
    80004850:	00500c93          	li	s9,5
    80004854:	dadff06f          	j	80004600 <__printf+0x3f8>
    80004858:	00600793          	li	a5,6
    8000485c:	00500c93          	li	s9,5
    80004860:	c09ff06f          	j	80004468 <__printf+0x260>
    80004864:	00800793          	li	a5,8
    80004868:	00700c93          	li	s9,7
    8000486c:	bfdff06f          	j	80004468 <__printf+0x260>
    80004870:	00100793          	li	a5,1
    80004874:	d91ff06f          	j	80004604 <__printf+0x3fc>
    80004878:	00100793          	li	a5,1
    8000487c:	bf1ff06f          	j	8000446c <__printf+0x264>
    80004880:	00900793          	li	a5,9
    80004884:	00800c93          	li	s9,8
    80004888:	be1ff06f          	j	80004468 <__printf+0x260>
    8000488c:	00002517          	auipc	a0,0x2
    80004890:	8ec50513          	addi	a0,a0,-1812 # 80006178 <CONSOLE_STATUS+0x168>
    80004894:	00000097          	auipc	ra,0x0
    80004898:	918080e7          	jalr	-1768(ra) # 800041ac <panic>

000000008000489c <printfinit>:
    8000489c:	fe010113          	addi	sp,sp,-32
    800048a0:	00813823          	sd	s0,16(sp)
    800048a4:	00913423          	sd	s1,8(sp)
    800048a8:	00113c23          	sd	ra,24(sp)
    800048ac:	02010413          	addi	s0,sp,32
    800048b0:	00004497          	auipc	s1,0x4
    800048b4:	c9048493          	addi	s1,s1,-880 # 80008540 <pr>
    800048b8:	00048513          	mv	a0,s1
    800048bc:	00002597          	auipc	a1,0x2
    800048c0:	8cc58593          	addi	a1,a1,-1844 # 80006188 <CONSOLE_STATUS+0x178>
    800048c4:	00000097          	auipc	ra,0x0
    800048c8:	5f4080e7          	jalr	1524(ra) # 80004eb8 <initlock>
    800048cc:	01813083          	ld	ra,24(sp)
    800048d0:	01013403          	ld	s0,16(sp)
    800048d4:	0004ac23          	sw	zero,24(s1)
    800048d8:	00813483          	ld	s1,8(sp)
    800048dc:	02010113          	addi	sp,sp,32
    800048e0:	00008067          	ret

00000000800048e4 <uartinit>:
    800048e4:	ff010113          	addi	sp,sp,-16
    800048e8:	00813423          	sd	s0,8(sp)
    800048ec:	01010413          	addi	s0,sp,16
    800048f0:	100007b7          	lui	a5,0x10000
    800048f4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800048f8:	f8000713          	li	a4,-128
    800048fc:	00e781a3          	sb	a4,3(a5)
    80004900:	00300713          	li	a4,3
    80004904:	00e78023          	sb	a4,0(a5)
    80004908:	000780a3          	sb	zero,1(a5)
    8000490c:	00e781a3          	sb	a4,3(a5)
    80004910:	00700693          	li	a3,7
    80004914:	00d78123          	sb	a3,2(a5)
    80004918:	00e780a3          	sb	a4,1(a5)
    8000491c:	00813403          	ld	s0,8(sp)
    80004920:	01010113          	addi	sp,sp,16
    80004924:	00008067          	ret

0000000080004928 <uartputc>:
    80004928:	00003797          	auipc	a5,0x3
    8000492c:	9507a783          	lw	a5,-1712(a5) # 80007278 <panicked>
    80004930:	00078463          	beqz	a5,80004938 <uartputc+0x10>
    80004934:	0000006f          	j	80004934 <uartputc+0xc>
    80004938:	fd010113          	addi	sp,sp,-48
    8000493c:	02813023          	sd	s0,32(sp)
    80004940:	00913c23          	sd	s1,24(sp)
    80004944:	01213823          	sd	s2,16(sp)
    80004948:	01313423          	sd	s3,8(sp)
    8000494c:	02113423          	sd	ra,40(sp)
    80004950:	03010413          	addi	s0,sp,48
    80004954:	00003917          	auipc	s2,0x3
    80004958:	92c90913          	addi	s2,s2,-1748 # 80007280 <uart_tx_r>
    8000495c:	00093783          	ld	a5,0(s2)
    80004960:	00003497          	auipc	s1,0x3
    80004964:	92848493          	addi	s1,s1,-1752 # 80007288 <uart_tx_w>
    80004968:	0004b703          	ld	a4,0(s1)
    8000496c:	02078693          	addi	a3,a5,32
    80004970:	00050993          	mv	s3,a0
    80004974:	02e69c63          	bne	a3,a4,800049ac <uartputc+0x84>
    80004978:	00001097          	auipc	ra,0x1
    8000497c:	834080e7          	jalr	-1996(ra) # 800051ac <push_on>
    80004980:	00093783          	ld	a5,0(s2)
    80004984:	0004b703          	ld	a4,0(s1)
    80004988:	02078793          	addi	a5,a5,32
    8000498c:	00e79463          	bne	a5,a4,80004994 <uartputc+0x6c>
    80004990:	0000006f          	j	80004990 <uartputc+0x68>
    80004994:	00001097          	auipc	ra,0x1
    80004998:	88c080e7          	jalr	-1908(ra) # 80005220 <pop_on>
    8000499c:	00093783          	ld	a5,0(s2)
    800049a0:	0004b703          	ld	a4,0(s1)
    800049a4:	02078693          	addi	a3,a5,32
    800049a8:	fce688e3          	beq	a3,a4,80004978 <uartputc+0x50>
    800049ac:	01f77693          	andi	a3,a4,31
    800049b0:	00004597          	auipc	a1,0x4
    800049b4:	bb058593          	addi	a1,a1,-1104 # 80008560 <uart_tx_buf>
    800049b8:	00d586b3          	add	a3,a1,a3
    800049bc:	00170713          	addi	a4,a4,1
    800049c0:	01368023          	sb	s3,0(a3)
    800049c4:	00e4b023          	sd	a4,0(s1)
    800049c8:	10000637          	lui	a2,0x10000
    800049cc:	02f71063          	bne	a4,a5,800049ec <uartputc+0xc4>
    800049d0:	0340006f          	j	80004a04 <uartputc+0xdc>
    800049d4:	00074703          	lbu	a4,0(a4)
    800049d8:	00f93023          	sd	a5,0(s2)
    800049dc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800049e0:	00093783          	ld	a5,0(s2)
    800049e4:	0004b703          	ld	a4,0(s1)
    800049e8:	00f70e63          	beq	a4,a5,80004a04 <uartputc+0xdc>
    800049ec:	00564683          	lbu	a3,5(a2)
    800049f0:	01f7f713          	andi	a4,a5,31
    800049f4:	00e58733          	add	a4,a1,a4
    800049f8:	0206f693          	andi	a3,a3,32
    800049fc:	00178793          	addi	a5,a5,1
    80004a00:	fc069ae3          	bnez	a3,800049d4 <uartputc+0xac>
    80004a04:	02813083          	ld	ra,40(sp)
    80004a08:	02013403          	ld	s0,32(sp)
    80004a0c:	01813483          	ld	s1,24(sp)
    80004a10:	01013903          	ld	s2,16(sp)
    80004a14:	00813983          	ld	s3,8(sp)
    80004a18:	03010113          	addi	sp,sp,48
    80004a1c:	00008067          	ret

0000000080004a20 <uartputc_sync>:
    80004a20:	ff010113          	addi	sp,sp,-16
    80004a24:	00813423          	sd	s0,8(sp)
    80004a28:	01010413          	addi	s0,sp,16
    80004a2c:	00003717          	auipc	a4,0x3
    80004a30:	84c72703          	lw	a4,-1972(a4) # 80007278 <panicked>
    80004a34:	02071663          	bnez	a4,80004a60 <uartputc_sync+0x40>
    80004a38:	00050793          	mv	a5,a0
    80004a3c:	100006b7          	lui	a3,0x10000
    80004a40:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80004a44:	02077713          	andi	a4,a4,32
    80004a48:	fe070ce3          	beqz	a4,80004a40 <uartputc_sync+0x20>
    80004a4c:	0ff7f793          	andi	a5,a5,255
    80004a50:	00f68023          	sb	a5,0(a3)
    80004a54:	00813403          	ld	s0,8(sp)
    80004a58:	01010113          	addi	sp,sp,16
    80004a5c:	00008067          	ret
    80004a60:	0000006f          	j	80004a60 <uartputc_sync+0x40>

0000000080004a64 <uartstart>:
    80004a64:	ff010113          	addi	sp,sp,-16
    80004a68:	00813423          	sd	s0,8(sp)
    80004a6c:	01010413          	addi	s0,sp,16
    80004a70:	00003617          	auipc	a2,0x3
    80004a74:	81060613          	addi	a2,a2,-2032 # 80007280 <uart_tx_r>
    80004a78:	00003517          	auipc	a0,0x3
    80004a7c:	81050513          	addi	a0,a0,-2032 # 80007288 <uart_tx_w>
    80004a80:	00063783          	ld	a5,0(a2)
    80004a84:	00053703          	ld	a4,0(a0)
    80004a88:	04f70263          	beq	a4,a5,80004acc <uartstart+0x68>
    80004a8c:	100005b7          	lui	a1,0x10000
    80004a90:	00004817          	auipc	a6,0x4
    80004a94:	ad080813          	addi	a6,a6,-1328 # 80008560 <uart_tx_buf>
    80004a98:	01c0006f          	j	80004ab4 <uartstart+0x50>
    80004a9c:	0006c703          	lbu	a4,0(a3)
    80004aa0:	00f63023          	sd	a5,0(a2)
    80004aa4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004aa8:	00063783          	ld	a5,0(a2)
    80004aac:	00053703          	ld	a4,0(a0)
    80004ab0:	00f70e63          	beq	a4,a5,80004acc <uartstart+0x68>
    80004ab4:	01f7f713          	andi	a4,a5,31
    80004ab8:	00e806b3          	add	a3,a6,a4
    80004abc:	0055c703          	lbu	a4,5(a1)
    80004ac0:	00178793          	addi	a5,a5,1
    80004ac4:	02077713          	andi	a4,a4,32
    80004ac8:	fc071ae3          	bnez	a4,80004a9c <uartstart+0x38>
    80004acc:	00813403          	ld	s0,8(sp)
    80004ad0:	01010113          	addi	sp,sp,16
    80004ad4:	00008067          	ret

0000000080004ad8 <uartgetc>:
    80004ad8:	ff010113          	addi	sp,sp,-16
    80004adc:	00813423          	sd	s0,8(sp)
    80004ae0:	01010413          	addi	s0,sp,16
    80004ae4:	10000737          	lui	a4,0x10000
    80004ae8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80004aec:	0017f793          	andi	a5,a5,1
    80004af0:	00078c63          	beqz	a5,80004b08 <uartgetc+0x30>
    80004af4:	00074503          	lbu	a0,0(a4)
    80004af8:	0ff57513          	andi	a0,a0,255
    80004afc:	00813403          	ld	s0,8(sp)
    80004b00:	01010113          	addi	sp,sp,16
    80004b04:	00008067          	ret
    80004b08:	fff00513          	li	a0,-1
    80004b0c:	ff1ff06f          	j	80004afc <uartgetc+0x24>

0000000080004b10 <uartintr>:
    80004b10:	100007b7          	lui	a5,0x10000
    80004b14:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80004b18:	0017f793          	andi	a5,a5,1
    80004b1c:	0a078463          	beqz	a5,80004bc4 <uartintr+0xb4>
    80004b20:	fe010113          	addi	sp,sp,-32
    80004b24:	00813823          	sd	s0,16(sp)
    80004b28:	00913423          	sd	s1,8(sp)
    80004b2c:	00113c23          	sd	ra,24(sp)
    80004b30:	02010413          	addi	s0,sp,32
    80004b34:	100004b7          	lui	s1,0x10000
    80004b38:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80004b3c:	0ff57513          	andi	a0,a0,255
    80004b40:	fffff097          	auipc	ra,0xfffff
    80004b44:	534080e7          	jalr	1332(ra) # 80004074 <consoleintr>
    80004b48:	0054c783          	lbu	a5,5(s1)
    80004b4c:	0017f793          	andi	a5,a5,1
    80004b50:	fe0794e3          	bnez	a5,80004b38 <uartintr+0x28>
    80004b54:	00002617          	auipc	a2,0x2
    80004b58:	72c60613          	addi	a2,a2,1836 # 80007280 <uart_tx_r>
    80004b5c:	00002517          	auipc	a0,0x2
    80004b60:	72c50513          	addi	a0,a0,1836 # 80007288 <uart_tx_w>
    80004b64:	00063783          	ld	a5,0(a2)
    80004b68:	00053703          	ld	a4,0(a0)
    80004b6c:	04f70263          	beq	a4,a5,80004bb0 <uartintr+0xa0>
    80004b70:	100005b7          	lui	a1,0x10000
    80004b74:	00004817          	auipc	a6,0x4
    80004b78:	9ec80813          	addi	a6,a6,-1556 # 80008560 <uart_tx_buf>
    80004b7c:	01c0006f          	j	80004b98 <uartintr+0x88>
    80004b80:	0006c703          	lbu	a4,0(a3)
    80004b84:	00f63023          	sd	a5,0(a2)
    80004b88:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004b8c:	00063783          	ld	a5,0(a2)
    80004b90:	00053703          	ld	a4,0(a0)
    80004b94:	00f70e63          	beq	a4,a5,80004bb0 <uartintr+0xa0>
    80004b98:	01f7f713          	andi	a4,a5,31
    80004b9c:	00e806b3          	add	a3,a6,a4
    80004ba0:	0055c703          	lbu	a4,5(a1)
    80004ba4:	00178793          	addi	a5,a5,1
    80004ba8:	02077713          	andi	a4,a4,32
    80004bac:	fc071ae3          	bnez	a4,80004b80 <uartintr+0x70>
    80004bb0:	01813083          	ld	ra,24(sp)
    80004bb4:	01013403          	ld	s0,16(sp)
    80004bb8:	00813483          	ld	s1,8(sp)
    80004bbc:	02010113          	addi	sp,sp,32
    80004bc0:	00008067          	ret
    80004bc4:	00002617          	auipc	a2,0x2
    80004bc8:	6bc60613          	addi	a2,a2,1724 # 80007280 <uart_tx_r>
    80004bcc:	00002517          	auipc	a0,0x2
    80004bd0:	6bc50513          	addi	a0,a0,1724 # 80007288 <uart_tx_w>
    80004bd4:	00063783          	ld	a5,0(a2)
    80004bd8:	00053703          	ld	a4,0(a0)
    80004bdc:	04f70263          	beq	a4,a5,80004c20 <uartintr+0x110>
    80004be0:	100005b7          	lui	a1,0x10000
    80004be4:	00004817          	auipc	a6,0x4
    80004be8:	97c80813          	addi	a6,a6,-1668 # 80008560 <uart_tx_buf>
    80004bec:	01c0006f          	j	80004c08 <uartintr+0xf8>
    80004bf0:	0006c703          	lbu	a4,0(a3)
    80004bf4:	00f63023          	sd	a5,0(a2)
    80004bf8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004bfc:	00063783          	ld	a5,0(a2)
    80004c00:	00053703          	ld	a4,0(a0)
    80004c04:	02f70063          	beq	a4,a5,80004c24 <uartintr+0x114>
    80004c08:	01f7f713          	andi	a4,a5,31
    80004c0c:	00e806b3          	add	a3,a6,a4
    80004c10:	0055c703          	lbu	a4,5(a1)
    80004c14:	00178793          	addi	a5,a5,1
    80004c18:	02077713          	andi	a4,a4,32
    80004c1c:	fc071ae3          	bnez	a4,80004bf0 <uartintr+0xe0>
    80004c20:	00008067          	ret
    80004c24:	00008067          	ret

0000000080004c28 <kinit>:
    80004c28:	fc010113          	addi	sp,sp,-64
    80004c2c:	02913423          	sd	s1,40(sp)
    80004c30:	fffff7b7          	lui	a5,0xfffff
    80004c34:	00005497          	auipc	s1,0x5
    80004c38:	94b48493          	addi	s1,s1,-1717 # 8000957f <end+0xfff>
    80004c3c:	02813823          	sd	s0,48(sp)
    80004c40:	01313c23          	sd	s3,24(sp)
    80004c44:	00f4f4b3          	and	s1,s1,a5
    80004c48:	02113c23          	sd	ra,56(sp)
    80004c4c:	03213023          	sd	s2,32(sp)
    80004c50:	01413823          	sd	s4,16(sp)
    80004c54:	01513423          	sd	s5,8(sp)
    80004c58:	04010413          	addi	s0,sp,64
    80004c5c:	000017b7          	lui	a5,0x1
    80004c60:	01100993          	li	s3,17
    80004c64:	00f487b3          	add	a5,s1,a5
    80004c68:	01b99993          	slli	s3,s3,0x1b
    80004c6c:	06f9e063          	bltu	s3,a5,80004ccc <kinit+0xa4>
    80004c70:	00004a97          	auipc	s5,0x4
    80004c74:	910a8a93          	addi	s5,s5,-1776 # 80008580 <end>
    80004c78:	0754ec63          	bltu	s1,s5,80004cf0 <kinit+0xc8>
    80004c7c:	0734fa63          	bgeu	s1,s3,80004cf0 <kinit+0xc8>
    80004c80:	00088a37          	lui	s4,0x88
    80004c84:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80004c88:	00002917          	auipc	s2,0x2
    80004c8c:	60890913          	addi	s2,s2,1544 # 80007290 <kmem>
    80004c90:	00ca1a13          	slli	s4,s4,0xc
    80004c94:	0140006f          	j	80004ca8 <kinit+0x80>
    80004c98:	000017b7          	lui	a5,0x1
    80004c9c:	00f484b3          	add	s1,s1,a5
    80004ca0:	0554e863          	bltu	s1,s5,80004cf0 <kinit+0xc8>
    80004ca4:	0534f663          	bgeu	s1,s3,80004cf0 <kinit+0xc8>
    80004ca8:	00001637          	lui	a2,0x1
    80004cac:	00100593          	li	a1,1
    80004cb0:	00048513          	mv	a0,s1
    80004cb4:	00000097          	auipc	ra,0x0
    80004cb8:	5e4080e7          	jalr	1508(ra) # 80005298 <__memset>
    80004cbc:	00093783          	ld	a5,0(s2)
    80004cc0:	00f4b023          	sd	a5,0(s1)
    80004cc4:	00993023          	sd	s1,0(s2)
    80004cc8:	fd4498e3          	bne	s1,s4,80004c98 <kinit+0x70>
    80004ccc:	03813083          	ld	ra,56(sp)
    80004cd0:	03013403          	ld	s0,48(sp)
    80004cd4:	02813483          	ld	s1,40(sp)
    80004cd8:	02013903          	ld	s2,32(sp)
    80004cdc:	01813983          	ld	s3,24(sp)
    80004ce0:	01013a03          	ld	s4,16(sp)
    80004ce4:	00813a83          	ld	s5,8(sp)
    80004ce8:	04010113          	addi	sp,sp,64
    80004cec:	00008067          	ret
    80004cf0:	00001517          	auipc	a0,0x1
    80004cf4:	4b850513          	addi	a0,a0,1208 # 800061a8 <digits+0x18>
    80004cf8:	fffff097          	auipc	ra,0xfffff
    80004cfc:	4b4080e7          	jalr	1204(ra) # 800041ac <panic>

0000000080004d00 <freerange>:
    80004d00:	fc010113          	addi	sp,sp,-64
    80004d04:	000017b7          	lui	a5,0x1
    80004d08:	02913423          	sd	s1,40(sp)
    80004d0c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80004d10:	009504b3          	add	s1,a0,s1
    80004d14:	fffff537          	lui	a0,0xfffff
    80004d18:	02813823          	sd	s0,48(sp)
    80004d1c:	02113c23          	sd	ra,56(sp)
    80004d20:	03213023          	sd	s2,32(sp)
    80004d24:	01313c23          	sd	s3,24(sp)
    80004d28:	01413823          	sd	s4,16(sp)
    80004d2c:	01513423          	sd	s5,8(sp)
    80004d30:	01613023          	sd	s6,0(sp)
    80004d34:	04010413          	addi	s0,sp,64
    80004d38:	00a4f4b3          	and	s1,s1,a0
    80004d3c:	00f487b3          	add	a5,s1,a5
    80004d40:	06f5e463          	bltu	a1,a5,80004da8 <freerange+0xa8>
    80004d44:	00004a97          	auipc	s5,0x4
    80004d48:	83ca8a93          	addi	s5,s5,-1988 # 80008580 <end>
    80004d4c:	0954e263          	bltu	s1,s5,80004dd0 <freerange+0xd0>
    80004d50:	01100993          	li	s3,17
    80004d54:	01b99993          	slli	s3,s3,0x1b
    80004d58:	0734fc63          	bgeu	s1,s3,80004dd0 <freerange+0xd0>
    80004d5c:	00058a13          	mv	s4,a1
    80004d60:	00002917          	auipc	s2,0x2
    80004d64:	53090913          	addi	s2,s2,1328 # 80007290 <kmem>
    80004d68:	00002b37          	lui	s6,0x2
    80004d6c:	0140006f          	j	80004d80 <freerange+0x80>
    80004d70:	000017b7          	lui	a5,0x1
    80004d74:	00f484b3          	add	s1,s1,a5
    80004d78:	0554ec63          	bltu	s1,s5,80004dd0 <freerange+0xd0>
    80004d7c:	0534fa63          	bgeu	s1,s3,80004dd0 <freerange+0xd0>
    80004d80:	00001637          	lui	a2,0x1
    80004d84:	00100593          	li	a1,1
    80004d88:	00048513          	mv	a0,s1
    80004d8c:	00000097          	auipc	ra,0x0
    80004d90:	50c080e7          	jalr	1292(ra) # 80005298 <__memset>
    80004d94:	00093703          	ld	a4,0(s2)
    80004d98:	016487b3          	add	a5,s1,s6
    80004d9c:	00e4b023          	sd	a4,0(s1)
    80004da0:	00993023          	sd	s1,0(s2)
    80004da4:	fcfa76e3          	bgeu	s4,a5,80004d70 <freerange+0x70>
    80004da8:	03813083          	ld	ra,56(sp)
    80004dac:	03013403          	ld	s0,48(sp)
    80004db0:	02813483          	ld	s1,40(sp)
    80004db4:	02013903          	ld	s2,32(sp)
    80004db8:	01813983          	ld	s3,24(sp)
    80004dbc:	01013a03          	ld	s4,16(sp)
    80004dc0:	00813a83          	ld	s5,8(sp)
    80004dc4:	00013b03          	ld	s6,0(sp)
    80004dc8:	04010113          	addi	sp,sp,64
    80004dcc:	00008067          	ret
    80004dd0:	00001517          	auipc	a0,0x1
    80004dd4:	3d850513          	addi	a0,a0,984 # 800061a8 <digits+0x18>
    80004dd8:	fffff097          	auipc	ra,0xfffff
    80004ddc:	3d4080e7          	jalr	980(ra) # 800041ac <panic>

0000000080004de0 <kfree>:
    80004de0:	fe010113          	addi	sp,sp,-32
    80004de4:	00813823          	sd	s0,16(sp)
    80004de8:	00113c23          	sd	ra,24(sp)
    80004dec:	00913423          	sd	s1,8(sp)
    80004df0:	02010413          	addi	s0,sp,32
    80004df4:	03451793          	slli	a5,a0,0x34
    80004df8:	04079c63          	bnez	a5,80004e50 <kfree+0x70>
    80004dfc:	00003797          	auipc	a5,0x3
    80004e00:	78478793          	addi	a5,a5,1924 # 80008580 <end>
    80004e04:	00050493          	mv	s1,a0
    80004e08:	04f56463          	bltu	a0,a5,80004e50 <kfree+0x70>
    80004e0c:	01100793          	li	a5,17
    80004e10:	01b79793          	slli	a5,a5,0x1b
    80004e14:	02f57e63          	bgeu	a0,a5,80004e50 <kfree+0x70>
    80004e18:	00001637          	lui	a2,0x1
    80004e1c:	00100593          	li	a1,1
    80004e20:	00000097          	auipc	ra,0x0
    80004e24:	478080e7          	jalr	1144(ra) # 80005298 <__memset>
    80004e28:	00002797          	auipc	a5,0x2
    80004e2c:	46878793          	addi	a5,a5,1128 # 80007290 <kmem>
    80004e30:	0007b703          	ld	a4,0(a5)
    80004e34:	01813083          	ld	ra,24(sp)
    80004e38:	01013403          	ld	s0,16(sp)
    80004e3c:	00e4b023          	sd	a4,0(s1)
    80004e40:	0097b023          	sd	s1,0(a5)
    80004e44:	00813483          	ld	s1,8(sp)
    80004e48:	02010113          	addi	sp,sp,32
    80004e4c:	00008067          	ret
    80004e50:	00001517          	auipc	a0,0x1
    80004e54:	35850513          	addi	a0,a0,856 # 800061a8 <digits+0x18>
    80004e58:	fffff097          	auipc	ra,0xfffff
    80004e5c:	354080e7          	jalr	852(ra) # 800041ac <panic>

0000000080004e60 <kalloc>:
    80004e60:	fe010113          	addi	sp,sp,-32
    80004e64:	00813823          	sd	s0,16(sp)
    80004e68:	00913423          	sd	s1,8(sp)
    80004e6c:	00113c23          	sd	ra,24(sp)
    80004e70:	02010413          	addi	s0,sp,32
    80004e74:	00002797          	auipc	a5,0x2
    80004e78:	41c78793          	addi	a5,a5,1052 # 80007290 <kmem>
    80004e7c:	0007b483          	ld	s1,0(a5)
    80004e80:	02048063          	beqz	s1,80004ea0 <kalloc+0x40>
    80004e84:	0004b703          	ld	a4,0(s1)
    80004e88:	00001637          	lui	a2,0x1
    80004e8c:	00500593          	li	a1,5
    80004e90:	00048513          	mv	a0,s1
    80004e94:	00e7b023          	sd	a4,0(a5)
    80004e98:	00000097          	auipc	ra,0x0
    80004e9c:	400080e7          	jalr	1024(ra) # 80005298 <__memset>
    80004ea0:	01813083          	ld	ra,24(sp)
    80004ea4:	01013403          	ld	s0,16(sp)
    80004ea8:	00048513          	mv	a0,s1
    80004eac:	00813483          	ld	s1,8(sp)
    80004eb0:	02010113          	addi	sp,sp,32
    80004eb4:	00008067          	ret

0000000080004eb8 <initlock>:
    80004eb8:	ff010113          	addi	sp,sp,-16
    80004ebc:	00813423          	sd	s0,8(sp)
    80004ec0:	01010413          	addi	s0,sp,16
    80004ec4:	00813403          	ld	s0,8(sp)
    80004ec8:	00b53423          	sd	a1,8(a0)
    80004ecc:	00052023          	sw	zero,0(a0)
    80004ed0:	00053823          	sd	zero,16(a0)
    80004ed4:	01010113          	addi	sp,sp,16
    80004ed8:	00008067          	ret

0000000080004edc <acquire>:
    80004edc:	fe010113          	addi	sp,sp,-32
    80004ee0:	00813823          	sd	s0,16(sp)
    80004ee4:	00913423          	sd	s1,8(sp)
    80004ee8:	00113c23          	sd	ra,24(sp)
    80004eec:	01213023          	sd	s2,0(sp)
    80004ef0:	02010413          	addi	s0,sp,32
    80004ef4:	00050493          	mv	s1,a0
    80004ef8:	10002973          	csrr	s2,sstatus
    80004efc:	100027f3          	csrr	a5,sstatus
    80004f00:	ffd7f793          	andi	a5,a5,-3
    80004f04:	10079073          	csrw	sstatus,a5
    80004f08:	fffff097          	auipc	ra,0xfffff
    80004f0c:	8ec080e7          	jalr	-1812(ra) # 800037f4 <mycpu>
    80004f10:	07852783          	lw	a5,120(a0)
    80004f14:	06078e63          	beqz	a5,80004f90 <acquire+0xb4>
    80004f18:	fffff097          	auipc	ra,0xfffff
    80004f1c:	8dc080e7          	jalr	-1828(ra) # 800037f4 <mycpu>
    80004f20:	07852783          	lw	a5,120(a0)
    80004f24:	0004a703          	lw	a4,0(s1)
    80004f28:	0017879b          	addiw	a5,a5,1
    80004f2c:	06f52c23          	sw	a5,120(a0)
    80004f30:	04071063          	bnez	a4,80004f70 <acquire+0x94>
    80004f34:	00100713          	li	a4,1
    80004f38:	00070793          	mv	a5,a4
    80004f3c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80004f40:	0007879b          	sext.w	a5,a5
    80004f44:	fe079ae3          	bnez	a5,80004f38 <acquire+0x5c>
    80004f48:	0ff0000f          	fence
    80004f4c:	fffff097          	auipc	ra,0xfffff
    80004f50:	8a8080e7          	jalr	-1880(ra) # 800037f4 <mycpu>
    80004f54:	01813083          	ld	ra,24(sp)
    80004f58:	01013403          	ld	s0,16(sp)
    80004f5c:	00a4b823          	sd	a0,16(s1)
    80004f60:	00013903          	ld	s2,0(sp)
    80004f64:	00813483          	ld	s1,8(sp)
    80004f68:	02010113          	addi	sp,sp,32
    80004f6c:	00008067          	ret
    80004f70:	0104b903          	ld	s2,16(s1)
    80004f74:	fffff097          	auipc	ra,0xfffff
    80004f78:	880080e7          	jalr	-1920(ra) # 800037f4 <mycpu>
    80004f7c:	faa91ce3          	bne	s2,a0,80004f34 <acquire+0x58>
    80004f80:	00001517          	auipc	a0,0x1
    80004f84:	23050513          	addi	a0,a0,560 # 800061b0 <digits+0x20>
    80004f88:	fffff097          	auipc	ra,0xfffff
    80004f8c:	224080e7          	jalr	548(ra) # 800041ac <panic>
    80004f90:	00195913          	srli	s2,s2,0x1
    80004f94:	fffff097          	auipc	ra,0xfffff
    80004f98:	860080e7          	jalr	-1952(ra) # 800037f4 <mycpu>
    80004f9c:	00197913          	andi	s2,s2,1
    80004fa0:	07252e23          	sw	s2,124(a0)
    80004fa4:	f75ff06f          	j	80004f18 <acquire+0x3c>

0000000080004fa8 <release>:
    80004fa8:	fe010113          	addi	sp,sp,-32
    80004fac:	00813823          	sd	s0,16(sp)
    80004fb0:	00113c23          	sd	ra,24(sp)
    80004fb4:	00913423          	sd	s1,8(sp)
    80004fb8:	01213023          	sd	s2,0(sp)
    80004fbc:	02010413          	addi	s0,sp,32
    80004fc0:	00052783          	lw	a5,0(a0)
    80004fc4:	00079a63          	bnez	a5,80004fd8 <release+0x30>
    80004fc8:	00001517          	auipc	a0,0x1
    80004fcc:	1f050513          	addi	a0,a0,496 # 800061b8 <digits+0x28>
    80004fd0:	fffff097          	auipc	ra,0xfffff
    80004fd4:	1dc080e7          	jalr	476(ra) # 800041ac <panic>
    80004fd8:	01053903          	ld	s2,16(a0)
    80004fdc:	00050493          	mv	s1,a0
    80004fe0:	fffff097          	auipc	ra,0xfffff
    80004fe4:	814080e7          	jalr	-2028(ra) # 800037f4 <mycpu>
    80004fe8:	fea910e3          	bne	s2,a0,80004fc8 <release+0x20>
    80004fec:	0004b823          	sd	zero,16(s1)
    80004ff0:	0ff0000f          	fence
    80004ff4:	0f50000f          	fence	iorw,ow
    80004ff8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80004ffc:	ffffe097          	auipc	ra,0xffffe
    80005000:	7f8080e7          	jalr	2040(ra) # 800037f4 <mycpu>
    80005004:	100027f3          	csrr	a5,sstatus
    80005008:	0027f793          	andi	a5,a5,2
    8000500c:	04079a63          	bnez	a5,80005060 <release+0xb8>
    80005010:	07852783          	lw	a5,120(a0)
    80005014:	02f05e63          	blez	a5,80005050 <release+0xa8>
    80005018:	fff7871b          	addiw	a4,a5,-1
    8000501c:	06e52c23          	sw	a4,120(a0)
    80005020:	00071c63          	bnez	a4,80005038 <release+0x90>
    80005024:	07c52783          	lw	a5,124(a0)
    80005028:	00078863          	beqz	a5,80005038 <release+0x90>
    8000502c:	100027f3          	csrr	a5,sstatus
    80005030:	0027e793          	ori	a5,a5,2
    80005034:	10079073          	csrw	sstatus,a5
    80005038:	01813083          	ld	ra,24(sp)
    8000503c:	01013403          	ld	s0,16(sp)
    80005040:	00813483          	ld	s1,8(sp)
    80005044:	00013903          	ld	s2,0(sp)
    80005048:	02010113          	addi	sp,sp,32
    8000504c:	00008067          	ret
    80005050:	00001517          	auipc	a0,0x1
    80005054:	18850513          	addi	a0,a0,392 # 800061d8 <digits+0x48>
    80005058:	fffff097          	auipc	ra,0xfffff
    8000505c:	154080e7          	jalr	340(ra) # 800041ac <panic>
    80005060:	00001517          	auipc	a0,0x1
    80005064:	16050513          	addi	a0,a0,352 # 800061c0 <digits+0x30>
    80005068:	fffff097          	auipc	ra,0xfffff
    8000506c:	144080e7          	jalr	324(ra) # 800041ac <panic>

0000000080005070 <holding>:
    80005070:	00052783          	lw	a5,0(a0)
    80005074:	00079663          	bnez	a5,80005080 <holding+0x10>
    80005078:	00000513          	li	a0,0
    8000507c:	00008067          	ret
    80005080:	fe010113          	addi	sp,sp,-32
    80005084:	00813823          	sd	s0,16(sp)
    80005088:	00913423          	sd	s1,8(sp)
    8000508c:	00113c23          	sd	ra,24(sp)
    80005090:	02010413          	addi	s0,sp,32
    80005094:	01053483          	ld	s1,16(a0)
    80005098:	ffffe097          	auipc	ra,0xffffe
    8000509c:	75c080e7          	jalr	1884(ra) # 800037f4 <mycpu>
    800050a0:	01813083          	ld	ra,24(sp)
    800050a4:	01013403          	ld	s0,16(sp)
    800050a8:	40a48533          	sub	a0,s1,a0
    800050ac:	00153513          	seqz	a0,a0
    800050b0:	00813483          	ld	s1,8(sp)
    800050b4:	02010113          	addi	sp,sp,32
    800050b8:	00008067          	ret

00000000800050bc <push_off>:
    800050bc:	fe010113          	addi	sp,sp,-32
    800050c0:	00813823          	sd	s0,16(sp)
    800050c4:	00113c23          	sd	ra,24(sp)
    800050c8:	00913423          	sd	s1,8(sp)
    800050cc:	02010413          	addi	s0,sp,32
    800050d0:	100024f3          	csrr	s1,sstatus
    800050d4:	100027f3          	csrr	a5,sstatus
    800050d8:	ffd7f793          	andi	a5,a5,-3
    800050dc:	10079073          	csrw	sstatus,a5
    800050e0:	ffffe097          	auipc	ra,0xffffe
    800050e4:	714080e7          	jalr	1812(ra) # 800037f4 <mycpu>
    800050e8:	07852783          	lw	a5,120(a0)
    800050ec:	02078663          	beqz	a5,80005118 <push_off+0x5c>
    800050f0:	ffffe097          	auipc	ra,0xffffe
    800050f4:	704080e7          	jalr	1796(ra) # 800037f4 <mycpu>
    800050f8:	07852783          	lw	a5,120(a0)
    800050fc:	01813083          	ld	ra,24(sp)
    80005100:	01013403          	ld	s0,16(sp)
    80005104:	0017879b          	addiw	a5,a5,1
    80005108:	06f52c23          	sw	a5,120(a0)
    8000510c:	00813483          	ld	s1,8(sp)
    80005110:	02010113          	addi	sp,sp,32
    80005114:	00008067          	ret
    80005118:	0014d493          	srli	s1,s1,0x1
    8000511c:	ffffe097          	auipc	ra,0xffffe
    80005120:	6d8080e7          	jalr	1752(ra) # 800037f4 <mycpu>
    80005124:	0014f493          	andi	s1,s1,1
    80005128:	06952e23          	sw	s1,124(a0)
    8000512c:	fc5ff06f          	j	800050f0 <push_off+0x34>

0000000080005130 <pop_off>:
    80005130:	ff010113          	addi	sp,sp,-16
    80005134:	00813023          	sd	s0,0(sp)
    80005138:	00113423          	sd	ra,8(sp)
    8000513c:	01010413          	addi	s0,sp,16
    80005140:	ffffe097          	auipc	ra,0xffffe
    80005144:	6b4080e7          	jalr	1716(ra) # 800037f4 <mycpu>
    80005148:	100027f3          	csrr	a5,sstatus
    8000514c:	0027f793          	andi	a5,a5,2
    80005150:	04079663          	bnez	a5,8000519c <pop_off+0x6c>
    80005154:	07852783          	lw	a5,120(a0)
    80005158:	02f05a63          	blez	a5,8000518c <pop_off+0x5c>
    8000515c:	fff7871b          	addiw	a4,a5,-1
    80005160:	06e52c23          	sw	a4,120(a0)
    80005164:	00071c63          	bnez	a4,8000517c <pop_off+0x4c>
    80005168:	07c52783          	lw	a5,124(a0)
    8000516c:	00078863          	beqz	a5,8000517c <pop_off+0x4c>
    80005170:	100027f3          	csrr	a5,sstatus
    80005174:	0027e793          	ori	a5,a5,2
    80005178:	10079073          	csrw	sstatus,a5
    8000517c:	00813083          	ld	ra,8(sp)
    80005180:	00013403          	ld	s0,0(sp)
    80005184:	01010113          	addi	sp,sp,16
    80005188:	00008067          	ret
    8000518c:	00001517          	auipc	a0,0x1
    80005190:	04c50513          	addi	a0,a0,76 # 800061d8 <digits+0x48>
    80005194:	fffff097          	auipc	ra,0xfffff
    80005198:	018080e7          	jalr	24(ra) # 800041ac <panic>
    8000519c:	00001517          	auipc	a0,0x1
    800051a0:	02450513          	addi	a0,a0,36 # 800061c0 <digits+0x30>
    800051a4:	fffff097          	auipc	ra,0xfffff
    800051a8:	008080e7          	jalr	8(ra) # 800041ac <panic>

00000000800051ac <push_on>:
    800051ac:	fe010113          	addi	sp,sp,-32
    800051b0:	00813823          	sd	s0,16(sp)
    800051b4:	00113c23          	sd	ra,24(sp)
    800051b8:	00913423          	sd	s1,8(sp)
    800051bc:	02010413          	addi	s0,sp,32
    800051c0:	100024f3          	csrr	s1,sstatus
    800051c4:	100027f3          	csrr	a5,sstatus
    800051c8:	0027e793          	ori	a5,a5,2
    800051cc:	10079073          	csrw	sstatus,a5
    800051d0:	ffffe097          	auipc	ra,0xffffe
    800051d4:	624080e7          	jalr	1572(ra) # 800037f4 <mycpu>
    800051d8:	07852783          	lw	a5,120(a0)
    800051dc:	02078663          	beqz	a5,80005208 <push_on+0x5c>
    800051e0:	ffffe097          	auipc	ra,0xffffe
    800051e4:	614080e7          	jalr	1556(ra) # 800037f4 <mycpu>
    800051e8:	07852783          	lw	a5,120(a0)
    800051ec:	01813083          	ld	ra,24(sp)
    800051f0:	01013403          	ld	s0,16(sp)
    800051f4:	0017879b          	addiw	a5,a5,1
    800051f8:	06f52c23          	sw	a5,120(a0)
    800051fc:	00813483          	ld	s1,8(sp)
    80005200:	02010113          	addi	sp,sp,32
    80005204:	00008067          	ret
    80005208:	0014d493          	srli	s1,s1,0x1
    8000520c:	ffffe097          	auipc	ra,0xffffe
    80005210:	5e8080e7          	jalr	1512(ra) # 800037f4 <mycpu>
    80005214:	0014f493          	andi	s1,s1,1
    80005218:	06952e23          	sw	s1,124(a0)
    8000521c:	fc5ff06f          	j	800051e0 <push_on+0x34>

0000000080005220 <pop_on>:
    80005220:	ff010113          	addi	sp,sp,-16
    80005224:	00813023          	sd	s0,0(sp)
    80005228:	00113423          	sd	ra,8(sp)
    8000522c:	01010413          	addi	s0,sp,16
    80005230:	ffffe097          	auipc	ra,0xffffe
    80005234:	5c4080e7          	jalr	1476(ra) # 800037f4 <mycpu>
    80005238:	100027f3          	csrr	a5,sstatus
    8000523c:	0027f793          	andi	a5,a5,2
    80005240:	04078463          	beqz	a5,80005288 <pop_on+0x68>
    80005244:	07852783          	lw	a5,120(a0)
    80005248:	02f05863          	blez	a5,80005278 <pop_on+0x58>
    8000524c:	fff7879b          	addiw	a5,a5,-1
    80005250:	06f52c23          	sw	a5,120(a0)
    80005254:	07853783          	ld	a5,120(a0)
    80005258:	00079863          	bnez	a5,80005268 <pop_on+0x48>
    8000525c:	100027f3          	csrr	a5,sstatus
    80005260:	ffd7f793          	andi	a5,a5,-3
    80005264:	10079073          	csrw	sstatus,a5
    80005268:	00813083          	ld	ra,8(sp)
    8000526c:	00013403          	ld	s0,0(sp)
    80005270:	01010113          	addi	sp,sp,16
    80005274:	00008067          	ret
    80005278:	00001517          	auipc	a0,0x1
    8000527c:	f8850513          	addi	a0,a0,-120 # 80006200 <digits+0x70>
    80005280:	fffff097          	auipc	ra,0xfffff
    80005284:	f2c080e7          	jalr	-212(ra) # 800041ac <panic>
    80005288:	00001517          	auipc	a0,0x1
    8000528c:	f5850513          	addi	a0,a0,-168 # 800061e0 <digits+0x50>
    80005290:	fffff097          	auipc	ra,0xfffff
    80005294:	f1c080e7          	jalr	-228(ra) # 800041ac <panic>

0000000080005298 <__memset>:
    80005298:	ff010113          	addi	sp,sp,-16
    8000529c:	00813423          	sd	s0,8(sp)
    800052a0:	01010413          	addi	s0,sp,16
    800052a4:	1a060e63          	beqz	a2,80005460 <__memset+0x1c8>
    800052a8:	40a007b3          	neg	a5,a0
    800052ac:	0077f793          	andi	a5,a5,7
    800052b0:	00778693          	addi	a3,a5,7
    800052b4:	00b00813          	li	a6,11
    800052b8:	0ff5f593          	andi	a1,a1,255
    800052bc:	fff6071b          	addiw	a4,a2,-1
    800052c0:	1b06e663          	bltu	a3,a6,8000546c <__memset+0x1d4>
    800052c4:	1cd76463          	bltu	a4,a3,8000548c <__memset+0x1f4>
    800052c8:	1a078e63          	beqz	a5,80005484 <__memset+0x1ec>
    800052cc:	00b50023          	sb	a1,0(a0)
    800052d0:	00100713          	li	a4,1
    800052d4:	1ae78463          	beq	a5,a4,8000547c <__memset+0x1e4>
    800052d8:	00b500a3          	sb	a1,1(a0)
    800052dc:	00200713          	li	a4,2
    800052e0:	1ae78a63          	beq	a5,a4,80005494 <__memset+0x1fc>
    800052e4:	00b50123          	sb	a1,2(a0)
    800052e8:	00300713          	li	a4,3
    800052ec:	18e78463          	beq	a5,a4,80005474 <__memset+0x1dc>
    800052f0:	00b501a3          	sb	a1,3(a0)
    800052f4:	00400713          	li	a4,4
    800052f8:	1ae78263          	beq	a5,a4,8000549c <__memset+0x204>
    800052fc:	00b50223          	sb	a1,4(a0)
    80005300:	00500713          	li	a4,5
    80005304:	1ae78063          	beq	a5,a4,800054a4 <__memset+0x20c>
    80005308:	00b502a3          	sb	a1,5(a0)
    8000530c:	00700713          	li	a4,7
    80005310:	18e79e63          	bne	a5,a4,800054ac <__memset+0x214>
    80005314:	00b50323          	sb	a1,6(a0)
    80005318:	00700e93          	li	t4,7
    8000531c:	00859713          	slli	a4,a1,0x8
    80005320:	00e5e733          	or	a4,a1,a4
    80005324:	01059e13          	slli	t3,a1,0x10
    80005328:	01c76e33          	or	t3,a4,t3
    8000532c:	01859313          	slli	t1,a1,0x18
    80005330:	006e6333          	or	t1,t3,t1
    80005334:	02059893          	slli	a7,a1,0x20
    80005338:	40f60e3b          	subw	t3,a2,a5
    8000533c:	011368b3          	or	a7,t1,a7
    80005340:	02859813          	slli	a6,a1,0x28
    80005344:	0108e833          	or	a6,a7,a6
    80005348:	03059693          	slli	a3,a1,0x30
    8000534c:	003e589b          	srliw	a7,t3,0x3
    80005350:	00d866b3          	or	a3,a6,a3
    80005354:	03859713          	slli	a4,a1,0x38
    80005358:	00389813          	slli	a6,a7,0x3
    8000535c:	00f507b3          	add	a5,a0,a5
    80005360:	00e6e733          	or	a4,a3,a4
    80005364:	000e089b          	sext.w	a7,t3
    80005368:	00f806b3          	add	a3,a6,a5
    8000536c:	00e7b023          	sd	a4,0(a5)
    80005370:	00878793          	addi	a5,a5,8
    80005374:	fed79ce3          	bne	a5,a3,8000536c <__memset+0xd4>
    80005378:	ff8e7793          	andi	a5,t3,-8
    8000537c:	0007871b          	sext.w	a4,a5
    80005380:	01d787bb          	addw	a5,a5,t4
    80005384:	0ce88e63          	beq	a7,a4,80005460 <__memset+0x1c8>
    80005388:	00f50733          	add	a4,a0,a5
    8000538c:	00b70023          	sb	a1,0(a4)
    80005390:	0017871b          	addiw	a4,a5,1
    80005394:	0cc77663          	bgeu	a4,a2,80005460 <__memset+0x1c8>
    80005398:	00e50733          	add	a4,a0,a4
    8000539c:	00b70023          	sb	a1,0(a4)
    800053a0:	0027871b          	addiw	a4,a5,2
    800053a4:	0ac77e63          	bgeu	a4,a2,80005460 <__memset+0x1c8>
    800053a8:	00e50733          	add	a4,a0,a4
    800053ac:	00b70023          	sb	a1,0(a4)
    800053b0:	0037871b          	addiw	a4,a5,3
    800053b4:	0ac77663          	bgeu	a4,a2,80005460 <__memset+0x1c8>
    800053b8:	00e50733          	add	a4,a0,a4
    800053bc:	00b70023          	sb	a1,0(a4)
    800053c0:	0047871b          	addiw	a4,a5,4
    800053c4:	08c77e63          	bgeu	a4,a2,80005460 <__memset+0x1c8>
    800053c8:	00e50733          	add	a4,a0,a4
    800053cc:	00b70023          	sb	a1,0(a4)
    800053d0:	0057871b          	addiw	a4,a5,5
    800053d4:	08c77663          	bgeu	a4,a2,80005460 <__memset+0x1c8>
    800053d8:	00e50733          	add	a4,a0,a4
    800053dc:	00b70023          	sb	a1,0(a4)
    800053e0:	0067871b          	addiw	a4,a5,6
    800053e4:	06c77e63          	bgeu	a4,a2,80005460 <__memset+0x1c8>
    800053e8:	00e50733          	add	a4,a0,a4
    800053ec:	00b70023          	sb	a1,0(a4)
    800053f0:	0077871b          	addiw	a4,a5,7
    800053f4:	06c77663          	bgeu	a4,a2,80005460 <__memset+0x1c8>
    800053f8:	00e50733          	add	a4,a0,a4
    800053fc:	00b70023          	sb	a1,0(a4)
    80005400:	0087871b          	addiw	a4,a5,8
    80005404:	04c77e63          	bgeu	a4,a2,80005460 <__memset+0x1c8>
    80005408:	00e50733          	add	a4,a0,a4
    8000540c:	00b70023          	sb	a1,0(a4)
    80005410:	0097871b          	addiw	a4,a5,9
    80005414:	04c77663          	bgeu	a4,a2,80005460 <__memset+0x1c8>
    80005418:	00e50733          	add	a4,a0,a4
    8000541c:	00b70023          	sb	a1,0(a4)
    80005420:	00a7871b          	addiw	a4,a5,10
    80005424:	02c77e63          	bgeu	a4,a2,80005460 <__memset+0x1c8>
    80005428:	00e50733          	add	a4,a0,a4
    8000542c:	00b70023          	sb	a1,0(a4)
    80005430:	00b7871b          	addiw	a4,a5,11
    80005434:	02c77663          	bgeu	a4,a2,80005460 <__memset+0x1c8>
    80005438:	00e50733          	add	a4,a0,a4
    8000543c:	00b70023          	sb	a1,0(a4)
    80005440:	00c7871b          	addiw	a4,a5,12
    80005444:	00c77e63          	bgeu	a4,a2,80005460 <__memset+0x1c8>
    80005448:	00e50733          	add	a4,a0,a4
    8000544c:	00b70023          	sb	a1,0(a4)
    80005450:	00d7879b          	addiw	a5,a5,13
    80005454:	00c7f663          	bgeu	a5,a2,80005460 <__memset+0x1c8>
    80005458:	00f507b3          	add	a5,a0,a5
    8000545c:	00b78023          	sb	a1,0(a5)
    80005460:	00813403          	ld	s0,8(sp)
    80005464:	01010113          	addi	sp,sp,16
    80005468:	00008067          	ret
    8000546c:	00b00693          	li	a3,11
    80005470:	e55ff06f          	j	800052c4 <__memset+0x2c>
    80005474:	00300e93          	li	t4,3
    80005478:	ea5ff06f          	j	8000531c <__memset+0x84>
    8000547c:	00100e93          	li	t4,1
    80005480:	e9dff06f          	j	8000531c <__memset+0x84>
    80005484:	00000e93          	li	t4,0
    80005488:	e95ff06f          	j	8000531c <__memset+0x84>
    8000548c:	00000793          	li	a5,0
    80005490:	ef9ff06f          	j	80005388 <__memset+0xf0>
    80005494:	00200e93          	li	t4,2
    80005498:	e85ff06f          	j	8000531c <__memset+0x84>
    8000549c:	00400e93          	li	t4,4
    800054a0:	e7dff06f          	j	8000531c <__memset+0x84>
    800054a4:	00500e93          	li	t4,5
    800054a8:	e75ff06f          	j	8000531c <__memset+0x84>
    800054ac:	00600e93          	li	t4,6
    800054b0:	e6dff06f          	j	8000531c <__memset+0x84>

00000000800054b4 <__memmove>:
    800054b4:	ff010113          	addi	sp,sp,-16
    800054b8:	00813423          	sd	s0,8(sp)
    800054bc:	01010413          	addi	s0,sp,16
    800054c0:	0e060863          	beqz	a2,800055b0 <__memmove+0xfc>
    800054c4:	fff6069b          	addiw	a3,a2,-1
    800054c8:	0006881b          	sext.w	a6,a3
    800054cc:	0ea5e863          	bltu	a1,a0,800055bc <__memmove+0x108>
    800054d0:	00758713          	addi	a4,a1,7
    800054d4:	00a5e7b3          	or	a5,a1,a0
    800054d8:	40a70733          	sub	a4,a4,a0
    800054dc:	0077f793          	andi	a5,a5,7
    800054e0:	00f73713          	sltiu	a4,a4,15
    800054e4:	00174713          	xori	a4,a4,1
    800054e8:	0017b793          	seqz	a5,a5
    800054ec:	00e7f7b3          	and	a5,a5,a4
    800054f0:	10078863          	beqz	a5,80005600 <__memmove+0x14c>
    800054f4:	00900793          	li	a5,9
    800054f8:	1107f463          	bgeu	a5,a6,80005600 <__memmove+0x14c>
    800054fc:	0036581b          	srliw	a6,a2,0x3
    80005500:	fff8081b          	addiw	a6,a6,-1
    80005504:	02081813          	slli	a6,a6,0x20
    80005508:	01d85893          	srli	a7,a6,0x1d
    8000550c:	00858813          	addi	a6,a1,8
    80005510:	00058793          	mv	a5,a1
    80005514:	00050713          	mv	a4,a0
    80005518:	01088833          	add	a6,a7,a6
    8000551c:	0007b883          	ld	a7,0(a5)
    80005520:	00878793          	addi	a5,a5,8
    80005524:	00870713          	addi	a4,a4,8
    80005528:	ff173c23          	sd	a7,-8(a4)
    8000552c:	ff0798e3          	bne	a5,a6,8000551c <__memmove+0x68>
    80005530:	ff867713          	andi	a4,a2,-8
    80005534:	02071793          	slli	a5,a4,0x20
    80005538:	0207d793          	srli	a5,a5,0x20
    8000553c:	00f585b3          	add	a1,a1,a5
    80005540:	40e686bb          	subw	a3,a3,a4
    80005544:	00f507b3          	add	a5,a0,a5
    80005548:	06e60463          	beq	a2,a4,800055b0 <__memmove+0xfc>
    8000554c:	0005c703          	lbu	a4,0(a1)
    80005550:	00e78023          	sb	a4,0(a5)
    80005554:	04068e63          	beqz	a3,800055b0 <__memmove+0xfc>
    80005558:	0015c603          	lbu	a2,1(a1)
    8000555c:	00100713          	li	a4,1
    80005560:	00c780a3          	sb	a2,1(a5)
    80005564:	04e68663          	beq	a3,a4,800055b0 <__memmove+0xfc>
    80005568:	0025c603          	lbu	a2,2(a1)
    8000556c:	00200713          	li	a4,2
    80005570:	00c78123          	sb	a2,2(a5)
    80005574:	02e68e63          	beq	a3,a4,800055b0 <__memmove+0xfc>
    80005578:	0035c603          	lbu	a2,3(a1)
    8000557c:	00300713          	li	a4,3
    80005580:	00c781a3          	sb	a2,3(a5)
    80005584:	02e68663          	beq	a3,a4,800055b0 <__memmove+0xfc>
    80005588:	0045c603          	lbu	a2,4(a1)
    8000558c:	00400713          	li	a4,4
    80005590:	00c78223          	sb	a2,4(a5)
    80005594:	00e68e63          	beq	a3,a4,800055b0 <__memmove+0xfc>
    80005598:	0055c603          	lbu	a2,5(a1)
    8000559c:	00500713          	li	a4,5
    800055a0:	00c782a3          	sb	a2,5(a5)
    800055a4:	00e68663          	beq	a3,a4,800055b0 <__memmove+0xfc>
    800055a8:	0065c703          	lbu	a4,6(a1)
    800055ac:	00e78323          	sb	a4,6(a5)
    800055b0:	00813403          	ld	s0,8(sp)
    800055b4:	01010113          	addi	sp,sp,16
    800055b8:	00008067          	ret
    800055bc:	02061713          	slli	a4,a2,0x20
    800055c0:	02075713          	srli	a4,a4,0x20
    800055c4:	00e587b3          	add	a5,a1,a4
    800055c8:	f0f574e3          	bgeu	a0,a5,800054d0 <__memmove+0x1c>
    800055cc:	02069613          	slli	a2,a3,0x20
    800055d0:	02065613          	srli	a2,a2,0x20
    800055d4:	fff64613          	not	a2,a2
    800055d8:	00e50733          	add	a4,a0,a4
    800055dc:	00c78633          	add	a2,a5,a2
    800055e0:	fff7c683          	lbu	a3,-1(a5)
    800055e4:	fff78793          	addi	a5,a5,-1
    800055e8:	fff70713          	addi	a4,a4,-1
    800055ec:	00d70023          	sb	a3,0(a4)
    800055f0:	fec798e3          	bne	a5,a2,800055e0 <__memmove+0x12c>
    800055f4:	00813403          	ld	s0,8(sp)
    800055f8:	01010113          	addi	sp,sp,16
    800055fc:	00008067          	ret
    80005600:	02069713          	slli	a4,a3,0x20
    80005604:	02075713          	srli	a4,a4,0x20
    80005608:	00170713          	addi	a4,a4,1
    8000560c:	00e50733          	add	a4,a0,a4
    80005610:	00050793          	mv	a5,a0
    80005614:	0005c683          	lbu	a3,0(a1)
    80005618:	00178793          	addi	a5,a5,1
    8000561c:	00158593          	addi	a1,a1,1
    80005620:	fed78fa3          	sb	a3,-1(a5)
    80005624:	fee798e3          	bne	a5,a4,80005614 <__memmove+0x160>
    80005628:	f89ff06f          	j	800055b0 <__memmove+0xfc>
	...
