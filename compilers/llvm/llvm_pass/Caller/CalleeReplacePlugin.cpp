#include "llvm/IR/InstIterator.h"
#include <llvm/IR/InstVisitor.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/IntrinsicInst.h>
#include <llvm/Passes/PassPlugin.h>
#include <llvm/Support/Compiler.h>
#include <llvm/Config/llvm-config.h>
#include <llvm/IR/PassManager.h>
#include "llvm/IR/InstVisitor.h"
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/PassManager.h>

#define DEBUG_TYPE "callee-replace-plugin"

using namespace llvm;

namespace {        
    struct CalleeReplacePluginPass : PassInfoMixin<CalleeReplacePluginPass>, public InstVisitor<CalleeReplacePluginPass> {
        public:
            PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM) {
                errs() << "Running CalleeReplacePluginPass on function " << F.getName() << "\n";

                // visitor pattern
                this->visit(F);
                
                // simple and direct approach of replacing function
                Module *M = F.getParent();
                Function *FaultyFree = M->getFunction("faulty_free");

                for(auto &BB : F){
                    for(auto &I : BB){
                        if(CallInst *CI = dyn_cast<CallInst>(&I) ){
                            errs() << "The caller Instruction is " << *CI << "\n";
                            Function *Callee = CI->getCalledFunction();
                            if( Callee && Callee->getName() == "free"){
                                CI->setCalledFunction(FaultyFree);
                            }
                        }
                    }
                }

                return PreservedAnalyses::all();
            }

            void visitCallInst(CallInst &I) {
                auto *CalledFunction = I.getCalledFunction();
                if (CalledFunction->getName() == "malloc") {
                    instrumentMalloc(&I);
                }
            }
        private:
            void instrumentMalloc(CallInst* CI){
                LLVMContext &Ctx(CI->getContext());
                IRBuilder Builder(CI);
                auto DL = CI->getParent()->getParent() ->getParent()->getDataLayout();
                auto *SizeTy = DL.getIntPtrType(Ctx); // type that corresponds to size_t in C
                auto *FuncType = FunctionType::get(Type::getInt8PtrTy(Ctx),{SizeTy},false);
                auto MallocFn = 
                    CI->getParent()->getParent()->getParent()->getOrInsertFunction(
                            "__runtime_malloc",FuncType);
                auto *sizeArg = CI->getArgOperand(0);
                //ConstantInt *sizeArg = ConstantInt::get(Type::getInt64Ty(Builder.getContext()), 100); // Allocating 100 bytes
                //CallInst *myMallocCall = Builder.CreateCall(FaultyMalloc, {sizeArg});
                CallInst *myMallocCall = Builder.CreateCall(MallocFn, {sizeArg});
                CI->replaceAllUsesWith(myMallocCall);
                CI->eraseFromParent(); // Question here: why segmentation fault if I try to do similar steps in the direct way of 
                                       // squence reading/writing instead of visitor pattern
                                       // Answer : if you want to erase the instructions, you have to wait until the end of the 
                                       // loop of the instructions, otherwise there could be issues
                                       // TODO : remember to add the note into my blog/post
            }
    };
}// namespace

// Registration
PassPluginLibraryInfo getPassPlugininInfo() {
    const auto callback = [](PassBuilder &PB) {
        PB.registerPipelineParsingCallback(
                [](StringRef Name, FunctionPassManager &FPM, auto) {
                if(Name == "callee-replace-plugin") {
                FPM.addPass(CalleeReplacePluginPass());
                return true;
                }
                return false;
                });
    };

    return {LLVM_PLUGIN_API_VERSION, "CalleeReplacePluginPass",
        LLVM_VERSION_STRING, callback};
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getPassPlugininInfo();
}


#undef DEBUG_TYPE
