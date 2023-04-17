; Example code that copies a string from one memory location to another using ESI as a source
; pointer
mov esi, src 	; Set ESI to the source address
mov ecx, len 	; Set ECS to the lenght of the string
mov edi, dest 	; Set EDI to the destination address
rep movsb 	; Copy the string using the instructions at the address in ESI
