#!/usr/bin/env ruby

class PostingsListNode
  attr_accessor :label, :order, :next, :jump
  def initialize(label, nxxt=nil, jump=nil)
    self.label = label
    self.order = -1
    self.next = nxxt
    self.jump = jump
  end

  def to_string
    memo = "[#{label}:#{order}]→ "
    if self.next
      memo += self.next.to_string
    else
      memo += 'x'
    end
    memo
  end

  def self.set_jump_order_recursive(node, order=0)
    if node and node.order == -1
      node.order = order +=1
      set_jump_order_recursive node.jump, order
      set_jump_order_recursive node.next, order
    end
  end

  def self.set_jump_order_iterative(head)
    stack = []
    order = 0
    stack.push head
    while stack.length > 0
      node = stack.last
      stack.pop
      if node and node.order == -1
        node.order = order +=1
        stack.push node.next
        stack.push node.jump
      end
    end
  end
end

#        ↱-------↘
# [a]→ [b]→ [c]→ [d]→ x
#   ↳-------↗ |   ↑↓
#        ↖___↙

def example_list
  _d = PostingsListNode.new('d')
  _c = PostingsListNode.new('c', _d)
  _b = PostingsListNode.new('b', _c, _d)
  _a = PostingsListNode.new('a', _b, _c)
  _d.jump = _d
  _c.jump = _b
  _a
end

e1 = example_list
PostingsListNode.set_jump_order_recursive e1
puts e1.to_string
e2 = example_list
PostingsListNode.set_jump_order_iterative e2
puts e2.to_string

__END__

[a:1]→ [b:3]→ [c:2]→ [d:4]→ x
[a:1]→ [b:3]→ [c:2]→ [d:4]→ x
