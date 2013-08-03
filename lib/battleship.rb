class PlayerBoard < Hash
  def initialize
    ("A".."J").each do |letter| 
      self[letter] = {}
      (1..10).each { |num| self[letter][num] = Square.new(num) }
    end
  end
end

class Square
  attr_accessor :num
  def initialize(num)
    @num = num
  end
end
