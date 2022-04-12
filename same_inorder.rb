#!/usr/bin/env ruby

class BSTnode
  attr_accessor :value, :left, :right
  def initialize(value, left = nil, right = nil)
    self.value = value
    self.left = left
    self.right = right
  end
end

# Given two binary treet, determine whether
# they have the same inorder traversal.
#
#    Tree 1          Tree 2
#
#       5              3
#      / \            / \
#     3   7          1   6
#    /   /              / \
#   1   6              5   7

n_1_3 = BSTnode.new(3, BSTnode.new(1))
n_1_7 = BSTnode.new(7, BSTnode.new(6))
tree1 = BSTnode.new(5, n_1_3, n_1_7)

n_2_6 = BSTnode.new(6, BSTnode.new(5), BSTnode.new(7))
tree2 = BSTnode.new(3, BSTnode.new(1), n_2_6)

def inorder(node, list = [])
  return if node.nil?
  inorder(node.left, list)
  list << node.value
  inorder(node.right, list)
  list
end

def inorder_check(node, list)
  return [list, true] if node.nil?
  ll, ls = inorder_check(node.left, list)
  return [ll, false] unless ls
  return [list, false] if node.value != list.shift
  rl, rs = inorder_check(node.right, list)
  return [rl, false] unless rs
  [list, true]
end

# compare each list
list1 = inorder(tree1)
list2 = inorder(tree2)
puts list1 == list2

# bail out when list does not match
list, status = inorder_check(tree2, list1)
puts (list.empty? && status).inspect
