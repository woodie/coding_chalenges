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

func map_set_strings(string_map map[string]bool) []string {
	out := []string{}
	for k := range string_map {
		out = append(out, k)
	}
	return out
}

/********************************
 * Compiles but not working yet *
 * - The map(set) is a mess     *
 * - Try input in JSON format   *
 ********* **********************/

func check_list(records [][]string) [][]string {
	entering := make(map[string]bool)
	exiting := make(map[string]bool)
	status := make(map[string]string)
	for i := 0; i < len(records); i++ {
		user, action := records[i][0], records[i][1]
		prev := status[user]

		if _, ok := exiting[user]; !ok {
			// EXITING: recorded an enter without a matching exit
			if action == "enter" && !(prev == "exit" || prev == "") {
				exiting[user] = true
			}
		}

		if _, ok := entering[user]; !ok {
			// ENTERING: recorded an exit without a matching enter.
			if action == "exit" && prev != "enter" {
				entering[user] = true
			}
		}

		status[user] = action
	}

	// EXITING: recorded an enter without a matching FINAL exit
	users := []string{}
	for k := range status {
		users = append(users, k)
	}
	for i := 0; i < len(status); i++ {
		user := users[i]
		action := status[user]
		if _, ok := exiting[user]; !ok {
			if action == "enter" {
				exiting[user] = true
			}
		}
	}

	return [][]string{map_set_strings(exiting), map_set_strings(entering)}
}

func main() {

	badge_records_1 := [][]string{
		[]string{"Lindsey", "exit"},
		[]string{"Mic", "enter"},
		[]string{"Lindsey", "enter"},
		[]string{"Stevie", "enter"},
		[]string{"Lindsey", "exit"},
		[]string{"Christine", "enter"},
		[]string{"Mic", "enter"},
		[]string{"John", "exit"},
		[]string{"John", "enter"},
		[]string{"Mic", "exit"},
		[]string{"Lindsey", "enter"},
		[]string{"Lindsey", "exit"},
		[]string{"Christine", "exit"},
		[]string{"Mic", "enter"},
		[]string{"Mic", "enter"},
		[]string{"Lindsey", "exit"},
		[]string{"Mic", "enter"},
		[]string{"Mic", "enter"},
		[]string{"Mic", "exit"},
		[]string{"Mic", "exit"},
	}
	// Expected output: ["Mic", "John", "Stevie"], ["Lindsey", "John", "Mic"]

	badge_records_2 := [][]string{
		[]string{"Mic", "enter"},
		[]string{"Mic", "exit"},
	}
	// Expected output: [], []

	badge_records_3 := [][]string{
		[]string{"Mic", "enter"},
		[]string{"Mic", "enter"},
		[]string{"Mic", "exit"},
		[]string{"Mic", "exit"},
	}
	// Expected output: ["Mic"], ["Mic"]

	badge_records_4 := [][]string{
		[]string{"Mic", "enter"},
		[]string{"Mic", "exit"},
		[]string{"Mic", "exit"},
		[]string{"Mic", "enter"},
	}
	// Expected output: ["Mic"], ["Mic"]

	fmt.Println(badge_records_1)
	fmt.Println(badge_records_2)
	fmt.Println(badge_records_3)
	fmt.Println(badge_records_4)
}
