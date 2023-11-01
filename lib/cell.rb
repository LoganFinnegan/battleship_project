
class Cell

  attr_accessor :coordinate,
                :ship,
                :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def sunk?
    if @health <= 0
      true
    else
      false
    end
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship_name)
    @ship = ship_name
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    return if @ship == nil
    @ship.hit
  end

  def render(default = false)
    if @ship == nil && fired_upon? == true
      "M"
    elsif @ship != nil && fired_upon? == true && @ship.sunk? == false
      "H"
    elsif @ship != nil && fired_upon? == true && @ship.sunk? == true
      "X"
    elsif default == true && @ship != nil && @ship.sunk? == false
      "S"
      else
      "."
    end
  end
end
