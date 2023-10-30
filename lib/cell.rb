
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
    # if @coordinate == 'M' || @coordinate == 'H' || @coordinate == 'X'
    #   true
    # else @coordinate == '.' || @coordinate == 'S'
    #   false
    #end
  end

  def fire_upon
    @fired_upon = true
    return if @ship == nil
    @ship.hit
    # if @ship != nil && @ship.health > 0
    #   @ship.hit
    #   @coordinate = 'H'
    # elsif @ship == nil
    #   @coordinate = 'M'
    # elsif @ship != nil && @ship.health <= 1
    #   @ship.hit
    #   @coordinate = 'X'
    # end
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
  #   if @ship == nil && @coordinate == 'M'
  #     @coordinate = 'M'
  #   elsif default == true
  #     @coordinate = 'S'
  #   elsif @ship != nil && @ship.health < @ship.length && @ship.health > 0
  #     @coordinate = 'H'
  #   elsif @ship == !nil && @ship.health == 0 && @coordinate == 'X' || @coordinate == 'H'
  #     @coordinate = 'X'
  #   else
  #     @coordinate = '.'
  #   end
  # end
