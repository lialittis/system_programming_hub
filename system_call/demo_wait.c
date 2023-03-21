#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t pid = fork();
    
    if (pid == -1) {
        printf("Error: fork failed\n");
        exit(1);
    }
    else if (pid == 0) {
        // This is the child process
        printf("Child process is running\n");
        sleep(2);
        printf("Child process is done\n");
        exit(0);
    }
    else {
        // This is the parent process
        printf("Parent process is waiting for child to complete\n");
        int status;
        pid_t wait_pid = wait(&status);
        
        if (wait_pid == -1) {
            printf("Error: wait failed\n");
            exit(1);
        }
        else if (WIFEXITED(status)) {
            printf("Child process completed successfully with exit code %d\n", WEXITSTATUS(status));
        }
        else if (WIFSIGNALED(status)) {
            printf("Child process was terminated by signal %d\n", WTERMSIG(status));
        }
    }
    
    return 0;
}

