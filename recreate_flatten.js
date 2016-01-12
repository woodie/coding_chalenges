#!/usr/bin/env node

var _ = require('underscore');

function __flatten(arr) {
  // complain if flat not Array?
  var flat = arr.slice(0); // clone it
  var i = 0;
  while (i < flat.length) {
    if (flat[i] instanceof Array) {
      flat[i] = flat[i].slice(0); // clone it
      var tail = flat.slice(i, flat.lenght);
      var elem = tail.shift();
      flat = flat.slice(0, i);
      if (elem.length === 0) {
        i--;
      } else if (elem.length === 1) {
        flat.push(elem.pop());
      } else {
        flat.push(elem.shift());
        flat.push(elem);
      }
      flat = flat.concat(tail);
    } else {
      i++;
    }
  }
  return flat;
}

var input = [1,2,3,4,[2,34],[],[23,[232,23,[1]]]];

console.log(input);
console.log(_.flatten(input));
console.log(input);
console.log(__flatten(input));
console.log(input);

/*

[ 1, 2, 3, 4, [ 2, 34 ], [], [ 23, [ 232, 23, [Object] ] ] ]
[ 1, 2, 3, 4, 2, 34, 23, 232, 23, 1 ]
[ 1, 2, 3, 4, [ 2, 34 ], [], [ 23, [ 232, 23, [Object] ] ] ]
[ 1, 2, 3, 4, 2, 34, 23, 232, 23, 1 ]
[ 1, 2, 3, 4, [ 2, 34 ], [], [ 23, [ 232, 23, [Object] ] ] ]

*/
