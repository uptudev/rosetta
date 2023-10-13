let a = 0n;
console.log(a.toString());
let b = 1n;
console.log(b.toString());
let c = a + b;

do {
    console.log(c.toString());
    a = b;
    b = c;
    c = a + b;
} while (c <= 18446744073709551615);

console.log("Overflowed!");
