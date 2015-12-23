#!/usr/bin/env python

import collections

d = collections.deque(range(1,18))
d.rotate(-3)
data = list(d)

def find_max(a):
  if a[0] <= a[-1]:
    return a[-1]
  pivot = len(a) / 2
  if a[pivot] > a[-1]:
    return find_max(a[pivot:])
  else:
    return find_max(a[:pivot])

print "input: %s" % ','.join(str(x) for x in data)
print "max: %d" % find_max(data)

"""

input: 4,5,6,7,8,9,10,11,12,13,14,15,16,17,1,2,3
max: 17

"""
