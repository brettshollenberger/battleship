class PlayerBoard < Hash
  def initialize
    ("A".."J").each do |letter| 
      self[letter] = {}
      (1..10).each { |num| self[letter][num] = Square.new(letter, num) }
    end
  end

  def bombable?(gridlocation)
    not square(gridlocation).guessed?
  end

  def bomb(gridlocation)
    return square(gridlocation).bomb if bombable?(gridlocation)
    raise "Square already guessed."
  end

private

  def square(gridlocation)
    self[lettersplit(gridlocation)[0]][lettersplit(gridlocation)[1].to_i]
  end

  def lettersplit(str)
    str.split("")
  end
end
