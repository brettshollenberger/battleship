class Board < Hash
  attr_accessor :game, :tray, :carrier, :battleship, :cruiser, :frigate, :destroyer

  def initialize(game=nil)
    @game = game
    ("A".."J").each do |letter| 
      self[letter] = {}
      (1..10).each { |num| self[letter][num] = Square.new(letter, num) }
    end
    @tray = Tray.new
  end

  def ready?
    @tray.empty?
  end

  def set(ship, *kwargs)
    if valid_set?(*kwargs, ship)
      unless squares_taken?(*kwargs)
        replace_empty_squares_with_ship_squares(ship, *kwargs) &&
          set_ship_instance_variable(ship) &&
          remove_ship_from_tray(ship) && 
          ship.set(*kwargs) 
        @game.transition_to_play_phase if @game
      else
        raise "Square already taken"
      end
    else
      raise "Invalid location"
    end
  end

  def bombable?(gridlocation)
    not square(gridlocation).guessed?
  end

  def bomb(gridlocation)
    return square(gridlocation).bomb if bombable?(gridlocation)
    raise "Square already guessed."
  end

  def display
    output = "     1  2  3  4  5  6  7  8  9  10\n  ----------------------------------\n"
    ("A".."J").each do |letter|
      output << letter + " |  " 
      (1..10).each do |number| 
        output << self[letter][number].representation.to_s + "  "
      end
      output << "|\n"
    end
    output << "  ----------------------------------"
    print output
  end

private

  def set_ship_instance_variable(ship)
    @tray.each { |key, value| instance_variable_set("@#{key}", ship) if value == ship }
  end

  def replace_empty_squares_with_ship_squares(ship, *kwargs)
    kwargs.each_with_index { |kwarg, index| self[lettersplit(kwarg)[0]][lettersplit(kwarg)[1].to_i] = ship[index] } 
  end

  def squares_taken?(*kwargs)
    kwargs.each { |kwarg| return true if self[lettersplit(kwarg)[0]][lettersplit(kwarg)[1].to_i].taken? }; false
  end

  def remove_ship_from_tray(ship)
    @tray.delete_if { |key, value| value == ship }
  end

  def square(gridlocation)
    self[lettersplit(gridlocation)[0]][lettersplit(gridlocation)[1].to_i]
  end

  def lettersplit(str)
    str.split(/\d/).zip(str.split(/\D/).reject { |n| n == "" }).flatten
  end

  def valid_set?(*kwargs, ship)
    on_the_board?(*kwargs) && (in_a_row?(*kwargs) || in_a_col?(*kwargs, ship))
  end

  def on_the_board?(*kwargs)
    if kwargs.map { |arg| arg[0] }.each { |arg| break false unless ("A".."J").to_a.include?(arg) }
      if kwargs.map { |arg| arg[1..-1].to_i }.each { |arg| break false unless (1..10).to_a.include?(arg) }
        return true
      end
    end
    false
  end

  def in_a_row?(*kwargs)
    kwargs.map { |arg| arg[0] }.uniq.length == 1 && kwargs.map { |arg| arg[1..-1].to_i }.ordered_list?
  end

  def in_a_col?(*kwargs, ship)
    kwargs.map { |arg| arg[0] }.uniq.length == ship.length && kwargs.map { |arg| arg[1] }.uniq.length == 1 && kwargs.map { |arg| arg[0] }.sorted_letters?
  end
end
