///usr/bin/true; exec /usr/bin/env go run "$0" "$@" ; exit
package main

// Init with field size and rover location/direction.
// Accept commands to M(ove) and rotate L(eft) and R(ight).
// Ignore commands to move off the field.

import (
	"fmt"
	"strings"
)

var DIR = [4]string{"N", "E", "S", "W"}
var CUR = [4]string{"↑", "→", "↓", "←"}

type Rover struct {
	w int
	h int
	x int
	y int
	d int
	f [][]string
}

func NewRover(w, h, x, y int, s string) *Rover {
	field := make([][]string, h)
	rows := make([]string, h*w)
	for i := 0; i < h; i++ {
		field[i] = rows[i*w : (i+1)*w]
		for j := 0; j < w; j++ {
			field[i][j] = "."
		}
	}
	d := strings.Index(strings.Join(DIR[:], ""), s)
	rover := Rover{w, h, x, y, d, field}
	plot(rover)
	fmt.Println(fmt.Sprintf(" %d %d (%s)", rover.x, rover.y, DIR[rover.d]))
	return &rover
}

func move(self Rover, cmd string) {
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
	fmt.Println(fmt.Sprintf(" %s\n %d %d (%s)", cmd, self.x, self.y, DIR[self.d]))
	show(self)
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
	var rover Rover = *NewRover(5, 5, 1, 1, "N")
	move(rover, "MLMMMMMRMRMMMMMMMRMM")
}

/*
 1 1 (N)
 MLMMMMMRMRMMMMMMMRMM
 4 1 (S)

 4 . . . . .
 3 → → → → ↓
 2 ↑ ← . . ↓
 1 . ↑ . . ↓
 0 . . . . .
   0 1 2 3 4
*/
