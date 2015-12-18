#!/usr/bin/env node

"use strict";

var Thing = function() {
  this._actions = {};
}

Thing.prototype.add = function(name, funct) {
  if(this._actions[name]) {
    this._actions[name].push(funct);
  } else {
    this._actions[name] = [funct];
  }
}

Thing.prototype.call = function(name, value) {
  for (var i = 0, f; (f = this._actions[name][i]); i++) {
    f(value);
  }
}

var x = new Thing;
x.add('thing_1', function(x){console.log(x)});
x.add('thing_1', function(y){console.log(y + y)});
x.add('thing_2', function(z){console.log(z - 1)});
x.call('thing_1', 'ooo');
x.call('thing_1', 2);
x.call('thing_2', 'ooo');
x.call('thing_2', 2);

console.log(x);

/*

ooo 
oooooo 
2 
4 
NaN
1 
Object { 
  _actions: Object {
  thing_1: [ [Function], [Function] ],
  thing_2: [ [Function] ] } } 

*/
