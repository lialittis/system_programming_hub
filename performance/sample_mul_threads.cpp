#include <iostream>
#include <thread>
#include <string>

void print_message(const std::string& message);

int main()
{
    std::thread t1(print_message, "Hello from threa 1 !");
    std::thread t2(print_message, "Hello from threa 2 !");
    std::cout << "Hello from the main thread "<< std::this_thread::get_id() << std::endl;

    t1.join();
    t2.join();

    return 0;
}

void print_message(const std::string& message)
{
    std::cout << message << std::this_thread::get_id() << std::endl;
}
