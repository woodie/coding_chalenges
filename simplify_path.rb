#!/usr/bin/env ruby

def simplify_iterative(path)
  stack = []
  grounded = false
  if path[0] == '/'
    stack.push('')
    grounded = true
  end
  dirs = path.split('/')
  while dirs.length > 0
    dir = dirs.shift
    if dir == '.' or dir == ''
      # no-op
    elsif dir == '..'
      if (grounded == true)
        stack.pop()
      else
        stack.push(dir)
      end
    else
      grounded = true
      stack.push(dir)
    end
  end
  if path[-1] == '/'
    stack.push('')
  end
  return stack.join('/')
end

path_1 = '/usr/lib/../bin/gcc'
path_2 = 'sctipts//./../scripts/awkscripts/././'
path_3 = '../../export/workspace/../goodies/'

puts simplify_iterative path_1
puts simplify_iterative path_2
puts simplify_iterative path_3

__END__

/usr/bin/gcc
scripts/awkscripts/
../../export/goodies/
