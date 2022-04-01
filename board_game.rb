# frozen_string_literal: true

require_relative 'player.rb'

# class for board play
class BoardGame
  def initialize(player1, player2)
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @player1 = player1
    @player2 = player2
  end

  def reset_board
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def display_board
    puts "  #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts ' ---+---+---'
    puts "  #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts ' ---+---+--- '
    puts "  #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position_taken?(input)
    @board[input] != ' '
  end

  def valid_move?(input)
    input.between?(0, 8) && !position_taken?(input)
  end

  def turn
    @current_player = @turn_count.odd? ? @player1 : @player2
    print "#{@current_player.name}, Please choose a number between 1 - 9: "
    position = gets.chomp.to_i
    position -= 1
    if valid_move?(position)
      @board[position] = @current_player.sign
    else
      puts 'Invalid position or input'
      turn
    end
  end

  def play
    @turn_count = 0
    until over?
      @turn_count += 1
      turn
      display_board
    end
    print 'Game Over '

    if won?
      puts " Congratulations #{@current_player.name}, You Won!"
    else
      puts 'Draw Game, Better Luck Next Time!'
    end
    play_again
  end

  def play_again
    puts 'Play Again? press Y/N'
    key = gets.chomp
    if %w[Y y].include?(key)
      reset_board
      play
    else
      puts 'See you next time!'
    end
  end
end

# class TicTacToe
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

  def draw?
    !won? && full?
  end

  def full?
    @turn_count == 9
  end

  def won?
    WIN_COMBOS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]] &&
        position_taken?(combo[0])
    end
  end

  def over?
    won? || full? || draw?
  end
end
