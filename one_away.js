#!/usr/bin/env node

"use strict";

function one_edit_away(s1, s2) {
  if (s1.length == s2.length) {
    return one_edit_replace(s1, s2);
  } else if (s1.length + 1 == s2.length) {
    return one_edit_insert(s1, s2);
  } else if (s2.length + 1 == s1.length) {
    return one_edit_insert(s2, s1);
  } else {
    return false;
  }
}

function one_edit_replace(s1, s2) {
  var found_difference = false;
  for (let i = 0; i < s1.length; i++) {
    if (s1[i] !== s2[i]) {
      if (found_difference) {
        return false;
      }
      found_difference = true;
    }
  }
  return true;
}

function one_edit_insert(s1, s2) {
  var x1 = 0;
  var x2 = 0;
  while (x1 < s1.length && x2 < s2.length) {
    if (s1[x1] != s2[x2]) {
      if (x1 !== x2) {
        return false;
      }
    } else {
      x1 += 1;
    }
    x2 += 1;
  }
  return true;
}

console.log(one_edit_away('pale', 'ple'));   // true
console.log(one_edit_away('pale', 'pales')); // true
console.log(one_edit_away('pale', 'bale'));  // true
console.log(one_edit_away('pale', 'base'));  // false
console.log(one_edit_away('pale', 'bae'));   // false
console.log(one_edit_away('pale', 'le'));    // false
