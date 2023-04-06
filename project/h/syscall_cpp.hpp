//
// Created by os on 5/22/22.
//

#ifndef syscall_cpp
#define syscall_cpp
#include "../lib/hw.h"
#include "../h/syscall_c.h"
    void *operator new(size_t n);

    void *operator new[](size_t n);

    void operator delete(void *p) noexcept;

    void operator delete[](void *p) noexcept;

class Thread {
public:
    Thread (void (*body)(void*), void* arg);
    virtual ~Thread ();
    int start ();
    static void dispatch ();
    static int sleep (time_t);
protected:
    Thread ();
    virtual void run () {};

private:
    thread_t myHandle;
    static void wrapperrun(void *args)
    {
        Thread *t=(Thread*)args;
        t->run();
    }
};

class Semaphore {
public:
    Semaphore (unsigned init = 1);
    virtual ~Semaphore ();
    int wait ();
    int signal ();
private:
    sem_t myHandle;
};



class Console {
public:
    static char getc ();
    static void putc (char);
};


class PeriodicThread : public Thread {
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
private:
    static void periodicwrapperfun(void *args);
};
struct argsfun{
    PeriodicThread *p;
    time_t per;
};

#endif
