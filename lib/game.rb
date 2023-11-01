require './lib/ship'
require './lib/cell'
require './lib/board'
#require 'colorize' #(gem install colorize)

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
    puts "+++++++++++++++++++++++++++++++++++++++++"#.yellow
    puts "Welcome to BATTLESHIP, Ahoy, Commander!!!"#.red
    puts "°º¤ø,..,ø¤º°`°º¤ø,.,ø¤°º¤ø,..,ø¤º°`°º¤ø,."#.blue
    puts " ><>  ><>  ><>  ><>   ><>  ><>  ><>  ><> "#.grey
    puts "    Enter p to play. Enter q to quit.    "
    input = gets.chomp.downcase
    if input == "p"
      puts "Ready your forces, Commander, Gah-Yarrr!"#.red
      sleep(1)
      setup
    elsif input == "q"
      puts "See you next time, Commander!"#.red
      exit
    else
      puts "Input ivalid, try again."#.red
      begin_game
    end
  end

  def setup
    @player_board = Board.new
    @computer_board = Board.new
    @player_board.create_cells
    @computer_board.create_cells
    npc_place_ship(@npc_submarine)
    npc_place_ship(@npc_cruiser)
    prompt_player
    print @player_board.render(true)
    player_place_ship(@player_submarine)
    player_place_ship(@player_cruiser)
    print @player_board.render(true)
    until @player_cruiser.sunk? && @player_submarine.sunk? || npc_cruiser.sunk? && npc_submarine.sunk?
    puts "Enemy fire incoming!!!"#.red
    puts "~~~~~~~~~~~~~~~~~~~~~~"#.blue
    sleep(2)
    npc_fire
    print @player_board.render(true)
    sleep(1)
    puts "Player turn now, awaiting coordinate!"#.red
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"#.blue
    sleep(0.5)
    print @npc_board.render
    player_fire
    end
    if @player_cruiser.sunk? && @player_submarine.sunk?
      puts "Game Over.. YOU LOSE!!!"#.red
      print @player_board.render
      puts "=X=X=X=X=X=X=X=X=X=X=X="#.red
      puts "X=X=X=X=X=X=X=X=X=X=X=X"#.red
      puts "=X=X=X=X=X=X=X=X=X=X=X="#.red
    else
      puts "COMMANDER! YOU HAVE WON THE BATTLE!!!"#.red
      print @npc_board.render
      puts "====================================="#.green
      puts "====================================="#.green
      puts "====================================="#.green
    end
    begin_game
  end

  def player_fire
    input = gets.chomp.upcase
    if @npc_board.cells.keys.include?(input) && @npc_board.cells[input].fired_upon? == false
      @npc_board.cells[input].fire_upon
      if @npc_board.cells[input].empty?
        puts "\nFire again, my liege! You have missed the target."#.red
      elsif @npc_board.cells[input].ship.sunk?
        puts "\nYOU HAVE SUNK AN ENEMY SHIP!!!"#.red
      elsif !@npc_board.cells[input].ship.sunk? && !@npc_board.cells[input].empty?
        puts "\nYou have struck an enemy ship!"#.red
      end
    elsif @npc_board.cells.keys.include?(input) && @npc_board.cells[input].fired_upon? == true
      puts "\nYou have already fired upon that coordinate, my liege! Try again."#.red
      player_fire
    else
      puts "Invalid coordinate, Sir."#.red
      player_fire
    end
  end

  def npc_fire
    random_cell = @player_board.cells.keys.sample
    until @player_board.cells[random_cell].fired_upon? == false
      random_cell = @player_board.cells.keys.sample
    end
      @player_board.cells[random_cell].fire_upon
    if @player_board.cells[random_cell].empty?
      puts "\nThe enemy missed!"#.red
    elsif @player_board.cells[random_cell].ship.sunk?
      puts "\nThe enemy sunk your ship!"#.red
    else
      puts "\nThe enemy struck your ship!"#.red
    end
  end

  def npc_place_ship(ship)
    random_coordinates = @npc_board.cells.keys.sample(ship.length)
    until @npc_board.valid_placement?(ship, random_coordinates)
      random_coordinates = @npc_board.cells.keys.sample(ship.length)
    end
    @npc_board.place(ship, random_coordinates)
  end

  def prompt_player
    puts "Enemy ships be lurking abouts.\nPick your two finest ships from the fleet.\nThe Cruiser is three units long and the Submarine is two units long.\n"#.red
  end

  def player_place_ship(ship)
    puts "Enter the squares for the #{ship.name} (#{ship.length} spaces):"#.red
    input = gets.chomp.upcase.split(' ')
    until @player_board.valid_placement?(ship, input) #&& @npc_board.cells.keys.include?(input)
      puts "Invalid entry. Please try again."#.red
      input = gets.chomp.upcase.split(' ')
    end
    @player_board.place(ship, input)
  end
end
