#include <stdio.h>

int main() {
    unsigned register long long a = 0;
    printf("%llu\n", a);
    unsigned register long long b = 1;
    printf("%llu\n", b);
    unsigned register long long c = a + b;

    loop:
        printf("%llu\n", c);
        a = b;
        b = c;
        c = a + b;
        if (c < b) {goto exit;}
        goto loop;

    exit:
        puts("Overflowed!");
        return 0;
}
