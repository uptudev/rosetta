let a = 0n;
console.log(a.toString());
let b = 1n;
console.log(b.toString());

while (true) {
    let c = a + b;

    if (c > 18446744073709551615n) {
        console.log("Overflowed!");
        break;
    }

    console.log(c.toString());
    a = b;
    b = c;
}
