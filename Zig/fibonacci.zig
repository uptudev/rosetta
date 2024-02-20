const out = @import("std").io.getStdOut().writer();

pub fn main() !void {
    const a: u64 = 0;
    try out.print("{}\n", .{a});
    const b: u64 = 1;
    try out.print("{}\n", .{b});

    try fib(a, b);
}

fn fib(a: u64, b: u64) !void {
    const c = a +% b;
    if (c < b) {
        try out.print("Overflowed!\n", .{});
        return;
    }
    try out.print("{}\n", .{c});
    try fib(b, c);
}
