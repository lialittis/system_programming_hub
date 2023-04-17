void func(int *a, int *b, int *c)
{
    *c = *a;
    *c = *b;
}

// use restrict to help compiler optimization
void func2(int *__restrict a, int *__restrict b, int *__restrict c)
{
    *c = *a;
    *c = *b;
}

void func3(int const *a, int const *b, int *__restrict c)
{
    *c = *a;
    *c = *b;
}
// use volatile to ban compiler optimization
// e.g. multi-threads access same address
int func4(int volatile *a)
{
    *a = 42;
    return *a;
}

int test1()
{
    int a = 100;
    int b = 21;
    func(&a, &b, &b);
    return a + b;
}

int test2()
{
    int a = 100;
    int b = 21;
    func2(&a, &b, &b);
    return a + b;
}

int test3()
{
    int a = 100;
    int b = 21;
    func3(&a, &b, &b);
    return a + b;
}

int test4()
{
    int a = 20;
    return func4(&a);
}
