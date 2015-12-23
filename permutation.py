#!/usr/bin/env python

# when sorting is too expensive or not allowed
s1 = "dkfoekfhcms_Figjekcjvnskwhfjjdje_"
s2 = "diwjrhfkehdjfjsodhfjdkdhfjfnskwjf"
s3 = "Figjekcjvnskwhfjjdje_dkfoekfhcms_"

def is_permutation(str1, str2):
  if len(str1) != len(str2):
    return False
  letters = [0] * 128
  for c in str1:
    letters[ord(c)] += 1
  for c in str2:
    letters[ord(c)] -= 1
    if letters[ord(c)] < 0:
      return False
  return True

print
print "\n".join([s1, s2, s3])
print "is permutation: %s" % is_permutation(s1, s2)
print "is permutation: %s" % is_permutation(s1, s3)

"""

dkfoekfhcms_Figjekcjvnskwhfjjdje_
diwjrhfkehdjfjsodhfjdkdhfjfnskwjf
Figjekcjvnskwhfjjdje_dkfoekfhcms_
is permutation: False
is permutation: True

"""
