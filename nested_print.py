#!/usr/bin/env python

def get_nodes(items):
  mash = {}
  for elem in items:
    if elem['parent_id'] not in mash:
      mash[elem['parent_id']] = []
    mash[elem['parent_id']].append(elem)
  return mash

def nice_print(mash, items=None, level=0):
  items = items if (items != None) else mash[0]
  for elem in items:
    print('  ' * level) + elem['value']
    children = mash[elem['id']] if (elem['id'] in mash) else []
    nice_print(mash, children, level + 1)

arr = []
pid = [0,0,0,0,1,1,1,2,2,2,3,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10]
for i in range(1, len(pid)):
  arr.append({'parent_id': pid[i], 'id': i, 'value': chr(i + 64)})

nice_print(get_nodes(arr))


"""

A
  D
    M
    N
  E
    O
    P
  F
    Q
    R
B
  G
    S
    T
  H
    U
    V
  I
    W
    X
C
  J
    Y
    Z
  K
  L

"""
