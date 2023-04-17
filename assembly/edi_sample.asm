; Example code that com0ares two strings using EDI as a destination pointer
mov edi, str1 	; Set EDI to the first string
mov esi, str2	; Set ESI to the second string
cld		; Clear the direction flag (forward direction)
repe cmpsb	; Compare the strings using the instructions at the address in EDI
