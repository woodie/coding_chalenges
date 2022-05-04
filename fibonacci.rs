//usr/bin/env rustc $0 -o a.out && ./a.out && rm ./a.out ; exit
use std::time::Instant;

fn fibonacci(n: u32) -> u32 {
  match n {
    0 | 1 | 2 => 1,
    _ => fibonacci(n - 1) + fibonacci(n - 2),
  }
}

fn main() {
  let start = Instant::now();
  fibonacci(40);
  let elapsed = start.elapsed().as_millis() as f64;
  println!("rust..... {:.6} seconds", 0.001 * elapsed);
}
