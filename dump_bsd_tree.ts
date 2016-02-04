#!/usr/bin/env typescript

class Iterator {
  stack: Array<BSTnode>;
  constructor(node: BSTnode) {
    this.stack = [];
    while(node) {
      this.stack.push(node);
      node = node.left;
    }
  }
  next() {
    if (this.hasNext()) {
      var node = this.stack.pop();
      var current = node;
      if (node.right) {
        node = node.right;
        while(node) {
          this.stack.push(node);
          node = node.left;
        }
      }
      return current;
    } else {
      return null;
    }
  }
  hasNext() {
    return (this.stack.length > 0);
  }
}

class BSTnode {
  value: number;
  left: BSTnode;
  right: BSTnode;
  constructor(value: number, left?: BSTnode, right?: BSTnode) {
    this.value = value;
    this.left = left || null;
    this.right = right || null;
  }
}

//           [19]
//          /    \
//       [7]     [43]
//      /  |     |  \
//    [3] [11] [23] [47]
//   /  \    |    \    \
// [2] [5] [17]  [37] [53]
//        /      /  \
//      [13]  [29]  [41]

var _13 = new BSTnode(13);
var _29 = new BSTnode(29);
var _41 = new BSTnode(41);
var _02 = new BSTnode(2);
var _05 = new BSTnode(5);
var _17 = new BSTnode(17, _13);
var _37 = new BSTnode(37, _29);
var _53 = new BSTnode(53);
var _03 = new BSTnode(3,  _02, _05);
var _11 = new BSTnode(11,null, _17);
var _23 = new BSTnode(23,null, _37);
var _47 = new BSTnode(47,null, _53);
var _07 = new BSTnode(7,  _03, _11);
var _43 = new BSTnode(43, _23, _47);
var _19 = new BSTnode(19, _07, _43);

function sorted_recursive(node: BSTnode) {
  if (node.left) {
    sorted_recursive(node.left);
  }
  process.stdout.write("" + node.value + ": ");
  if (node.right) {
    sorted_recursive(node.right);
  }
}

function sorted_use_stack(node: BSTnode) {
  var stack = [];
  var result = '';
  while (stack.length > 0 || node) {
    if (node) {
      stack.push(node);
      node = node.left;
    } else {
      node = stack.pop();
      result += ("" + node.value + ": ");
      node = node.right;
    }
  }
  console.log(result);
}

sorted_use_stack(_19);
sorted_recursive(_19);
console.log();

var iter = new Iterator(_19);
while(iter.hasNext()) {
  process.stdout.write(iter.next().value + ": ");
}
console.log('');

/*

2: 3: 5: 7: 11: 13: 17: 19: 23: 29: 37: 43: 47: 53:
2: 3: 5: 7: 11: 13: 17: 19: 23: 29: 37: 43: 47: 53:
2: 3: 5: 7: 11: 13: 17: 19: 23: 29: 37: 43: 47: 53:

*/
