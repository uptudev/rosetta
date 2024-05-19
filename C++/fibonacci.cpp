#include <iostream>

int main() {
    unsigned long long a = 0;
    std::cout << a << '\n';
    unsigned long long b = 1;
    std::cout << b << '\n';
    unsigned long long c = a + b;

    loop:
        std::cout << c << '\n';
        a = b;
        b = c;
        c = a + b;
        if (c < b) {goto overflow;}
        goto loop;

    overflow:
        std::cout << "Overflowed!\n";
        return 0;
}
