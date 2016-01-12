#!/usr/bin/env ruby

class Array
  def go_flat
    flat = self.clone
    i = 0
    while (i < flat.length)
      if flat[i].is_a?(Array)
        if flat[i].empty?
          flat.delete_at(i)
        else
          tmp = flat[i].clone
          flat[i] = tmp.shift
          flat.insert(i + 1, tmp) unless tmp.empty?
        end
      else
        i +=1
      end
    end
    flat
  end
end

input = [1,2,3,4,[2,34],[],[23,[232,23,[1]]]]

puts input.inspect
puts input.flatten.inspect
puts input.inspect
puts input.go_flat.inspect
puts input.inspect

__END__

[1, 2, 3, 4, [2, 34], [23, [232, 23, [1]]]]
[1, 2, 3, 4, 2, 34, 23, 232, 23, 1]
[1, 2, 3, 4, [2, 34], [23, [232, 23, [1]]]]
[1, 2, 3, 4, 2, 34, 23, 232, 23, 1]
[1, 2, 3, 4, [2, 34], [23, [232, 23, [1]]]]
