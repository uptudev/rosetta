void main() {
    var U64_MAX = BigInt.parse('18446744073709551615');
    var a = BigInt.zero;
    print(a);
    var b = BigInt.one;
    print(b);
    var c = a + b;

    do {
        print(c);
        a = b;
        b = c;
        c = a + b;
    } while (c < U64_MAX);

    print("Overflowed!");
}
