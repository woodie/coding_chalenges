#!/usr/bin/env ruby

1.upto(100) do |i|
  out = ''
  out << 'Fizz' if i % 3 == 0
  out << 'Buzz' if i % 5 == 0
  puts out.empty? ? i : out
end

__END__
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
...
