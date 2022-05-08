///usr/bin/true; exec /usr/bin/env go run "$0" "$@" ; exit
package main

import (
	"encoding/json"
	"fmt"
	"sort"
)

// Write a function which returns the maximum number
// of concurrent users logged in at the same time.

type Entry struct {
	UserId     int
	LoginTime  int
	LogoutTime int
}

func maximum_number_users(users []Entry) int {
	times := []int{} // should be a tree
	max := 0
	for _, node := range users {
		times = append(times, node.LogoutTime)
		for i, x := range times {
			if x < node.LoginTime {
				times = append(times[:i], times[i+1:]...)
			}
		}
		if len(times) > max {
			max = len(times)
		}
	}
	return max
}

func main() {

	data := `[
  {"userId": 1, "loginTime": 2, "logoutTime": 5},
  {"userId": 2, "loginTime": 3, "logoutTime": 7},
  {"userId": 3, "loginTime": 3, "logoutTime": 5},
  {"userId": 4, "loginTime": 1, "logoutTime": 10},
  {"userId": 5, "loginTime": 15, "logoutTime": 15},
  {"userId": 6, "loginTime": 14, "logoutTime": 16}
]`

	var entries []Entry
	json.Unmarshal([]byte(data), &entries)
	sort.SliceStable(entries, func(i, j int) bool {
		return entries[i].LoginTime < entries[j].LoginTime
	})

	fmt.Println(maximum_number_users(entries))
}
