#include <iostream>
#include <thread>

int main()
{
    int x = 42;

    // create a therad using a lambda function
    std::thread t([&x]()
            {
            std::cout << "Hello from thread "<< std::this_thread::get_id() <<
            " x = " << x++ << std::endl;
            });
            
    std::cout << "Hello from main thread "<< std::this_thread::get_id() <<
            " x = " << x++ << std::endl;
    t.join();
    
    std::cout << "Hello from main thread "<< std::this_thread::get_id() <<
            " x = " << x << std::endl;
    return 0;
}
