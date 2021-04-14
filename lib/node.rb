# lib/node.rb

# Creates a node for a directed graph
class GraphNode
  attr_accessor :data, :neighbors

  def initialize(data)
    @data = data
    @neighbors = []
  end

  def add_edge(neighbor)
    @neighbors << neighbor
    p @neighbors.length
  end
end
