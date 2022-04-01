# frozen_string_literal: true

require_relative 'player.rb'
require_relative 'board_game.rb'

def valid_sign?(input)
  input.length == 1
end

print 'Enter Player 1 Name: '
@name1 = gets.chomp
print 'Enter Sign: '
@sign1 = gets.chomp

until valid_sign?(@sign1)
  print 'Invalid sign, Try again: '
  @sign1 = gets.chomp
end

player1 = Player.new(@name1, @sign1)

print 'Enter Player 2 Name: '
@name2 = gets.chomp
while @name1 == @name2
  print 'This name is already taken Enter another name: '
  @name2 = gets.chomp
end

print 'Enter Sign: '
@sign2 = gets.chomp
while (@sign1 == @sign2) || !valid_sign?(@sign2)
  print 'Invalid sign. Enter another sign for youself: '
  @sign2 = gets.chomp
end

player2 = Player.new(@name2, @sign2)
puts "#{player1.name} and #{player2.name} are ready to go"

game = TicTacToe.new(player1, player2)
game.display_board
game.play
