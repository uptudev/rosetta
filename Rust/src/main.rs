use malachite::num::basic::traits::One;
use malachite::num::conversion::traits::ToStringBase;
use malachite::natural::Natural;
use std::{mem::replace, io::stdin};

fn fibonacci(input: usize) {
    let mut a;
    let mut b = Natural::ONE;
    let mut c = Natural::ONE;
    match input {
        0 => {}
        1 => {println!("0")},
        2 | 3 => {println!("1")},
        _ => {
            for _ in 0..(input-3) {
                a = replace(&mut b, c);
                c = a + b.clone();
            }
            println!("{}", c.to_string_base(10));
        },
    }
}

fn main() {
    println!("Which fibonacci number do you wish to calculate?");
    let mut str = String::new();
    stdin().read_line(&mut str)
        .expect("Failed to read input.");
    let num = atoi(str);

    println!("");
    fibonacci(num);
}

fn atoi(s: String) -> usize {
    let mut s = s.trim_start().to_string();
    if s.is_empty() {return 0;}

    // check if first character is a digit
    if let Some(c) = s.chars().next() {
        if !c.is_digit(10) {
            return 0;
        }
    } else {
        return 0;
    }

    let mut i = 0;
    
    while i < s.len() {
        if !s.chars().nth(i).unwrap().is_digit(10) {
            s.truncate(i);
            break;
        }
        i += 1;
    } 
    parse_string_to_usize(&s)
}

fn parse_string_to_usize(s: &str) -> usize {
    match s.parse::<usize>() {
        Ok(num) => {
            num
        },
        Err(_) => {
            usize::MIN
        }
    }
}
