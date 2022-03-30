# frozen_string_literal: true

require 'player'
require 'board_game'
# need
# name and sign for player (x or o)
# display the changing board with inputs
# win draw or lose options/display
# can only input one spot once
# end game
# print out steps/instructions/result

# create a player
# create a board
# create game function

# methods for game
class TicTacToe < BoardGame
  WIN_COMBOS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [6, 4, 2],
    [0, 4, 8]
  ].freeze

  def welcome
    puts 'Tic Tac Toe'
    print 'Enter Player 1 Name'
    @name1 = gets.chomp
    puts ' '
    print 'Enter Player 2 Name'
    @name2 = gets.chomp
    puts ' '
  end
end
