package main
import "core:fmt"

main :: proc() {
    a: u64 = 0
    fmt.println(a)
    b: u64 = 1
    fmt.println(b)
    c: u64 = a + b;

    for {
        fmt.println(c)
        a = b;
        b = c;
        c = a + b;
        if c > b {
            continue
        }
        break 
    } 

    fmt.println("Overflowed!")
}
