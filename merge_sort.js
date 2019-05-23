#!/usr/bin/env node

"use strict";

function merge_sort(array) {
  if (array.length <= 1) {
    return array
  } else {
    var mid = Math.floor(array.length / 2);
    return merge(merge_sort(array.slice(0, mid)), merge_sort(array.slice(mid)));
  }
}

function merge(left, right) {
  var result = [];
  while ((left.length > 0) && (right.length > 0)) {
    result.push(left[0] <= right[0] ? left.shift() : right.shift());
  }
  return result.concat(left).concat(right);
}

var data = [9,4,8,2,7,1,6,4,0,5,9,3,8,2,6,3,5,8,2,7,3,9,4,0,5];
console.log("unsorted: ", data.join(","));
console.log("sorted:   ", merge_sort(data).join(","));

/*
unsorted: 9,4,8,2,7,1,6,4,0,5,9,3,8,2,6,3,5,8,2,7,3,9,4,0,5
sorted:   0,0,1,2,2,2,3,3,3,4,4,4,5,5,5,6,6,7,7,8,8,8,9,9,9
*/

