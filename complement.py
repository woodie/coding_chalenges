#!/usr/bin/env python

# return the index of first pairs that add up to target
def complementary_pair(target, data):
  memo = {}
  for idx, num in enumerate(data):
    if num >= target: continue
    com = target - num
    memo[com] = idx
    if num in memo:
      if memo[num] == idx: continue
      return "%s + %s = %s at [%s,%s] of %s" % (com, num, target, memo[num], idx, data)

print(complementary_pair(8, [4,3,9,2,5,7,2,6]))

# 3 + 5 = 8 at [1,4] of [4, 3, 9, 2, 5, 7, 2, 6]
