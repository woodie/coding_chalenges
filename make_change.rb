#!/usr/bin/env ruby

# Calculate the number of coins of each type required to make up the change:
$coin_types = [0.01, 0.1, 0.25, 1, 3, 4]
# This is variable, each vending machine could have different coinTypes

def get_change(amount)
  coins = {}
  unit = $coin_types.length - 1
  while amount > 0
    coin = $coin_types[unit]
    key = coin.to_s
    if coin <= amount
      coins[key] = coins.has_key?(key) ? coins[key] + 1 : 1
      amount = (amount - coin).round(2)
    else
      unit -=1
    end
  end
  coins
end

puts "1.00: #{ get_change(1) }"
puts "2.35: #{ get_change(2.35) }"
puts "6.00: #{ get_change(6) }"

__END__

1.00: {"1"=>1}
2.35: {"1"=>2, "0.25"=>1, "0.1"=>1}
6.00: {"4"=>1, "1"=>2}
