#include <cstdint>

int add(int a, int b)
{
    return a + b;
}

int addMul8(int a, int b)
{
    return a + 8 * b;
}

// linear operation in X86 assembly
int func(int *a, int b)
{
    return a[b];
}

// the reason of using size_t but not int
// no need to use movslq
// could handle number larger than INT_MAX
int func2(int *a, std::size_t b)
{
    return a[b];
}

int algebraicSimplify(int a, int b)
{
    int c = a + b;
    int d = a - b;
    return (c + d) / 2;
}

int constAddition()
{
    int a = 10;
    int b = 32;
    return a + b;
}

int forConstAddition()
{
    int ret = 0;
    for(int i = 0; i<=100; ++i)
    {
        ret += i;
    }

    return ret;
}
