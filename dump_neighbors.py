#!/usr/bin/env python
# -*- coding: utf-8 -*-

class NeighborNode():
  def __init__(self, label, neighbors=[]):
    self.label = label
    self.neighbors = neighbors

  #  1-2-3    (1,0)→ []          • return any suitable datatype
  #   \| |    (1,1)→ [2,4]       • order doesn't matter
  #    4-5-6  (1,2)→ [1,2,3,4,5] • results should be unique

  @staticmethod
  def get_neighborhood(node, depth=0):
    neighborhood = {}
    queue = node.neighbors
    for _ in range(depth):
      for z in queue:
        neighborhood[z.label] = z
      queue = []
      for k in neighborhood:
        for z in neighborhood[k].neighbors:
          if z.label not in neighborhood:
            queue.append(z)
    return neighborhood.values()

  def print_neighborhood(self, depth):
    neighbors = NeighborNode.get_neighborhood(self, depth)
    print "%s,%s → [%s]" % (self.label, depth, ', '.join(str(x.label) for x in neighbors))
    pass

  @staticmethod
  def print_nodelist(nodes):
    for n in nodes:
      print "%s → [%s]" % (n.label, ', '.join(str(x.label) for x in n.neighbors))

# 1-2-3
#  \| |
#   4-5-6
nodes = [None] * 7
for i in range(7):
  nodes[i] = NeighborNode(i)
nodes[1].neighbors = [nodes[2], nodes[4]]
nodes[2].neighbors = [nodes[1], nodes[3], nodes[4]]
nodes[3].neighbors = [nodes[2], nodes[4], nodes[5]]
nodes[4].neighbors = [nodes[1], nodes[2], nodes[5]]
nodes[5].neighbors = [nodes[3], nodes[4], nodes[6]]
#NeighborNode.print_nodelist(nodes)

nodes[1].print_neighborhood(0)
nodes[1].print_neighborhood(1)
nodes[1].print_neighborhood(2)

"""

1,0 → []
1,1 → [2, 4]
1,2 → [1, 2, 3, 4, 5]

"""
