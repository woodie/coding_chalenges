#!/usr/bin/env node

"use strict";

function coordinates_naive(img) {
  var x, y, w, h;
  for (var r = 0; r < img.length; r++) {
    var row = img[r];
    for (var c = 0; c < row.length; c++) {
      var pix = row[c];
      if (pix === 1) {
        if (typeof x === "undefined") {
          x = c;
        }
        if (typeof y === "undefined") {
          y = r;
        }
        w = c - x + 1;
        h = r - y + 1;
      }
    }
  }
  return {x:x, y:y, w:w, h:h}
}

function coordinates_smart(img) {
  for (var r = 0; r < img.length; r++) {
    var row = img[r];
    if (row.indexOf(1) !== -1) {
      for (var c = 0; c < row.length; c++) {
        var pix = row[c];
        if (pix === 1) {
          var x = c;
          var y = r;
          var w = row.lastIndexOf(1) - x + 1;
          for (var z = y; z < img.length + 1; z++) {
            if (z === img.length || (img[z].indexOf(1) == -1)) {
              var h = z - r;
              return {x:x, y:y, w:w, h:h};
            }
          }
        }
      }
    }
  }
  return null;
}

function plot_rect_on_board(x, y, w, h) {
  var min = 10;
  var height = (y + h) > min ? (y + h) : min
  var width  = (x + w) > min ? (x + w) : min
  board = new Array(height);
  for (let row = 0; row < height; row++) {
    board[row] = Array(width);
    for (let col = 0; col < width; col++) {
      board[row][col] = (
          row >= x + 1 &&
          col >= y - 1 &&
          col <= w + x - 1 &&
          row <= h + y - 1
      ) ? 1 : 0;
    }
  }
  return board;
}

function render_entire_artboard(img) {
  var buffer = '\n   ';
  for (var n = 0; n < img[0].length; n++) {
    buffer += (n > 9) ? ' ' : (" " + n);
  }
  buffer += "\n";
  for (var r = 0; r < img[0].length; r++) {
    var row = img[r];
    buffer += (r > 99) ? '   ' : ('   ' + r).slice(-3);
    for (var c = 0; c < row.length; c++) {
      var pix = row[c];
      buffer += (pix !== 1) ? ' .' : ' X';
    }
    buffer += '\n';
  }
  console.log(buffer);
}

var board = plot_rect_on_board(2,3,14,15);
render_entire_artboard(board);
console.log(coordinates_naive(board));
console.log(coordinates_smart(board));

/*
    0 1 2 3 4 5 6 7 8 9
  0 . . . . . . . . . .
  1 . . . . . . . . . .
  2 . . . . . . . . . .
  3 . . X X X X . . . .
  4 . . X X X X . . . .
  5 . . X X X X . . . .
  6 . . X X X X . . . .
  7 . . X X X X . . . .
  8 . . . . . . . . . .
  9 . . . . . . . . . .

{ x: 2, y: 3, w: 4, h: 5 }
{ x: 2, y: 3, w: 4, h: 5 }

*/
