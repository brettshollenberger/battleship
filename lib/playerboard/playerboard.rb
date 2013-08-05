class PlayerBoard < Hash
  attr_accessor :tray, :carrier, :battleship, :cruiser, :frigate, :destroyer

  def initialize
    ("A".."J").each do |letter| 
      self[letter] = {}
      (1..10).each { |num| self[letter][num] = Square.new(letter, num) }
    end
    @tray = Tray.new
  end

  def set(ship, *kwargs)
    set_ship_instance_variable(ship) && 
      ship.set(*kwargs) && 
      replace_empty_squares_with_ship_squares(ship, *kwargs) &&
      remove_ship_from_tray(ship)
  end

  def bombable?(gridlocation)
    not square(gridlocation).guessed?
  end

  def bomb(gridlocation)
    return square(gridlocation).bomb if bombable?(gridlocation)
    raise "Square already guessed."
  end

private

  def set_ship_instance_variable(ship)
    @tray.each { |key, value| instance_variable_set("@#{key}", ship) if value == ship }
  end

  def replace_empty_squares_with_ship_squares(ship, *kwargs)
    kwargs.each_with_index { |kwarg, index| self[lettersplit(kwarg)[0]][lettersplit(kwarg)[1].to_i] = ship[index] }
  end

  def remove_ship_from_tray(ship)
    @tray.delete_if { |key, value| value == ship }
  end

  def square(gridlocation)
    self[lettersplit(gridlocation)[0]][lettersplit(gridlocation)[1].to_i]
  end

  def lettersplit(str)
    str.split("")
  end
end
