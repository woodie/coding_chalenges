#!/usr/bin/env ruby

# return the index of first pairs that add up to target
def complementary_pair(target, data)
  memo = {}
  data.each_with_index do |num, idx|
    next if num >= target
    com = target - num
    memo[com] = idx
    if memo.key?(num)
      next if memo[num] == idx
      return "#{com} + #{num} = #{target} at [#{memo[num]},#{idx}] of #{data}"
    end
  end
end

puts complementary_pair 8, [4,3,9,2,5,7,2,6]

# 3 + 5 = 8 at [1,4] of [4, 3, 9, 2, 5, 7, 2, 6]
