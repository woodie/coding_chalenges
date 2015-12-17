#!/usr/bin/env node

"use strict";

Array.prototype.deduce = function(funct) {
  var m = (typeof this[0] === 'number') ? 0 : '';
  for (let i = 0; i < this.length; i++) {
    m = funct(m, this[i]);
  }
  return m;
};

console.log(['a','b','c','d','e','f'].reduce(function(m,c){return m + c}));
console.log(['a','b','c','d','e','f'].deduce(function(m,c){return m + c}));
console.log([1, 2, 3, 4, 5].reduce(function(m,c){return m + c}));
console.log([1, 2, 3, 4, 5].deduce(function(m,c){return m + c}));

/*

abcdef
abcdef
15
15

*/
