///usr/bin/true; exec /usr/bin/env go run "$0" "$@" ; exit
package main

import (
	"fmt"
	"time"
)

func Fib(n int) int {
	if n <= 2 {
		return n
	}
	return Fib(n-1) + Fib(n-2)
}

func main() {
	start := time.Now()
	Fib(40)
	secs := float64(time.Now().UnixNano()-start.UnixNano()) * 0.000000001
	fmt.Printf("golang... %f seconds\n", secs)
}
