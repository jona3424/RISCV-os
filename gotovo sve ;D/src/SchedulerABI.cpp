//
// Created by os on 5/22/22.
//
#include "../h/SchedulerABI.hpp"
#include "../h/ThreadABI.hpp"

ThreadABI *SchedulerABI::headsleep = nullptr;
ThreadABI *SchedulerABI::headready = nullptr;
ThreadABI *SchedulerABI::tailready = nullptr;

ThreadABI *SchedulerABI::get() {

    if (headready == nullptr)return ThreadABI::idle;
    if (tailready == headready) {
        ThreadABI *tmp = headready;
        tailready = nullptr;
        headready = nullptr;
        return tmp;
    }
    ThreadABI *tmp = headready;
    headready = headready->next;
//    ThreadABI::running=tmp;
    tmp->next= nullptr;

    return tmp;
}

void SchedulerABI::put(ThreadABI *t) {
    t->state=ThreadABI::READY;
    if(t==ThreadABI::idle)return;
    if (t == nullptr)return;
    if (headready == nullptr) {
        headready = t;
        tailready = t;
        t->next= nullptr;
        return;
    }

    tailready->next=t;
    tailready=tailready->next;
    tailready->next= nullptr;

}

void SchedulerABI::sleep(time_t time) {

    ThreadABI *tmp2=ThreadABI::running;
    tmp2->state=ThreadABI::State::SLEEP;
    tmp2->sleeptime=time;

    //prevezivanje linked liste spavajucih threadova
//    if(tmp== nullptr){
//        headsleep=tmp2;
//    }
//    else
//    while (tmp) {
//        if(tmp->sleeptime<tmp2->sleeptime){
//            onebehind=tmp;
//            tmp=tmp->next;
//        }
//        else{
//            if(tmp==headsleep){
//                tmp2->next=tmp;
//                headsleep=tmp2;
//                break;
//            }
//            if(tmp->next== nullptr){
//
//            }
//            tmp2->next=tmp;
//            onebehind->next=tmp2;
//            break;
//        }
//    }
    if (headsleep == nullptr || headsleep->sleeptime > tmp2->sleeptime) {
        tmp2->next = headsleep;
        headsleep = tmp2;
    }
    else {
        ThreadABI *tmp = headsleep;

        while (tmp->next != nullptr && tmp->next->sleeptime < tmp2->sleeptime) {
            tmp = tmp->next;
        }
        tmp2->next = tmp->next;
        tmp->next = tmp2;
    }
    //ostala promjena kontexta;
    ThreadABI::yield();
}

SchedulerABI &SchedulerABI::getInstanceScheduler() {
    static SchedulerABI instance;
    return instance;
}
