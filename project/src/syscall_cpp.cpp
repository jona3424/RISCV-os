//
// Created by os on 5/22/22.
//
#include "../h/syscall_cpp.hpp"

void *operator new(size_t n)
{
    return mem_alloc(n);
}

void *operator new[](size_t n)
{
    return mem_alloc(n);
}

void operator delete(void *p) noexcept
{
    mem_free(p);
}

void operator delete[](void *p) noexcept
{
    mem_free(p);
}

Thread::Thread(void (*body)(void *), void *arg) {
    __asm__ volatile("mv a4, %0" : : "r" (mem_alloc(DEFAULT_STACK_SIZE)));
    __asm__ volatile("mv a3, %0" : : "r" (arg));
    __asm__ volatile("mv a2, %0" : : "r" (body));
    __asm__ volatile("mv a1, %0" : : "r" (&myHandle));
    __asm__ volatile("li a0, 0x11");
    __asm__ volatile("ecall");
}

Thread::~Thread() {
    mem_free( myHandle);
}

int Thread::start() {
    __asm__ volatile("mv a1, %0" : : "r" ((void *)myHandle));
    __asm__ volatile("li a0, 0x14");
    __asm__ volatile("ecall");
    int povr;
    __asm__ volatile("mv %0, a0" : "=r" (povr));
    return povr;

}

void Thread::dispatch() {
    thread_dispatch();
}
int Thread::sleep(time_t time) {
    return time_sleep(time);
}

Thread::Thread() {
    __asm__ volatile("mv a4, %0" : : "r" (mem_alloc(DEFAULT_STACK_SIZE)));
    __asm__ volatile("mv a3,%0"  : : "r"(this));
    __asm__ volatile("mv a2, %0" : : "r" (wrapperrun));
    __asm__ volatile("mv a1, %0" : : "r" (&myHandle));
    __asm__ volatile("li a0, 0x11");
    __asm__ volatile("ecall");
}

Semaphore::Semaphore (unsigned init){
    sem_open(&myHandle,init);
}

int  Semaphore::wait (){
    return sem_wait(myHandle);
}
int Semaphore::signal() {
    return sem_signal(myHandle);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

char Console::getc() {
    return ::getc();

}

void Console::putc(char c) {
::putc(c);
}
PeriodicThread::PeriodicThread(time_t period):Thread(periodicwrapperfun,new argsfun{this,period}){}

void PeriodicThread::periodicwrapperfun(void *args) {
    argsfun *tmp = (argsfun*) args;
    while(true){
        tmp->p->periodicActivation();
        sleep(tmp->per);
    }
}
