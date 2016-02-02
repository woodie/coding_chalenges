#!/usr/bin/env typescript

class Elem {
  id: number;
  value: string;
  parent_id: number;
  constructor(id: number, value: string, parent_id: number) {
    this.id = id;
    this.value = value;
    this.parent_id = parent_id;
  }
  indentedLabel(level) {
    return Array(level + 1).join('  ') + this.value;
  }
}

function getNodes(list: Array<Elem>) {
  var hash = {};
  for (let elem of list) {
    if (hash[elem.parent_id] === undefined) {
      hash[elem.parent_id] = [];
    }
    hash[elem.parent_id].push(elem);
  }
  return hash;
}

function nicePrint(hash: {}, list?: Array<Elem>, level?: number) {
  list = list || hash[0];
  level = level || 0;
  for (let elem of list) {
    console.log(elem.indentedLabel(level));
    nicePrint(hash, hash[elem.id] || [], level + 1);
  }
}

var arr = [];
var p = [0,0,0,0,1,1,1,2,2,2,3,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10];
for (let i = 1; i < 27; i++) {
  arr.push(new Elem(i, String.fromCharCode(i + 64), p[i]));
}

nicePrint(getNodes(arr));


/*

A
  D
    M
    N
  E
    O
    P
  F
    Q
    R
B
  G
    S
    T
  H
    U
    V
  I
    W
    X
C
  J
    Y
    Z
  K
  L

*/
