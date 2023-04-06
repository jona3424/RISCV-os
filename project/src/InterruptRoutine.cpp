
#include "../h/MemoryAllocator.hpp"
#include "../lib/console.h"
#include "../h/ThreadABI.hpp"
#include "../h/SemaphoreABI.hpp"
#include "../h/BufferPrinting.hpp"
#include "../test/printing.hpp"
//ovo treba za prekidna rutina yield da nasilno izadje iz prekidne rutine kad se prvi put nitr poziva
void ThreadABI::popSppSpie()     {
    __asm__ volatile ("csrw sepc, ra" );
    __asm__ volatile("csrc sip,0x02");
    __asm__ volatile ("sret");
}

extern "C" void handleSupervisorTrap(){
    // Array of arguments
    uint64 A[8];
    {
        asm volatile("sd a0, %0" : "=m"(A[0]));
        asm volatile("sd a1, %0" : "=m"(A[1]));
        asm volatile("sd a2, %0" : "=m"(A[2]));
        asm volatile("sd a3, %0" : "=m"(A[3]));
        asm volatile("sd a4, %0" : "=m"(A[4]));
        asm volatile("sd a5, %0" : "=m"(A[5]));
        asm volatile("sd a6, %0" : "=m"(A[6]));
        asm volatile("sd a7, %0" : "=m"(A[7]));
    }
    uint64* a = A;
    //poseban reg za cuvanje sp da umetnem a0
    void* retsp;
    asm volatile("csrr %0, sscratch" : "=r"(retsp));
    //uzimam pc
    unsigned long int incrementedpc;
    __asm__ volatile("csrr %0,sepc": "=r" (incrementedpc));
    //uzmi scause
    uint64 causevalue;
    uint8 a0val=a[0];
    __asm__ volatile("csrr %0,scause" : "=r" (causevalue) );
    // ako je ecall
    if(causevalue==(0x09UL) ||causevalue==(0x08UL)){

        //provjera dali je mem_alloc
        if(a0val==(0x01)){
            //mem_alloc
            size_t bytes=a[1];


            uint64 savesstatus;
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));


            void * retformalloc=MemoryAllocator::getInstance().MemoryAlloc(bytes);

            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));


            //force umetanje povratne vrijednosti na stek
            __asm__ volatile("mv a0, %0" : : "r" ( retformalloc));
            __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));
            //ecall cuva vrijednost trenutnog pc ne sledece instrukcije
            incrementedpc+=4;
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));


        }

        //memory free provjera
        if(a0val==(0x02)){
            incrementedpc+=4;
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));
            void* handler= reinterpret_cast<void *>(a[1]);


            uint64 savesstatus;
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));


            MemoryAllocator::getInstance().MemoryFree(handler);

            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));


            uint64 returngflag=0x696969;
            //umetanje ret value u ovom slucaju nije ni potrebno
            __asm__ volatile("mv a0, %0" : : "r" (returngflag));
            __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));

        }
        if(a0val==(0x11)){
            //threadcreate
            //pc increment

            //restore reg
            void* stack= reinterpret_cast<void *>(a[4]);
            void* arg= reinterpret_cast<void *>(a[3]);
            void(*fun)(void*)=reinterpret_cast<void (*)(void *)>(a[2]);
            ThreadABI **handle= reinterpret_cast<ThreadABI **>(a[1]);


            uint64 savesstatus;
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));
            uint64 returngflag;

            if(ThreadABI::thread_create(handle,fun,arg,stack)<0){
                //greska
                returngflag=-1;
                //umetanje ret value u ovom slucaju nije ni potrebno
                __asm__ volatile("mv a0, %0" : : "r" (returngflag));
                __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));
            }

            //sve ok sve naj
            returngflag=0;
            //umetanje ret value u ovom slucaju nije ni potrebno
            __asm__ volatile("mv a0, %0" : : "r" (returngflag));
            __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));

            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));

            incrementedpc+=4;
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));

        }
        if(a0val==(0x12)) {
            //gasenje niti nasilno
            //incprement pc
            ThreadABI::running->setState(ThreadABI::FINISHED);

            uint64 savesstatus;
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));

            ThreadABI::yield();

            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));

            incrementedpc+=4;
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));

        }
        if(a0val==(0x13)) {
            // ovo je dispatch
            // mozda treba ali vec imam sacuvan pc  ako bude error odkometarisiii
            uint64 savedSEPC;
            asm volatile("csrr %0, sepc" : "=r"(savedSEPC));

            uint64 savesstatus;
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));

            ThreadABI::yield();
            // mozda treba ali vec imam sacuvan pc  ako bude error odkometarisiii
            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));

            //increment pc
            savedSEPC+=4;
            asm volatile("csrw sepc, %0" : : "r"(savedSEPC));

        }
        if(a0val==(0x14)){
            //custom start za cpp api


            uint64 savesstatus;
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));

            ThreadABI *handle= reinterpret_cast<ThreadABI *>(a[1]);
            uint64 returngflag;
            if(handle!= nullptr){
                SchedulerABI::getInstanceScheduler().put(handle);
                returngflag= 1;

            }
            else
            returngflag= -1;

            __asm__ volatile("mv a0, %0" : : "r" (returngflag));
            __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));
            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));
            incrementedpc+=4;
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));

        }

        if(a0val==(0x21)) {
           //semopen
           SemaphoreABI ** sem= reinterpret_cast<SemaphoreABI **>(a[2]);
            int val=a[1];

            uint64 savesstatus;
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));

            //otvaranje semafora
            int retvalfromsem=SemaphoreABI::semopenABI(sem, val);


            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));

            //force umetanje povratne vrijednosti na stek
            __asm__ volatile("mv a0, %0" : : "r" ( retvalfromsem));
            __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));
            //ecall cuva vrijednost trenutnog pc ne sledece instrukcije
            incrementedpc+=4;
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));
        }
        if(a0val==(0x22)) {
            //semclose
            SemaphoreABI * sem= reinterpret_cast<SemaphoreABI *>(a[1]);

            uint64 savesstatus;
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));

            int retvalfromsem=SemaphoreABI::semcloseABI(sem);


            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));

            //force umetanje povratne vrijednosti na stek
            __asm__ volatile("mv a0, %0" : : "r" ( retvalfromsem));
            __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));
            //ecall cuva vrijednost trenutnog pc ne sledece instrukcije
            incrementedpc+=4;
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));


        }
        if(a0val==(0x23)) {
            //semwait
            SemaphoreABI  *sem= reinterpret_cast<SemaphoreABI *>(a[1]);

            uint64 savesstatus;
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));


            int retvalfromsem=SemaphoreABI::semwaitABI(sem);


            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));

            //force umetanje povratne vrijednosti na stek
            __asm__ volatile("mv a0, %0" : : "r" ( retvalfromsem));
            __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));
            //ecall cuva vrijednost trenutnog pc ne sledece instrukcije
            incrementedpc+=4;
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));



        }
        if(a0val==(0x24)) {
            //semsignal
            SemaphoreABI * sem= reinterpret_cast<SemaphoreABI *>(a[1]);

            uint64 savesstatus;
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));

            uint64 retvalfromsem=SemaphoreABI::semsignalABI(sem);

            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));


            //force umetanje povratne vrijednosti na stek
            __asm__ volatile("mv a0, %0" : : "r" ( retvalfromsem));
            __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));
            //ecall cuva vrijednost trenutnog pc ne sledece instrukcije
            incrementedpc+=4;
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));


        }
        if(a0val==(0x31)) {
            //semsignal
            time_t time=a[1];

            uint64 savesstatus;
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));

            SchedulerABI::getInstanceScheduler().sleep(time);

            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));


            //ecall cuva vrijednost trenutnog pc ne sledece instrukcije
            incrementedpc+=4;
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));


        }
        if(a0val==(0x41)) {
            //getc
            uint64 savesstatus;
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));
            char ret=BufferPrinting::bout->get();
            __asm__ volatile("mv a0, %0" : : "r" ( ret));
            __asm__ volatile("sd a0,0x50(%0)" : : "r"(retsp));
            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));
            //ecall cuva vrijednost trenutnog pc ne sledece instrukcije
            incrementedpc+=4;
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));

        }
        if(a0val==(0x42)) {
            //putc
            char c =a[1];
            uint64 savesstatus;
            asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));
            BufferPrinting::bin->put(c);
            asm volatile("csrw sstatus, %0" : : "r"(savesstatus));

            incrementedpc+=4;
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));

        }
        // start user mode
        if(a0val==0xff)
        {
            uint64 temp;
            asm volatile("csrr %0, sstatus" : "=r" (temp));
            temp &= ~0x100;
            asm volatile("csrw sstatus, %0" : : "r" (temp));
            incrementedpc+=4;
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));
        }
        // start privileged mode
        if(a0val==0xfe)
        {
            uint64 temp;
            asm volatile("csrr %0, sstatus" : "=r" (temp));
            temp |= 0x100;
            asm volatile("csrw sstatus, %0" : : "r" (temp));
            incrementedpc+=4;
            __asm__ volatile("csrw sepc, %0" : : "r" (incrementedpc));
        }
            //custom yield prekidna rutina
