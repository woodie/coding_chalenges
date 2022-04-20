#!/usr/bin/env ruby

require "time"

def fib(n)
  n <= 2 ? 1 : fib(n - 2) + fib(n - 1)
end

platform = RUBY_PLATFORM == "java" ? "jruby" : "ruby."

start = Time.now
fib(40)
puts "#{platform}.... #{(Time.now.to_f - start.to_f).round(6)} seconds"
