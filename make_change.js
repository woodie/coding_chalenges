#!/usr/bin/env node

//Calculate the number of coins of each type required to make up the change:
var coinTypes = [ 0.01, 0.1, 0.25, 1, 3, 4];
//This is variable, each vending machine could have different coinTypes

function getChange(amount) {
  var coins = {};
  var unit = coinTypes.length - 1;
  while (amount > 0) {
    var coin = coinTypes[unit];
    if (coin <= amount) {
      coins[coin] = typeof coins[coin] == 'undefined' ? 1 : coins[coin] + 1;
      amount = Math.round((amount - coin) * 100)/100;
    } else {
      unit--;
    }
  }
  return coins;
}

console.log('1.00:', getChange(1));
console.log('2.35:', getChange(2.35));
console.log('6.00:', getChange(6));

/*

1.00: { '1': 1 }
2.35: { '1': 2, '0.25': 1, '0.1': 1 }
6.00: { '1': 2, '4': 1 }

*/
