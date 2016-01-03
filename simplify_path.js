#!/usr/bin/env node

function simplify_iterative(path) {
  var stack = [];
  var grounded = false;
  if (path[0] === '/') {
    stack.push('');
    grounded = true;
  }
  var dirs = path.split('/');
  while (dirs.length > 0) {
    var dir = dirs.shift();
    if (dir === '.' || dir == '') {
      // no-op
    } else if (dir === '..') {
      if (grounded === true) {
        stack.pop();
      } else {
        stack.push(dir);
      }
    } else {
      grounded = true;
      stack.push(dir);
    }
  }
  if (path[path.length - 1] === '/') {
    stack.push('');
  }
  return stack.join('/');
}

var path_1 = '/usr/lib/../bin/gcc';
var path_2 = 'sctipts//./../scripts/awkscripts/././';
var path_3 = '../../export/workspace/../goodies/';

console.log(simplify_iterative(path_1));
console.log(simplify_iterative(path_2));
console.log(simplify_iterative(path_3));

/*

/usr/bin/gcc
scripts/awkscripts/
../../export/goodies/

*/
