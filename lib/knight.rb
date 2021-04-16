# lib/knight.rb

require_relative('node')
require_relative('board')
require 'matrix'

# Behaves as the Knight piece in a game of chess
class Knight
  MOVES = [[1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [-1, 2], [2, -1], [-2, 1]].freeze

  attr_accessor :graph
  attr_reader :board

  def initialize
    @board = Board.new
    @graph = []
    @history = []
  end

  def knights_move(to, from)
    @graph << GraphNode.new(from) if @graph.empty? # Make the first node

    @graph.each do |node|
      move_piece(node) unless @history.include?(node) # Make new moves, don't overwrite old ones

      next if @history.include?(node)

      node.neighbors.each do |node|
        @graph = @graph.flatten.push(node) # arrays begin to nest, so it must be flattened each iteration
      end
      @history << node # Node will not run on recursion
    end

    find_parents_or_repeat(to, from)
  end

  private

  # Build a tree of possible moves
  def move_piece(from_node)
    MOVES.each do |move|
      new_move = Matrix[from_node.data.flatten] + Matrix[move] # Matrix addition > Array math

      next unless @board.valid_move?(new_move) # Move must be on the board

      new_node = GraphNode.new(new_move.to_a)
      from_node.add_edge(new_node)
      new_node.add_parent(from_node) # Data necessary to find path of the moveset
    end
  end

  # Run knights move if false, find parents if true
  def find_parents_or_repeat(to, from)
    last_move = graph_search(@graph[0], to)

    if last_move == false
      knights_move(to, from)
    else
      print_parents(last_move)
    end
  end

  # Search a tree for a correct move, if existing
  def graph_search(node, move, queue = [])
    return false if node.nil?
    return node if node.data.flatten == move

    node.neighbors.each { |neighbor| queue << neighbor } unless node.neighbors.empty?
    graph_search(queue.shift, move, queue)
  end

  # If correct, retrieve all parents of the correct position
  def print_parents(node, moveset = [])
    return "#{moveset} => #{node.data}" if node.parent.nil? # Base case: no more parents

    moveset << node.data.flatten

    print_parents(node.parent, moveset) # Find all parents
  end
end
