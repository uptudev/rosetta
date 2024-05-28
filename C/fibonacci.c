#include <stdio.h>

int main() {
    unsigned long long a = 0;
    printf("%llu\n", a);
    unsigned long long b = 1;
    printf("%llu\n", b);
    unsigned long long c = a + b;

    do {
        printf("%llu\n", c);
        a = b;
        b = c;
        c = a + b;
    } while (c >= b);

    puts("Overflowed!");
    return 0;
}
