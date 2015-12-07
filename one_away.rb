#!/usr/bin/env ruby

def one_edit_away(s1, s2)
  if s1.size == s2.size
    one_edit_replace(s1, s2)
  elsif s1.size + 1 == s2.size
    one_edit_insert(s1, s2)
  elsif s2.size + 1 == s1.size
    one_edit_insert(s2, s1)
  else
    false
  end
end

def one_edit_replace(s1, s2)
  found_difference = false
  0.upto(s1.size - 1) do |i|
    if s1[i] != s2[i]
      return false if found_difference
      found_difference = true
    end
  end
  true
end

def one_edit_insert(s1, s2)
  x1 = x2 = 0
  while x1 < s1.size and x2 < s2.size
    if s1[x1] != s2[x2]
      return false if x1 != x2
    else
      x1 += 1
    end
    x2 += 1
  end
  true
end

puts one_edit_away('pale', 'ple')   # true
puts one_edit_away('pale', 'pales') # true
puts one_edit_away('pale', 'bale')  # true
puts one_edit_away('pale', 'base')  # false
puts one_edit_away('pale', 'bae')   # false
puts one_edit_away('pale', 'le')    # false
