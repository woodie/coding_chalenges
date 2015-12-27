#!/usr/bin/env ruby

class ListNode
  attr_accessor :value, :next

  def initialize(value, next_node=nil)
    self.value = value
    self.next = next_node
  end
end

class NodeList
  attr_accessor :head

  def initialize(head)
    self.head = head
  end

  # [a]→ [b]→ [c]→ [d]→ [e]→ [f]→ [g]→ [h]→ [i]→ [j]
  def self.generate(start=:a, finish=:j)
    this_node = nil
      (start..finish).to_a.reverse.each do |i|
      this_node = ListNode.new i, this_node
    end
    new this_node
  end

  # [a]→ [b]→ [c]→ [d]→ [e]→ [f]→ [g]→ [h]→ [i]→ [j]
  # !!! WARNING !!!            ↖_________________/
  def loop_back!(value=:f)
    target = nil
    cursor = self.head
    while cursor.next
      target = cursor if cursor.value == value
      if target and cursor.next.next.nil?
        cursor.next.next = target
        return
      end
      cursor = cursor.next
    end
  end

  def has_cycle?
    slow = self.head
    fast = self.head
    while fast and fast.next and fast.next.next
      slow = slow.next
      fast = fast.next.next
      if slow == fast
        slow = self.head
        while slow != fast
          slow = slow.next
          fast = fast.next
        end
        return slow.value
      end
    end
    nil
  end

  def to_string
    dupe = has_cycle?
    seen = false
    memo = ''
    pointer = head
    while pointer.next
      memo += "[#{pointer.value}]→ "
      pointer = pointer.next
      if dupe and pointer.value == dupe
        return memo += "[#{dupe}]→ ..." if seen
        seen = true
      end
    end
    memo += "[#{pointer.value}]→ x"
  end

  def reverse!
    tail = self.head
    while tail.next
      temp = tail.next
      tail.next = temp.next
      temp.next = self.head
      self.head = temp
    end
  end

  def reversed
    head = nil
    cursor = self.head
    while cursor
      node = ListNode.new(cursor.value)
      node.next = head
      head = node
      cursor = cursor.next
    end
    NodeList.new(head)
  end
end

some = NodeList.generate
puts some.to_string
some.reverse!
puts some.to_string
last = some.reversed
puts last.to_string
some.loop_back!
puts some.to_string

__END__

[a]→ [b]→ [c]→ [d]→ [e]→ [f]→ [g]→ [h]→ [i]→ [j]→ x
[j]→ [i]→ [h]→ [g]→ [f]→ [e]→ [d]→ [c]→ [b]→ [a]→ x
[a]→ [b]→ [c]→ [d]→ [e]→ [f]→ [g]→ [h]→ [i]→ [j]→ x
[j]→ [i]→ [h]→ [g]→ [f]→ [e]→ [d]→ [c]→ [b]→ [a]→ [f]→ ...
