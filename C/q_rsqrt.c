#include <stdio.h> // so that I can print the values, q_rsqrt itself is not reliant on the C standard library.

double q_rsqrt(double i) {
    long long i_bits;
    double half_i, out;
    const double threehalfs = 1.5;

    half_i = i * 0.5;
    out = i;
    i_bits = * ( long long * ) &out;
    i_bits = 0x5fe6a09e667f3bc8 - ( i_bits >> 1 );
    out = * ( double * ) &i_bits;
    out = out * ( threehalfs - ( half_i * out * out ) ); // Newtonian approximation, lower two optional
    out = out * ( threehalfs - ( half_i * out * out ) );
    out = out * ( threehalfs - ( half_i * out * out ) );

    return out;
}

int main() {
    long long testbits = 0x69420abcdef69420;
    double testcase = * ( double * ) &testbits;

    printf("%.16e\n", q_rsqrt(testcase));
    printf("%.16e\n", q_rsqrt(0.5));

    return 0;
}
