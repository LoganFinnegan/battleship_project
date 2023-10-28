require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  it "exists" do
    board = Board.new

    expect(board).to be_a(Board)
  end

  it "can create a hash of 16 cells 4x4" do
    board = Board.new
    
    expect(board.cells).to be_a(Hash)
  end
end
