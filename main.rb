#!/usr/bin/env ruby
require_relative('./lib/board')
require_relative('./lib/knight')
board = Board.new
knight = Knight.new
knight.knights_move([0, 0], [2, 4])
puts 'Try again'
knight.knights_move([0, 0], [8, 8])
puts 'Try again'
knight.knights_move([0, 0], [2, 1])
