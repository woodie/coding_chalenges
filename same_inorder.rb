#!/usr/bin/env ruby

def inorder(node, list = [])
  return if node.nil?
  inorder(node.left, list)
  list << node.value
  inorder(node.right, list)
  list
end

class BSTnode
  attr_accessor :value, :left, :right
  def initialize(value, left = nil, right = nil)
    self.value = value
    self.left = left
    self.right = right
  end
end

n_1_1 = BSTnode.new(1)
n_1_6 = BSTnode.new(6)
n_1_3 = BSTnode.new(3, n_1_1)
n_1_7 = BSTnode.new(7, n_1_6)
tree1 = BSTnode.new(5, n_1_3, n_1_7)

n_2_5 = BSTnode.new(5)
n_2_7 = BSTnode.new(7)
n_2_1 = BSTnode.new(1)
n_2_6 = BSTnode.new(6, n_2_5, n_2_7)
tree2 = BSTnode.new(3, n_2_1, n_2_6)

list1 = inorder(tree1)
list2 = inorder(tree2)
puts list1 == list2

__END__

Given two binary treet, determine whether
they have the same inorder traversal.

    Tree 1          Tree 2

       5              3
      / \            / \
     3   7          1   6
    /   /              / \
   1   6              5   7
