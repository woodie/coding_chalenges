#!/usr/bin/env ruby

def get_nodes(list)
  hash = {}
  list.each do |elem|
    hash[elem[:parent_id]] = [] unless hash.has_key? elem[:parent_id]
    hash[elem[:parent_id]] << elem
  end
  hash
end

def nice_print(hash, list=nil, level=0)
  list = hash[0] if list.nil?
  list.each do |elem|
    puts ('  ' * level) + elem[:value]
    nice_print(hash, hash[elem[:id]] || [], level + 1)
  end
end

arr = []
p = [0,0,0,0,1,1,1,2,2,2,3,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10]
1.upto(26) do |i|
  arr << {parent_id: p[i], id: i, value: (i + 64).chr}
end

nice_print get_nodes(arr)

__END__

A
  D
    M
    N
  E
    O
    P
  F
    Q
    R
B
  G
    S
    T
  H
    U
    V
  I
    W
    X
C
  J
    Y
    Z
  K
  L
