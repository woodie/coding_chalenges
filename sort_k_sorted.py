#!/usr/bin/env python

from heapq import heappush, heappop

def pq_sort(nums, k):
  out = []
  x = 0
  min_heap = []
  for _ in range(0, k + 1):
    if len(nums) > x:
      heappush(min_heap, nums[x])
      x +=1
  while len(nums) > x:
    heappush(min_heap, nums[x])
    out.append(heappop(min_heap))
    x +=1
  while min_heap:
    out.append(heappop(min_heap))
  return out

# two away from final position
input = [3,-1,2,6,4,5,8,7,9]

print ",".join(map(str, pq_sort(input, 1)))
print ",".join(map(str, sorted(input)))

"""

-1,2,3,4,5,6,7,8,9
-1,2,3,4,5,6,7,8,9

"""
