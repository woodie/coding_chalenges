#!/usr/bin/env node

var _ = require('underscore');

var range = _.range(1, 18); // 1..17
var data = _.rest(range, 3).concat(_.first(range,3));

var find_max = function(a) {
  var last = a[a.length - 1];
  if (a[0] <= last) {
    return last;
  }
  var pivot = parseInt(a.length / 2);
  if (a[pivot] > last) {
    return find_max(a.slice(pivot, a.length));
  } else {
    return find_max(a.slice(0, pivot));
  }
}

console.log("input:", data.join(','));
console.log("max:", find_max(data));

/*

input: 4,5,6,7,8,9,10,11,12,13,14,15,16,17,1,2,3
max: 17

*/
