package main

import (
  "fmt"
  "bytes"
)

func main() {
  for i := 1; i < 101; i++ {
    var out bytes.Buffer
    if i % 3 == 0 { out.WriteString("Fizz") }
    if i % 5 == 0 { out.WriteString("Buzz") }
    if out.Len() == 0 {
      fmt.Println(i)
    } else {
      fmt.Println(out.String())
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
