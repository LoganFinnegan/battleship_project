require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end
  it "exists" do
    expect(@board).to be_a(Board)
  end

  it "can create a hash of 16 cells 4x4" do
    expect(@board.cells).to be_a(Hash)
  end

  it "has a valid coord" do
    expect(@board.valid_coordinate?("A1")).to eq(true)
    expect(@board.valid_coordinate?("D4")).to eq(true)
    expect(@board.valid_coordinate?("A5")).to eq(false)
    expect(@board.valid_coordinate?("E1")).to eq(false)
    expect(@board.valid_coordinate?("A22")).to eq(false)
  end

  describe "#valid_placement?" do
    it "has the same length" do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
      expect(@board.same_length?(@cruiser, ["A1", "A2"])).to eq(false)
    end

    context "consecutive coordinates" do
      it "is vertical" do
        expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
        expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
        expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
        expect(@board.vertical?(["A1", "A2", "A3"])).to eq(true)
      end

      it "is horizontal" do
        expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
        expect(@board.horizontal?(["A3", "B3", "C3"])).to eq(true)
      end

      it "can't be diagonal" do
        expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
        expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq(false)
      end

      it "has valid placement" do
        expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq(true)
        expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq(true)
      end
    end
  end

  it "can place a ship on multiple coordinates" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    expect(cell_3.ship).to eq(cell_2.ship)
  end
end
