#include <stdio.h>
#include <string.h>

int main(void)
{
    int pass = 0;
    char buff[15];

    printf("\n Enter the password: \n");
    gets(buff); // Never use gets, it is removed !
/*
 * The first internet worm (the Morris Internet Worm) escaped about 30 years ago (1988-11-02), and 
 * it used gets() and a buffer overflow as one of its methods of propagating from system to system.
 * The basic problem is that the function doesn't know how big the buffer is, so it continues 
 * reading until it finds a newline or encounters EOF, and may overflow the bounds of the buffer it
 * was given.
 */
    if(strcmp(buff, "thegeekstuff"))
    {
        printf("\n Wrong Password! \n");
    }
    else
    {
        printf("\n Correct Password! \n");
        pass = 1;
    }

    if(pass)
    {
        printf("\n Root privileges given to the user \n");
    }
    return 0;
}