//        if(a0val==(0x69)){
//
//            //moguce da ce morati da se poziva kao funkcija
//            uint64  sepc;
//            __asm__ volatile("csrr %0,sepc": "=r" (sepc));
//            sepc +=4;
//            uint64  sstatus;
//            __asm__ volatile("csrr %0,sstatus": "=r" (sstatus));
//
//            ThreadABI::timeSliceCounterSet();
//
//            ThreadABI::dispatch();
//            //u ovoj linij su 0
//            __asm__ volatile ("csrw sstatus, %0" : : "r"(sstatus));
//            __asm__ volatile ("csrw sepc, %0" : :  "r"(sepc));
//
//        }
    }
    else if (causevalue == 0x8000000000000009UL)
    {

        if(plic_claim()==0x0a){
            uint8 *num=(uint8*)CONSOLE_STATUS;

            if (*num & CONSOLE_RX_STATUS_BIT){
                SemaphoreABI::semsignalABI(BufferPrinting::out);

            }
            if (*num & CONSOLE_TX_STATUS_BIT){
                //putc
               SemaphoreABI::semsignalABI(BufferPrinting::in);

            }

            plic_complete(0x0a);
        }
    }
    else if (causevalue == 0x8000000000000001UL)
    {
        asm volatile("csrc sip,0x02");

        uint64 savedSEPC;
        asm volatile("csrr %0, sepc" : "=r"(savedSEPC));
        uint64 savesstatus;
        asm volatile("csrr  %0, sstatus" : "=r"(savesstatus));
        //ovo vadi niti iz sleep
        ThreadABI *tmp=SchedulerABI::headsleep;
        while (tmp){
            if(tmp->decrementsleep()==0){
                SchedulerABI::headsleep=SchedulerABI::headsleep->next;
                SchedulerABI::getInstanceScheduler().put(tmp);

            }
            tmp=tmp->next;
        }


        if(ThreadABI::running->timeSliceCounterDecrement()==0){
            ThreadABI::running->timeSliceCounterSet();
            ThreadABI::yield();

        }
        asm volatile("csrw sstatus, %0" : : "r"(savesstatus));

        //increment pc
        asm volatile("csrw sepc, %0" : : "r"(savedSEPC));

    }
    else{

    }

    //__asm__ volatile("csrc sip, 0x02");
//    __asm__ volatile("csrc sip, 0x0A");
}


