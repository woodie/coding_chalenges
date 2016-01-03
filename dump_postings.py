#!/usr/bin/env python
# -*- coding: utf-8 -*-

class PostingsListNode:
  def __init__(self, label, nxxt=None, jump=None):
    self.label = label
    self.order = -1
    self.next = nxxt
    self.jump = jump

  @classmethod
  def to_string(self, node):
    memo = "[%s:%d]→ " % (node.label, node.order)
    if node.next:
      memo += self.to_string(node.next)
    else:
      memo += 'x'
    return memo

  @classmethod
  def set_jump_order_recursive(self, node, order=0):
    if node and node.order == -1:
      order +=1
      node.order = order
      self.set_jump_order_recursive(node.jump, order)
      self.set_jump_order_recursive(node.next, order)

  @staticmethod
  def set_jump_order_iterative(head):
    stack = []
    order = 0
    stack.append(head)
    while len(stack) > 0:
      node = stack[-1]
      stack.pop()
      if node and node.order == -1:
        order +=1
        node.order = order
        stack.append(node.next)
        stack.append(node.jump)

#        ↱-------↘
# [a]→ [b]→ [c]→ [d]→ x
#   ↳-------↗ |   ↑↓
#        ↖___↙

def example_list():
  _d = PostingsListNode('d')
  _c = PostingsListNode('c', _d)
  _b = PostingsListNode('b', _c, _d)
  _a = PostingsListNode('a', _b, _c)
  _d.jump = _d
  _c.jump = _b
  return _a

e1 = example_list()
PostingsListNode.set_jump_order_recursive(e1)
print  PostingsListNode.to_string(e1)
e2 = example_list()
PostingsListNode.set_jump_order_iterative(e2)
print  PostingsListNode.to_string(e2)

"""

[a:1]→ [b:3]→ [c:2]→ [d:4]→ x
[a:1]→ [b:3]→ [c:2]→ [d:4]→ x

"""
