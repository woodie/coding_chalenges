#!/usr/bin/env python3

"""
Given ordered lists of band members who enter or exit the studio,
write a function that returns two collections:

1. All who didn't use their badge while exiting the room,
   they recorded an enter without a matching exit.

2. All who didn't use their badge while entering the room,
   they recorded an exit without a matching enter. (The room is empty when the log begins)

Each collection should contain no duplicates, regardless of how
many times a band member matches the criteria for belonging to it.
"""

badge_records_1 = [
    ["Lindsey", "exit"],
    ["Mic", "enter"],
    ["Lindsey", "enter"],
    ["Stevie", "enter"],
    ["Lindsey", "exit"],
    ["Christine", "enter"],
    ["Mic", "enter"],
    ["John", "exit"],
    ["John", "enter"],
    ["Mic", "exit"],
    ["Lindsey", "enter"],
    ["Lindsey", "exit"],
    ["Christine", "exit"],
    ["Mic", "enter"],
    ["Mic", "enter"],
    ["Lindsey", "exit"],
    ["Mic", "enter"],
    ["Mic", "enter"],
    ["Mic", "exit"],
    ["Mic", "exit"]
]
# Expected output: ["Mic", "John", "Stevie"], ["Lindsey", "John", "Mic"]

badge_records_2 = [
    ["Mic", "enter"],
    ["Mic", "exit"],
]
# Expected output: [], []

badge_records_3 = [
    ["Mic", "enter"],
    ["Mic", "enter"],
    ["Mic", "exit"],
    ["Mic", "exit"],
]
# Expected output: ["Mic"], ["Mic"]

badge_records_4 = [
    ["Mic", "enter"],
    ["Mic", "exit"],
    ["Mic", "exit"],
    ["Mic", "enter"],
]
# Expected output: ["Mic"], ["Mic"]


def check_list(records):
    entering = []
    exiting = []
    status = {}
    for row in records:
        user, action = row
        prev = status[user] if (user in status) else None

        if user not in exiting:
            # EXITING: recorded an enter without a matching exit
            if action == "enter" and not (prev == "exit" or prev is None):
                exiting.append(user)

        if user not in entering:
            # ENTERING: recorded an exit without a matching enter.
            if action == "exit" and prev != "enter":
                entering.append(user)

        status[user] = action

    # EXITING: recorded an enter without a matching FINAL exit
    for user in status:
        action = status[user]
        if user not in exiting:
            if action == "enter":
                exiting.append(user)
    return [exiting, entering]


print(check_list(badge_records_1))
print(check_list(badge_records_2))
print(check_list(badge_records_3))
print(check_list(badge_records_4))
