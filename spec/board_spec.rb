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

  it "can tell us if a coordinate is valid or not" do
    board = Board.new
    board.cells

    board.valid_coordinate?('A1')
    expect(board.valid_coordinate?('A1')).to be true
    board.valid_coordinate?('A5')
    expect(board.valid_coordinate?('A5')).to be false
  end
end
