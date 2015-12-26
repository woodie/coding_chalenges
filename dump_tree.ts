#!/usr/bin/env typescript

class TreeNode {
  value: string;
  children: Array<TreeNode>;
  constructor(value: string, children?: Array<TreeNode>) {
    this.value = value;
    this.children = children || [];
  }
}

class Tree {
  root: TreeNode;
  constructor(root: TreeNode) {
    this.root = root;
  }
  to_s() {
    return Tree.to_string(this.root);
  }
  print() {
    Tree.print_tree(this.root);
  }
  static to_string(node) {
    if (typeof memo === "undefined") {
      var memo = '';
    }
    memo += node.value + ": "
    for (let sub of node.children) {
      memo += Tree.to_string(sub);
    }
    return memo;
  }
  static print_tree(node) {
    process.stdout.write(node.value + ": ");
    for (let sub of node.children) {
      Tree.print_tree(sub);
    }
  }
}

//        "ab"
//        /  \
//      "ef"  "gh"
//     / | \    \
//  "x" "y" "z"  "p"

var root = new TreeNode("ab", [new TreeNode("ef", [
    new TreeNode("x"), new TreeNode("y"), new TreeNode("z")]),
    new TreeNode("gh", [new TreeNode("p")])])

console.log(Tree.to_string(root));
Tree.print_tree(root);
console.log('');
var tree = new Tree(root);
console.log(tree.to_s());
tree.print();
console.log('');

/*

ab: ef: x: y: z: gh: p:
ab: ef: x: y: z: gh: p:
ab: ef: x: y: z: gh: p:
ab: ef: x: y: z: gh: p:

*/
