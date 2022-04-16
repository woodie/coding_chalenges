#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Init with field size and rover location/direction.
# Accept commands to M(ove) and rotate L(eft) and R(ight).
# Ignore commands to move off the field.

drs = ["N", "E", "S", "W"]
cur = ["▲", "▶", "▼", "◀"]


class Field:

    def __init__(self, w, h, x, y, c):
        global drs
        self.w = w
        self.h = h
        self.x = x
        self.y = y
        self.d = drs.index(c)
        self.field = []
        for r in range(0, h):
            self.field.append(["."] * w)
        self.plot()
        print(" %s %s (%s)" % (x, y, drs[self.d]))

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
        print(" %s\n %s %s (%s)" % (cmd, self.x, self.y, drs[self.d]))
        self.show()

    def plot(self):
        global cur
        self.field[self.y][self.x] = cur[self.d]

    def show(self):
        print
        for r in reversed(range(self.h)):
            print(r if r > 9 else " %s" % r),
            for c in self.field[r]:
                print(c),
            print
        print("  "),
        for n in range(0, self.w):
            print(n % 10),
        print


field = Field(5, 5, 1, 1, "N")

field.move("MLMMMMMRMRMMMMMMMRMM")

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
