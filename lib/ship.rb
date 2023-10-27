class Ship
  attr_reader :name,
              :length,
              :health
  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @hit = 0
  end

  def hit
    @hit += 1
    # @length -= 1
    @health -= 1
  end

  def sunk?
    if @health <= 0
      true
    else
      false
    end
  end
end
