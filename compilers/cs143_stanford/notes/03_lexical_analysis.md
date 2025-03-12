# Lexical Analysis

The goal of lexical analysis is to partition input code (string for machine) into substrings. and the substrings are called **tokens**.

But the token is not only a substring itself, it has a class/type, with its own name/string value. In other words, tokens are used to classfiy program substrings according to their roles. And the typical roles/classes include **Identifier**, **Integer/Number**, **Operator**, **Keyword**, **Whitespace**.

## LA Examples

An interestring example in fortran language.

```Fortran
DO 5 I = 1,25   // A loop of value from 1 to 25 for variable I

DO 5 I = 1.25   // The variable DO5I is assigned to 1.25
```

The only difference in the above example is just the difference between a period and a comma.

The problem is we can't possibly disambiguate the role of `do` until the point later, so the only way that compilers can understand the code correctly is to look ahead, and it complicates the implementation of lexical analyzer. So one of the goals in the design of lexical systems is to minimize the amount of lookahead or bound the amount of lookahead that is required.

> Interesting fact: why the fortran language decided to ignore the whitespaces/blanks for naming variables?
> 
> Puch Card Machines Drawback!

## The steps of designing a Lexical Analyzer

1. Define a finite set of tokens
 




