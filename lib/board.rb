class Board
  def initialize
    @c_hash = {}
  end

  def cells
    @c_hash = {
    @c_hash['A1'] => Cell.new('A1'), @c_hash['A2'] => Cell.new('A2'), @c_hash['A3'] => Cell.new('A3'), @c_hash['A4'] => Cell.new('A4'),
    @c_hash['B1'] => Cell.new('B1'), @c_hash['B2'] => Cell.new('B2'), @c_hash['B3'] => Cell.new('B3'), @c_hash['B4'] => Cell.new('B4'),
    @c_hash['C1'] => Cell.new('C1'), @c_hash['C2'] => Cell.new('C2'), @c_hash['C3'] => Cell.new('C3'), @c_hash['C4'] => Cell.new('C4'),
    @c_hash['D1'] => Cell.new('D1'), @c_hash['D2'] => Cell.new('D2'), @c_hash['D3'] => Cell.new('D3'), @c_hash['D4'] => Cell.new('D4')}
  end
end
