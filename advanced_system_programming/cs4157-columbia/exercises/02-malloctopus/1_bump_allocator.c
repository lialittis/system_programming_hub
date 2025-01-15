#include <stdio.h>
#include <stdlib.h>


#define MEM_POOL_SIZE (1024 * 1024) // 1 MB
#define ALIGNMENT 16
#define PAGE_SIZE 4096

static char mem_pool[MEM_POOL_SIZE];
static char *heap_start = mem_pool;
static char *heap_end = mem_pool;
static char *heap_max = mem_pool + MEM_POOL_SIZE;

// Simulate mem_sbrk()
void *mem_sbrk(int increment) {
  if (heap_end + increment > heap_max) {
    fprintf(stderr, "mem_sbrk failed: out of memory\n");
    return NULL;
  }
  void *old_heap_end = heap_end;
  heap_end += increment;
  return old_heap_end;
}

// Initialize memory system
void mm_init() {
  heap_start = mem_pool;
  heap_end = mem_pool;
}

// Deinitialize memory system
void mm_deinit() {
  heap_start = mem_pool;
  heap_end = mem_pool;
}

// Align size to nearest multiple of ALIGNMENT
size_t align_size(size_t size) {
  return (size + (ALIGNMENT - 1)) & ~(ALIGNMENT - 1);
}

// Bump allocator malloc
void *mm_malloc(size_t size) {
  size_t aligned_size = align_size(size);
  if (heap_end + aligned_size > heap_max) {
    size_t shortfall = aligned_size - (heap_max - heap_end);
    size_t increment = ((shortfall + PAGE_SIZE - 1) / PAGE_SIZE) * PAGE_SIZE;
    if (!mem_sbrk(increment)) {
      return NULL;
    }
  }

  void *allocated = heap_end;
  heap_end += aligned_size;
  return allocated;
}

// No-op free
void mm_free(void *ptr) {
  (void)ptr; // No operation
}

// Example usage
int main() {
    mm_init();

    void *ptr1 = mm_malloc(5);
    void *ptr2 = mm_malloc(20);
    void *ptr3 = mm_malloc(4096);

    printf("ptr1: %p\n", ptr1);
    printf("ptr2: %p\n", ptr2);
    printf("ptr3: %p\n", ptr3);

    mm_deinit();
    return 0;
}
