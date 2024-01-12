use malachite::num::basic::traits::One;
use malachite::num::conversion::traits::ToStringBase;
use malachite::natural::Natural;
use std::{mem::replace, io::stdin};

fn fibonacci(input: usize) {
    let mut a;
    let mut b = Natural::ONE;
    let mut c = Natural::ONE;
    match input {
        0 => {},                        // not valid input here; do nothing and terminate
        1 => {println!("0")},           // these two lines are cheaper than converting to a string...
        2 | 3 => {println!("1")},       // ...as only numbers above 3 require computation as is      
        _ => {
            let mut i = input - 3;      // init counter for a makeshift C-like for loop
            while i > 0 {               // no need for a Rust for loop, as an iterator could create overhead
                a = replace(&mut b, c); // moves all values at once (a <- b <- c)
                c = a + b.clone();      // get new value for `c`
                i -= 1;                 // decrement counter
            }
            println!("{}", c.to_string_base(10));
        },
    }
}

fn main() {
    println!("Which fibonacci number do you wish to calculate?");   
    let mut str = String::new();            // initialize input buffer
    stdin().read_line(&mut str)             // push input to buffer
        .expect("Failed to read input.");
    println!("");

    let n = atoi(str);                      // convert string to usize
    fibonacci(n);                           // calculate nth fibonacci number
}

fn atoi(mut s: String) -> usize {
    s = s.trim_start().to_string();
    if let Some(i) = s.chars().position(|c| !c.is_digit(10)) {
        s.truncate(i);              // truncate to first nondecimal character encountered
    }
    if s.is_empty() {return 0;}     // early return
        
    match s.parse::<usize>() {      // parse and return result (or 0 if an error occured)
        Ok(num) => num,
        Err(_) => 0,
    }
}
