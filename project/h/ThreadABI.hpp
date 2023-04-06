////
//// Created by os on 5/22/22.
////
//
#ifndef thread_abi
#define thread_abi
#include "../lib/hw.h"
#include "definefile.hpp"
#include "SchedulerABI.hpp"

class ThreadABI{
public:
    MEM_ALLOC;

    static ThreadABI *idle;
    static  ThreadABI *main;
    ThreadABI()=default;


    static void pushregs();
    static void popregs();

    friend class SchedulerABI;
    ThreadABI *next= nullptr;

    enum State{
        CREATED,READY,SLEEP,BLOCKED,FINISHED
    };

   static int thread_create (
            ThreadABI** handle,
            void(*start_routine)(void*),
            void* arg,
            void* stack_space
    );
    ~ThreadABI() =default;
    ThreadABI(const ThreadABI&)=delete;
    ThreadABI( ThreadABI&&)=delete;
    ThreadABI operator=(const ThreadABI&)=delete;
    ThreadABI operator=( ThreadABI&&)=delete;

     int timeSliceCounterDecrement(){return --timeSliceCounter;}



     void timeSliceCounterSet(){timeSliceCounter=DEFAULT_TIME_SLICE;}
     bool timeSliceEnd(){ return 0==timeSliceCounter; }

    void setState(State value) { state = value; }
    State getState() const { return state; }

    time_t getTimeSlice() const { return DEFAULT_TIME_SLICE; }


    using Body = void (*)(void *);

    static void dispatch();

    static ThreadABI *running;
    static void threadWrapper();
    static void yield();
    bool errorsem=false;

private:
    //restore spp i spie za threadwrappperrr
    static void popSppSpie();




    ThreadABI(void(*start_routine)(void*),
              void* args){
        body=start_routine;
        arg=args;
    }
    struct Context
    {
        uint64 ra;
        uint64 sp;
    };
        State state=CREATED;
        Body body= nullptr;
        void *stack= nullptr;
        Context context;
        void *arg= nullptr;
     static void contextswitch(Context *old,Context *notold);

    time_t sleeptime=0;
public:
    time_t getSleeptime() const;

    int decrementsleep();

private:

    time_t timeSliceCounter=DEFAULT_TIME_SLICE;
public:
    const Context &getContext() const;
    void *getStack() const;
    void setStack(void *stack);

};
#endif
