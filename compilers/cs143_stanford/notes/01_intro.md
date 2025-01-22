# Introduction

- Compilers

```off-line

Program   ----->   C   -----> exec

Data      -----> exec  -----> Output

```

Compilers dominate low-level languages: C, C++, Go, Rust

- Interpreters

```on-line

Program  -----> 
                   I    ------> Output
Data     ----->
```

Interpreters dominate high-level languages: python, javascript

Many language implementations provide both
- Java, Javascript, WebAssembly
- Interpreter + Just in Time(JIT) compiler

## A Bit of History

- 1954 IBM develops the 704
  - Successor to the 701
  - problem: software costs exceeded hardware costs!

- 1953 "Speedcoding" (John Backus)
  - interpreter
  - faster to develop the programs
  - 10 - 20x slower running than hand-written assembly
  - 300 bytes of memory(30% of the entire memory)

- FORTRAN I(1954 - 1957)
  - Formulas Tranlated
  - By 1958, 50% programs in FORTRAN
  - The first compiler - huge impact
  - Led to an enormous body of theoretical work(Theory + Pratice)
  - Modern compilers preserve the outline of FORTRAN I 

## Scope

1. Lexical Analysis     --- identify words
2. Parsing              --- identify sentences
3. Semantic Analysis    --- analyse sentences(meaning)
4. Optimization         --- editing
5. Code Generation      --- translation
