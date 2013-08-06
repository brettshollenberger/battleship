class Game
  attr_accessor :player1, :player2, :phase
  def initialize
    @phase = "setup"
    @player1 = Player.new(self)
    @player2 = Player.new(self)
  end

  def play
    
  end

  def transition_to_play_phase
    @phase = "play" if ready?
  end

  def ready?
    @player1.board.ready? && @player2.board.ready?
  end

  def over?
    @player1.ships.sunk? || @player2.ships.sunk?
  end
end
