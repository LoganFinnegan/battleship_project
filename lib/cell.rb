
class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
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
    @ship.hit
  end

  def render
      if @coordinate.empty? && @coordinate.fire_upon == false
        print "M"
      elsif if @ship != nil
        print "H"
      else
        print "."
      end
    end
  end
end
