#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"

using namespace llvm;

int main() {
    LLVMContext Context;
    Module module("example", Context);

    // Create a function
    FunctionType *funcType = FunctionType::get(Type::getVoidTy(Context), {}, false);
    Function *function = Function::Create(funcType, Function::ExternalLinkage, "myFunction", module);

    // Create basic blocks
    BasicBlock *entryBlock = BasicBlock::Create(Context, "entry", function);
    BasicBlock *otherBlock = BasicBlock::Create(Context, "other", function);
    
    module.print(outs(), nullptr);

    // Erase the 'other' basic block
    otherBlock->eraseFromParent();

    // Print the IR
    errs() << "After erasing: \n";
    module.print(outs(), nullptr);

    return 0;
}

