The `volatile` keyword is intended to prevent the compiler from applying any optimizations on objects
that can change in ways that cannot be determined by the compiler.

Objects declared as volatile are omitted from optimization because their values can be changed by code
outside the scope of current code at any time.

1) Global variables modified by an interrupt service routine outside the scope: For example, a global
variable can represent a data port (usually a global pointer, referred to as memory mapped IO) which
will be updated dynamically. The code reading the data port must be declared as volatile in order to
fetch the latest data available at the port. Failing to declare the variable as volatile will result
in the compiler optimizing the code in such a way that it will read the port only once and keep using
the same value in a temporary register to speed up the program (speed optimization). In general, an
ISR is used to update these data ports when there is an interrupt due to the availability of new data. 

 
2) Global variables within a multi-threaded application: There are multiple ways for threads’ communication
, viz., message passing, shared memory, mail boxes, etc. A global variable is weak form of shared memory
. When two threads are sharing information via global variables, those variables need to be qualified 
with volatile. Since threads run asynchronously, any update of global variables due to one thread should 
be fetched freshly by the other consumer thread. The compiler can read the global variables and place 
them in temporary variables of the current thread context. To nullify the effect of compiler optimizations
, such global variables need to be qualified as volatile.

# Reference

Geeksforgeeks.org
