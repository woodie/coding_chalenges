#!/usr/bin/env typescript

class ListNode {
  value: string;
  next: ListNode;

  constructor(value: string, next?: ListNode) {
    this.value = value;
    this.next = next || null;
  }
}

class NiceList {
  head: ListNode;

  constructor(head: ListNode) {
    this.head = head;
  }

  // [a]→ [b]→ [c]→ d]→ [e]→ x
  static generate(start?: string, finish?: string) {
    start = start || 'a';
    finish = finish || 'e';
    var this_node = null;
    for (var n = finish.charCodeAt(0); n >= start.charCodeAt(0); n--) {
      this_node = new ListNode(String.fromCharCode(n), this_node);
    }
    return new NiceList(this_node);
  }

  // [a]→ [b]→ [c]→ d]→ [e]→ [c]→ ... 
  loop_back(value?: string) {
    value = value || 'c';
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

  find_node(value: string) {
    var cursor = this.head;
    while (cursor) {
      if (cursor.value === value) {
        return cursor;
      }
      cursor = cursor.next;
    }
    return null;
  }

  delete_node(node: ListNode) {
    if (node.next) {
      var value = node.value
      node.value = node.next.value;
      node.next = node.next.next;
      return value;
    } else {
      var cursor = this.head;
      while (cursor) {
        if (cursor.next === node) {
          cursor.next = cursor.next.next;
          return node.value;
        }
        cursor = cursor.next;
      }
    }
    return null;
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

  join(other: NiceList, offset?: number) {
    offset = offset || 0;
    if (this.has_cycle()) {
      return false;
    }
    var last = this.head;
    while(last.next) {
      last = last.next;
    }
    for (var s = 0; s < offset; s++) {
      other.head = other.head.next;
    }
    last.next = other.head;
    return true;
  }

  palindromal() {
    var slow = this.head;
    var fast = this.head;
    if (slow.next === null || slow.next === slow) {
      return true;
    }
    var count = 0;
    while (fast && fast.next && fast.next.next) {
      slow = slow.next;
      fast = fast.next.next;
      count++;
      if (slow === fast) {
        return false; // cycles
      }
    }
    if (fast.next) {
      count++; // correct for even number
    }
    while (slow.next) {
      count--;
      fast = this.head;
      for (var i = 0; i < count; i++) {
        fast = fast.next;
      }
      slow = slow.next;
      if (fast.value != slow.value) {
        return false;
      }
    }
    return true;
  }
}

var deep = NiceList.generate('a', 'j');
console.log(deep.to_string());
console.log("delete: " +
    deep.delete_node(deep.find_node('e')) +  ", " +
    deep.delete_node(deep.find_node('j')));
console.log(deep.to_string());
console.log('reverse:');
deep.reverse();
console.log(deep.to_string());
var last = NiceList.generate();
var one = last.reversed();
var two = last.reversed();
var bad = last.reversed();
one.join(last);
two.join(last, 1);
bad.join(last, 2);
console.log('palindromal: ', one.palindromal());
console.log(one.to_string());
console.log('palindromal: ', two.palindromal());
console.log(two.to_string());
console.log('palindromal;', bad.palindromal());
console.log(bad.to_string());
bad.loop_back();
console.log('palindromal;', bad.palindromal());
console.log(bad.to_string());

/*

[a]→ [b]→ [c]→ [d]→ [e]→ [f]→ [g]→ [h]→ [i]→ [j]→ x
delete: e, j
[a]→ [b]→ [c]→ [d]→ [f]→ [g]→ [h]→ [i]→ x
reverse:
[i]→ [h]→ [g]→ [f]→ [d]→ [c]→ [b]→ [a]→ x
palindromal:  true
[e]→ [d]→ [c]→ [b]→ [a]→ [a]→ [b]→ [c]→ [d]→ [e]→ x
palindromal:  true
[e]→ [d]→ [c]→ [b]→ [a]→ [b]→ [c]→ [d]→ [e]→ x
palindromal; false
[e]→ [d]→ [c]→ [b]→ [a]→ [d]→ [e]→ x
palindromal; false
[e]→ [d]→ [c]→ [b]→ [a]→ [d]→ [e]→ [c]→ ...

*/
