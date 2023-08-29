#include <iostream>
#include <unistd.h>

namespace{
    std::size_t getUserSpaceSize() {
        long pageSize = sysconf(_SC_PAGESIZE);
        std::cout << " Page Size is: 0x" << std::hex << pageSize <<std::endl;
        long physSize = sysconf(_SC_PHYS_PAGES);
        std::cout << "Physical Pages : "<< std::dec << physSize <<std::endl;
        return static_cast<int>(pageSize*physSize);
    }
}

int main(){
    auto userSpace = getUserSpaceSize();
    std::cout << "User Space Size is: 0x" << std::hex << userSpace <<std::endl;
}
