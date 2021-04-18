package main

import (
  "fmt"
  "strings"
)

// return the index of first pairs that add up to target
func complementary_pair(target int, data []int) string {
  out := ""
  memo := make(map[int] int)
  for idx := 0; idx < len(data); idx++ {
    num := data[idx]
    com := target - num
    memo[com] = idx
    if alt, ok:= memo[num]; ok {
      if alt == idx { continue }
      array := fmt.Sprintf(strings.Join(strings.Split(fmt.Sprint(data), " "), ", "))
      out = fmt.Sprintf("%d + %d = %d at [%d, %d] of %s", com, num, target, memo[num], idx, array)
      break
    }
  }
  return out
}

func main() {
  fmt.Println(complementary_pair(8, []int{4, 3, 9, 2, 5, 7, 2, 6}))
}

// 3 + 5 = 8 at [1, 4] of [4, 3, 9, 2, 5, 7, 2, 6]
