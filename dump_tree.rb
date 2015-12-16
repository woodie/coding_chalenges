#!/usr/bin/env ruby

#        "ab"
#        /  \
#      "ef"  "gh"
#     / | \    \
#  "x" "y" "z"  "p"

class Node
  attr_accessor :value, :children
  def initialize(value, children)
    self.value = value
    self.children = children.is_a?(Array) ? children : (children.nil? ? [] : [children])
  end
end

root = Node.new("ab", [
    Node.new("ef", [Node.new("x", nil),
    Node.new("y", nil), Node.new("z", nil)]),
    Node.new("gh",  Node.new("p", nil))])

def to_string(node)
  memo = '' if memo.nil?
  memo += node.value + ": "
  node.children.each do |sub|
    memo += to_string(sub)
  end
  memo
end

def print_tree(node)
  print node.value + ": "
  node.children.each do |sub|
    print_tree(sub)
  end
end 

print_tree(root)
puts
puts to_string(root)

__END__

ab: ef: x: y: z: gh: p: 
ab: ef: x: y: z: gh: p: 
