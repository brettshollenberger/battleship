class Ships < Array
  def initialize(*ships)
    ships.each { |ship| self << ship }
  end
  
  def sunk?
    self.each { |ship| return false unless ship.sunk? }; true
  end
end
