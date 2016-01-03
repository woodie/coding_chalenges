#!/usr/bin/env python

from collections import deque

def simplify_iterative(path):
  stack = []
  grounded = False
  if path[0] == '/':
    stack.append('')
    grounded = True
  dirs = deque(path.split('/'))
  while len(dirs) > 0:
    dir = dirs.popleft()
    if dir == '.' or dir == '':
      pass
    elif dir == '..':
      if (grounded == True):
        stack.pop()
      else:
        stack.append(dir)
    else:
      grounded = True
      stack.append(dir)
  if path[-1] == '/':
    stack.append('')
  return "/".join(stack)

path_1 = '/usr/lib/../bin/gcc'
path_2 = 'sctipts//./../scripts/awkscripts/././'
path_3 = '../../export/workspace/../goodies/'

print simplify_iterative(path_1)
print simplify_iterative(path_2)
print simplify_iterative(path_3)

"""

/usr/bin/gcc
scripts/awkscripts/
../../export/goodies/

"""
