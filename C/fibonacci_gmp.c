#include <stdio.h>
#include <gmp.h>

int main() {
    puts("Which fibonacci number do you wish to calculate?");
    unsigned long long input;
    scanf("%llu", &input);

    switch (input) {
        case 0:
            puts("\n0");
            return 0;
        case 1:
        case 2:
            puts("\n1");
            return 0;
        default:
            break;
    }

    puts("");
    mpz_t a;
    mpz_init(a);
    
    mpz_t b;
    mpz_init_set_ui(b, 1);
    
    mpz_t c;
    mpz_init_set_ui(c, 1);

    for (unsigned long long i = 2; i < input; i++) {
        mpz_set(a, b);
        mpz_set(b, c);
        mpz_add(c, a, b);
    }

    gmp_printf("%Zd\n", c);
    return 0;
}

unsigned long long fib(unsigned long long a, unsigned long long b) {

}
