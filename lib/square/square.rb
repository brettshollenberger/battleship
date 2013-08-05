class Square
  attr_accessor :x, :y, :status
  def initialize(x=nil, y=nil, ship=nil, ship_index=nil)
    @x, @y, @ship = x, y, ship
    set_status
    @guessed = false
  end

  def taken?
    @status != "empty"
  end

  def location
    "#{@x}#{@y}"
  end

  def guessed?
    @guessed
  end

  def bomb
    @guessed = true unless guessed? rescue raise "Square already guessed."
    return_outcome
  end

  def return_outcome
    return "Hit!" if @value == "unhit"
    return "Miss."
  end

private
  def set_status
    @status = "unhit" unless @ship.nil?
    @status = "empty" if @ship.nil?
  end
end
