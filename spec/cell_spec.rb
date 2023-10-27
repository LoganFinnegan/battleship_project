require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  it 'exists' do
    cell = Cell.new("B4")

    expect(cell).to be_a(Cell)
  end

  it "has a coordinate attribute" do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
  end

  it "has a ship attribute, empty by default" do
    cell = Cell.new("B4")

    expect(cell.ship).to eq(nil)
  end

  it "has an empty? method that checks if cell is empty" do
    cell = Cell.new("B4")

    expect(cell.empty?).to be true
  end

end
