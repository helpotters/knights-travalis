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
    @graph << GraphNode.new(from) if @graph.empty?
    @graph.each do |node|
      move_piece(node) unless @history.include?(node)
      node.neighbors.each { |node| move_piece(node) } if @history.include?(node)
      @history << node
    end

    correct_move?(to, from)
  end

  private

  def move_piece(from_node)
    # Build a tree of possible moves
    MOVES.each do |move|
      # BUG: Dimension mismatch
      move_data = Matrix[from_node.data.transposeknights_travalis / lib / knight.rb] + Matrix[move]
      if valid_move?(move_data) # must be on the chess board
        new_node = GraphNode.new(move_data.to_a)
        from_node.add_edge(new_node)
      else
        next
      end
    end
  end

  def valid_move?(_move)
    true
  end

  def correct_move?(to, from)
    # TODO: Run knights move if false, find parents if true
    correct = depth_search_for_move?(@graph[0], to)
    if correct == true
      puts 'parents'
      print_parents
    else
      puts 'knight'
      knights_move(to, from)
    end
  end

  def depth_search_for_move?(node, correct, moves = 0)
    # TODO: Search a tree for a correct move, if existing
    return false if node.nil?
    return true if node.data == correct
    return false if node.neighbors.empty?

    puts 'search'
    node.neighbors.each do |neighbor|
      puts 'depth'
      depth_search_for_move?(neighbor, correct, moves += 1)
    end
  end

  def print_parents
    # TODO: If correct, retrieve all parents of the correct position
    p 'True'
  end
end
