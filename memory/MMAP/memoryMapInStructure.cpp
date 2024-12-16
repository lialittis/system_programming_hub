#include <stdio.h>
#include <sys/mman.h>
#include <stdlib.h>

long long ADDR_SPACE_START      = 0x100000000000;
long long SPACE_SIZE            = 0x200000000;

void *mapMemoryFromSystem(void *addr, size_t size);

struct User{
public:
    void init(char *name);
    char *address;
private:
    char *user;
};

void User::init(char *name){
    user = name;
    address = (char *)mapMemoryFromSystem((void *)ADDR_SPACE_START,SPACE_SIZE);
}

void my_gets(char *buf){
    char c;
    while((c = getc(stdin)) != '\n'){
        *buf++ = c;
    }
    *buf += '\0';
}

int main(){
    struct User user;
    printf("User Name is: ");
    char *buf = (char *)malloc(32);
    my_gets(buf);
    user.init(buf);

    auto memAddr = user.address; 
    printf("The mapped address is: %p\n",memAddr);
    return 0;
}

void *mapMemoryFromSystem(void *addr, size_t size){
    return (void *)mmap(addr, size, PROT_READ | PROT_WRITE, MAP_PRIVATE, 0, 0);
}
