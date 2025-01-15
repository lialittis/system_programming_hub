#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char *username;
    char isAdmin;
} User;

void faulty_free(void *ptr){
    // no sense
    printf("Do Nothing!\n");
}

int main() {
    User *user = (User *)malloc(sizeof(User));
    user->username = (char *)malloc(32);

    printf("Enter your name:");
    
    int size = 0;
    char *buf = user->username;
    char c;
    while((c = getc(stdin)) != '\n' && size++ <31){
        *buf++ = c;
    }
    *buf = '\0';

    if(user->isAdmin) {
        printf("Hello admin %s\n", user->username);
    } else {
        printf("Hello user %s\n", user->username);
    }
    
    free(user->username);
    free(user);
}
