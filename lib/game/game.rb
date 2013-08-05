class Game
  attr_accessor :player1, :player2, :phase
  def initialize
    @phase = "setup"
    @player1 = Player.new(self)
    @player2 = Player.new(self)
  end

  def begin_play
    @phase = "play" if ready?
  end

  def ready?
    @player1.board.ready? && @player2.board.ready?
  end
end
