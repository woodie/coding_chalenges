#!/usr/bin/env ruby

# Init with field size and location/direction.
# Accept commands to M(ove) and rotate L(eft) and R(ight).
# Ignore commands to move off the field.

class Rover
  attr_accessor :w, :h, :x, :y, :d, :field
  DIR = %w[N E S W]
  CUR = %W[▲ ▶ ▼ ◀]

  def initialize(w, h, x, y, c)
    self.w = w
    self.h = h
    self.x = x
    self.y = y
    self.d = DIR.index(c) || 0
    self.field = Array.new(h) { Array.new(w) { "." } }
    plot
    puts " #{x} #{y} (#{DIR[d]})"
  end

  def move(cmd)
    cmd.each_char do |c|
      if c == "M"
        if d == 0 && y < h - 1 # N
          self.y += 1
        elsif d == 1 && x < w - 1 # E
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
      plot
    end
    puts " #{cmd}\n #{x} #{y} (#{DIR[d]})"
    show
  end

  def plot
    field[y][x] = CUR[d]
  end

  def show
    print "\n"
    (h - 1).downto(0) do |r|
      print r > 9 ? r.to_s : " #{r}"
      0.upto(w - 1) do |c|
        print " #{field[r][c]}"
      end
      print "\n"
    end
    print "  "
    0.upto(field.first.size - 1) { |n| print " #{n % 10}"}
    print "\n\n"
  end
end

rover = Rover.new(5, 5, 1, 1, "N")
rover.move("MLMMMMMRMRMMMMMMMRMM")

__END__

 1 1 (N)
 MLMMMMMRMRMMMMMMMRMM
 4 1 (S)

 4 . . . . .
 3 ▶ ▶ ▶ ▶ ▼
 2 ▲ ◀ . . ▼
 1 . ▲ . . ▼
 0 . . . . .
   0 1 2 3 4
