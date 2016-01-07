#!/usr/bin/env ruby

list = %w(Adam Brett Cari Donna Ethan Fred Grok Han Izzy Jay)
columns = 3

def tableify(list, columns)
  rows = (list.length.to_f / columns).ceil
  result = Array.new(rows) {[]}

  list.length.times do |i|
    result[i % rows] << list[i]
  end
  result
end

puts tableify(list, columns).inspect.gsub(', [',",\n [")
 
__END__

[["Adam", "Ethan", "Izzy"],
 ["Brett", "Fred", "Jay"],
 ["Cari", "Grok"],
 ["Donna", "Han"]]
