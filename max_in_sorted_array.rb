data = (1..9).to_a.rotate!.rotate!.rotate!

def find_max(a)
  return a.first if a.size == 1
  return a.last if a.first < a.last
  pivot = a.size / 2
  if a[pivot] > a.last
    find_max(a[pivot..-1])
  else
    find_max(a[0..(pivot - 1)])
  end
end

puts data.inspect
puts find_max(data)

__END__

[4, 5, 6, 7, 8, 9, 1, 2, 3]
9
