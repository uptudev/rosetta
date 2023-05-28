const out = @import("std").io.getStdOut().writer();

fn fibonacci() !void {
    var a: u64 = 0;
    try out.print("{}\n", .{a});
    var b: u64 = 1;
    try out.print("{}\n", .{b});

    while (true) {
        const res = @addWithOverflow(a, b);
        if (res[1] == 1) {
            try out.print("Overflowed!\n", .{});
            break;
        }

        try out.print("{}\n", .{res[0]});
        a = b;
        b = res[0];
    }
}

pub fn main() !void {
    try fibonacci();
}
