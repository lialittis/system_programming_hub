; Example code that uses EBP as a base pointer to access function arguments and local variables
push ebp         ; Save the old value of EBP on the stack
mov ebp, esp     ; Set EBP to the current top of the stack (base pointer for this function call)
sub esp, 4       ; Allocate space on the stack for one 32-bit local variable

mov eax, [ebp+8] ; Load the first function argument into EAX
add eax, [ebp+12]; Add the second function argument to EAX
mov [ebp-4], eax ; Store the result in the local variable on the stack

pop ebp          ; Restore the previous value of EBP from the stack
ret              ; Return from the function

