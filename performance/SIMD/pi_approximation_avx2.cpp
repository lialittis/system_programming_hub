#include <iostream>
#include <random>
#include <cmath>
#include <chrono>
#include <immintrin.h> // Include the SIMD header

constexpr int NUM_SAMPLES = 10000000;

int main() {
    std::mt19937 rng(std::random_device{}());
    std::uniform_real_distribution<float> dist(-1.0f, 1.0f);

    __m256 vec4_total = _mm256_setzero_ps(); // Initialize SIMD vector to store partial results
    const __m256 vec4_4 = _mm256_set1_ps(4.0f); // SIMD vector with all elements set to 4.0

    auto start = std::chrono::steady_clock::now();

    for (int i = 0; i < NUM_SAMPLES; i += 8) {
        float a,b;
        a = dist(rng);
        b = dist(rng);
        __m256 vec4_x = _mm256_loadu_ps(&a); // Load 8 random x values
        __m256 vec4_y = _mm256_loadu_ps(&b); // Load 8 random y values
        __m256 vec4_r = _mm256_add_ps(_mm256_mul_ps(vec4_x, vec4_x), _mm256_mul_ps(vec4_y, vec4_y)); // r = x^2 + y^2
        __m256 vec4_mask = _mm256_cmp_ps(vec4_r, _mm256_set1_ps(1.0f), _CMP_LE_OS); // Mask elements where r <= 1
        vec4_total = _mm256_add_ps(vec4_total, _mm256_and_ps(vec4_mask, vec4_4)); // Add 4.0 to the total for each element in the mask
    }

    float total[8];
    _mm256_storeu_ps(total, vec4_total); // Store the SIMD vector into an array

    float sum = 0.0f;
    for (int i = 0; i < 8; i++) {
        sum += total[i];
    }

    float pi = sum / NUM_SAMPLES;

    auto end = std::chrono::steady_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();

    std::cout << "Approximated pi: " << pi << std::endl;
    std::cout << "Elapsed time: " << duration << " milliseconds" << std::endl;

    return 0;
}

