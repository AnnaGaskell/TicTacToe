require 'player'
# class for board play

class BoardGame
  def initialize(player1, player2)
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @player1 = player1
    @player2 = player2
  end

  def display_board
    puts "  #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts ' ---+---+---'
    puts "  #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts ' ---+---+--- '
    puts "  #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def turn
    print "Choose a number between 1 - 9"
    position = gets.chomp.to_i
    position -= 1
    @board[position] = player.icon
  end

  def play
    @turn_count = 0
    until over?
    @turn_count += 1
    turn
  end
  print "Game Over "

  def check_winner
  end

  def announce_winner
  end

  def play_again
  end
end