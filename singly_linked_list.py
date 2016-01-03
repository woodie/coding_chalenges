#!/usr/bin/env python
# -*- coding: utf-8 -*-

class ListNode:
  def __init__(self, value, nxxt=None):
    self.value = value
    self.next = nxxt

class NodeList:
  def __init__(self, head):
    self.head = head

  # [a]→ [b]→ [c]→ [d]→ [e]→ x
  @staticmethod
  def generate(start='a', finish='e'):
    this_node = None
    for n in range(ord(finish), ord(start) - 1, -1):
      this_node = ListNode(chr(n), this_node)
    return NodeList(this_node)

  # [a]→ [b]→ [c]→ [d]→ [e]→ [c]→ ...
  def loop_back(self, value='c'):
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

  def join(self, other, offset=0):
    if self.has_cycle():
      return False
    last = self.head
    while last.next:
      last = last.next
    for _ in range(offset):
      other.head = other.head.next
    last.next = other.head
    return True

  def palindromal(self):
    slow = self.head
    fast = self.head
    if slow.next == None or slow.next == slow:
      return True
    count = 0
    while fast and fast.next and fast.next.next:
      slow = slow.next
      fast = fast.next.next
      count +=1
      if slow == fast: # cycles
        return False
      if fast.next: # correct for even number
        count +=1
    while slow.next:
      count -=1
      fast = self.head
      for _ in range(count):
        fast = fast.next
      slow = slow.next
      if fast.value != slow.value:
        return False
    return True

deep = NodeList.generate('a', 'j')
print deep.to_string()
deep.reverse()
print deep.to_string()
last = NodeList.generate()
one = last.reversed()
two = last.reversed()
bad = last.reversed()
one.join(last)
two.join(last, 1)
bad.join(last, 2)
print one.to_string()
print "palindromal: %s" % one.palindromal()
print two.to_string()
print "palindromal: %s" % two.palindromal()
print bad.to_string()
print "palindromal: %s" % bad.palindromal()
bad.loop_back()
print bad.to_string()
print "palindromal: %s" % bad.palindromal()

"""

[a]→ [b]→ [c]→ [d]→ [e]→ [f]→ [g]→ [h]→ [i]→ [j]→ x
[j]→ [i]→ [h]→ [g]→ [f]→ [e]→ [d]→ [c]→ [b]→ [a]→ x
[e]→ [d]→ [c]→ [b]→ [a]→ [a]→ [b]→ [c]→ [d]→ [e]→ x
palindromal: False
[e]→ [d]→ [c]→ [b]→ [a]→ [b]→ [c]→ [d]→ [e]→ x
palindromal: False
[e]→ [d]→ [c]→ [b]→ [a]→ [d]→ [e]→ x
palindromal: False
[e]→ [d]→ [c]→ [b]→ [a]→ [d]→ [e]→ [c]→ ...
palindromal: False

"""
