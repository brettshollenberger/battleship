class Square
  attr_accessor :x, :y
  def initialize(x, y)
    @x, @y = x, y
    @value = 0
  end

  def empty?
    @value == 0
  end

  def taken?
    @value != 0
  end
end
