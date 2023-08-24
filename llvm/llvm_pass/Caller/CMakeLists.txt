cmake_minimum_required(VERSION 3.18)
project(llvm-callee-replace-plugin)

find_package(LLVM REQUIRED CONFIG HINTS)
add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS})

add_library(CalleeReplacePlugin SHARED CalleeReplacePlugin.cpp)
