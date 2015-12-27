#!/usr/bin/env python
# -*- coding: utf-8 -*-

class ListNode:
  def __init__(self, value, next_node=None):
    self.value = value
    self.next = next_node

class NodeList:
  def __init__(self, head):
    self.head = head

  # [a]→ [b]→ [c]→ [d]→ [e]→ [f]→ [g]→ [h]→ [i]→ [j]
  @staticmethod
  def generate(start='a', finish='j'):
    this_node = None
    for n in range(ord(finish), ord(start) - 1, -1):
      this_node = ListNode(chr(n), this_node)
    return NodeList(this_node)

  # [a]→ [b]→ [c]→ [d]→ [e]→ [f]→ [g]→ [h]→ [i]→ [j]
  # !!! WARNING !!!            ↖_________________/
  def loop_back(self, value='f'):
    target = None
    cursor = self.head
    while cursor.next:
      if cursor.value == value:
        target = cursor
      if target and cursor.next.next == None:
        cursor.next.next = target
        return
      cursor = cursor.next

  def has_cycle(self):
    slow = self.head
    fast = self.head
    while fast and fast.next and fast.next.next:
      slow = slow.next
      fast = fast.next.next
      if slow == fast:
        slow = self.head
        while slow != fast:
          slow = slow.next
          fast = fast.next
        return slow.value
    return None

  def to_string(self):
    dupe = self.has_cycle()
    seen = False
    memo = ''
    pointer = self.head
    while pointer.next:
      memo = "%s[%s]→ " % (memo, pointer.value)
      pointer = pointer.next
      if dupe and pointer.value == dupe:
        if seen:
          return "%s[%s]→ ..." % (memo, dupe)
        seen = True
    return "%s[%s]→ x" % (memo, pointer.value)

  def reverse(self):
    tail = self.head
    while tail.next:
      temp = tail.next
      tail.next = temp.next
      temp.next = self.head
      self.head = temp

  def reversed(self):
    head = None
    cursor = self.head
    while cursor:
      node = ListNode(cursor.value)
      node.next = head
      head = node
      cursor = cursor.next
    return NodeList(head)

  def clone(self):
    import copy
    return copy.deepcopy(self)

some = NodeList.generate()
print some.to_string()
some.reverse()
print some.to_string()
last = some.reversed()
print last.to_string()
some.loop_back()
print some.to_string()

"""

[a]→ [b]→ [c]→ [d]→ [e]→ [f]→ [g]→ [h]→ [i]→ [j]→ x
[j]→ [i]→ [h]→ [g]→ [f]→ [e]→ [d]→ [c]→ [b]→ [a]→ x
[a]→ [b]→ [c]→ [d]→ [e]→ [f]→ [g]→ [h]→ [i]→ [j]→ x
[j]→ [i]→ [h]→ [g]→ [f]→ [e]→ [d]→ [c]→ [b]→ [a]→ [f]→ ...

"""
