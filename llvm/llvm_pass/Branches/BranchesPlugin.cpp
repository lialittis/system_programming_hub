#include "llvm/Analysis/PostDominators.h"
#include "llvm/Analysis/TargetLibraryInfo.h"
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/InstVisitor.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include <llvm-16/llvm/Support/Casting.h>

#define DEBUG_TYPE "branches-plugin"

using namespace llvm;

namespace {
    struct BranchesPluginPass : PassInfoMixin<BranchesPluginPass> {
        PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM) {
            errs() << "Running MyHelloPluginPass on function " << F.getName() << "\n";

            for(auto &BB : F){
                for (auto &Inst : BB) {
                    if(auto *BrInst = dyn_cast<BranchInst>(&Inst)) {
                        if(BrInst->isConditional()){
                            errs() << "The current instruction is conditional:" << Inst << "\n";
                            auto *ParentBB = BrInst->getParent();
                            errs() << "Its Parent Block is " << *ParentBB << "\n";
                            for (auto *Succ : successors(BrInst)){
                                errs() << "Its successsors contain " << *Succ << "\n";
                            }
                            for (auto *Succ : successors(ParentBB)){
                                errs() << "Its Parent Block's 'successsors contain " << *Succ << "\n";
                            }
                            auto num = BrInst->getNumSuccessors();
                            for(int i=0; i< num; ++i){
                                errs() << "Its " <<i<<" successor is "<< BrInst->getSuccessor(i)<<"\n"; 
                            }

                            // test
                            auto target = BrInst->getSuccessor(0);
                            for (auto *Succ : successors(ParentBB)){
                                if(Succ != target ) {
                                    errs() << "NOTICE:" << Succ << " != " << target << "\n";
                                }else{
                                    errs() << "NOTICE:" << Succ << " == " << target << "\n";
                                }
                            }
                        }
                    }
                }
            }

            return PreservedAnalyses::none();
        }
    };
} // namespace

/// Registration
PassPluginLibraryInfo getPassPluginInfo() {
    const auto callback = [](PassBuilder &PB) {
        PB.registerPipelineParsingCallback(
                [](StringRef Name, FunctionPassManager &FPM, auto) {
                    if (Name == "branches-plugin") {
                        FPM.addPass(BranchesPluginPass());
                        return true;
                    }
                    return false;
                });
    };
    return {LLVM_PLUGIN_API_VERSION, "BranchesPluginPass",
            LLVM_VERSION_STRING, callback};
};

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getPassPluginInfo();
}

#undef DEBUG_TYPE
