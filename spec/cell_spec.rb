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


  it "checks if cruiser has sunk" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    expect(cruiser.sunk?).to eq(false)
    cruiser.hit
    cruiser.hit
    cruiser.hit
    expect(cruiser.sunk?).to eq(true)
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

    it "can render the coordinate for the board" do
      cell_1 = Cell.new("B4")

      expect(cell_1.render).to eq('.')
      cell_1.fire_upon
      expect(cell_1.render).to eq('M')

      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)

      cell_2.place_ship(cruiser)
      expect(cell_2.render).to eq('.')
      expect(cell_2.render(true)).to eq('S')

      cell_2.fire_upon
      expect(cell_2.render).to eq('H')
      expect(cruiser.sunk?).to be false

      cruiser.hit
      cruiser.hit

      expect(cruiser.sunk?).to be true
      expect(cell_2.render).to eq('X')
    end
  end
