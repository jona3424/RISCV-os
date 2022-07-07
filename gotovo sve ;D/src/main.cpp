#include "../h/syscall_c.h"
#include "../h/SchedulerABI.hpp"
#include "../h/ThreadABI.hpp"
#include "../h/BufferPrinting.hpp"
extern "C" void supervisorTrap();


void idlefun(void *) {
    while (1){
        if(SchedulerABI::headready)thread_dispatch();
    }
}



void putcthrfun(void *arg) {
    intopriv();
    __asm__ volatile("csrc sstatus,0x02");

   // sem_t sempolling = (sem_t) arg;

    while (true) {
        uint8 *tmp = (uint8 *) CONSOLE_STATUS;
        while ((*tmp & CONSOLE_TX_STATUS_BIT) && BufferPrinting::tmpput!=0) {
           // sem_wait(sempolling);
            uint8 *adr = (uint8 *) CONSOLE_TX_DATA;
            *adr = BufferPrinting::bin->get();
            BufferPrinting::tmpput--;
        }
        thread_dispatch();

    }
}

void getcthrfun(void *arg) {
    intopriv();
    __asm__ volatile("csrs sstatus,0x02");

   // sem_t sempolling = (sem_t) arg;

    while (true) {
        uint8 *tmp = (uint8 *) CONSOLE_STATUS;
        while (*tmp & CONSOLE_RX_STATUS_BIT) {
          //  sem_wait(sempolling);
            uint8 *adr = (uint8 *) CONSOLE_RX_DATA;
            BufferPrinting::bout->put(*adr);
            BufferPrinting::tmpget--;
        }
        thread_dispatch();
    }
}

int main() {
    __asm__ volatile("csrw stvec, %0" : : "r" (&supervisorTrap));
    thread_t loopputc = nullptr;
    thread_t loopgetc = nullptr;

    ThreadABI::main = new ThreadABI;
    ThreadABI::running = ThreadABI::main;
    thread_create(&ThreadABI::idle, idlefun, nullptr);
    BufferPrinting::bin = new BufferPrinting(100);
    BufferPrinting::bout = new BufferPrinting(100);
    sem_open(&BufferPrinting::in, 0);
    sem_open(&BufferPrinting::out, 0);
    thread_create(&loopputc, putcthrfun, BufferPrinting::in);
    thread_create(&loopgetc, getcthrfun, BufferPrinting::out);

    __asm__ volatile("csrs sstatus,0x02");
    intouser();


    //usermainhere
    putc('G');
    putc('O');
    putc('T');
    putc('O');
    putc('V');
    putc('O');
    putc(':');
    putc('D');
    putc('\n');

    while (BufferPrinting::tmpput>0 || BufferPrinting::tmpget>0) thread_dispatch();


    return 0;
}