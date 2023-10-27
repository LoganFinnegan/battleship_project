class Ship 
  attr_reader :name,
              :length
  def initialize(name, length)
    @name = name
    @length = length
    @health = 0
    @hit = 0

  end

  def health
    @health = @length - @hit
  end

  def hit
    @hit += 1
  end
end