# frozen_string_literal: true

# class for player info
class Player
  attr_accessor :name, :icon

  def initialize(name, icon)
    @name = name
    @icon = icon
  end

  def print
    puts "Name : #{@name}, Icon : #{@icon}"
  end
end
