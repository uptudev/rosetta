let a: bigint = 0n;
console.log(a.toString());
let b: bigint = 1n;
console.log(b.toString());

while (true) {
    let c: bigint = a + b;

    if (c > 18446744073709551615n) {
        console.log("Overflowed!");
        break;
    }

    a = b;
    b = c;
    console.log(c.toString());
}
