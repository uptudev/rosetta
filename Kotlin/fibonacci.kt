fun fibonacci() {
    var a: ULong = 0u;
    println(a);
    var b: ULong = 1u;
    println(b);

    while(true) {
        val c: ULong = a + b;

        if (c < b) {
            println("Overflowed!");
            break;
        }

        println(c);
        a = b;
        b = c;
    }
}

fun main(args: Array<String>) {
    fibonacci();
}
