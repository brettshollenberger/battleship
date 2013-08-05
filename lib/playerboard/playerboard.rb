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
    instance_var = @tray.each { |key, value| break key if value == ship }
    instance_variable_set("@#{instance_var}", ship)
    ship.set(*kwargs)
    kwargs.each_with_index { |kwarg, index| self[lettersplit(kwarg)[0]][lettersplit(kwarg)[1].to_i] = ship[index] }
    @tray.delete_if { |key, value| value == ship }
  end

  def bombable?(gridlocation)
    not square(gridlocation).guessed?
  end

  def bomb(gridlocation)
    return square(gridlocation).bomb if bombable?(gridlocation)
    raise "Square already guessed."
  end

private

  def square(gridlocation)
    self[lettersplit(gridlocation)[0]][lettersplit(gridlocation)[1].to_i]
  end

  def lettersplit(str)
    str.split("")
  end
end
