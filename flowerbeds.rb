#!/usr/bin/env ruby

# Given the following array of flower plots, determine where a new flower can be planted.
# Every 1 represents a flower, every 0 represents a plot, flowers can ONLY be planted when there
# isn't one in the adjacent plot. In the following example indexes 2 and 6 can be planted.

class FlowerPlanter
  attr_accessor :plots
  def initialize(plots)
    self.plots = plots
  end
  def plant
    plots.length.times do |i|
      if plots[i - 1] != 1 and plots[i] == 0 and plots[i + 1] != 1
        plots[i] = 1
        i +=1
      end
    end
    puts plots.join(',')
  end
end

flowers = [1, 0, 0, 0, 1, 0, 0, 0]
puts flowers.join(',')
flowerBed = FlowerPlanter.new(flowers)
flowerBed.plant # [1, 0, 1, 0, 1, 0, 1, 0]

nine = [0, 0, 0, 0, 0, 0, 0, 0, 0]
puts nine.join(',')
emptyBed = FlowerPlanter.new(nine)
emptyBed.plant # [1, 0, 1, 0, 1, 0, 1, 0, 1]


# Given these two arrays, reorganize them in this explicit format.
# Pay attention to the way this array is being sorted, and the
# movement of the pointer from front to back.

one_arr = ["a","b","c","d","e","f"] # ["f","a","e","b","d","c"]
two_arr = [1, 2, 3, 4, 5, 6, 7]     # [7, 1, 6, 2, 5, 3 ]

def re_org(arr)
  out = []
  pivot = arr.length / 2
  pivot.times do |i|
    out.push(arr[arr.length - (i + 1)])
    out << arr[i]
  end
  out << arr[pivot] if arr.length % 2 != 0
  puts out.join(',')
end

puts one_arr.join(',')
re_org(one_arr)
puts two_arr.join(',')
re_org(two_arr)

__END__

1,0,0,0,1,0,0,0
1,0,1,0,1,0,1,0
0,0,0,0,0,0,0,0,0
1,0,1,0,1,0,1,0,1
a,b,c,d,e,f
f,a,e,b,d,c
1,2,3,4,5,6,7
7,1,6,2,5,3,4
