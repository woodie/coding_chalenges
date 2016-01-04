#!/usr/bin/env node

var MinHeap = require('libstl').MinHeap;

Array.prototype.pq_sort = function (k) {
  out = [];
  x = 0;
  var min_heap = new MinHeap();
  for (var i = 0; i < k; i++) {
    if (this.length > x) {
      min_heap.insert(this[x]);
      x++;
    }
  }
  while (this.length > x) {
    min_heap.insert(this[x])
    out.push(min_heap.extract());
    x++;
  }
  while (!min_heap.isEmpty()) {
    out.push(min_heap.extract());
  }
  return out;
}

// two away from final position
var input = [3,-1,2,6,4,5,8,7,9];

console.log(input.pq_sort(1).join(','));
console.log(input.sort().join(','));

/*

-1,2,3,4,5,6,7,8,9
-1,2,3,4,5,6,7,8,9

*/
