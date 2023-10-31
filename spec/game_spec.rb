require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
  it "exits" do
    game = Game.new 

    expect(game).to be_a(Game)
  end

  it "has a menu display" do 
    game = Game.new

    expect(game.menu).to eq(String)
  end

  # it "can take user input" do
  #   game = Game.new 

  #   expect(game.user_input).to eq(?)
  # end
end

