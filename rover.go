///usr/bin/true; exec /usr/bin/env go run "$0" "$@" ; exit
package main

// Init with field size and rover location/direction.
// Accept commands to M(ove) and rotate L(eft) and R(ight).
// Ignore commands to move off the field.

import (
	"fmt"
)

const (
	N int = 0
	E int = 1
	S int = 2
	W int = 3
)

var DIR = [4]string{"N", "E", "S", "W"}
var CUR = [4]string{"▲", "▶", "▼", "◀"}

type Rover struct {
	w int
	h int
	x int
	y int
	d int
	f [][]string
}

func move(self Rover, cmd string) {
	fmt.Println(fmt.Sprintf(" %d %d (%s)", self.x, self.y, DIR[self.d]))
	for i := 0; i < len(cmd); i++ {
		c := string(cmd[i])
		if c == "M" {
			if self.d == 0 && self.y < self.h-1 { // N
				self.y += 1
			} else if self.d == 1 && self.x < self.w-1 { // E
				self.x += 1
			} else if self.d == 2 && self.y > 0 { // S
				self.y -= 1
			} else if self.d == 3 && self.x > 0 { // W
				self.x -= 1
			}
		} else if c == "L" {
			if self.d == 0 {
				self.d = 3
			} else {
				self.d = self.d - 1
			}
		} else if c == "R" {
			if self.d == 3 {
				self.d = 0
			} else {
				self.d = self.d + 1
			}
		}
		plot(self)
	}
	fmt.Println(fmt.Sprintf(" %s", cmd))
	fmt.Println(fmt.Sprintf(" %d %d (%s)", self.x, self.y, DIR[self.d]))
	show(self)
}

func field(w int, h int) [][]string {
	matrix := make([][]string, h)
	rows := make([]string, h*w)
	for i := 0; i < h; i++ {
		matrix[i] = rows[i*w : (i+1)*w]
		for j := 0; j < w; j++ {
			matrix[i][j] = "."
		}
	}
	return matrix
}

func plot(self Rover) {
	self.f[self.y][self.x] = CUR[self.d]
}

func show(self Rover) {
	fmt.Println()
	for i := self.h - 1; i > -1; i-- {
		if i < 10 {
			fmt.Printf(" ")
		}
		fmt.Printf("%d", i)
		for j := 0; j < self.w; j++ {
			fmt.Printf(" %s", self.f[i][j])
		}
		fmt.Println()
	}
	fmt.Printf("  ")
	for n := 0; n < self.w; n++ {
		fmt.Printf(" %d", n%10)
	}
	fmt.Println()
}

func main() {
	w := 5
	h := 5
	rover := Rover{w, h, 1, 1, N, field(w, h)}
	plot(rover)
	move(rover, "MLMMMMMRMRMMMMMMMRMM")
}

/*
 1 1 (N)
 MLMMMMMRMRMMMMMMMRMM
 4 1 (S)

 4 . . . . .
 3 ▶ ▶ ▶ ▶ ▼
 2 ▲ ◀ . . ▼
 1 . ▲ . . ▼
 0 . . . . .
   0 1 2 3 4
*/
