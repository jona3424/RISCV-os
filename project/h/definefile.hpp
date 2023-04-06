//
// Created by os on 5/23/22.
//

#ifndef PROJECT_BASE_V1_1_DEFINEFILE_HPP
#define PROJECT_BASE_V1_1_DEFINEFILE_HPP
#include "MemoryAllocator.hpp"


#define MEM_ALLOC \
        static void *operator new(size_t s) { \
            size_t t,cnt=0;\
            cnt=(s+(sizeof(size_t)))/MEM_BLOCK_SIZE;\
            t=(s+(sizeof(size_t)))%MEM_BLOCK_SIZE;\
            if(t!=cnt)cnt++;          \
            cnt*=MEM_BLOCK_SIZE ; \
        return MemoryAllocator::getInstance().MemoryAlloc(cnt); } \
         static void *operator new[](size_t s) { \
            size_t t,cnt=0;\
            cnt=(s+(sizeof(size_t)))/MEM_BLOCK_SIZE;\
            t=(s+(sizeof(size_t)))%MEM_BLOCK_SIZE;\
            if(t!=cnt)cnt++;          \
            cnt*=MEM_BLOCK_SIZE ; \
        return MemoryAllocator::getInstance().MemoryAlloc(cnt); } \
        static void  operator delete(void* s) { MemoryAllocator::getInstance().MemoryFree(s); }\
        static void  operator delete[](void* s) { MemoryAllocator::getInstance().MemoryFree(s); }




#endif //PROJECT_BASE_V1_1_DEFINEFILE_HPP
