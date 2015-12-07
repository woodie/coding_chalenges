#!/usr/bin/env ruby

# when sorting is too expensive or not allowed
s1 = "dkfoekfhcms_Figjekcjvnskwhfjjdje_"
s2 = "diwjrhfkehdjfjsodhfjdkdhfjfnskwjf"
s3 = "Figjekcjvnskwhfjjdje_dkfoekfhcms_"

def is_permutation(str1, str2)
  return false if str1.size != str2.size
  letters = Array.new(128) {0}
  str1.each_byte do |c|
    letters[c] += 1
  end
  str2.each_byte do |c|
    letters[c] -= 1
    return false if letters[c] < 0
  end
  true
end

puts
puts [s1, s2, s3]
puts "is permutation: #{is_permutation(s1, s2)}"
puts "is permutation: #{is_permutation(s1, s3)}"

__END__

dkfoekfhcms_Figjekcjvnskwhfjjdje_
diwjrhfkehdjfjsodhfjdkdhfjfnskwjf
Figjekcjvnskwhfjjdje_dkfoekfhcms_
is permutation: false
is permutation: true
