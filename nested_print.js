#!/usr/bin/env node

"use strict";

var getNodes = function(list) {
  var hash = {};
  for (let elem of list) {
    if (hash[elem.parent_id] === undefined) {
      hash[elem.parent_id] = [];
    }
    hash[elem.parent_id].push(elem);
  }
  return hash;
}

var nicePrint = function(hash, list, level) {
  list = list || hash[0];
  level = level || 0;
  for (let elem of list) {
    console.log('  '.repeat(level) + elem.value);
    nicePrint(hash, hash[elem.id] || [], level + 1);
  }
}

var arr = [];
var p = [0,0,0,0,1,1,1,2,2,2,3,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10];
for (let i = 1; i < 27; i++) {
  arr.push({parent_id: p[i], id: i, value: String.fromCharCode(i + 64)})
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
