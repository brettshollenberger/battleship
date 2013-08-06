class Tray < Hash
  def initialize
    self[:carrier] = Ship.new(5, "Aircraft Carrier")
    self[:battleship] = Ship.new(4, "Battleship")
    self[:cruiser] = Ship.new(3, "Cruiser")
    self[:frigate] = Ship.new(3, "Frigate")
    self[:destroyer] = Ship.new(2, "Destroyer")
  end
end
