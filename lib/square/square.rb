class Square
  attr_accessor :x, :y, :ship, :status, :representation
  def initialize(x=nil, y=nil, ship=nil, ship_index=nil)
    @x, @y, @ship = x, y, ship
    set_status
    @guessed = false
    set_rep
  end

  def taken?
    @status != "empty"
  end

  def hit?
    @status == "hit"
  end

  def unhit?
    @status == "unhit"
  end

  def location
    "#{@x}#{@y}"
  end

  def guessed?
    @guessed
  end

  def set_rep
    @representation = 0 unless taken?
    @representation = @ship.name[0] if taken?
  end

  def bomb
    @guessed = true
    @status = "hit" unless @status == "empty"
    return_outcome
  end

  def return_outcome
    case @status
      when "hit" then return "Hit!"
      when "empty" then return "Miss."
    end
  end

private
  def set_status
    @status = "unhit" unless @ship.nil?
    @status = "empty" if @ship.nil?
  end
end
