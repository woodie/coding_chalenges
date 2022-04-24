///usr/bin/true; exec /usr/bin/env go run "$0" "$@" ; exit
package main

import (
	"fmt"
)

func rotate(nums []int, k int) {
	k = k % len(nums)
	temp := append(nums[k:], nums[0:k]...)
	copy(nums, temp)
}

func find_max(a []int) int {
	if a[0] <= a[len(a)-1] {
		return a[len(a)-1]
	}
	pivot := len(a) / 2
	if a[pivot] > a[len(a)-1] {
		return find_max(a[pivot : len(a)-1])
	} else {
		return find_max(a[0 : pivot-1])
	}
}

func main() {
	data := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
	rotate(data, 3)
	fmt.Println("input:", data)
	fmt.Println("max:", find_max(data))
}

/*
input: [4 5 6 7 8 9 10 11 12 13 14 15 16 17 1 2 3]
max: 17
*/
