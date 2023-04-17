```
Initial Stack
+------------------+
|                  |
|                  |
|                  |
|                  |
|                  |
|                  |
|                  |
|                  |
+------------------+

push ebp
+------------------+
|                  |
|                  |
|                  |
|                  |
|                  |
|                  |
|                  |
|      Old EBP     |
+------------------+

mov ebp, esp
+------------------+
|                  |
|                  |
|                  |
|                  |
|                  |
|                  |
|                  |
|      Old EBP     |
+------------------+
|                  |
|                  |
|                  |
|                  |
|                  |
|                  |
|                  |
|  New Base Pointer|
+------------------+

sub esp, 8
+------------------+
|                  |
|                  |
|                  |
|                  |
|                  |
|                  |
|   Local Var 2    |
|   Local Var 1    |
+------------------+
|                  |
|                  |
|                  |
|                  |
|                  |
|                  |
|                  |
|  New Base Pointer|
+------------------+

mov dword [ebp+8], eax
+------------------+
|  Arg 1           |
|                  |
|                  |
|                  |
|                  |
|                  |
|   Local Var 2    |
|   Local Var 1    |
+------------------+
|                  |
|                  |
|                  |
|                  |
|                  |
|                  |
|                  |
|  New Base Pointer|
+------------------+

mov dword [ebp-4], ebx
+------------------+
|  Arg 1           |
|                  |
|                  |
|                  |
|                  |
|   Local Var 2    |
|  Arg 2           |
|   Local Var 1    |
+------------------+
|                  |
|                  |
|                  |
|                  |
|                  |
|                  |
|                  |
|  New Base Pointer|
+------------------+
```
The diagram shows the stack at various points during the execution of the code. The initial stack 
has no values on it. The first instruction push ebp saves the old value of EBP on the stack. The 
second instruction mov ebp, esp sets EBP to the current top of the stack, which becomes the base 
pointer for this function call.

The sub esp, 8 instruction allocates space on the stack for two 32-bit local variables. The mov 
dword [ebp+8], eax instruction stores the first function argument in the space allocated on the 
stack for the first local variable. The mov dword [ebp-4], ebx instruction stores the second 
function argument in the space allocated on the stack for the second local variable.

At the end of the code, the stack contains the two function arguments and the two local variables,
with the base pointer EBP pointing to the start of the local variables.

```
          |  Stack top
          |-------------------
          |  Local variable 2 | [EBP-4]
          |-------------------
          |  Local variable 1 | [EBP-8]
          |-------------------
          |  Old EBP value    | [EBP]
          |-------------------
          |  Return address   | [EBP+4]
EBP ----> |-------------------
          |  Function arg 1   | [EBP+8]
          |-------------------
          |  Function arg 2   | [EBP+12]
          |-------------------
          |                   |
          |                   |
          |      ...          |
          |                   |
          |                   |
          |-------------------
          |                   |
          |  Stack bottom     |
          |-------------------
```
push ebp: This instruction saves the old value of the EBP register on the stack. This is typically 
done at the beginning of a function to create a stack frame and preserve the previous value of EBP 
for when the function returns.

mov ebp, esp: This instruction sets the EBP register to the current top of the stack, creating a 
new base pointer for this function call. This is also part of the stack frame setup.

sub esp, 8: This instruction subtracts 8 from ESP, which allocates space on the stack for two 32-bit
local variables.

mov dword [ebp+8], eax: This instruction stores the contents of the EAX register into the memory 
location [EBP+8], which is the first function argument.

mov dword [ebp-4], ebx: This instruction stores the contents of the EBX register into the memory 
location [EBP-4], which is the second function argument.

So, the stack layout after these instructions are executed includes the old EBP value, the return 
address, the two function arguments, and the two local variables. The base pointer EBP points to the
beginning of the local variables. The function can now access its arguments and local variables 
using the appropriate offset from EBP.

## Another demostration

