class Tray < Hash
  def initialize
    self[:carrier] = Ship.new(5)
    self[:battleship] = Ship.new(4)
    self[:cruiser] = Ship.new(3)
    self[:frigate] = Ship.new(3)
    self[:destroyer] = Ship.new(2)
  end
end
