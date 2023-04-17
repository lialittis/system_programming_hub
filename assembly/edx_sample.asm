; Example code that multiples two 32-bit values and stores the result in EDX:EAX
mov eax, 5	; Move the value 5 into EAX
mov edx, 0	; Clear EDX
mul dword [var1]; Multiply EAX by the value of var1 and store the result in EDX:EAX
