fn main() {
    mut a:= u64(0)
    println(a)
    mut b:= u64(1)
    println(b)
    mut c:= a + b
    
    for c >= b {
        println(c)
        a = b
        b = c
        c = a + b
    }

    println("Overflowed!")
}
