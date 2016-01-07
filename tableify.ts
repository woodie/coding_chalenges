#!/usr/bin/env typescript

var list = 'Adam Brett Cari Donna Ethan Fred Grok Han Izzy Jay'.split(' ');
var columns = 3;

function tableify (list: Array<string>, columns: number) {
  var rows = Math.ceil(list.length / columns);
  var result = Array.apply(null, Array(rows)).map(function(){return []})

  for (var i = 0; i < list.length; i++) {
    result[i % rows].push(list[i]);
  }
  return result;
}

console.log(tableify(list, columns));
 
// [ [ 'Adam', 'Ethan', 'Izzy' ],
//   [ 'Brett', 'Fred', 'Jay' ],
//   [ 'Cari', 'Grok' ],
//   [ 'Donna', 'Han' ] ]
