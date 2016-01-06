#!/usr/bin/env node

"use strict";

// Given the following array of flower plots, determine where a new flower can be planted.
// Every 1 represents a flower, every 0 represents a plot, flowers can ONLY be planted when there
// isn't one in the adjacent plot. In the following example indexes 2 and 6 can be planted.

var FlowerPlanter =(function () {
  function FlowerPlanter(plots) {
    this.plots = plots;
  }
  FlowerPlanter.prototype.plant = function () {
    for (var i = 0; i < this.plots.length; i++) {
      if (this.plots[i - 1] !== 1 &&
          this.plots[i] === 0 &&
          this.plots[i + 1] !== 1) {
        this.plots[i] = 1;
        i++;
      }
    }
    console.log(this.plots.join(','));
  };
  return FlowerPlanter;
})();

var flowers = [1, 0, 0, 0, 1, 0, 0, 0];
console.log(flowers.join(','));
var flowerBed = new FlowerPlanter(flowers);
flowerBed.plant(); // [1, 0, 1, 0, 1, 0, 1, 0]

var nine = [0, 0, 0, 0, 0, 0, 0, 0, 0];
console.log(nine.join(','));
var emptyBed = new FlowerPlanter(nine);
emptyBed.plant(); // [1, 0, 1, 0, 1, 0, 1, 0, 1]


// Given these two arrays, reorganize them in this explicit format.
// Pay attention to the way this array is being sorted, and the
// movement of the pointer from front to back.

var one_arr = ["a","b","c","d","e","f"]; // ["f","a","e","b","d","c"]
var two_arr = [1, 2, 3, 4, 5, 6, 7];     // [7, 1, 6, 2, 5, 3 ]

function re_org(arr) {
  var out = [];
  var pivot = Math.floor(arr.length / 2);
  for (var i = 0; i < pivot; i++) {
    out.push(arr[arr.length - (i + 1)]);
    out.push(arr[i]);
  }
  if (arr.length % 2 != 0) {
    out.push(arr[pivot]);
  }
  console.log(out.join(','));
}

console.log(one_arr.join(','));
re_org(one_arr);
console.log(two_arr.join(','));
re_org(two_arr);

/*

1,0,0,0,1,0,0,0
1,0,1,0,1,0,1,0
0,0,0,0,0,0,0,0,0
1,0,1,0,1,0,1,0,1
a,b,c,d,e,f
f,a,e,b,d,c
1,2,3,4,5,6,7
7,1,6,2,5,3,4

*/
