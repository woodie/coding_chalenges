// rustc fizzbuzz.rs; ./fizzbuzz

pub fn main() {
  for i in 1..=100 {
    match (i%3, i%5) {
      (0, 0) => println!("FizzBuzz"),
      (0, _) => println!("Fizz"),
      (_, 0) => println!("Buzz"),
      _ => println!("{}", i),
    }
  }
}

/*
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
...
*/
