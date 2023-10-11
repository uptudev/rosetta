#include <iostream>

int main() {
    unsigned long long a = 0;
    std::cout << a << '\n';
    unsigned long long b = 1;
    std::cout << b << '\n';

    while (true) {
        unsigned long long c = a + b;

        if (c < b) {
            std::cout << "Overflowed!\n";
            return 0;
        }

        std::cout << c << '\n';
        a = b;
        b = c;
    }
}
