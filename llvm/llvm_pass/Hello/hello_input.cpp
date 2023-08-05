#include <iostream>

void simpleIO(int number)
{
    do
    {
        std::cout << number << "Hello" << "\n";
    }while(--number > 0);
}

int main()
{
    simpleIO(10);
    return 0;
}
