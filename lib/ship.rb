class Ship
  attr_reader :name,
              :length,
              :health
  attr_accessor :hits
  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @hits = 0
  end

  def hit
    @hits += 1
    # @length -= 1
    @health -= 1
  end

  def sunk?
    if @health == 0
      true
    else
      false
    end
  end
end
