//
// Created by os on 5/23/22.
//

#ifndef PROJECT_BASE_V1_1_SCHEDULERABI_HPP
#define PROJECT_BASE_V1_1_SCHEDULERABI_HPP
#include "../lib/hw.h"
class ThreadABI;
class SchedulerABI {
public:
    friend class ThreadABI;
    static ThreadABI *headsleep;

    static ThreadABI *headready;
    static ThreadABI *tailready;

    static SchedulerABI &getInstanceScheduler();

    ThreadABI *get();

    void put(ThreadABI *t);

    void static sleep(time_t time);

private:
    SchedulerABI()=default;

};

#endif //PROJECT_BASE_V1_1_SCHEDULERABI_HPP
