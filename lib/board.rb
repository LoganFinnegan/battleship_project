class Board
attr_reader :cells
  def initialize
    @cells = create_cells
  end

  def create_cells
    coords = ['A1', 'A2', 'A3', 'A4', 'B1', 'B2', 'B3', 'B4',
    'C1', 'C2', 'C3', 'C4', 'D1', 'D2', 'D3', 'D4']
    coords.each_with_object({}) do |coord, hash|
      hash[coord] = Cell.new(coord)
    end
  end

  def valid_coordinate?(coordinate)
      @cells.keys.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    same_length?(ship, coordinates) &&
    (vertical?(coordinates) || horizontal?(coordinates))
  end

  def same_length?(ship, coordinates)
    ship.length == coordinates.count
  end

  def vertical?(coords)
    #same letter and consecutive numbers
    letter_count = coords.map do |coord|
      coord[0]
    end.uniq.count


    nums = coords.map do |coord|
      coord[1]
    end

    range = (nums[0]..nums[-1]).to_a

    (letter_count == 1) && (nums == range)
  end

  def horizontal?(coords)
    #
    number_count = coords.map do |coord|
      coord[1]
    end.uniq.count

    letters = coords.map do |coord|
      coord[0]
    end

    range = (letters[0]..letters[-1]).to_a

    (number_count == 1) && (letters == range)
  end

  def place(ship_name, coord_arry)
    if ship_name.length == 2
      @cells[coord_arry[0]].ship = ship_name
      @cells[coord_arry[1]].ship = ship_name
      coord_arry[0] = @cells[coord_arry[0]]
      coord_arry[1] = @cells[coord_arry[1]]
    elsif ship_name.length == 3
      @cells[coord_arry[0]].ship = ship_name
      @cells[coord_arry[1]].ship = ship_name
      @cells[coord_arry[2]].ship = ship_name
      coord_arry[0] = @cells[coord_arry[0]]
      coord_arry[1] = @cells[coord_arry[1]]
      coord_arry[2] = @cells[coord_arry[2]]
    end
  end
end
