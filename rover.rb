#!/usr/bin/env ruby

class Field
  attr_accessor :w, :h, :x, :y, :d
  DIR = %w[N E S W]

  def initialize(w, h, x, y, c)
    self.w = w
    self.h = h
    self.x = x
    self.y = y
    self.d = DIR.index(c) || 0
    # puts "#{x} #{y} (#{DIR[d]})"
  end

  def move(cmd)
    cmd.each_char do |c|
      if c == "M"
        if d == 0 && y < h # N
          self.y += 1
        elsif d == 1 && x < w # E
          self.x += 1
        elsif d == 2 && y > 0 # S
          self.y -= 1
        elsif d == 3 && x > 0 # W
          self.x -= 1
        end
      elsif c == "L"
        self.d = d == 0 ? 3 : d - 1
      elsif c == "R"
        self.d = d == 3 ? 0 : d + 1
      end
      # puts "#{c}: #{x} #{y} #{DIR[d]}"
    end
    puts "#{x} #{y} (#{DIR[d]})"
  end
end

field = Field.new(5, 5, 1, 2, "N")

puts field.move("MLMRML")
