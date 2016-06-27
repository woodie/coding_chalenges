#!/usr/bin/env python

import decimal

# Calculate the number of coins of each type required to make up the change:
coin_types = [0.01, 0.1, 0.25, 1, 3, 4]
# This is variable, each vending machine could have different coinTypes

def get_change(amount):
  coins = {}
  unit = len(coin_types) - 1
  while amount > 0:
    coin = coin_types[unit]
    key = str(coin)
    if coin <= amount:
      coins[key] = (coins[key] + 1) if (key in coins) else 1
      amount = round(amount - coin, 2)
    else:
      unit -= 1
  return coins

print "1.00: ", get_change(1)
print "2.35: ", get_change(2.35)
print "6.00: ", get_change(6)

"""

1.00:  {'1': 1}
2.35:  {'1': 2, '0.25': 1, '0.1': 1}
6.00:  {'1': 2, '4': 1}

"""
