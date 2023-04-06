
#include "../lib/hw.h"

#include "../h/syscall_c.h"
#include "../h/SchedulerABI.hpp"
#include "../h/BufferPrinting.hpp"


void* mem_alloc (size_t size){
    size_t cnt=0;
    void *povr;
    uint64 code=0x01;
    size_t t;
    cnt=(size+(sizeof(size_t)))/MEM_BLOCK_SIZE;
    t=(size+(sizeof(size_t)))%MEM_BLOCK_SIZE;
    if(t!=cnt)cnt++;
    cnt*=MEM_BLOCK_SIZE;

    __asm__ volatile("mv a0, %0" : : "r" (code));
    __asm__ volatile("mv a1, %0" : : "r" (cnt));
   __asm__ volatile("ecall");
   __asm__ volatile("mv %0, a0" : "=r" (povr));
    return povr;
}

int mem_free (void* arg){
    uint64 code=0x02;
    uint64 flag;
    void * handler=arg;
    __asm__ volatile("mv a1, %0" : : "r" (handler));
    __asm__ volatile("mv a0, %0" : : "r" (code));
    __asm__ volatile("ecall");
    __asm__ volatile("mv %0, a0" : "=r" (flag));
    if(flag==0x696969) return 0;
    else return -1;

}

void thread_dispatch() {
    uint64 code=0x13;
    __asm__ volatile("mv a0, %0" : : "r" (code));
    __asm__ volatile("ecall");


}

int thread_exit() {
    uint64 code=0x12;
    __asm__ volatile("mv a0, %0" : : "r" (code));
    __asm__ volatile("ecall");
    return 0;
}


int thread_create(thread_t *handle, void (*start_routine)(void *), void *arg) {
    __asm__ volatile("mv a4, %0" : : "r" (mem_alloc(DEFAULT_STACK_SIZE)));
    __asm__ volatile("mv a3, %0" : : "r" (arg));
    __asm__ volatile("mv a2, %0" : : "r" (start_routine));

    __asm__ volatile("li a0, 0x11" );
    __asm__ volatile("mv a1, %0" : : "r" ((void *)handle));

    __asm__ volatile("ecall");
    int povr;
    __asm__ volatile("mv %0, a0" : "=r" (povr));
    if(povr==0){
        SchedulerABI::getInstanceScheduler().put(*(handle));
    }

    return povr;
}

int sem_open(sem_t *handle, unsigned int init) {
    __asm__ volatile("mv a2, %0" : : "r" ((void*)handle));
    __asm__ volatile("mv a1, %0" : : "r" (init));
    __asm__ volatile("li a0, 0x21" );
    __asm__ volatile("ecall");
    int povr;
    __asm__ volatile("mv %0, a0" : "=r" (povr));
    return povr;
}

int sem_close(sem_t handle) {
    __asm__ volatile("mv a1, %0" : : "r" ((void*)handle));
    __asm__ volatile("li a0, 0x22" );
    __asm__ volatile("ecall");
    int povr;
    __asm__ volatile("mv %0, a0" : "=r" (povr));
    return povr;
}

int sem_wait(sem_t id) {
    __asm__ volatile("mv a1, %0" : : "r" ((void*)id));
    __asm__ volatile("li a0, 0x23" );
    __asm__ volatile("ecall");
    int povr;
    __asm__ volatile("mv %0, a0" : "=r" (povr));
    return povr;

}

int sem_signal(sem_t id) {
    __asm__ volatile("mv a1, %0" : : "r" ((void*)id));
    __asm__ volatile("li a0, 0x24" );
    __asm__ volatile("ecall");
    int povr;
    __asm__ volatile("mv %0, a0" : "=r" (povr));
    return povr;
}

int time_sleep(time_t time) {
    if(time==0)return -1;
    __asm__ volatile("mv a1, %0" : : "r" (time));
    __asm__ volatile("li a0, 0x31" );
    __asm__ volatile("ecall");
    int povr;
    __asm__ volatile("mv %0, a0" : "=r" (povr));
    return povr;
}

char getc (){
    BufferPrinting::tmpget++;
    __asm__ volatile("li a0,0x41");
    __asm__ volatile("ecall");

    int povr;
    __asm__ volatile("mv %0, a0" : "=r" (povr));

    return povr;
}



void putc (char c){
    BufferPrinting::tmpput++;

    __asm__ volatile("mv a1,%0" : : "r" (c));
    __asm__ volatile("li a0,0x42");
    __asm__ volatile("ecall");

}
void intopriv(){
    __asm__ volatile("li a0,0xfe");
    __asm__ volatile("ecall");
}
void intouser(){
    __asm__ volatile("li a0,0xff");
    __asm__ volatile("ecall");
}