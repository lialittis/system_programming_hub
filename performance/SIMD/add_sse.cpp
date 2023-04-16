#include <emmintrin.h> // include SSE header
#include <iostream>
#include <vector>
constexpr int SIZE = 1000000;

void add_sse(float* a, float* b, float* result, int n)
{
    int i;
    __m128 a_vec, b_vec, result_vec; // declare sse registers

    for(i = 0; i < n; i += 4)
    {
        a_vec = _mm_loadu_ps(&a[i]); // load 4 floats from array a into SSE register
        b_vec = _mm_loadu_ps(&b[i]); // load 4 floats form array b into SSE register
        result_vec = _mm_add_ps(a_vec, b_vec); // add two SSE registers
        _mm_storeu_ps(&result[i], result_vec); // store 4 floats from SSE register into array result
    }
}

int main()
{
    std::vector<float> a(SIZE), b(SIZE), c(SIZE);
    for(int i = 0; i < SIZE ; ++i)
    {
        a[i] = rand()%100;
        b[i] = rand()%100;
    }
    add_sse(&a[0],&b[0],&c[0],SIZE);
    std::cout << "First 10th numbers of a,b,c are :" <<std::endl;
    for(int i = 0; i < 10 ; ++i)
        std::cout << a[i] << " + " << b[i] << " = " << c[i] << std::endl;

    return 0;
}

