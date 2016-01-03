#!/usr/bin/env node

var PostingsListNode = (function () {
  function PostingsListNode(label, next, jump) {
    this.label = label;
    this.order = -1;
    this.next = next || null;
    this.jump = jump || null;
  }

  PostingsListNode.prototype.to_string = function () {
    var memo = `[${this.label}:${this.order}]→ `;
    if (this.next) {
      memo += this.next.to_string();
    } else {
      memo += 'x';
    }
    return memo;
  };

  PostingsListNode.set_jump_order_recursive = function (node, order) {
    order = order || 0;
    if (node && node.order === -1) {
      node.order = order++;
      PostingsListNode.set_jump_order_recursive(node.jump, order);
      PostingsListNode.set_jump_order_recursive(node.next, order);
    }
  };

  PostingsListNode.set_jump_order_iterative = function (head) {
    var stack = [];
    var order = 0;
    stack.push(head);
    while (stack.length > 0) {
      var node = stack[stack.length - 1];
      stack.pop();
      if (node && node.order === -1) {
        node.order = order++;
        stack.push(node.next);
        stack.push(node.jump);
      }
    }
  };
  return PostingsListNode;
})();

//        ↱-------↘
// [a]→ [b]→ [c]→ [d]→ x
//   ↳-------↗ |   ↑↓
//        ↖___↙

function example_list() {
  var _d = new PostingsListNode('d');
  var _c = new PostingsListNode('c', _d);
  var _b = new PostingsListNode('b', _c, _d);
  var _a = new PostingsListNode('a', _b, _c);
  _d.jump = _d;
  _c.jump = _b;
  return _a;
}

var e1 = example_list();
PostingsListNode.set_jump_order_recursive(e1);
console.log(e1.to_string());
var e2 = example_list();
PostingsListNode.set_jump_order_iterative(e2);
console.log(e2.to_string());

/*

[a:0]→ [b:2]→ [c:1]→ [d:3]→ x
[a:0]→ [b:2]→ [c:1]→ [d:3]→ x

*/
