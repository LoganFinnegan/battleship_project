class Ship
  attr_reader :name,
              :length

  attr_accessor :hits,
                :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @hits = 0
  end

  def hit
    @hits += 1
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
