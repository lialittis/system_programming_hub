#include <immintrin.h>
#include <vector>
#include <iostream>

constexpr int SIZE = 4;

void shuffle_example(float *a, float *b, float *c, int n)
{
    __m128 amm = _mm_load_ps(a);
    __m128 bmm = _mm_load_ps(b);
    __m128 xmm = _mm_add_ss(bmm, _mm_shuffle_ps(amm,amm,1));
    _mm_store_ps(c, xmm);
}

int main()
{
    std::vector<float> a(SIZE), b(SIZE), c(SIZE);

    for(int i = 0; i < SIZE ; ++i)
    {
        a[i] = rand()%100;
        b[i] = rand()%100;
    }
    shuffle_example(&a[0],&b[0],&c[0],SIZE);
    std::cout << "After shuffle a,b,c are :" <<std::endl;
    for(int i = 0; i < 4 ; ++i)
        std::cout << a[i] << ";"<< b[i] << ";" << c[i] << std::endl;

    return 0;
}
