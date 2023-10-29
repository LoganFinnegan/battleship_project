
class Cell
  attr_reader :ship

  attr_accessor :coordinate


  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
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
    if @coordinate == 'M' || @coordinate == 'H' || @coordinate == 'X'
      true
    else @coordinate == '.' || @coordinate == 'S'
      false
    end
  end

  def fire_upon
    if @ship != nil && @ship.health > 0
      @ship.hit
      @coordinate = 'H'
    elsif @ship == nil
      @coordinate = 'M'
    elsif @ship != nil && @ship.health <= 1
      @ship.hit
      @coordinate = 'X'
    end
  end

  def render(default = false)
    if @ship == nil && @coordinate == 'M'
      @coordinate = 'M'
    elsif default == true
      @coordinate = 'S'
    elsif @ship != nil && @ship.health < @ship.length && @ship.health > 0
      @coordinate = 'H'
    elsif @ship == !nil && @ship.health == 0 && @coordinate == 'X' || @coordinate == 'H'
      @coordinate = 'X'
    else
      @coordinate = '.'
    end
  end
end
