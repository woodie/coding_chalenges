#!/usr/bin/env typescript

function fib(n: number) {
  if (n <= 2) return 1;
  return fib(n-1) + fib(n-2);
}

const start = Date.now();
fib(40);
const millis = Date.now() - start;
console.log(`ts....... ${(millis / 1000).toFixed(6)} seconds`);
