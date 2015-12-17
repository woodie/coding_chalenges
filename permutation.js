#!/usr/bin/env node

"use strict";

// when sorting is too expensive or not allowed
var s1 = "dkfoekfhcms_Figjekcjvnskwhfjjdje_"
var s2 = "diwjrhfkehdjfjsodhfjdkdhfjfnskwjf"
var s3 = "Figjekcjvnskwhfjjdje_dkfoekfhcms_"

function is_permutation(str1, str2) {
  if (str1.size != str2.size) {
  return false;
  }
  var letters = new Array(128);
  for (let i = 0; i < letters.length; i++) {
    letters[i] = 0;
  }
  for (let c = 0; c < str1.length; c++) {
    let char = str1.charCodeAt(c);
    letters[char] += 1;
  }
  for (let c = 0; c < str2.length; c++) {
    let char = str2.charCodeAt(c);
    letters[char] -= 1
    if (letters[c] < 0) {
      return false;
    }
  }
  return true;
}

console.log('');
console.log([s1, s2, s3].join('\n'));
console.log("is permutation:", is_permutation(s1, s2));
console.log("is permutation:", is_permutation(s1, s3));

/*

dkfoekfhcms_Figjekcjvnskwhfjjdje_
diwjrhfkehdjfjsodhfjdkdhfjfnskwjf
Figjekcjvnskwhfjjdje_dkfoekfhcms_
is permutation: false
is permutation: true

*/
