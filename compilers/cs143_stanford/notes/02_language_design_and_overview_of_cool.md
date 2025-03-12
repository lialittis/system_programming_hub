# Language Design and Overview of Cool

## Language Design

In the first part of this lecture, it basically trys to answer to one question, which is "why do we need
to learn language design and compilers?".

First of all, programming languages are designed for reasons of need in reality, but it is so difficult to
have an universally accepted metrics for language design. The programming language economics also explains
some facts, e.g. programmer training is the dominant cost, languages with many users are replaced rarely ( 
which happens to answer partially the question - "whether C++ be replaced by Rust"). 

Several criteria might be critical for language design: **Readability**, **Writeability**, and **Reliability**.

And several features also be proven to be extremely important: **Data types**, **Abstraction**, **Type checking**,
**Exception handling**.

More impotantly, the trends are that there are many new special-purpose languages designed but the popular ones
will stick around perhaps forever. The importance of compilers is significantly increasing because of the
increasing gap between new languages and new architectures.

With the above understandings, it is much easier to answer the question at the beginning. From what the authors'
words, it is important for you/us to *increase capacity of expression*, *improve understanding of program behavior*,
*increase ability to learn new languages*, *learn to build a large and reliable system*, and *see many basic CS concepts at work*.


## Cool Overview

The fullname of `Cool` is **Classroom Object Oriented Language**, it is specificly designed for training purpose,
with a taste of implementation of modern language features.

`Cool` is a MIPS assembly language, and there is no optimization. The goal of this course is to develop a `Cool` compiler, so it is important to know the specs
of this language. You can find more in [Cool Manual](./cool-manual.pdf) or in some videos you can find [here](./99_references.md).

