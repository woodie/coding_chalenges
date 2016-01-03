#!/usr/bin/env ruby

class ListNode
  attr_accessor :value, :next

  def initialize(value, nxxt=nil)
    self.value = value
    self.next = nxxt
  end
end

class NodeList
  attr_accessor :head

  def initialize(head)
    self.head = head
  end

  # [a]→ [b]→ [c]→ [d]→ [e]→ x
  def self.generate(start=:a, finish=:e)
    this_node = nil
      (start..finish).to_a.reverse.each do |i|
      this_node = ListNode.new i, this_node
    end
    new this_node
  end

  # [a]→ [b]→ [c]→ [d]→ [e]→ [c]→ ...
  def loop_back!(value=:c)
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

  def join(other, offset=0)
    return false if self.has_cycle?
    last = self.head
    while last.next
      last = last.next
    end
    offset.times do
      other.head = other.head.next
    end
    last.next = other.head
    true
  end

  def palindromal?
    slow = self.head
    fast = self.head
    return true if slow.next == nil or slow.next == slow
    count = 0
    while fast and fast.next and fast.next.next
      slow = slow.next
      fast = fast.next.next
      count +=1
      return false if slow == fast # cycles
    end
    count +=1 if fast.next # correct for even number
    while slow.next
      count -=1
      fast = self.head
      count.times do
        fast = fast.next
      end
      slow = slow.next
      return false if fast.value != slow.value
    end
    true
  end
end

deep = NodeList.generate('a', 'j')
puts deep.to_string
deep.reverse!
puts deep.to_string
last = NodeList.generate
one = last.reversed
two = last.reversed
bad = last.reversed
one.join last
two.join last, 1
bad.join last, 2
puts one.to_string
puts "palindromal: #{one.palindromal?}"
puts two.to_string
puts "palindromal: #{two.palindromal?}"
puts bad.to_string
puts "palindromal: #{bad.palindromal?}"
bad.loop_back!
puts bad.to_string
puts "palindromal: #{bad.palindromal?}"

__END__

[a]→ [b]→ [c]→ [d]→ [e]→ [f]→ [g]→ [h]→ [i]→ [j]→ x
[j]→ [i]→ [h]→ [g]→ [f]→ [e]→ [d]→ [c]→ [b]→ [a]→ x
[e]→ [d]→ [c]→ [b]→ [a]→ [a]→ [b]→ [c]→ [d]→ [e]→ x
palindromal: true
[e]→ [d]→ [c]→ [b]→ [a]→ [b]→ [c]→ [d]→ [e]→ x
palindromal: true
[e]→ [d]→ [c]→ [b]→ [a]→ [d]→ [e]→ x
palindromal: false
[e]→ [d]→ [c]→ [b]→ [a]→ [d]→ [e]→ [c]→ ...
palindromal: false
