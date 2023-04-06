#ifndef Memory_Allocator
#define Memory_Allocator

#include "../lib/hw.h"

class MemoryAllocator {
    struct FreeMem{
        FreeMem *next,*prev;
        size_t sizeofblock;
    };
    FreeMem *head=nullptr;
    void tryToJoin(FreeMem* cur);

    MemoryAllocator();
public:
    static MemoryAllocator& getInstance();
    void * MemoryAlloc(size_t bytes);
    void MemoryFree(void *);
};

#endif
