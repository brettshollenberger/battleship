class Ship < Array
  attr_accessor :len, :orientation, :status

  def initialize(len)
    @len = len
    @orientation = "horizontal"
    @status = "unhit"
    set_empty_squares
  end

  def set(*kwargs)
    kwargs.map { |arg| arg.split("") }.each_with_index do |split_arg, index|
      self[index].x, self[index].y = split_arg[0], split_arg[1] if valid_set?(*kwargs)
    end
  end

  def flip
    @orientation = other_orientation
  end

  def set_empty_squares
    (0..@len-1).each { |num| self << Square.new(x=nil, y=nil, ship=self, ship_index=num) } 
  end

  def hit?
    self.each { |square| return true unless square.status == "unhit" }; return false
  end

  def sunk?
    self.map { |ship| ship.status }.uniq!.length == 1 && self[0].status == "hit"
  end

private
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
