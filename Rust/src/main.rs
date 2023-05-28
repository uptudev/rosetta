pub fn q_rsqrt(i: f64) -> f64 {
    let i_bits: u64 = i.to_bits();
    let i_bits: u64 = 0x5fe6a09e667f3bc8 - (i_bits >> 1);
    let out: f64 = f64::from_bits(i_bits);

    let out: f64 = out * (1.5 - 0.5 * i * out * out); // 1st iteration
    let out: f64 = out * (1.5 - 0.5 * i * out * out); // 2nd iteration, optional
    let out: f64 = out * (1.5 - 0.5 * i * out * out); // 3rd iteration, optional

    return out;
}

fn main() {
    println!("{:?}", q_rsqrt(f64::from_bits(0x69420abcdef69420)));
    println!("{:?}", q_rsqrt(0.5));
}
