# frozen_string_literal: true

require 'player'

# class for board play
class BoardGame
  def initialize(player1, player2)
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @player1 = player1
    @player2 = player2
  end

  def display_board(board)
    puts "  #{board[0]} | #{board[1]} | #{board[2]} "
    puts ' ---+---+---'
    puts "  #{board[3]} | #{board[4]} | #{board[5]} "
    puts ' ---+---+--- '
    puts "  #{board[6]} | #{board[7]} | #{board[8]} "
  end

  display_board(board)

  def input_to_index(user_input)
    user_input = gets.chomp.to_i - 1
  end

  def move(board, index, player)
    board[index] = player
  end

  def position_taken?(board, index)
    return false if (board[index] == ' ' || (board[index] == '') || board[index] == nil)
  rescue
    else
      return true
    end
  end

  def valid_move?(board, index)
    if index.between?(0, 8) && !position_taken?(board, index)
      return true
    end
  end

  def turn_count(board)
    counter = 0
    board.each do |spaces|
      if spaces == 'X' || spaces == 'O'
        counter += 1
      end
    end
    counter
  end

  def current_player(board)
    turn_count(board) % 2 == 0? 'X' : 'O'
  end

  def play(board)
    until over?(board)
      turn(board)
    end
    if won?(board)
      winner(board) == 'X' || winner(board) == '0'
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      put 'Draw, Try Again?'
    end
  end

  def turn(board)
    puts 'Choose number between 1 - 9:'
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(board, index)
      move(board, index, current_player)
      turn(board)
    end
    display_board(board)
  end
end