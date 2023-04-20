#include <vector>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <functional>
#include <iostream>
#include <random>

float random_float() {
    static std::random_device rd;
    static std::mt19937 gen{rd()};
    std::uniform_real_distribution<float> dist{};
    return dist(gen);
}

void initialize_matrix(float *m, int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            m[i * n + j] = random_float();
        }
    }
}

float* transpose_matrix1(float *a, int n)
{
    std::vector<float> r_a(n * n);
    for(int i = 0; i < n; ++i)
    {
        for(int j = 0; j < n; ++j)
        {
            r_a[i*n + j] = a[j*n + i];
        }
    }
    return r_a.data();  // Error : A typlical example of segmentation fault caused by wrongly memory allocation
}

void transpose_matrix2(float *src, float *dst, int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            dst[i * n + j] = src[j * n + i];
        }
    }
}

void compare_matrix(float *src, float *dest, int n)
{
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            float first = src[i * n + j];
            float second = dest[i * n + j];
            if (std::abs(first - second) > 0.1) {
                fprintf(stderr, "Contents not equal at %d, %d: %f != %f\n", i,
                        j, first, second);
                exit(1);
            }
        }
    }
}

int main()
{
    int n = 1600;

    // Input matrices
    std::vector<float> a1(n * n, 0.0f);
    std::vector<float> a2(n * n, 0.0f);

    // Initialize
    initialize_matrix(a1.data(), n);

    a2 = a1;

    float* r_a1 = transpose_matrix1(a1.data(), n);

    std::vector<float> vec(n * n);
    float *r_a2 = vec.data();
    transpose_matrix2(a2.data(), r_a2, n);

    compare_matrix(r_a1, r_a2, n);

    return 0;
}
