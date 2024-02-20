package main
import "fmt"

func main() {
    var a uint64 = 0;
    fmt.Println(a)
    var b uint64 = 1;
    fmt.Println(b)
    var c uint64 = a + b;

    for true {
        fmt.Println(c)
        a = b
        b = c
        c = a + b
        if c > b {
            continue
        }
        fmt.Println("Overflowed!")
        break
    }
}
