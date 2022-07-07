//
// Created by os on 5/23/22.
//

#include "../h/SemaphoreABI.hpp"
#include "../h/SchedulerABI.hpp"
#include "../h/ThreadABI.hpp"
#include "../lib/console.h"

int SemaphoreABI::semopenABI(SemaphoreABI **handler, int val){

        *handler=new SemaphoreABI(val);

    if(*handler == nullptr)return -2;
    else return 0;
}
int SemaphoreABI::semcloseABI(SemaphoreABI *handler){
    if(handler == nullptr)return -1;
    if(handler->headblocked!= nullptr){
        while(handler->headblocked){
            handler->headblocked->errorsem= true;
            semsignalABI(handler);
        }
    }
    MemoryAllocator::getInstance().MemoryFree(handler);
    return 0;
}
int SemaphoreABI::semwaitABI(SemaphoreABI *id){
    if(ThreadABI::running==ThreadABI::idle)return -1;
    if(ThreadABI::running->errorsem)return -3;
    if(--id->value<0) {

        ThreadABI::running->setState(ThreadABI::BLOCKED);
        if (id->headblocked == nullptr) {
            id->headblocked = ThreadABI::running;
            id->tailblocked = ThreadABI::running;
            ThreadABI::yield();
            if(ThreadABI::running->errorsem){
                return -1;
            }
            return 1;
        }

        id->tailblocked->next=ThreadABI::running;
        id->tailblocked=id->tailblocked->next;
        ThreadABI::yield();
        if(ThreadABI::running->errorsem)return -1;
        return 1;
    }
    return 0;
}
int SemaphoreABI::semsignalABI(SemaphoreABI *id){
    if(++id->value<=0){
        if (id->headblocked == nullptr)return 0;
        if (id->tailblocked == id->headblocked) {
            ThreadABI *tmp = id->headblocked;
            id->headblocked = nullptr;
            id->tailblocked = nullptr;
            tmp->next= nullptr;
            SchedulerABI::getInstanceScheduler().put(tmp);
            return 1;
        }
        ThreadABI *tmp = id->headblocked;
        id->headblocked = id->headblocked->next;
//    ThreadABI::running=tmp;
        tmp->next= nullptr;
        SchedulerABI::getInstanceScheduler().put(tmp);
        return 1;
    }
    return 0;
}

int SemaphoreABI::getValue() const {
    return value;
}

void SemaphoreABI::setValue(int value) {
    SemaphoreABI::value = value;
}


