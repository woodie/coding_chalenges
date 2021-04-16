#!/usr/bin/env node

// return the index of first pairs that add up to target
function complementary_pair(target, data) {
  const memo = {}
  for (var idx = 0; idx < data.length; idx++) {
    let num = data[idx];
    if (num >= target) continue;
    com = target - num;
    memo[com] = idx;
    if(memo.hasOwnProperty(num)) {
      if (memo[num] == idx) continue;
      return `${com} + ${num} = ${target} at [${memo[num]},${idx}] of [${data}]`
    }
  }
}

console.log(complementary_pair(8, [4, 3, 9, 2, 5, 7, 2, 6]));

// 3 + 5 = 8 at [1,4] of [4,3,9,2,5,7,2,6]

