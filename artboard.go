package main

import (
  "bytes"
  "fmt"
  "strconv"
)

const SIZE = 10

func coordinates_naive(img [SIZE][SIZE]int) string {
  var x, y, w, h int
  for r := 0; r < len(img); r++ {
    for c := 0; c < SIZE; c++ {
      if img[r][c] == 1 {
        if x == 0 { x = c }
        if y == 0 { y = r }
        w = c - x + 1
        h = r - y + 1
      }
    }
  }
  return fmt.Sprintf("{ x:%d, y:%d, w:%d, h:%d }", x, y, w, h)
}

func coordinates_smart(img [SIZE][SIZE]int) string {
  var x, y, w, h int
  for r := 0; r < SIZE; r++ {
    if indexOf(img[r], 1) != -1 {
      for c := 0; c < SIZE; c++ {
        if img[r][c] == 1 {
          x = c
          y = r
          w = lastIndexOf(img[r], 1) - x + 1
          for z := y; z < len(img) + 1; z++ {
            if z == len(img) || indexOf(img[z], 1) == -1 {
              h = z - r
              return fmt.Sprintf("{ x:%d, y:%d, w:%d, h:%d }", x, y, w, h)
            }
          }
        }
      }
    }
  }
  return ""
}

func plot_rect_on_board(x int, y int, w int, h int) [SIZE][SIZE]int {
  var board [SIZE][SIZE]int
  for row := 0; row < SIZE; row++ {
    for col := 0; col < SIZE; col++ {
      board[row][col] = 0
      if row >= x + 1 &&
         col >= y - 1 &&
         col <= w + x - 1 &&
         row <= h + y - 1 { board[row][col] = 1 }
    }
  }
  return board
}

func render_entire_artboard(img [SIZE][SIZE]int) {
  var buffer bytes.Buffer
  buffer.WriteString("\n   ")
  for n := 0; n < len(img[0]); n++ {
    buffer.WriteString(" ")
    buffer.WriteString(strconv.Itoa(n % 10))
  }
  buffer.WriteString("\n")
  for r := 0; r < len(img[0]); r++ {
    if r < 100 { buffer.WriteString(" ") }
    if r < 10 { buffer.WriteString(" ") }
    buffer.WriteString(strconv.Itoa(r))
    for c := 0; c < SIZE; c++ {
      if (img[r][c] != 1) {
        buffer.WriteString(" .")
      } else {
        buffer.WriteString(" X")
      }
    }
    buffer.WriteString("\n")
  }
  fmt.Println(buffer.String())
}

func indexOf(data [SIZE]int, element int) (int) {
  for i := 0; i < len(data); i++ {
    if data[i] == element { return i }
  }
  return -1
}

func lastIndexOf(data [SIZE]int, element int) (int) {
  for i := len(data)-1; i >= 0; i-- {
    if data[i] == element { return i }
  }
  return -1
}

func main() {
  var board [SIZE][SIZE]int
  board = plot_rect_on_board(2,3,4,5)
  render_entire_artboard(board)
  fmt.Println(coordinates_naive(board))
  fmt.Println(coordinates_smart(board))
}

/*
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

{ x:2, y:3, w:4, h:5 }
{ x:2, y:3, w:4, h:5 }

*/
