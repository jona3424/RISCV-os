//
// Created by os on 6/2/22.
//
#include "../h/BufferPrinting.hpp"
BufferPrinting *BufferPrinting::bout= nullptr;
BufferPrinting *BufferPrinting::bin= nullptr;
sem_t BufferPrinting::in= nullptr;
sem_t BufferPrinting::out= nullptr;
int BufferPrinting::tmpput=0;
int BufferPrinting::tmpget=0;

char BufferPrinting::get() {
    SemaphoreABI::semwaitABI(itemAvailable);

    char ret = buffer[head];
    head = (head + 1) % cap;

    SemaphoreABI::semsignalABI(spaceAvailable);

    return ret;
}

void BufferPrinting::put(char val) {
    SemaphoreABI::semwaitABI(spaceAvailable);

    buffer[tail] = val;
    tail = (tail + 1) % cap;

    SemaphoreABI::semsignalABI(itemAvailable);
}

BufferPrinting::~BufferPrinting() {
    delete buffer;
    SemaphoreABI::semcloseABI(itemAvailable);
    SemaphoreABI::semcloseABI(spaceAvailable);
  }

BufferPrinting::BufferPrinting(int cap) {
    this->cap=cap;
    buffer = new char[cap];
    SemaphoreABI::semopenABI(&itemAvailable, 0);
    SemaphoreABI::semopenABI(&spaceAvailable, cap);
    head=tail=0;
}

