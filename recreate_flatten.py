#!/usr/bin/env python

# represent desired output
def strhack(arr):
  hack = str(arr).replace(" [],","").replace("[", "").replace("]", "")
  return [int(x) for x in hack.split(", ")]

def flatten(arr):
  flat = arr[:] # clone it
  i = 0
  while (i < len(flat)):
    if (type(flat[i]) is list):
      flat[i] = flat[i][:] # clone it
      if len(flat[i]) == 0:
        del flat[i]
      else:
        tmp = flat[i]
        flat[i] = tmp.pop(0)
        if len(tmp) >  0:
          flat.insert(i + 1, tmp)
    else:
      i +=1
  return flat

input = [1,2,3,4,[2,34],[],[23,[232,23,[1]]]]

print input
print strhack(input)
print input
print flatten(input)
print input

"""

[1, 2, 3, 4, [2, 34], [], [23, [232, 23, [1]]]]
[1, 2, 3, 4, 2, 34, 23, 232, 23, 1]
[1, 2, 3, 4, [2, 34], [], [23, [232, 23, [1]]]]
[1, 2, 3, 4, 2, 34, 23, 232, 23, 1]
[1, 2, 3, 4, [2, 34], [], [23, [232, 23, [1]]]]

"""
