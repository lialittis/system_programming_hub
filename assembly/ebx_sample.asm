;Example code that copies a string from one memory location to another using EBX as a base pointer
mov ebx, src ;Set EBX to the source address
mov ecx, len ;Set ECX to the length of the string
mov edi, dest ;Set EDI to the destination address
rep movsb ;Copy the string using the instructions at the address in EBX
