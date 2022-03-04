package main

import (
	"fmt"
	"strings"
)

func mergeSort(items []int) []int {
	if len(items) <= 1 {
		return items
	} else {
		mid := int(len(items) / 2)
		return merge(mergeSort(items[0:mid]), mergeSort(items[mid:]))
	}
}

func merge(left, right []int) []int {
	result := make([]int, 0, len(left)+len(right))
	for len(left) > 0 && len(right) > 0 {
		if left[0] < right[0] {
			result, left = append(result, left[0]), left[1:]
		} else {
			result, right = append(result, right[0]), right[1:]
		}
	}
	return append(result, append(left, right...)...)
}

func main() {
	data := []int{9, 4, 8, 2, 7, 1, 6, 4, 0, 5, 9, 3, 8, 2, 6, 3, 5, 8, 2, 7, 3, 9, 4, 0, 5}
	fmt.Println("unsorted:", strings.Trim(strings.Join(strings.Split(fmt.Sprint(data), " "), ","), "[]"))
	fmt.Println("sorted:  ", strings.Trim(strings.Join(strings.Split(fmt.Sprint(mergeSort(data)), " "), ","), "[]"))
}

/*
go run merge_sort.go
unsorted: 9,4,8,2,7,1,6,4,0,5,9,3,8,2,6,3,5,8,2,7,3,9,4,0,5
sorted:   0,0,1,2,2,2,3,3,3,4,4,4,5,5,5,6,6,7,7,8,8,8,9,9,9
*/
