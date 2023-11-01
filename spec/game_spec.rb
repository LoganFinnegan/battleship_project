require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
  it "exits" do
    game = Game.new

    expect(game).to be_a(Game)
  end

  it "has some attributes" do
    game = Game.new

    expect(game.player_board).to be_a(Board)
    expect(game.npc_board).to be_a(Board)
    expect(game.player_cruiser).to be_a(Ship)
    expect(game.npc_cruiser).to be_a(Ship)
    expect(game.player_submarine).to be_a(Ship)
    expect(game.npc_submarine).to be_a(Ship)
  end
end
