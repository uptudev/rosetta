import std::io;
fn void main() {
    ulong a;
    io::printn(a);
    ulong b = 1;
    io::printn(b);
    ulong c = a + b;

    do {
        io::printn(c);
        a = b;
        b = c;
        c = a + b;
    } while (c >= b);
    io::printn("Overflowed!");
}
