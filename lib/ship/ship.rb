class Ship < Array
  attr_accessor :len, :orientation

  def initialize(len, orientation)
    @len = len
    @orientation = orientation
    set_empty_squares
    orient_ship
  end

  def display
    self
  end

  def set(*kwargs)
    kwargs.map { |arg| arg.split("") }.each { |split_arg| self.shift; self << Square.new(split_arg[0], split_arg[1]) } if valid_set?(*kwargs)
  end

  def flip
    @orientation = other_orientation
    orient_ship
  end

  def set_empty_squares
    @len.times { self << Square.new } 
  end

  def orient_ship
    @len.times do
      self.flatten! if @orientation == "horizontal"
      self.map! { |square| [square] } if @orientation == "vertical"
    end
  end

  def valid_set?(*kwargs)
    in_a_row?(*kwargs) || in_a_col?(*kwargs)
  end

  def in_a_row?(*kwargs)
    kwargs.map { |arg| arg[0] }.uniq!.length == 1 && kwargs.map { |arg| arg[1] }.ordered_list?
  end

  def in_a_col?(*kwargs)
    kwargs.map { |arg| arg[0] }.uniq!.length == @len && kwargs.map { |arg| arg[1] }.uniq!.length == 1
  end

  def other_orientation
    orientations.keep_if { |orientation| orientation != @orientation }.first
  end

  def orientations
    ["horizontal", "vertical"]
  end
end
