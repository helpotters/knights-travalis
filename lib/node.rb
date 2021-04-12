# lib/node.rb

class Node
  attr_accessor :data, :one, :two, :three, :four, :five, :six

  def initialize
    @one = nil
    @two = nil
    @three = nil
    @four = nil
    @five = nil
    @six = nil
    @data = nil
  end

  def add(node, index)
    case index
    when 1
      one = node
    when 2
      two = node
    when 3
      three = node
    when 4
      four = node
    when 5
      five = node
    when 6
      six = node
    end
  end
end
