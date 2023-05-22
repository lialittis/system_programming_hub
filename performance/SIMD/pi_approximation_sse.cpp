#include <iostream>
#include <random>
#include <cmath>
#include <chrono>
#include <emmintrin.h> // Include the SSE header

constexpr int NUM_SAMPLES = 10000000;

int main() {
    std::mt19937 rng(std::random_device{}());
    std::uniform_real_distribution<float> dist(-1.0f, 1.0f);

    __m128 vec4_total = _mm_setzero_ps(); // Initialize SIMD vector to store partial results
    const __m128 vec4_4 = _mm_set1_ps(4.0f); // SIMD vector with all elements set to 4.0

    auto start = std::chrono::steady_clock::now();

    for (int i = 0; i < NUM_SAMPLES; i += 4) {
        float a = dist(rng);
        __m128 vec4_x = _mm_loadu_ps(&a); // Load 4 random x values
        float b = dist(rng);
        __m128 vec4_y = _mm_loadu_ps(&b); // Load 4 random y values
        __m128 vec4_r = _mm_add_ps(_mm_mul_ps(vec4_x, vec4_x), _mm_mul_ps(vec4_y, vec4_y)); // r = x^2 + y^2
        __m128 vec4_mask = _mm_cmple_ps(vec4_r, _mm_set1_ps(1.0f)); // Mask elements where r <= 1
        vec4_total = _mm_add_ps(vec4_total, _mm_and_ps(vec4_mask, vec4_4)); // Add 4.0 to the total for each element in the mask
    }

    float total[4];
    _mm_storeu_ps(total, vec4_total); // Store the SIMD vector into an array

    float sum = 0.0f;
    for (int i = 0; i < 4; i++) {
        sum += total[i];
    }

    float pi = sum / NUM_SAMPLES;

    auto end = std::chrono::steady_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();

    std::cout << "Approximated pi: " << pi << std::endl;
    std::cout << "Elapsed time: " << duration << " milliseconds" << std::endl;

    return 0;
}

