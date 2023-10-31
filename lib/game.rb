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
      puts "Ready your forces, Commander."
      sleep(0)
      play
    elsif input == "q"
      puts "See you next time, Commander!"
      exit
    else
      puts "Input ivalid, try again."
      begin_game
    end
  end

  def play
    npc_place_ship(@npc_submarine)
    npc_place_ship(@npc_cruiser)
    prompt_player
    print @player_board.render
    player_place_ship(@player_submarine)
    player_place_ship(@player_cruiser)
  end

  def npc_place_ship(ship)
    random_coordinates = @npc_board.cells.keys.sample(ship.length)
    until @npc_board.valid_placement?(ship, random_coordinates)
      random_coordinates = @npc_board.cells.keys.sample(ship.length)
    end
    @npc_board.place(ship, random_coordinates)
  end

  def prompt_player
    puts "I have laid out my ships on the grid.\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long.\n"
  end

  def player_place_ship(ship)
    puts "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
    input = gets.chomp.upcase.split(' ')
    until @player_board.valid_placement?(ship, input)
      puts "Invalid entry. Please try again."
      input = gets.chomp.upcase.split(' ')
    end
    @player_board.place(ship, input)
  end
end
