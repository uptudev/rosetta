#include <stdio.h>

int rec_fib(unsigned long long a, unsigned long long b) {
    unsigned long long c = a + b;
    if (c < b) {
        puts("Overflowed!");
        return 0;
    }

    printf("%llu\n", c);
    rec_fib(b, c);
}

int main() {
    unsigned long long a = 0;
    unsigned long long b = 1;
    printf("%llu\n", a);
    printf("%llu\n", b);

    return rec_fib(a, b);
}
