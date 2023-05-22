#include <stdio.h>      // perror
#include <stdlib.h>     // EXIT_FAILURE
#include <fcntl.h>  // O_RDONLY
#include <unistd.h>
#include <errno.h>
#include <aio.h>
#include <string.h>

#define BUFFER_SIZE 4096

int main() 
{
    int fd = open("input.txt", O_RDONLY);
    if (fd == -1 ){
        perror("open");
        exit(EXIT_FAILURE);
    }

    // alocate buffer for reading
    char buffer[BUFFER_SIZE];

    // Initialize aio control block
    struct aiocb cb;
    memset(&cb, 0, sizeof(cb));


}
