#!/usr/bin/env python

names = 'Adam Brett Cari Donna Ethan Fred Grok Han Izzy Jay'.split()
columns = 3

def tableify(names, columns):
  rows = int(len(names) / columns) + (len(names) % columns > 0)
  result = [[] for _ in range(rows)]

  for i in range(len(names)):
    result[i % rows].append(names[i])
  return result

print str(tableify(names, columns)).replace(', [',",\n [")
 
"""

[["Adam", "Ethan", "Izzy"],
 ["Brett", "Fred", "Jay"],
 ["Cari", "Grok"],
 ["Donna", "Han"]]

"""
