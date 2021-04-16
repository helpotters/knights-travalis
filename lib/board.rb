# lib/board.rb

class Board
  def initialize
    @matrix =
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0]
  end

  def valid_move?(move)
    # is [x, y] between 8, 8 and 0, 0
    move = move.to_a.flatten
    case move <=> [8, 8] && move <=> [0, 0]
    when 0
      true
    when 1
      true
    when -1
      false
    end
  end
end
