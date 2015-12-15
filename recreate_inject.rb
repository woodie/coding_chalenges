#!/usr/bin/env ruby

# create a simplified implimentation of inject

class Array
  def myject(&block)
    return if self.empty?
    m = self.first.is_a?(Fixnum) ? 0 : self.first.class.new
    self.each {|c| m = block.call(m, c)}
    m
  end
end

puts %w{a b c d e f}.inject {|m,c| m + c}
puts %w{a b c d e f}.myject {|m,c| m + c}
puts [1, 2, 3, 4, 5].inject {|m,c| m + c}
puts [1, 2, 3, 4, 5].myject {|m,c| m + c}
puts [].inject {|m,c| m + c}
puts [].myject {|m,c| m + c}

__END__

abcdef
abcdef
15
15
