package main

import (
	"fmt"
	"strings"
)

// return the index of first pairs that add up to target
func complementary_pair(target int, data []int) string {
	memo := make(map[int]int)
	for idx := 0; idx < len(data); idx++ {
		num := data[idx]
		com := target - num
		memo[com] = idx
		if alt, ok := memo[num]; ok {
			if alt == idx {
				continue
			}
			return fmt.Sprintf("%d + %d = %d at [%d, %d] of %s", com, num, target, memo[num], idx, strings.Replace(fmt.Sprint(data), " ", ", ", -1))
		}
	}
	return ""
}

func main() {
	fmt.Println(complementary_pair(8, []int{4, 3, 9, 2, 5, 7, 2, 6}))
}

// 3 + 5 = 8 at [1, 4] of [4, 3, 9, 2, 5, 7, 2, 6]
