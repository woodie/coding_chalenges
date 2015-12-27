#!/usr/bin/env node

"use strict";

class ListNode {
  constructor(value, next) {
    this.value = value;
    this.next = next || null;
  }
}

class NiceList {
  constructor(head) {
    this.head = head;
  }

  // [a]→ [b]→ [c]→ [d]→ [e]→ [f]→ [g]→ [h]→ [i]→ [j]
  static generate(start, finish) {
    start = start || 'a';
    finish = finish || 'j';
    var this_node = null;
    for (var n = finish.charCodeAt(0); n >= start.charCodeAt(0); n--) {
      this_node = new ListNode(String.fromCharCode(n), this_node);
    }
    return new NiceList(this_node);
  }

  // [a]→ [b]→ [c]→ [d]→ [e]→ [f]→ [g]→ [h]→ [i]→ [j]
  // !!! WARNING !!!            ↖_________________/
  loop_back(value) {
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
  }

  has_cycle() {
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
  }

  to_string() {
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
  }

  reverse() {
    var tail = this.head;
    while (tail.next) {
      var temp = tail.next;
      tail.next = temp.next;
      temp.next = this.head;
      this.head = temp;
    }
  }

  reversed() {
    var head = null;
    var cursor = this.head;
    while (cursor) {
      var node = new ListNode(cursor.value);
      node.next = head;
      head = node;
      cursor = cursor.next;
    }
    return new NiceList(head);
  }
}

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
