# Malloctopus

## Part 1: Bump Allocator

It is requested to implement a simple allocator, called bump allocator. It needs to do three things:

1. implementing `mm_malloc()` to return the pointer's current value and then advance the pointer by the allocated block's size.
2. using `mem_sbrk()` from CSAPP's *memlib* instead of `sbrk()` once there's not enough space in heap to serve an allocation request.
3. implementing `mm_free()` as a no-op

Requirements:

1. Ensure that allocated blocks satisfy 64-bit memory alignment requirements.(Note that the modern 64-bit system should use 16-byte
boundary, even though 8-byte might be enough for a typical 64-bit data type)
2. Imcrement the heap in multiples of 4096 bytes.

### Implementation

Because I don't have the access to the internal materials and code, I don't have the required libraries to support me complish this
exercise. Luckily the exercise is only used to train myself, so I am happy to self-implement all its needs and practice my skills at
the same time.

**1. Create a preallocated memory pool and the initial heap status.**

**2. Simulate `mem_sbrk()`**

**3. Align size to nearest multiple of alignment**

**4. Bump allocator malloc**


