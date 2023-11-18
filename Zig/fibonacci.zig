const print = @import("std").debug.print;

pub fn main() void {
    var a: u64 = 0;
    print("{}\n", .{a});
    var b: u64 = 1;
    print("{}\n", .{b});

    while (true) {
        const c = @addWithOverflow(a, b);
        if (c[1] == 1) {
            print("Overflowed!\n", .{});
            return;
        }

        print("{}\n", .{c[0]});
        a = b;
        b = c[0];
    }
}
