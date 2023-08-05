# LLVM PASS

LLVM is a powerful infrastructure for compiler-related tasks and optimizations. Writing an LLVM pass
involves manipulating the intermediate representation (IR) of the program being compiled. The IR is
a low-level representation that sits between the front-end (source code) and back-end (machine code)
of the LLVM compilation pipeline.

## A Very Simple Example

Prerequisites:

1. LLVM installed on the local system

In my local system. llvm-16 is installed.

2. Create a new C++ file for the pass.

Let's name it `Hello.cpp`.

- Include the necessary headers

```
#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
```

- Define the "Hello" class.

Create a class that inherits from the `FunctionPass` class and override the `runOnFunction` method to
perform your desired analysis or transformation.

```
using namespace llvm;

namespace {
    struct Hello : public FunctionPass {
        static char ID; // Pass identification, used by LLVM
        Hello() : FunctionPass(ID) {}

        bool runOnFunction(Function &F) override {
            // Get the name of the current function
            std::string functionName = F.getName().str();

            // Print a message for each function
            errs() << "Hello from function: " << functionName << "\n";

            // Since we don't modify the IR, return false
            return false;
        }
    };
}

char Hello::ID = 0; // Initialize the pass ID
                    
// Register the pass with the LLVM Pass Manager
static RegisterPass<Hello> X("hello", "Hello World Pass",false, false);
```

The actions it does is printing a message for each function in the module.

- Build the pass

```
clang++ -g -O3 -shared -o HelloPass.so Hello.cpp `llvm-config --cxxflags` -fPIC
```

- Run the pass

```
opt -load ./HelloPass.so -hello < input.ll > output.ll
```

The `-load` option specifies the path to your compiled pass (`HelloPass.so`). The `-hello` option is
the name we provided while registering the pass. When you run the pass, it will print `"Hello from 
function: <function-name>"` for each function in the input IR and create a modified IR in `output.ll`.

