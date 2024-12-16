#include <stdio.h>
#include <sys/mman.h>

long long ADDR_SPACE_START      = 0x100000000000;
long long SPACE_SIZE            = 0x200000000;

void *mapMemoryFromSystem(void *addr, size_t size);

int main(){
    auto memAddr = mapMemoryFromSystem((void *)ADDR_SPACE_START,SPACE_SIZE);
    printf("The mapped address is: %p\n",memAddr);
    return 0;
}

void *mapMemoryFromSystem(void *addr, size_t size){
    return (void *)mmap(addr, size, PROT_READ | PROT_WRITE, MAP_PRIVATE, 0, 0);
}
