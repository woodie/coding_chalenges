///usr/bin/true; exec /usr/bin/env go run "$0" "$@" ; exit
package main

import (
	"fmt"
)

// Given an array of integers nums and an integer target,
// return values of the two numbers such that they add up to target.

// You may assume that each input would have exactly one solution,
// and you may not use the same element twice.

func complement(nums []int, target int) []int {
	println(fmt.Sprintf("# Given nums %d and target %d", nums, target))
	complements := make(map[int]bool)

	for idx := 0; idx < len(nums); idx++ {
		num := nums[idx]
		cmp := target - num
		if (complements[cmp]) {
			return []int{cmp, num}
		}
		complements[num] = true
	}
	return []int{}
}

func main() {
	fmt.Println(complement([]int{2, 7, 11, 15}, 9))
}

// Input: nums = [2,7,11,15], tatget = 9
// Output: [2,7]
