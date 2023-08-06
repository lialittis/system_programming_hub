# LLVM PASS

LLVM is a powerful infrastructure for compiler-related tasks and optimizations. Writing an LLVM pass
involves manipulating the intermediate representation (IR) of the program being compiled. The IR is
a low-level representation that sits between the front-end (source code) and back-end (machine code)
of the LLVM compilation pipeline.

## A Very Simple Example of Plugin Pass

Prerequisites:

1. LLVM installed on the local system

In my local system. llvm-16 is installed.

2. Create a new C++ file for the pass.

Let's name it `MyHelloPlugin.cpp`.

- Include the necessary headers

```
#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/raw_ostream.h"
```

- Define the "MyHelloPlugin" class.

Create a class that inherits from the `PassInfoMixin` class and define the `run` method to
perform your desired analysis or transformation.

```
using namespace llvm;

namespace {
    struct MyHelloPluginPass : PassInfoMixin<MyHelloPluginPass> {
        PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM) {
            errs() << "Running MyHelloPluginPass on function " << F.getName() << "\n";

            return PreservedAnalyses::none();
        }
    };
} // namespace

/// Registration
PassPluginLibraryInfo getPassPluginInfo() {
    const auto callback = [](PassBuilder &PB) {
        PB.registerPipelineParsingCallback(
                [](StringRef Name, FunctionPassManager &FPM, auto) {
                    if (Name == "my-hello-plugin") {
                        FPM.addPass(MyHelloPluginPass());
                        return true;
                    }
                    return false;
                });
    };
    return {LLVM_PLUGIN_API_VERSION, "MyHelloPluginPass",
            LLVM_VERSION_STRING, callback};
};

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getPassPluginInfo();
}
```

The actions it does is printing a message for each function in the module.

- Build the pass

```
clang++ -g -O3 -shared -o libMyHelloPass.so MyHelloPlugin.cpp `llvm-config --cxxflags` -fPIC
```

- Run the pass

```
opt -load-pass-plugin ./libMyHelloPass.so -passes=my-hello-plugin -S input.ll -o output.ll
```

The `-load-pass-plugin` option specifies the path to your compiled plugin pass (`libMyHelloPass.so`).
The `-passes=my-hello-plugin` option is the name we provided while registering the pass. When you 
run the pass, it will print the defined message for each function in the input IR and create a modified
IR in `output.ll`.

3. Or, use cmake and any builder you like to build the project

- Config `CMakeLists.txt`

- Creat a `Makefile` with your builder. 
