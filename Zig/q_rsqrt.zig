pub fn q_rsqrt(i: f64) f64 {
    const threehalfs: f64 = 1.5;
    const half_i: f64 = 0.5 * i;
    const i_bits: u64 = 0x5fe6a09e667f3bc8 - (@bitCast(u64, i) >> 1);
    var out: f64 = @bitCast(f64, i_bits);

    out = out * (threehalfs - half_i * out * out);
    out = out * (threehalfs - half_i * out * out);
    out = out * (threehalfs - half_i * out * out);

    return out;
}

pub fn main() !void {
    const stdout = @import("std").io.getStdOut().writer();
    const testbits: u64 = 0x69420abcdef69420;
    var testcase: f64 = 0;
    testcase = @bitCast(f64, testbits);

    try stdout.print("{}\n", .{q_rsqrt(testcase)});
    try stdout.print("{}\n", .{q_rsqrt(0.5)});
}
