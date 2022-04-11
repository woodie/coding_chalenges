#!/usr/bin/env node

// Given an array of integers nums and an integer target,
// return values of the two numbers such that they add up to target.

// You may assume that each input would have exactly one solution,
// and you may not use the same element twice.

function complement(nums, target) {
  console.log(`# Given nums ${nums} and target ${target}`);
  let complements = new Set();
  for (let num of nums) {
    let cmp = target - num;
    if (complements.has(cmp)) return [cmp, num];
    complements.add(num);
  }
  return [];
}

console.log(JSON.stringify(complement([2, 7, 11, 15], 9)));

// Input: nums = [2,7,11,15], tatget = 9
// Output: [2,7]
