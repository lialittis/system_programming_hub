#include <stdio.h>

typedef unsigned char *pointer;

void show_bytes(pointer start, int len){
    int i;
    for(i=0; i < len; ++i){
        printf("%p\t0x%.2x\n", start+i, start[i]);
    }
    printf("\n");
}

int main(){
    unsigned char samples[10] = {};
    show_bytes(samples,10);
}
