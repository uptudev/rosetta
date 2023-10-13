const out = @import("std").io.getStdOut().writer();

pub fn main() !void {
    var a: u64 = 0;
    try out.print("{}\n", .{a});
    var b: u64 = 1;
    try out.print("{}\n", .{b});

    while (true) {
        const c = @addWithOverflow(a, b);
        if (c[1] == 1) {
            try out.print("Overflowed!\n", .{});
            return;
        }

        try out.print("{}\n", .{c[0]});
        a = b;
        b = c[0];
    }
}
