#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"

using namespace llvm;

int main() {
    LLVMContext Context;
    Module module("example", Context);
    IRBuilder<> builder(Context);

    // Create a function
    FunctionType *funcType = FunctionType::get(Type::getVoidTy(Context), {}, false);
    Function *function = Function::Create(funcType, Function::ExternalLinkage, "myFunction", module);

    // Create an entry block
    BasicBlock *entryBlock = BasicBlock::Create(Context, "entry", function);

    // Insert an 'unreachable' instruction
    builder.SetInsertPoint(entryBlock);
    builder.CreateUnreachable();
    
    // Print the IR
    module.print(outs(), nullptr);

    // Get the 'unreachable' instruction
    Instruction *unreachableInst = entryBlock->getTerminator();

    // Erase the 'unreachable' instruction
    unreachableInst->eraseFromParent();

    // Print the IR
    errs() << "After erasing: \n";
    module.print(outs(), nullptr);

    return 0;
}
