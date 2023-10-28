
class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    ship = nil
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
    if @ship.hits > 0
      true
    else
      false
    end
  end

  def fire_upon
    if @ship != nil && @ship.health > 0
      @ship.hit
      @coordinate = 'H'
    elsif @ship == nil
      @coordinate = 'M'
    end
  end

  def render(default = false)
    if @ship == nil && @coordinate == 'M'
      @coordinate = 'M'
    elsif default == true
      @coordinate = 'S'
    elsif @ship != nil && @ship.health < 3 && @ship.health > 0
      @coordinate = 'H'
    elsif @health == 0 && @hits == 3 && @coordinate == 'H'
      @coordinate = 'X'
    else
      @coordinate = '.'
    end
  end
end
