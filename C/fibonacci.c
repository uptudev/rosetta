#include <stdio.h>

int main() {
    unsigned long long a = 0;
    printf("%llu\n", a);
    unsigned long long b = 1;
    printf("%llu\n", b);

    while (1) {
        unsigned long long c = a + b;

        if (c < b) {
            printf("Overflowed!\n");
            return 0;
        }

        printf("%llu\n", c);
        a = b;
        b = c;
    }
}
