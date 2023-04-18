#include <emmintrin.h>
#include <cstdio>

int main() {
    // Create an XMM register with four integers
    __m128i values = _mm_set_epi32(4, 3, 2, 1);

    // Allocate memory to store the integers
    int *ptr = new int[4];

    // Store the integers to memory
    _mm_store_si128((__m128i*)ptr, values);

    // Print the values to verify that they were stored correctly
    for (int i = 0; i < 4; i++) {
        printf("%d\n", ptr[i]);
    }

    // Free the allocated memory
    delete[] ptr;

    return 0;
}

