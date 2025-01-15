int callee(const int* x)
{
    return *x + 1;
}

int main()
{
    int t = 4;
    return callee(&t);
}
