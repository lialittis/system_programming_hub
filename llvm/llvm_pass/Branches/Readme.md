# Some Useful APIs

## getTerminator()

The `getTerminator()` function is used in LLVM to retrieve the terminator instruction of a basic block
. The terminator instruction is the last instruction in a basic block and is responsible for determining
the control flow that leaves the basic block. In most cases, the terminator instruction is a branching 
instruction like `br` (branch), `switch`, or `ret` (return).

## successors and predecessors

In LLVM, the term "successors" refers to the basic blocks that can be reached immediately after a given
basic block in the control flow graph (CFG) of a function. A basic block is considered a successor of 
another basic block if control flow can directly transfer from the first block to the second based on 
the execution of the instructions in the function.

```
define i32 @main(i32 %x) {
  entry:
    %cmp = icmp eq i32 %x, 0
    br i1 %cmp, label %if.then, label %if.else

  if.then:
    ret i32 1

  if.else:
    ret i32 0
}
```

Here, `if.then` and `if.else` are successors of the entry basic block. The successors are determined
by the possible outcomes of the conditional branch instruction. Depending on the value of `%cmp`, either
the `if.then` or the `if.else` block will be executed next.

In this example, the entry basic block has two successors: `if.then` and `if.else`. These successors
represent the possible control flow paths that can be taken based on the conditional instruction's outcome.

## replaceUsesOfWith

Replace uses of one Value with another.

## conditional

`isUnconditional()` and `isConditional()` are member functions available on certain terminator instructions
in LLVM IR. These functions are used to determine whether a terminator instruction is unconditional 
or conditional.

`isUnconditional()`: This function checks if a terminator instruction unconditionally transfers control
to a single successor. It returns true if the terminator is unconditional and false otherwise.

For example, in an LLVM IR code like this:

```
br label %target
```
The `br` instruction is unconditional because it transfers control to the target block without any condition.

`isConditional()`: This function checks if a terminator instruction conditionally transfers control
based on a condition. It returns true if the terminator is conditional and false otherwise.
```
br i1 %condition, label %trueBlock, label %falseBlock
```
The `br` instruction is conditional because it transfers control based on the value of the `%condition`
variable. If `%condition` is true, control goes to the `trueBlock`; otherwise, it goes to the `falseBlock`.
