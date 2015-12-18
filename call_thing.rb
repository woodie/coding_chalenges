#!/usr/bin/env ruby

"use strict";

class Thing
  attr_accessor :_actions
  def initialize
    self._actions = {};
  end
end

class Thing
  def add(name, funct)
    if self._actions.has_key?(name)
      self._actions[name] << funct
    else
      self._actions[name] = [funct]
    end
  end

  def call(name, value)
    0.upto(self._actions[name].size - 1) do |i|
      return self._actions[name][i].call(value)
    end
  end
end

x = Thing.new
x.add 'thing_1', lambda {|x| x}
x.add 'thing_1', lambda {|y| y + y}
x.add 'thing_2', lambda {|z| z.to_i - 1}
puts x.call 'thing_1', 'ooo'
puts x.call 'thing_1', 2
puts x.call 'thing_2', 'ooo'
puts x.call 'thing_2', 2

puts x.inspect

__END__

ooo
2
-1
1
#<Thing:0x007f80a40ba168 @_actions={
  "thing_1"=>[#<Proc:0x007f80a40ba0f0@./call_event.rb:29 (lambda)>,
  #<Proc:0x007f80a40ba050@./call_event.rb:30 (lambda)>],
  "thing_2"=>[#<Proc:0x007f80a40ba000@./call_event.rb:31 (lambda)>]}>
