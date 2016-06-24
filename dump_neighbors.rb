#!/usr/bin/env ruby

class NeighborNode
  attr_accessor :label, :neighbors

  def initialize(label, neighbors=[])
    self.label = label
    self.neighbors = neighbors
  end

  #  1-2-3    (1,0)→ []          • return any suitable datatype
  #   \| |    (1,1)→ [2,4]       • order doesn't matter
  #    4-5-6  (1,2)→ [1,2,3,4,5] • results should be unique

  def self.get_neighborhood(node, depth=0)
    neighborhood = {}
    queue = node.neighbors
    depth.times do 
      queue.each {|z| neighborhood[z.label] = z}
      queue = []
      neighborhood.values.each do |sub|
        sub.neighbors.each do |z|
          queue << z unless neighborhood.has_key? z.label
        end
      end
    end
    neighborhood.values.sort_by {|e| e.label}
  end

  def print_neighborhood(depth)
    puts "#{self.label},#{depth} → #{
        NeighborNode.get_neighborhood(self, depth).map(&:label).inspect}"
  end
  
  def self.print_nodelist(nodes)
    nodes.each do |n|
      puts "#{n.label} → #{n.neighbors.map(&:label).inspect}"
    end
  end
end

# 1-2-3
#  \| |
#   4-5-6
nodes = 0.upto(6).map {|i| NeighborNode.new(i)}
nodes[1].neighbors = [nodes[2], nodes[4]]
nodes[2].neighbors = [nodes[1], nodes[3], nodes[4]]
nodes[3].neighbors = [nodes[2], nodes[4], nodes[5]]
nodes[4].neighbors = [nodes[1], nodes[2], nodes[5]]
nodes[5].neighbors = [nodes[3], nodes[4], nodes[6]]
# NeighborNode.print_nodelist(nodes)

nodes[1].print_neighborhood(0)
nodes[1].print_neighborhood(1)
nodes[1].print_neighborhood(2)

__END__

1,0 → []
1,1 → [2, 4]
1,2 → [1, 2, 3, 4, 5]
