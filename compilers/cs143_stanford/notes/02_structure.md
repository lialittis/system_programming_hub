# Structure of a Compiler

- *First step*: recognize words
  - Smallest unit above letters
    - "This is a sentence"
  - Lexical analysis divides program text into "words" or "tokens"
    - "if x == y then z = 1; else z = 2;"

- Once words are understood, the *next step* is to understand sentence structure
  - Parsing = Diagramming Sentences - the diagram is a tree
  
- Once the sentence structure is understood, the *next step* is to understand the "meaning".
  - Compilers perform **limited** semantic analysis to catch inconsistencies
    - Example: Jack said Jerry left his assignment at home.
    - Even worse: Jack said Jack left his assignment at home?
    - So programming languages define strict rules to avoid such ambiguities.
  - Compilers perform many semantic checks besides **variable bindings**
    - Example: Jack left her homework at home.
    - A "type mismatch" between her and Jack; we know they are different people.
    
- The *next step* is **Optimization**. Is has no strong counter part in English.
  - But a little bit like editing.
  - It automatically modifies programs so that they
    - run faster
    - use less memory
    - power
    - network
    - database
    - etc.

> An example about optimization
> X = Y * 0 is the same as X = 0 ?
> In programming, it is valid when X and Y are integers, but invalid for floating-point numbers.
> becase Nan * 0 = Nan.


- The *final step* is code generation.
  - It produces assembly code(usually)
  - A translation into another language
    - Analogous to human translation

The overall structure of almost every compiler adheres to this outline, but the proportions have
changed since FORTRAN.

  
