class Game
  attr_accessor :player1
  def initialize
  end

  def player1
    @player1 ||= Player.new
  end

  def player2
  end
end
