
#ifndef CAPI
#define CAPI

#include "../lib/hw.h"

void* mem_alloc (size_t size);
int mem_free (void* arg);
class ThreadABI;
typedef ThreadABI* thread_t;
int thread_create (thread_t* handle,void(*start_routine)(void*),void* arg);

void thread_dispatch ();
int thread_exit ();
class SemaphoreABI;
typedef SemaphoreABI* sem_t;
int sem_open (sem_t* handle,unsigned init);
int sem_close (sem_t handle);
int sem_wait (sem_t id);
int sem_signal (sem_t id);
typedef unsigned long time_t;
int time_sleep (time_t);
const int EOF = -1;
char getc ();
void putc (char);
void intopriv();
void intouser();

#endif
