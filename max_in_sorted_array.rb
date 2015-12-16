#!/usr/bin/env ruby

data = (1..17).to_a.rotate!(3)

def find_max(a)
  return a.last if a.first <= a.last
  pivot = a.size / 2
  if a[pivot] > a.last
    return find_max(a[pivot..-1])
  else
    return find_max(a[0..(pivot - 1)])
  end
end

puts "input: #{data.join(',')}"
puts "max: #{find_max(data)}"

__END__

input: 4,5,6,7,8,9,10,11,12,13,14,15,16,17,1,2,3
max: 17
