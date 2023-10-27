class Ship 
  attr_reader :name,
              :length
  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @hit = 0

  end

  def health
    @health = @length - @hit
  end

  def hit
    @hit += 1
  end

  def sunk?
    if @health == 0
      true
    else
      false
    end
  end
end