```
          Stack                                    Registers
          ----                                     --------

                        +-----------------+
            esp ----->  | old EBP value   |     ebp
                        +-----------------+
                        |  return address |     eip
                        +-----------------+
                        |  arg1 value     |     eax
                        +-----------------+
                        |  arg2 value     |     ebx
                        +-----------------+

push ebp

          Stack                                    Registers
          ----                                     --------

                        +-----------------+
                        | old EBP value   |     ebp
                        +-----------------+
            esp ----->  |  return address |     eip
                        +-----------------+
                        |  arg1 value     |     eax
                        +-----------------+
                        |  arg2 value     |     ebx
                        +-----------------+

mov ebp, esp

          Stack                                    Registers
          ----                                     --------

                        +-----------------+
                        | old EBP value   |
                        +-----------------+
                        |  return address |
                        +-----------------+
                        |  arg1 value     |
                        +-----------------+
                        |  arg2 value     |
                        +-----------------+
            esp ----->  | current EBP     |     ebp

sub esp, 8

          Stack                                    Registers
          ----                                     --------

                        +-----------------+
                        | old EBP value   |
                        +-----------------+
                        |  return address |
                        +-----------------+
                        |  arg1 value     |
                        +-----------------+
                        |  arg2 value     |
                        +-----------------+
                        |                 |
                        |                 |
                        +-----------------+
            esp ----->  | current EBP     |     ebp

mov dword [ebp+8], eax

          Stack                                    Registers
          ----                                     --------

                        +-----------------+
                        | old EBP value   |
                        +-----------------+
                        |  return address |
                        +-----------------+
                        |  arg1 value     |
                        +-----------------+
                        |  arg2 value     |
                        +-----------------+
                        |                 |
                        |                 |
                        +-----------------+
            esp ----->  | current EBP     |     ebp

                        +-----------------+
                        |  arg1 value     |     [ebp+8]
                        +-----------------+

mov dword [ebp-4], ebx

          Stack                                    Registers
          ----                                     --------

                        +-----------------+
                        | old EBP value   |
                        +-----------------+
                        |  return address |
                        +-----------------+
                        |  arg1 value     |
                        +-----------------+
                        |  arg2 value     |
                        +-----------------+
                        |                 |
                        |                 |
                        +-----------------+
            esp ----->  | current EBP     |     ebp

                        +-----------------+
                        |  arg1 value     |     [ebp+8]
                        +-----------------+
                        |  arg2 value     |     [ebp-4]
                        +-----------------+

```

```
Initial stack state:

+--------------+
| Old EBP      | <-- ESP
+--------------+

push ebp:

+--------------+
| Old EBP      |
+--------------+
| Old EBP      | <-- ESP
+--------------+

mov ebp, esp:

+--------------+
| Old EBP      |
+--------------+
| New EBP      |
+--------------+

sub esp, 8:

+--------------+
| Old EBP      |
+--------------+
| New EBP      |
+--------------+
| Local var 1  | <-- [EBP-4]
+--------------+
| Local var 2  | <-- [EBP-8]
+--------------+

mov dword [ebp+8], eax:

+--------------+
| Old EBP      |
+--------------+
| New EBP      |
+--------------+
| Local var 1  | <-- [EBP-4]
+--------------+
| Local var 2  | <-- [EBP-8]
+--------------+
| Arg 1        | <-- [EBP+8]
+--------------+

mov dword [ebp-4], ebx:

+--------------+
| Old EBP      |
+--------------+
| New EBP      |
+--------------+
| Local var 1  | <-- [EBP-4]
+--------------+
| Local var 2  | <-- [EBP-8]
+--------------+
| Arg 1        | <-- [EBP+8]
+--------------+
| Arg 2        | <-- [EBP-4]
+--------------+

```

Here's an explanation of what happens:

The push ebp instruction saves the old value of EBP on the stack. This is done so that EBP can be restored to its previous value when the function returns.

The mov ebp, esp instruction sets EBP to the current top of the stack. This creates a new base pointer for the current function call.

The sub esp, 8 instruction allocates space on the stack for two 32-bit local variables. The value of ESP is decremented by 8 to make room for the two variables.

The mov dword [ebp+8], eax instruction stores the first function argument (which is in the EAX register) at [EBP+8]. The offset of 8 is used because the old EBP value takes up 4 bytes and the return address takes up another 4 bytes.

The mov dword [ebp-4], ebx instruction stores the second function argument (which is in the EBX register) at [EBP-4]. The offset of -4 is used because the first local variable takes up 4 bytes.

