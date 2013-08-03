class Ship < Array
  attr_accessor :orientation
  def initialize(l, orientation)
    l.times { self << 1 }
    @orientation = orientation
  end

  def display
    self.each { |num| print num }
  end
end
