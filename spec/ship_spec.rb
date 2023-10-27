require './lib/ship'

RSpec.describe Ship do
  it "exists" do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_a(Ship)
  end

  it "has readable attributes" do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.name).to eq("Cruiser")
    expect(cruiser.length).to eq(3)
    expect(cruiser.health).to eq(3)
  end

  it "checks if cruiser has sunk" do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.sunk?).to eq(false)
  end

  it "checks for hits" do
    cruiser = Ship.new("Cruiser", 3)

    cruiser.hit
# require 'pry'; binding.pry
    expect(cruiser.health).to eq(2)

    cruiser.hit
# require 'pry'; binding.pry
    expect(cruiser.health).to eq(1)
    expect(cruiser.sunk?).to eq(false)

    cruiser.hit

    expect(cruiser.sunk?).to eq(true)
  end
end
