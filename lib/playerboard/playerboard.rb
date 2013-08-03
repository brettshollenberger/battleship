class PlayerBoard < Hash
  def initialize
    ("A".."J").each do |letter| 
      self[letter] = {}
      (1..10).each { |num| self[letter][num] = Square.new(letter, num) }
    end
  end

  def bombable?(gridlocation)
    not lookup(gridlocation).guessed?
  end

private

  def lookup(gridlocation)
    self[lettersplit(gridlocation)[0]][lettersplit(gridlocation)[1].to_i]
  end

  def lettersplit(str)
    str.split("")
  end
end
