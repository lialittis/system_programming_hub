#include <iostream>
#include <vector>

constexpr int SIZE = 1000000;

void add_base(float* a, float* b, float* result, int n)
{
    int i;

    for(i = 0; i < n; ++i)
    {
        result[i] = a[i] + b[i];
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
    add_base(&a[0],&b[0],&c[0],SIZE);

    std::cout << "First 10th numbers of a,b,c are :" <<std::endl;
    for(int i = 0; i < 10 ; ++i)
        std::cout << a[i] << " + " << b[i] << " = " << c[i] << std::endl;

    return 0;
}
