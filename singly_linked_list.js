#!/usr/bin/env node

"use strict";

var ListNode = (function () {
  function ListNode(value, next) {
    this.value = value;
    this.next = next || null;
  }
  return ListNode;
})();

var NiceList = (function () {
  function NiceList(head) {
    this.head = head;
  }

  // [a]→ [b]→ [c]→ [d]→ [e]→ [f]→ [g]→ [h]→ [i]→ [j]
  NiceList.generate = function (start, finish) {
    start = start || 'a';
    finish = finish || 'j';
    var this_node = null;
    for (var n = finish.charCodeAt(0); n >= start.charCodeAt(0); n--) {
      this_node = new ListNode(String.fromCharCode(n), this_node);
    }
    return new NiceList(this_node);
  };

  // [a]→ [b]→ [c]→ [d]→ [e]→ [f]→ [g]→ [h]→ [i]→ [j]
  // !!! WARNING !!!            ↖_________________/
  NiceList.prototype.loop_back = function (value) {
    value = value || 'f';
    var target = null;
    var cursor = this.head;
    while (cursor.next) {
      if (cursor.value === value) {
        target = cursor;
      }
      if (target && cursor.next.next === null) {
        cursor.next.next = target;
        return;
      }
      cursor = cursor.next
    }
  };

  NiceList.prototype.has_cycle = function () {
    var slow = this.head;
    var fast = this.head;
    while (fast && fast.next && fast.next.next) {
      slow = slow.next;
      fast = fast.next.next;
      if (slow === fast) {
        slow = this.head;
        while (slow !== fast) {
          slow = slow.next;
          fast = fast.next;
        }
        return slow.value;
      }
    }
    return null;
  };

  NiceList.prototype.to_string = function () {
    var dupe = this.has_cycle();
    var seen = false;
    var memo = '';
    var pointer = this.head;
    while (pointer.next) {
      memo += `[${pointer.value}]→ `;
      pointer = pointer.next;
      if (dupe  && pointer.value === dupe) {
        if (seen) {
          return memo += `[${dupe}]→ ...`
        }
        seen = true;
      }
    }
    return memo += `[${pointer.value}]→ x`;
  };

  NiceList.prototype.reverse = function () {
    var tail = this.head;
    while (tail.next) {
      var temp = tail.next;
      tail.next = temp.next;
      temp.next = this.head;
      this.head = temp;
    }
  };

  NiceList.prototype.reversed = function () {
    var head = null;
    var cursor = this.head;
    while (cursor) {
      var node = new ListNode(cursor.value);
      node.next = head;
      head = node;
      cursor = cursor.next;
    }
    return new NiceList(head);
  };
  return NiceList;
})();

var some = NiceList.generate();
console.log(some.to_string());
some.reverse();
console.log(some.to_string());
var last = some.reversed();
console.log(last.to_string());
some.loop_back();
console.log(some.to_string());

/*

[a]→ [b]→ [c]→ [d]→ [e]→ [f]→ [g]→ [h]→ [i]→ [j]→ x
[j]→ [i]→ [h]→ [g]→ [f]→ [e]→ [d]→ [c]→ [b]→ [a]→ x
[a]→ [b]→ [c]→ [d]→ [e]→ [f]→ [g]→ [h]→ [i]→ [j]→ x
[j]→ [i]→ [h]→ [g]→ [f]→ [e]→ [d]→ [c]→ [b]→ [a]→ [f]→ ...

*/
