#!/usr/bin/env python

def merge_sort(array):
  if len(array) <= 1:
    return array
  else:
    mid = len(array) // 2
    return merge(merge_sort(array[0:mid]), merge_sort(array[mid:]))

def merge(left, right):
  result = []
  while (len(left) > 0 and len(right) > 0):
    result.append(left.pop(0) if (left[0] <= right[0]) else right.pop(0))
  return result + left + right

data = [9,4,8,2,7,1,6,4,0,5,9,3,8,2,6,3,5,8,2,7,3,9,4,0,5]
print "unsorted: %s" % ",".join(map(str, data))
print "sorted:   %s" % ",".join(map(str, merge_sort(data)))

"""
unsorted: 9,4,8,2,7,1,6,4,0,5,9,3,8,2,6,3,5,8,2,7,3,9,4,0,5
sorted:   0,0,1,2,2,2,3,3,3,4,4,4,5,5,5,6,6,7,7,8,8,8,9,9,9
"""
