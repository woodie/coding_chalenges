#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Init with field size and location/direction.
# Accept commands to M(ove) and rotate L(eft) and R(ight).
# Ignore commands to move off the field.

DIR = ["N", "E", "S", "W"]
CUR = ["↑", "→", "↓", "←"]


class Rover:

    def __init__(self, w, h, x, y, c):
        self.w = w
        self.h = h
        self.x = x
        self.y = y
        self.d = DIR.index(c)
        self.field = []
        for r in range(h):
            self.field.append(["."] * w)
        self.plot()
        print(" %s %s (%s)" % (x, y, DIR[self.d]))

    def move(self, cmd):
        for c in cmd:
            if c == "M":
                if self.d == 0 and self.y < self.h - 1:  # N
                    self.y += 1
                elif self.d == 1 and self.x < self.w - 1:  # E
                    self.x += 1
                elif self.d == 2 and self.y > 0:  # S
                    self.y -= 1
                elif self.d == 3 and self.x > 0:  # W
                    self.x -= 1
            elif c == "L":
                self.d = 3 if self.d == 0 else self.d - 1
            elif c == "R":
                self.d = 0 if self.d == 3 else self.d + 1
            self.plot()
        print(" %s\n %s %s (%s)" % (cmd, self.x, self.y, DIR[self.d]))
        self.show()

    def plot(self):
        self.field[self.y][self.x] = CUR[self.d]

    def show(self):
        print
        for r in reversed(range(self.h)):
            print(r if r > 9 else " %s" % r),
            for c in self.field[r]:
                print(c),
            print
        print("  "),
        for n in range(self.w):
            print(n % 10),
        print


rover = Rover(5, 5, 1, 1, "N")
rover.move("MLMMMMMRMRMMMMMMMRMM")

"""
 1 1 (N)
 MLMMMMMRMRMMMMMMMRMM
 4 1 (S)

 4 . . . . .
 3 ▶ ▶ ▶ ▶ ▼
 2 ▲ ◀ . . ▼
 1 . ▲ . . ▼
 0 . . . . .
   0 1 2 3 4
"""
