#!/usr/bin/env ruby

SIZE = 10 # board size

def coordinates_naive(img)
  x = y = w = h = nil
  img.each_with_index do |row,r|
    row.each_with_index do |pix,c|
      if pix == 1
        x = c if x.nil? 
        y = r if y.nil?
        w = c - x + 1
        h = r - y + 1
      end  
    end  
  end
  {x:x, y:y, w:w, h:h}
end

def coordinates_smart(img)
  img.each_with_index do |row,r|
    next unless row.include?(1)
    row.each_with_index do |pix,c|
      if pix == 1
        x = c
        y = r
        w = row.rindex(1) - x + 1
        y.upto(img.size) do |z|
          if z == img.size or !img[z].include?(1)
            h = z - r
            return {x:x, y:y, w:w, h:h}
          end
        end
      end  
    end  
  end
  nil # noithing found 
end

def plot_rect_on_board(x, y, w, h)
  height = (y + h) > SIZE ? (y + h) : SIZE
  board = Array.new(height) {Array.new(SIZE) {0}}
  y.upto(y + h - 1) do |one|
    x.upto(x + w - 1) do |two|
      board[one][two] = 1
    end
  end
  board
end

def render_entire_artboard(img)
  print "   "
  0.upto(img.first.size - 1) {|n| print n > 9 ? ' ' : " #{n}"}
  print "\n"
  img.each_with_index do |row,r|
    print r > 99 ? '   ' : r.to_s.rjust(3)
    row.each_with_index do |pix,c|
      print pix != 1 ? ' .' : ' X'
    end
    print "\n"
  end
end

board = plot_rect_on_board(2,3,4,5)
puts
render_entire_artboard board
puts
puts coordinates_naive board
puts coordinates_smart board

__END__

  0 1 2 3 4 5 6 7 8 9
0 . . . . . . . . . .
1 . . . . . . . . . .
2 . . . . . . . . . .
3 . . X X X X . . . .
4 . . X X X X . . . .
5 . . X X X X . . . .
6 . . X X X X . . . .
7 . . X X X X . . . .
8 . . . . . . . . . .
9 . . . . . . . . . .

{:x=>2, :y=>3, :w=>4, :h=>5}
{:x=>2, :y=>3, :w=>4, :h=>5}
