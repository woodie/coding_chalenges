#!/usr/bin/env python

class Node:
  def __init__(self, value, children=[]):
    self.value = value
    self.children = children if (type(children) is list) else [children]

class Tree:
  def __init__(self, root):
    self.root = root

  def to_s(self):
    return Tree.to_string(self.root)

  def print_out(self):
    Tree.print_tree(self.root)

  @staticmethod
  def to_string(node):
    if 'memo' not in vars():
      memo = ''
    memo += node.value + ": "
    for sub in node.children:
      memo += Tree.to_string(sub)
    return memo

  @staticmethod
  def print_tree(node):
    print (node.value + ":"),
    for sub in node.children:
      Tree.print_tree(sub)

#        "ab"
#        /  \
#      "ef"  "gh"
#     / | \    \
#  "x" "y" "z"  "p"

root = Node("ab", [
    Node("ef", [Node("x"),
    Node("y"), Node("z")]),
    Node("gh", Node("p"))])

Tree.print_tree(root)
print
print Tree.to_string(root)
tree = Tree(root)
tree.print_out()
print
print tree.to_s()

"""

ab: ef: x: y: z: gh: p:
ab: ef: x: y: z: gh: p:
ab: ef: x: y: z: gh: p:
ab: ef: x: y: z: gh: p:

"""
