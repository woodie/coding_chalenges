#!/usr/bin/env python

SIZE = 10 # board size

def coordinates_naive(img):
  x = y = w = h = None
  for r, row in enumerate(img):
    for c, pix in enumerate(row):
      if (pix == 1):
        if (x == None):
          x = c 
        if (y == None):
          y = r
        w = c - x + 1
        h = r - y + 1
  return "{x:%d, y:%d, w:%d, h:%d}" % (x, y, w, h)

def coordinates_smart(img):
  for r, row in enumerate(img):
    if (1 not in row):
      continue
    for c, pix in enumerate(row):
      if (pix == 1):
        x = c
        y = r
        w = (len(row) - 1) - row[::-1].index(1) - x + 1
        for z in range(y, len(img) + 1):
          if (z == len(img) or 1 not in img[z]):
            h = z - r
            return "{x:%d, y:%d, w:%d, h:%d}" % (x, y, w, h)
  return None # nothing found

def plot_rect_on_board(x, y, w, h):
  height = (y + h) if (y + h) > SIZE else SIZE
  board = [[]] * height
  for r, row in enumerate(board):
    board[r] = [0] * SIZE
  for one in range(y, y + h):
    for two in range(x, x + w):
      board[one][two] = 1
  return board

def render_entire_artboard(img):
  print ("   "),
  for n in range(len(img[0])):
    print ('' if n > 9 else "%s" % n),
  print ""
  for r, row in enumerate(img):
    print ('   ' if r > 99 else "% 3d" % r),
    for c, pix in enumerate(row):
      print ('.' if pix != 1 else 'X'),
    print ""

board = plot_rect_on_board(2,3,4,5)
print ""
render_entire_artboard(board)
print ""
print coordinates_naive(board)
print coordinates_smart(board)

"""
  0 1 2 3 4 5 6 7 8 9
0 . . . . . . . . . .
1 . . . . . . . . . .
2 . . . . . . . . . .
3 . . X X X X . . . .
4 . . X X X X . . . .
5 . . X X X X . . . .
6 . . X X X X . . . .
7 . . X X X X . . . .
8 . . . . . . . . . .
9 . . . . . . . . . .

{x:2, y:3, w:4, h:5}
{x:2, y:3, w:4, h:5}
"""
