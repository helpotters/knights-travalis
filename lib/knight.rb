# lib/knight.rb
require_relative('./node')
require 'matrix'

# Behaves as the Knight piece in a game of chess
class Knight
  attr_accessor :root

  MOVES = [[1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [-1, 2], [2, -1], [-2, 1]].freeze
  def initialize
    @root = Node.new
  end

  # return how many moves it takes to get
  def knights_move(to, from, node = root)
    print_moves if is_there_a_match?(to)

    node.data = from
    print node.data

    move_piece
  end

  private

  # matrix addition to create every possible move at the current position
  def move_piece(node = root)
    MOVES.each_with_index do |_move, i|
      new_move = Matrix[node.data] + Matrix[MOVES[i]] # Movement by adding the matrices
      new_node = Node.new
      new_node.data = new_move.to_a
      node.add(new_node, i)
      new_node.data
    end
  end

  def is_there_a_match?(value, node = root)
    return false if node.nil?
    return true if node.data == value

    is_there_a_match?(node.one)
    is_there_a_match?(node.two)
    is_there_a_match?(node.three)
    is_there_a_match?(node.four)
    is_there_a_match?(node.five)
    is_there_a_match?(node.six)
  end

  def print_moves
    'ITS TRUE'
  end
end
