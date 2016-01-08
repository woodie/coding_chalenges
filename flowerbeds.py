#!/usr/bin/env python

# Given the following array of flower plots, determine where a new flower can be planted.
# Every 1 represents a flower, every 0 represents a plot, flowers can ONLY be planted when there
# isn't one in the adjacent plot. In the following example indexes 2 and 6 can be planted.

class FlowerPlanter:
  def __init__(self, plots):
    self.plots = plots
  def plant(self):
    tot = len(self.plots)
    for i in range(tot):
      if (self.plots[i] == 0 and
          (i == 0 or self.plots[i - 1] != 1) and
          (i == tot - 1 or self.plots[i + 1] != 1)):
        self.plots[i] = 1
    print ','.join(str(x) for x in self.plots)

flowers = [1, 0, 0, 0, 1, 0, 0, 0]
print ','.join(str(x) for x in flowers)
flowerBed = FlowerPlanter(flowers)
flowerBed.plant() # [1, 0, 1, 0, 1, 0, 1, 0]

nine = [0, 0, 0, 0, 0, 0, 0, 0, 0]
print ','.join(str(x) for x in nine)
emptyBed = FlowerPlanter(nine)
emptyBed.plant() # [1, 0, 1, 0, 1, 0, 1, 0, 1]


# Given these two arrays, reorganize them in this explicit format.
# Pay attention to the way this array is being sorted, and the
# movement of the pointer from front to back.

one_arr = ["a","b","c","d","e","f"] # ["f","a","e","b","d","c"]
two_arr = [1, 2, 3, 4, 5, 6, 7]     # [7, 1, 6, 2, 5, 3 ]

def re_org(arr):
  out = []
  pivot = len(arr) / 2
  for i in range(pivot):
    out.append(arr[len(arr) - (i + 1)])
    out.append(arr[i])
  if len(arr) % 2 != 0:
    out.append(arr[pivot])
  print ','.join(str(x) for x in out)

print ','.join(str(x) for x in one_arr)
re_org(one_arr)
print ','.join(str(x) for x in two_arr)
re_org(two_arr)

"""

1,0,0,0,1,0,0,0
1,0,1,0,1,0,1,0
0,0,0,0,0,0,0,0,0
1,0,1,0,1,0,1,0,1
a,b,c,d,e,f
f,a,e,b,d,c
1,2,3,4,5,6,7
7,1,6,2,5,3,4

"""
