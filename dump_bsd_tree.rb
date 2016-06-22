#!/usr/bin/env ruby

class Iterator
  def initialize(node)
    @stack = []
    while(node)
      @stack.push(node)
      node = node.left
    end
  end

  def next
    if has_next?
      node = @stack.pop
      current = node
      if node.right
        node = node.right
        while (node)
          @stack.push(node)
          node = node.left
        end
      end
      current
    else
      nil
    end
  end

  def has_next?
    !@stack.empty?
  end
end

class BSTnode
  attr_accessor :value, :left, :right
  def initialize(value, left=nil, right=nil)
    self.value = value
    self.left = left
    self.right = right
  end
end

#           [19]
#          /    \
#       [7]     [43]
#      /  |     |  \
#    [3] [11] [23] [47]
#   /  \    |    \    \
# [2] [5] [17]  [37] [53]
#        /      /  \
#      [13]  [29]  [41]

_13 = BSTnode.new(13)
_29 = BSTnode.new(29)
_41 = BSTnode.new(41)
_02 = BSTnode.new(2)
_05 = BSTnode.new(5)
_17 = BSTnode.new(17, _13)
_37 = BSTnode.new(37, _29)
_53 = BSTnode.new(53)
_03 = BSTnode.new(3,  _02, _05)
_11 = BSTnode.new(11, nil, _17)
_23 = BSTnode.new(23, nil, _37)
_47 = BSTnode.new(47, nil, _53)
_07 = BSTnode.new(7,  _03, _11)
_43 = BSTnode.new(43, _23, _47)
_19 = BSTnode.new(19, _07, _43)

def sorted_recursive(node)
  sorted_recursive(node.left) if node.left
  print "#{node.value}: "
  sorted_recursive(node.right) if node.right
end

def sorted_use_stack(node)
  stack = []
  result = ""
  while !stack.empty? or node
    if node
      stack.push node
      node = node.left
    else
      node = stack.pop
      result << "#{node.value}: "
      node = node.right
    end
  end
  puts result
end

sorted_use_stack _19
sorted_recursive _19
puts

iter = Iterator.new(_19)
while iter.has_next?
  print "#{iter.next.value}: "
end
puts

__END__

2: 3: 5: 7: 11: 13: 17: 19: 23: 29: 37: 43: 47: 53:
2: 3: 5: 7: 11: 13: 17: 19: 23: 29: 37: 43: 47: 53:
