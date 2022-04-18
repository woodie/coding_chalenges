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
	// TODO
	return [][]string{}
}

func plot(self Rover) {
	// TODO
}

func show(self Rover) {
	// TODO
}

func main() {
	w := 5
	h := 5
	rover := Rover{w, h, 1, 1, N, field(w, h)}
	move(rover, "MLMMMMMRMRMMMMMMMRMM")
}

/*
 1 1 (N)
 MLMMMMMRMRMMMMMMMRMM
 4 1 (S)
*/
