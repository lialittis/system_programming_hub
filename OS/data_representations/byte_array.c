#include <stdio.h>
#include <stdint.h>

typedef unsigned char *pointer;

void show_bytes(pointer start, int len){
    int i;
    for(i=0; i < len; ++i){
        printf("%p\t0x%.2x\n", start+i, start[i]); // printf directives : 
                                                   // %p: print pointer, %x: print hexadecimal
    }
    printf("\n");
}

void example1(){
    int8_t a = 10;
    printf("int a = %d;\n", a);
    show_bytes((pointer) &a, sizeof(int8_t));
}

void example2(){
    int8_t a = -10;
    printf("int a = %d;\n", a); // 2's complement
    show_bytes((pointer) &a, sizeof(int8_t));
}

void example3(){
    int32_t a = 15213;
    printf("int a = %d;\n",a);
    show_bytes((pointer) &a, sizeof(int32_t));
}

int main(){
    printf("========test========\n");
    unsigned char samples[10] = {};
    show_bytes(samples,10);
    printf("=======example1=======\n");
    example1();
    printf("=======example2=======\n");
    example2();
    printf("=======example3=======\n");
    example3();
}
