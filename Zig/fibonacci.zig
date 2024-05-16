const out = @import("std").io.getStdOut().writer();

pub fn main() !void {
    var a: u64 = 0;
    try out.print("{}\n", .{a});
    var b: u64 = 1;
    try out.print("{}\n", .{b});

    var c: u64 = a +% b;
    while (c >= b) : (c = a +% b) {
        try out.print("{}\n", .{c});
        a = b;
        b = c;
    }
    try out.print("Overflowed!\n", .{});
    return;
}
