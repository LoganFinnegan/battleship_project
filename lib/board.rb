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
    (vertical?(coordinates) || horizontal?(coordinates)) &&
    (overlap?(coordinates) == false)
  end
  #check that coordinates requested for placement are empty
  def overlap?(coordinates)
    coordinates.one? {|coordinate| @cells[coordinate].empty?}
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
      # coord_arry[0] == @cells[coord_arry[0]]
      # coord_arry[1] == @cells[coord_arry[1]]
    elsif ship_name.length == 3
      @cells[coord_arry[0]].ship = ship_name
      @cells[coord_arry[1]].ship = ship_name
      @cells[coord_arry[2]].ship = ship_name
      # coord_arry[0] == @cells[coord_arry[0]]
      # coord_arry[1] == @cells[coord_arry[1]]
      # coord_arry[2] == @cells[coord_arry[2]]
    end
  end

  def render(default = false)
    row1 = "  1 2 3 4 \nA"
    row2 = " "
    row3 = " "
    row4 = " "
    row5 = " "
    @cells.each do |k, v|
      if k[0] == "A"
        if v.ship == nil && v.coordinate == 'M '
          v.coordinate = 'M '
        elsif default == true && v.ship != nil
          v.coordinate = 'S '
        elsif v.ship != nil && v.ship.health < v.ship.length && v.ship.health > 0
          v.coordinate = 'H '
        elsif v.ship == !nil && v.ship.health == 0 && v.coordinate == 'X ' || v.coordinate == 'H '
          v.coordinate = 'X '
        else
          v.coordinate = '. '
        end
      row2 = row2 + v.coordinate
      elsif k[0] == "B"
        if v.ship == nil && v.coordinate == 'M '
          v.coordinate = 'M '
        elsif default == true && v.ship != nil
          v.coordinate = 'S '
        elsif v.ship != nil && v.ship.health < v.ship.length && v.ship.health > 0
          v.coordinate = 'H '
        elsif v.ship == !nil && v.ship.health == 0 && v.coordinate == 'X ' || v.coordinate == 'H '
          v.coordinate = 'X '
        else
          v.coordinate = '. '
        end
      row3 = row3 + v.coordinate
      elsif k[0] == "C"
        if v.ship == nil && v.coordinate == 'M '
          v.coordinate = 'M '
        elsif default == true && v.ship != nil
          v.coordinate = 'S '
        elsif v.ship != nil && v.ship.health < v.ship.length && v.ship.health > 0
          v.coordinate = 'H '
        elsif v.ship == !nil && v.ship.health == 0 && v.coordinate == 'X ' || v.coordinate == 'H '
          v.coordinate = 'X '
        else
          v.coordinate = '. '
        end
      row4 = row4 + v.coordinate
      elsif k[0] == "D"
        if v.ship == nil && v.coordinate == 'M '
          v.coordinate = 'M '
        elsif default == true && v.ship != nil
          v.coordinate = 'S '
        elsif v.ship != nil && v.ship.health < v.ship.length && v.ship.health > 0
          v.coordinate = 'H '
        elsif v.ship == !nil && v.ship.health == 0 && v.coordinate == 'X ' || v.coordinate == 'H '
          v.coordinate = 'X '
        else
          v.coordinate = '. '
        end
        row5 = row5 + v.coordinate
      end
    end
    r_board = row1 + (row2 + "\nB") + (row3 + "\nC") + (row4 + "\nD") + (row5 + "\n")
  end
end
