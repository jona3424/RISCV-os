//
// Created by os on 6/2/22.
//

#ifndef INC_3_0_SLEEP_ASINHRONA_BUFFERPRINTING_HPP
#define INC_3_0_SLEEP_ASINHRONA_BUFFERPRINTING_HPP
#include "SemaphoreABI.hpp"
#include "../h/definefile.hpp"
typedef SemaphoreABI* sem_t;
class BufferPrinting{
    sem_t itemAvailable,spaceAvailable;
    char* buffer;
    int head,tail,cap;
public:
    static int tmpput,tmpget;
    MEM_ALLOC;
    static sem_t in,out;
    static BufferPrinting *bin,*bout;
    BufferPrinting(int cap);

    char get();
    void put(char val);
    ~BufferPrinting();
private:
    BufferPrinting(const BufferPrinting &)=delete;
    BufferPrinting( BufferPrinting &&)=delete;
    BufferPrinting& operator =(const BufferPrinting &)=delete;
    BufferPrinting& operator =( BufferPrinting &&)=delete;

};



#endif //INC_3_0_SLEEP_ASINHRONA_BUFFERPRINTING_HPP
