#include <stdio.h>
#include <stdlib.h>

#define BUFFERSIZE 25000

int main(int argc, char **argv)
{
    int ret;
    FILE *fp;

    if(argc < 2){
        printf("usage: %s <filename>\n", argv[0]);
        return EXIT_FAILURE;
    }

    fp = fopen(argv[1], "r");
    if(fp == NULL){
        perror("fopen");
        return EXIT_FAILURE;
    }

    char buf[BUFFERSIZE];
    ret = fread(buf, 1, BUFFERSIZE, fp); // read bytes from a file-like system
                                         // synchronous I/O, start wait for finish return result

    fclose(fp);

    if(ret > 0){
        printf("Got %d byutes:\n",ret);
    }else{
        printf("READ FAILED!\n");
    }
}
