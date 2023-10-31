require './lib/ship'
require './lib/cell'
require './lib/board'

class Game
  attr_reader :player_board,
              :npc_board,
              :player_cruiser,
              :npc_cruiser,
              :player_submarine,
              :npc_submarine

  def initialize
    @player_board     = Board.new
    @npc_board        = Board.new
    @player_cruiser   = Ship.new("cruiser", 3)
    @npc_cruiser      = Ship.new("cruiser", 3)
    @player_submarine = Ship.new("submarine", 2)
    @npc_submarine    = Ship.new("submarine", 2)
  end

  def begin_game
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    input = gets.chomp.downcase
    if input == "p" 
      play
    elsif input == "q"
      exit
    end
    require 'pry'; binding.pry
  end


end