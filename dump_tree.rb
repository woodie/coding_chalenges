#!/usr/bin/env ruby

class Iterator
  def initialize(node)
    @stack = [node]
  end

  def next
    if has_next
      node = @stack.pop
      node.children.reverse.each do |child|
        @stack.push child
      end
      node
    else
      nil
    end
  end

  def has_next
    !@stack.empty?
  end
end

class Node
  attr_accessor :value, :children

  def initialize(value, children=[])
    self.value = value
    self.children = children
  end
end

class Tree
  attr_accessor :root

  def initialize(root)
    self.root = root
  end

  def to_s
    Tree.to_string(root)
  end

  def print
    Tree.print_tree(root)
  end

  def self.to_string(node)
    memo = node.value + ": "
    node.children.each do |sub|
      memo += to_string(sub)
    end
    memo
  end

  def self.print_tree(node)
    print node.value + ": "
    node.children.each do |sub|
      print_tree(sub)
    end
  end
end

#        "ab"
#        /  \
#      "ef"  "gh"
#     / | \    \
#  "x" "y" "z"  "p"

root = Node.new("ab", [Node.new("ef", [
    Node.new("x"), Node.new("y"), Node.new("z")]),
    Node.new("gh", [Node.new("p")])])

Tree.print_tree(root)
puts
puts Tree.to_string(root)
tree = Tree.new root
tree.print
puts
puts tree.to_s

iter = Iterator.new(root)
while(iter.has_next)
  print iter.next.value + ": "
end
puts

__END__

ab: ef: x: y: z: gh: p:
ab: ef: x: y: z: gh: p:
ab: ef: x: y: z: gh: p:
ab: ef: x: y: z: gh: p:
ab: ef: x: y: z: gh: p:
