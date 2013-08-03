class Square
  attr_accessor :x, :y
  def initialize(x, y)
    @x, @y = x, y
    @value = 0
    @guessed = false
  end

  def taken?
    @value != 0
  end

  def location
    "#{@x}#{@y}"
  end

  def guessed?
    @guessed
  end

  def bomb
    @guessed = true unless guessed? rescue throw "Square already guessed."
    return_outcome
  end

  def return_outcome
    return "Hit!" if @value != 0
    return "Miss!"
  end
end
