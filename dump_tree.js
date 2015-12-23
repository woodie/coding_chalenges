#!/usr/bin/env node

"use strict";

var Node = (function () {
  function Node(value, children) {
    this.value = value;
    this.children = (children === null) ? [] : children;
  }
  return Node;
})();

var Tree = (function () {
  function Tree(node) {
    this.root = root;
  };
  Tree.prototype.root = function () {
    return this.root;
  };
  Tree.prototype.to_s = function () {
    return Tree.to_string(this.root);
  };
  Tree.prototype.print = function () {
    Tree.print_tree(this.root);
  };
  Tree.to_string = function (node) {
    if (typeof memo === "undefined") {
      var memo = '';
    }
    memo += node.value + ": "
    for (let sub of node.children) {
      memo += Tree.to_string(sub);
    }
    return memo;
  };
  Tree.print_tree = function(node) {
    console.log(node.value + ": ");
    for (let sub of node.children) {
      Tree.print_tree(sub);
    }
  };
  return Tree;
})();

//        "ab"
//        /  \
//      "ef"  "gh"
//     / | \    \
//  "x" "y" "z"  "p"

var ef = new Node("ef", [
    new Node("x", null),
    new Node("y", null),
    new Node("z", null) ]);
var gh = new Node("gh", [
    new Node("p", null) ]);
var root = new Node("ab", [ef,gh]);

console.log(Tree.to_string(root));
Tree.print_tree(root);
var tree = new Tree(root);
console.log(tree.to_s());
tree.print();

/*

ab: ef: x: y: z: gh: p:
ab:
ef:
x:
y:
z:
gh:
p:
ab: ef: x: y: z: gh: p:
ab:
ef:
x:
y:
z:
gh:
p:

*/
