; Example code that uses EBP as a base pointer to access function arguments and local variables
push ebp         ; Save the old value of EBP on the stack
mov ebp, esp     ; Set EBP to the current top of the stack (base pointer for this function call)
sub esp, 8       ; Allocate space on the stack for two 32-bit local variables
mov dword [ebp+8], eax   ; Store the first function argument at [EBP+8]
mov dword [ebp-4], ebx   ; Store the second function argument at [EBP-4]

