#!/usr/bin/env node

"use strict";

//        "ab"
//        /  \
//      "ef"  "gh"
//     / | \    \
//  "x" "y" "z"  "p"

var Node = (function () {
  function Node(value, children) {
    this.value = value;
    this.children = (children === null) ? [] : children;
  }
  return Node;
})();

var ef = new Node("ef", [
    new Node("x", null),
    new Node("y", null),
    new Node("z", null) ]);
var gh = new Node("gh", [
    new Node("p", null) ]);
var root = new Node("ab", [ef,gh]);

var to_string = function(node) {
  if (typeof memo === "undefined") {
    var memo = '';
  }
  memo += node.value + ": "
  for (let sub of node.children) {
    memo += to_string(sub);
  }
  return memo;
}

var print_tree = function(node) {
  console.log(node.value + ": ");
  for (let sub of node.children) {
    print_tree(sub);
  }
};

console.log(to_string(root));
print_tree(root);
