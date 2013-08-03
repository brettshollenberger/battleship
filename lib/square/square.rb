class Square
  attr_accessor :x, :y
  def initialize(x, y)
    @x, @y = x, y
    @value = 0
  end

  def taken?
    @value != 0
  end

  def location
    "#{@x}#{@y}"
  end
end
