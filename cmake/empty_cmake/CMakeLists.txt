cmake_minimum_required(VERSION 3.20)
project(empty_cmake)

# Set a variable
set(MY_VARIABLE "Hello, CMake!")

# Print the value of the variable
message("The value of MY_VARIABLE is: ${MY_VARIABLE}")

# Set this to a valid LLVM installation dir
set(LT_LLVM_INSTALL_DIR "" CACHE PATH "Path to LLVM")

# Add the location of LLVMConfig.cmake to CMake search paths (so that
# find_package can locate it)
list(APPEND CMAKE_PREFIX_PATH "${LT_LLVM_INSTALL_DIR}/lib/cmake/llvm/")

find_package(LLVM REQUIRED CONFIG HINTS)
add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS})

message("path :${CMAKE_PREFIX_PATH}; ${LT_LLVM_INSTALL_DIR} ;${LLVM_DEFINITIONS}; ${LLVM_INCLUDE_DIRS} ; ${LLVM_LIBRARY_DIRS} ")

# Use the same C++ standard as LLVM does
#set(CMAKE_CXX_STANDARD 17 CACHE STRING "")

