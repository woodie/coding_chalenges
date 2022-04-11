#!/usr/bin/env python

# Given an array of integers nums and an integer target,
# return values of the two numbers such that they add up to target.

# You may assume that each input would have exactly one solution,
# and you may not use the same element twice.

def complement(nums, target):
  print "# Given nums #{nums} and target #{target}"
  complements = set()
  for num in nums:
    cmp = target - num
    if cmp in complements:
      return [cmp, num]
    complements.add(num)
  return []

print complement([2,7,11,15], 9)

# Input: nums = [2,7,11,15], tatget = 9
# Output: [2,7]
