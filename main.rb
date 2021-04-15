#!/usr/bin/env ruby
require_relative('./lib/board')
require_relative('./lib/knight')

board = Board.new
knight = Knight.new
knight.knights_move([0, 0], [2, 1])
knight2 = Knight.new
knight2.knights_move([0, 2], [4, 8])
