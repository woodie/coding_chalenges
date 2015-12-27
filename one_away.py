#!/usr/bin/env python

def one_edit_away(s1, s2):
  if len(s1) == len(s2):
    return one_edit_replace(s1, s2)
  elif len(s1) + 1 == len(s2):
    return one_edit_insert(s1, s2)
  elif len(s2) + 1 == len(s1):
    return one_edit_insert(s2, s1)
  else:
    return False

def one_edit_replace(s1, s2):
  found_difference = False
  for i in range(0, len(s1)):
    if s1[i] != s2[i]:
      if found_difference:
        return False
      found_difference = True
  return True

def one_edit_insert(s1, s2):
  x1 = x2 = 0
  while x1 < len(s1) and x2 < len(s2):
    if s1[x1] != s2[x2]:
      if x1 != x2:
        return False
    else:
      x1 += 1
    x2 += 1
  return True

print one_edit_away('pale', 'ple')   # True
print one_edit_away('pale', 'pales') # True
print one_edit_away('pale', 'bale')  # True
print one_edit_away('pale', 'base')  # False
print one_edit_away('pale', 'bae')   # False
print one_edit_away('pale', 'le')    # False
