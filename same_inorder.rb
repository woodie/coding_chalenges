#!/usr/bin/env ruby

def inorder(node)
  return if node.nil?
  [inorder(node.left), node.value, inorder(node.right)].compact.flatten
end

class BSTnode
  attr_accessor :value, :left, :right
  def initialize(value, left = nil, right = nil)
    self.value = value
    self.left = left
    self.right = right
  end
end

n1_1 = BSTnode.new(1)
n1_6 = BSTnode.new(6)
n1_3 = BSTnode.new(3, n1_1)
n1_7 = BSTnode.new(7, n1_6)
tr_1 = BSTnode.new(5, n1_3, n1_7)

n2_5 = BSTnode.new(5)
n2_7 = BSTnode.new(7)
n2_1 = BSTnode.new(1)
n2_6 = BSTnode.new(6, n2_5, n2_7)
tr_2 = BSTnode.new(3, n2_1, n2_6)

def same_inorder(tree1, tree2)
  puts inorder(tree1).inspect
  puts inorder(tree2).inspect
  puts inorder(tree1) == inorder(tree2)
end

same_inorder(tr_1, tr_2)

__END__

Given two binary treet, determine whether
they have the same inorder traversal.

    Tree 1          Tree 2

       5              3
      / \            / \
     3   7          1   6
    /   /              / \
   1   6              5   7
