# lib/node.rb

# Creates a node for a directed graph
class GraphNode
  attr_accessor :data, :neighbors, :parent

  def initialize(data)
    @data = data
    @neighbors = []
    @parent = nil
  end

  def add_edge(neighbor)
    @neighbors << neighbor
  end

  def add_parent(parent)
    @parent = parent
  end
end
