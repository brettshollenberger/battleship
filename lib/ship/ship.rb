class Ship < Array
  attr_accessor :orientation
  def initialize(l, orientation)
    @l = l
    @orientation = orientation
    orient_ship
  end

  def display
    self
  end

private
  def orient_ship
    @l.times do
      self << 1 if @orientation == "horizontal"
      self << [1] if @orientation == "vertical"
    end
  end
end
