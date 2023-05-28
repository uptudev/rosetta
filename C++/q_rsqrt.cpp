#include <bit>
#include <limits>
#include <cstdint>
#include <cstdio>

constexpr double q_rsqrt(double i) {
    static_assert(std::numeric_limits<double>::is_iec559); // Ensure floating points follow IEEE-754 convention

    double out = std::bit_cast<double>(
        0x5fe6a09e667f3bc8 - (std::bit_cast<std::uint64_t>(i) >> 1));
    out = out * (1.5 - (i * 0.5 * out * out));
    out = out * (1.5 - (i * 0.5 * out * out));
    return out * (1.5 - (i * 0.5 * out * out));
}

int main() {
    uint64_t const testbits = 0x69420abcdef69420;
    double const testcase = std::bit_cast<double>(testbits);

    printf("%.15e\n", q_rsqrt(testcase));
    printf("%.15e\n", q_rsqrt(0.5));
}
