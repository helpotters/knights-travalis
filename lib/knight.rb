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
      move_piece(node) unless @history.include?(node)
      @history << node
      # node.neighbors.each { |node| @graph << node } unless node.neighbors.empty?
    end

    correct_move(to, from)
  end

  private

  # Build a tree of possible moves
  def move_piece(from_node)
    MOVES.each do |move|
      new_move = Matrix[from_node.data.flatten] + Matrix[move]

      next unless @board.valid_move?(new_move)

      new_node = GraphNode.new(new_move.to_a)
      from_node.add_edge(new_node)
      new_node.add_parent(from_node)
    end
  end

  # Run knights move if false, find parents if true
  def correct_move(to, from)
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
    return if queue.length == 1

    node.neighbors.each { |neighbor| queue << neighbor } unless node.neighbors.empty?
    graph_search(queue.shift, move, queue)
  end

  # TODO: If correct, retrieve all parents of the correct position
  def print_parents(node); end
end
