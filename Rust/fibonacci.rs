fn main() {
    let mut a: u64 = 0;
    println!("{}", a);
    let mut b: u64 = 1;
    println!("{}", b);

    while let Some(c) = a.checked_add(b) {
        println!("{}", c);
        a = std::mem::replace(&mut b, c);
    }
    println!("Overflowed!");
}
