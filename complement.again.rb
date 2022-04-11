#!/usr/bin/env ruby
require "set"
require "json"

# Given an array of integers nums and an integer target,
# return values of the two numbers such that they add up to target.

# You may assume that each input would have exactly one solution,
# and you may not use the same element twice.

def complement(nums, target)
  puts "# Given nums #{nums} and target #{target}"
  complements = Set.new
  nums.each do |num|
    cmp = target - num
    return [cmp, num] if complements.include? cmp
    complements.add num
  end
  []
end

puts complement([2, 7, 11, 15], 9).to_json

# Input: nums = [2,7,11,15], tatget = 9
# Output: [2,7]
