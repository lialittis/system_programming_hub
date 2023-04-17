#include <array>
#include <vector>
#include <numeric>

int vectorFunc()
{
    std::vector<int> arr;
    for (int i = 0; i < 100 ; ++i)
    {
        arr.push_back(i);
    }
    return std::reduce(arr.begin(), arr.end());
}

int arrayFunc()
{
    std::array<int, 100> arr;
    for (int i = 0; i < 100 ; ++i)
    {
        arr[i] = i;
    }
    return std::reduce(arr.begin(), arr.end());
}

int simpleSmallArrayFunc()
{
    std::array<int, 10> arr;
    for (int i = 0; i < 10 ; ++i)
    {
        arr[i] = i;
    }

    int ret = 0;
    for (int i = 0; i < 10 ; ++i)
    {
        ret += arr[i-1];
    }
    return ret;
}

constexpr int func_impl()
{
    std::array<int, 10> arr{};
    for (int i = 0; i < 10 ; ++i)
    {
        arr[i] = i;
    }

    int ret = 0;
    for (int i = 0; i < 10 ; ++i)
    {
        ret += arr[i-1];
    }
    return ret;
}

int func()
{
    int ret = func_impl();
    return ret;
}
