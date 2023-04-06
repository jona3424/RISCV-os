//
// Created by os on 5/23/22.
//


#ifndef semaphoreabi
#define semaphoreabi
#include "definefile.hpp"
#include "TemplateLinkedList.hpp"

class ThreadABI;
class SemaphoreABI{
    private:
        int value;
public:
    int getValue() const;
    ~SemaphoreABI(){
        headblocked= nullptr;
        tailblocked= nullptr;
    }
    void setValue(int value);

private:
    SemaphoreABI(int valu): value(valu){}
        ThreadABI* headblocked= nullptr;
        ThreadABI* tailblocked= nullptr;
public:
    MEM_ALLOC;
        int static semopenABI(SemaphoreABI **handler, int val);
        int static semcloseABI(SemaphoreABI *handler);
        int static semwaitABI(SemaphoreABI *id);
        int static semsignalABI(SemaphoreABI *id);
    };




#endif //semaphoreabi
