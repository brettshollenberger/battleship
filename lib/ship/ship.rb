class Ship < Array
  attr_accessor :l, :orientation

  def initialize(l, orientation)
    @l = l
    @orientation = orientation
    orient_ship
  end

  def display
    self
  end

  def flip
    @orientation = other_orientation
    orient_ship
  end

  def other_orientation
    orientations.keep_if { |orientation| orientation != @orientation }[0]
  end

  def orientations
    ["horizontal", "vertical"]
  end

private
  def orient_ship
    self.clear
    @l.times do
      self << 1 if @orientation == "horizontal"
      self << [1] if @orientation == "vertical"
    end
  end
end
