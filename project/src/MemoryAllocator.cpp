#include "../h/MemoryAllocator.hpp"

MemoryAllocator& MemoryAllocator::getInstance() {
    static MemoryAllocator instance;
    return instance;
}

MemoryAllocator::MemoryAllocator() {
    head = (FreeMem*)HEAP_START_ADDR;
    head->prev = head->next = nullptr;
    head->sizeofblock = (char*)HEAP_END_ADDR - (char*)HEAP_START_ADDR;
}

void * MemoryAllocator::MemoryAlloc(size_t bytes) {
    // Try to find an existing free block in the list (first fit):
    FreeMem *blk = head, *prev = nullptr;
    for (; blk!=nullptr; prev=blk, blk=blk->next)
        if (blk->sizeofblock>=bytes) break;
    if (blk == nullptr) {
        return nullptr;
    }
// Allocate the requested block:
    size_t remainingSize = blk->sizeofblock - bytes;
    if (remainingSize > 0) {
// A fragment remains
        FreeMem* newBlk = (FreeMem*)((char*)blk + bytes);
        if (prev) {
            prev->next = newBlk;
            newBlk->prev = prev;
        } else {
            head = newBlk;
            newBlk->prev = nullptr;
        }

        newBlk->next = blk->next;
        if(blk->next) {
            blk->next->prev = newBlk;
        }
        newBlk->sizeofblock = remainingSize;
    } else {
// No remaining fragment, allocate the entire block
        if (prev) {
            prev->next = blk->next;
            if(blk->next)
                blk->next->prev=prev;
        } else {
            head = blk->next;
            if(blk->next)
                blk->next->prev=nullptr;
        }
    }

    size_t* newPtr = (size_t*)blk;
    *newPtr = bytes;

    return newPtr+1;
}

void MemoryAllocator::MemoryFree(void * ptr) {
    size_t* realStart = (size_t*)(ptr) - 1;
    size_t bytes = *realStart;

    FreeMem* cur=0;
    if (!head || realStart<(size_t *)head)
        cur = 0;
    else
        for (cur=head; cur->next!=0 && realStart>(size_t *)(cur->next); cur=cur->next);
    FreeMem* newSeg = (FreeMem*)realStart;
    newSeg->sizeofblock = bytes;
    newSeg->prev = cur;
    if (cur) newSeg->next = cur->next;
    else newSeg->next = head;
    if (newSeg->next) newSeg->next->prev = newSeg;
    if (cur) cur->next = newSeg;
    else head = newSeg;
    tryToJoin(newSeg);
    tryToJoin(cur);
}


void MemoryAllocator::tryToJoin (FreeMem* cur) {
    if (!cur) return;
    if (cur->next && (char*)cur+cur->sizeofblock == (char*)(cur->next)) {
        cur->sizeofblock += cur->next->sizeofblock;
        cur->next = cur->next->next;
        if (cur->next) cur->next->prev = cur;
    }
}


