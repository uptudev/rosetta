fun main(args: Array<String>) {
    var a: ULong = 0u;
    println(a);
    var b: ULong = 1u;
    println(b);
    var c: ULong = a + b;

    do {
        println(c);
        a = b;
        b = c;
        c = a + b;
    } while (c >= b);

    println("Overflowed!");
}
