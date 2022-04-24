///usr/bin/true; exec /usr/bin/env go run "$0" "$@" ; exit
package main

import (
	"fmt"
)

/*
Given ordered lists of band members who enter or exit the studio,
write a function that returns two collections:

1. All who didn't use their badge while exiting the room,
   they recorded an enter without a matching exit.

2. All who didn't use their badge while entering the room,
   they recorded an exit without a matching enter. (The room is empty when the log begins)

Each collection should contain no duplicates, regardless of how
many times a band member matches the criteria for belonging to it.
*/

func map_keys[K comparable, V any](m map[K]V) []K {
	out := []K{}
	for s := range m {
		out = append(out, s)
	}
	return out
}

func check_list(records [][]string) [][]string {
	entering := make(map[string]bool)
	exiting := make(map[string]bool)
	status := make(map[string]string)
	for i := 0; i < len(records); i++ {
		user, action := records[i][0], records[i][1]
		prev := status[user]

		// EXITING: recorded an enter without a matching exit
		if action == "enter" && !(prev == "exit" || prev == "") {
			exiting[user] = true
		}

		// ENTERING: recorded an exit without a matching enter.
		if action == "exit" && prev != "enter" {
			entering[user] = true
		}

		status[user] = action
	}

	// EXITING: recorded an enter without a matching FINAL exit
	users := map_keys[string, string](status)
	for i := 0; i < len(users); i++ {
		user := users[i]
		action := status[user]
		if _, ok := exiting[user]; !ok {
			if action == "enter" {
				exiting[user] = true
			}
		}
	}

	return [][]string{map_keys[string, bool](exiting), map_keys[string, bool](entering)}
}

func main() {

	badge_records_1 := [][]string{
		{"Lindsey", "exit"},
		{"Mic", "enter"},
		{"Lindsey", "enter"},
		{"Stevie", "enter"},
		{"Lindsey", "exit"},
		{"Christine", "enter"},
		{"Mic", "enter"},
		{"John", "exit"},
		{"John", "enter"},
		{"Mic", "exit"},
		{"Lindsey", "enter"},
		{"Lindsey", "exit"},
		{"Christine", "exit"},
		{"Mic", "enter"},
		{"Mic", "enter"},
		{"Lindsey", "exit"},
		{"Mic", "enter"},
		{"Mic", "enter"},
		{"Mic", "exit"},
		{"Mic", "exit"},
	}
	// Expected output: ["Mic", "John", "Stevie"], ["Lindsey", "John", "Mic"]

	badge_records_2 := [][]string{
		{"Mic", "enter"},
		{"Mic", "exit"},
	}
	// Expected output: [], []

	badge_records_3 := [][]string{
		{"Mic", "enter"},
		{"Mic", "enter"},
		{"Mic", "exit"},
		{"Mic", "exit"},
	}
	// Expected output: ["Mic"], ["Mic"]

	badge_records_4 := [][]string{
		{"Mic", "enter"},
		{"Mic", "exit"},
		{"Mic", "exit"},
		{"Mic", "enter"},
	}
	// Expected output: ["Mic"], ["Mic"]

	fmt.Println(check_list(badge_records_1))
	fmt.Println(check_list(badge_records_2))
	fmt.Println(check_list(badge_records_3))
	fmt.Println(check_list(badge_records_4))
}
