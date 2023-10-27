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

  it "has a method to place a ship object" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    expect(cell.empty?).to be false
  end

  it "has a method that checks if ships been fired upon" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    expect(cell.fired_upon?).to be false
  end

  it "has a method that fires upon ship" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    cell.fire_upon

    expect(cell.ship.health).to eq(2)
    expect(cell.fired_upon?).to be true
  end
end
