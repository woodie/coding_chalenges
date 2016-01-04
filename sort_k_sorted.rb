#!/usr/bin/env ruby

require 'fc' # priority_queue_cxx

class Array
  def pq_sort(k)
    out = []
    x = 0
    min_heap = FastContainers::PriorityQueue.new(:min)
    k.times do
      min_heap.push(self[x], self[x]) if self.size > x
      x +=1
    end
    while self.size > x
      min_heap.push(self[x], self[x])
      out << min_heap.pop
      x +=1
    end
    while !min_heap.empty?
      out << min_heap.pop
    end
    out
  end
end

# two away from final position
input = [3,-1,2,6,4,5,8,7,9]

puts input.pq_sort(1).join(',')
puts input.sort.join(',')

__END__

-1,2,3,4,5,6,7,8,9
-1,2,3,4,5,6,7,8,9
