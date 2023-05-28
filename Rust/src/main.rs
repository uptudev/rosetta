pub fn fibonacci() {
    let mut a: i64 = 0;
    println!("{:?}", a);
    let mut b: i64 = 1;
    println!("{:?}", b);

    while let Some(c) = a.checked_add(b) {
        a = b;
        b = c;
        println!("{:?}", b);
    }
}

fn main() {
    fibonacci();
}
