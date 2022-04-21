#!/usr/bin/env ruby

# Given ordered lists of band members who enter or exit the studio,
# write a function that returns two collections:
#
# 1. All who didn't use their badge while exiting the room,
#    they recorded an enter without a matching exit.
#
# 2. All who didn't use their badge while entering the room,
#    they recorded an exit without a matching enter. (The room is empty when the log begins)
#
# Each collection should contain no duplicates, regardless of how
# many times a band member matches the criteria for belonging to it.

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
  ["Mic", "exit"]
]
# Expected output: [], []

badge_records_3 = [
  ["Mic", "enter"],
  ["Mic", "enter"],
  ["Mic", "exit"],
  ["Mic", "exit"]
]
# Expected output: ["Mic"], ["Mic"]

badge_records_4 = [
  ["Mic", "enter"],
  ["Mic", "exit"],
  ["Mic", "exit"],
  ["Mic", "enter"]
]
# Expected output: ["Mic"], ["Mic"]

def check_list(records)
  entering = []
  exiting = []
  status = {}
  records.each do |user, action|
    prev = status[user]

    if !exiting.include?(user)
      # EXITING: recorded an enter without a matching exit
      exiting << user if action == "enter" && !(prev == "exit" || prev.nil?)
    end

    if !entering.include?(user)
      # ENTERING: recorded an exit without a matching enter.
      entering << user if action == "exit" && prev != "enter"
    end

    status[user] = action
  end

  # EXITING: recorded an enter without a matching FINAL exit
  status.each_pair do |user, action|
    unless exiting.include?(user)
      exiting << user if action == "enter"
    end
  end
  [exiting, entering]
end

puts check_list(badge_records_1).inspect
puts check_list(badge_records_2).inspect
puts check_list(badge_records_3).inspect
puts check_list(badge_records_4).inspect
