#!/usr/bin/env python

class BSTnode:
  def __init__(self, value, left=None, right=None):
    self.value = value
    self.left = left
    self.right = right

#           [19]
#          /    \
#       [7]     [43]
#      /  |     |  \
#    [3] [11] [23] [47]
#   /  \    |    \    \
# [2] [5] [17]  [37] [53]
#        /      /  \
#      [13]  [29]  [41]

_13 = BSTnode(13)
_29 = BSTnode(29)
_41 = BSTnode(41)
_02 = BSTnode(2)
_05 = BSTnode(5)
_17 = BSTnode(17, _13)
_37 = BSTnode(37, _29)
_53 = BSTnode(53)
_03 = BSTnode(3,  _02, _05)
_11 = BSTnode(11, None, _17)
_23 = BSTnode(23, None, _37)
_47 = BSTnode(47, None, _53)
_07 = BSTnode(7,  _03, _11)
_43 = BSTnode(43, _23, _47)
_19 = BSTnode(19, _07, _43)

def sorted_recursive(node):
  if node.left:
    sorted_recursive(node.left)
  print("%d:" % node.value),
  if node.right:
    sorted_recursive(node.right)

def sorted_use_stack(node):
  stack = []
  result = ""
  while len(stack) > 0 or node:
    if node:
      stack.append(node)
      node = node.left
    else:
      node = stack.pop()
      result += "%d: " % node.value
      node = node.right
  print result

sorted_use_stack(_19)
sorted_recursive(_19)
print

"""

2: 3: 5: 7: 11: 13: 17: 19: 23: 29: 37: 43: 47: 53:
2: 3: 5: 7: 11: 13: 17: 19: 23: 29: 37: 43: 47: 53:

"""
