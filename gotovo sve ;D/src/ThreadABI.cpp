////
//// Created by os on 5/22/22.
////
//
#include "../h/ThreadABI.hpp"
#include "../lib/console.h"
//



ThreadABI *ThreadABI::running = nullptr;
ThreadABI *ThreadABI::main = nullptr;
ThreadABI *ThreadABI::idle = nullptr;

void ThreadABI::popregs() {
// Pop all registers
    asm volatile("ld x3, 0x18(sp)");
    asm volatile("ld x4, 0x20(sp)");
    asm volatile("ld x5, 0x28(sp)");
    asm volatile("ld x6, 0x30(sp)");
    asm volatile("ld x7, 0x38(sp)");
    asm volatile("ld x8, 0x40(sp)");
    asm volatile("ld x9, 0x48(sp)");
    asm volatile("ld x10, 0x50(sp)");
    asm volatile("ld x11, 0x58(sp)");
    asm volatile("ld x12, 0x60(sp)");
    asm volatile("ld x13, 0x68(sp)");
    asm volatile("ld x14, 0x70(sp)");
    asm volatile("ld x15, 0x78(sp)");
    asm volatile("ld x16, 0x80(sp)");
    asm volatile("ld x17, 0x88(sp)");
    asm volatile("ld x18, 0x90(sp)");
    asm volatile("ld x19, 0x98(sp)");
    asm volatile("ld x20, 0xa0(sp)");
    asm volatile("ld x21, 0xa8(sp)");
    asm volatile("ld x22, 0xb0(sp)");
    asm volatile("ld x23, 0xb8(sp)");
    asm volatile("ld x24, 0xc0(sp)");
    asm volatile("ld x25, 0xc8(sp)");
    asm volatile("ld x26, 0xd0(sp)");
    asm volatile("ld x27, 0xd8(sp)");
    asm volatile("ld x28, 0xe0(sp)");
    asm volatile("ld x29, 0xe8(sp)");
    asm volatile("ld x30, 0xf0(sp)");
    asm volatile("ld x31, 0xf8(sp)");
    asm volatile("addi sp, sp, 256");
}

void ThreadABI::pushregs() {
    asm volatile("addi sp, sp, -256");
    asm volatile("sd x3, 0x18(sp)");
    asm volatile("sd x4, 0x20(sp)");
    asm volatile("sd x5, 0x28(sp)");
    asm volatile("sd x6, 0x30(sp)");
    asm volatile("sd x7, 0x38(sp)");
    asm volatile("sd x8, 0x40(sp)");
    asm volatile("sd x9, 0x48(sp)");
    asm volatile("sd x10, 0x50(sp)");
    asm volatile("sd x11, 0x58(sp)");
    asm volatile("sd x12, 0x60(sp)");
    asm volatile("sd x13, 0x68(sp)");
    asm volatile("sd x14, 0x70(sp)");
    asm volatile("sd x15, 0x78(sp)");
    asm volatile("sd x16, 0x80(sp)");
    asm volatile("sd x17, 0x88(sp)");
    asm volatile("sd x18, 0x90(sp)");
    asm volatile("sd x19, 0x98(sp)");
    asm volatile("sd x20, 0xa0(sp)");
    asm volatile("sd x21, 0xa8(sp)");
    asm volatile("sd x22, 0xb0(sp)");
    asm volatile("sd x23, 0xb8(sp)");
    asm volatile("sd x24, 0xc0(sp)");
    asm volatile("sd x25, 0xc8(sp)");
    asm volatile("sd x26, 0xd0(sp)");
    asm volatile("sd x27, 0xd8(sp)");
    asm volatile("sd x28, 0xe0(sp)");
    asm volatile("sd x29, 0xe8(sp)");
    asm volatile("sd x30, 0xf0(sp)");
    asm volatile("sd x31, 0xf8(sp)");
}



void ThreadABI::yield()
{
    // Push all registers
    pushregs();

    // Switch context as suitable
    dispatch();

    popregs();


}

void ThreadABI::dispatch()
{
    ThreadABI *old = running;
    if (old->state!=ThreadABI::FINISHED ) {
        if(old->state!=ThreadABI::BLOCKED)
            if(old->state!=ThreadABI::SLEEP)
            SchedulerABI::getInstanceScheduler().put(old); }

    running = SchedulerABI::getInstanceScheduler().get();

    ThreadABI::contextswitch(&old->context, &running->context);
    if(old->getState()==ThreadABI::FINISHED){
        void * stack=old->stack;
        MemoryAllocator::getInstance().MemoryFree(old);
        if(stack!=nullptr)
        MemoryAllocator::getInstance().MemoryFree(stack);
    }

}
int ThreadABI::thread_create(ThreadABI **handle, void (*start_routine)(void *), void *arg, void *stack_space) {
    if(stack_space== nullptr)return -1;

    *handle=new ThreadABI(start_routine,arg);
    if(*handle== nullptr)return  -1;
    (*handle)->errorsem=false;
    //pri prvom izvrsavanju krece se od adrese threadwrapper
    (*handle)->context.ra=(uint64)&threadWrapper;
    (*handle)->context.sp=(uint64)stack_space+DEFAULT_STACK_SIZE;
    (*handle)->stack=stack_space;
    return 0;
}


void ThreadABI::threadWrapper() {
    popSppSpie();
    ThreadABI::running->body(ThreadABI::running->arg);
    ThreadABI::running->state=ThreadABI::FINISHED;
    yield();
}

const ThreadABI::Context &ThreadABI::getContext() const {
    return context;
}

void *ThreadABI::getStack() const {
    return stack;
}

void ThreadABI::setStack(void *stack) {
    ThreadABI::stack = stack;
}

time_t ThreadABI::getSleeptime() const {
    return sleeptime;
}

int ThreadABI::decrementsleep() {
    return --ThreadABI::sleeptime;
}















