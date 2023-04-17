; Example code that uses ECX as a loop counter
mov ecx, 10	; Set ECX to 10
loop_start:	; Loop label
    ; Do something here
    loop loop_start ; Decrement ECX and loop if not zero
