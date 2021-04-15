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
      node.neighbors.each { |node| move_piece(node) } if @history.include?(node)
      @history << node
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
    last_move = tree_search(@graph[0], to)

    if last_move == false
      knights_move(to, from)
    else
      print_parents(last_move)
    end
  end

  # TODO: Search a tree for a correct move, if existing
  def tree_search(node, move, queue = [])
    return node if node.data == move

    until node.nil?
      queue << node.neighbors
      tree_search(queue.shift, move, queue)
    end
  end

  # TODO: If correct, retrieve all parents of the correct position
  def print_parents(nodes)
    nodes.each { |node| puts "node data: #{node.data}" }
    moves = 0
    nodes.each { |_node| moves += 1 }

    "it took #{moves} moves."
  end
end
