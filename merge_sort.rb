#!/usr/bin/env ruby

def merge_sort(array)
  if array.length <= 1
    array
  else
    mid = array.length / 2
    merge merge_sort(array[0...mid]), merge_sort(array[mid..-1])
  end
end

def merge(left, right)
  result = []
  while (left.length > 0 and right.length > 0) do
    result << (left.first <= right.first ? left.shift : right.shift)
  end
  result + left + right
end

data = [9,4,8,2,7,1,6,4,0,5,9,3,8,2,6,3,5,8,2,7,3,9,4,0,5]
puts "unsorted: #{data.join(",")}"
puts "sorted:   #{merge_sort(data).join(",")}"

__END__

unsorted: 9,4,8,2,7,1,6,4,0,5,9,3,8,2,6,3,5,8,2,7,3,9,4,0,5
sorted:   0,0,1,2,2,2,3,3,3,4,4,4,5,5,5,6,6,7,7,8,8,8,9,9,9
