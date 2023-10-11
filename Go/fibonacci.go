package main
import "fmt"

func main() {
    var a uint64 = 0;
    fmt.Println(a)
    var b uint64 = 1;
    fmt.Println(b)

    for true {
        var c uint64 = a + b

        if c < b {
            fmt.Println("Overflowed!")
            break
        }

        fmt.Println(c)
        a = b
        b = c
    }
}
