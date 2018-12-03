use std::fs::File;
use std::io::prelude::*;

fn main() {
  let mut f = File::open("input.txt").expect("file not found");
  let mut contents = String::new();
  f.read_to_string(&mut contents).expect("something went wrong reading the file");
  let numbers: Vec<i32> = contents.trim().split('\n').map(|s| s.parse().unwrap()).collect();

  println!("{}", numbers.iter().fold(0, |a, &b| a + b));
}
