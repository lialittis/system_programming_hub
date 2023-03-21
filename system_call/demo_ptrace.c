#include <stdio.h>
#include <stdlib.h>
#include <sys/ptrace.h>
#include <sys/user.h>
#include <sys/wait.h>
#include <unistd.h>

int main() {
    pid_t child_pid = fork(); // return different values to parent process and child process

    if (child_pid == 0) {
        // Child process
        execl("/bin/ls", "ls", "-l", NULL);
    } else {
        // Parent process
        waitpid(child_pid, NULL, 0); // pid, status, options

        struct user_regs_struct regs;

        // Attach to child process
        ptrace(PTRACE_ATTACH, child_pid, NULL, NULL); // attach to the target pid
        waitpid(child_pid, NULL, 0);

        // Read the contents of the child's registers
        ptrace(PTRACE_GETREGS, child_pid, NULL, &regs);

        // Print out the values of some of the registers
        printf("rax = %llu\n", regs.rax);
        printf("rbx = %llu\n", regs.rbx);
        printf("rcx = %llu\n", regs.rcx);
        printf("rdx = %llu\n", regs.rdx);

        // Detach from child process
        ptrace(PTRACE_DETACH, child_pid, NULL, NULL);
    }

    return 0;
}

