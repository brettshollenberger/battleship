class Player

  attr_accessor :game, :board

  def initialize(game)
    @game = game
    @board = Board.new(@game)
  end

  def set(*kwargs)
    @board.set(*kwargs)
  end

  def name
    "Danny"
  end

  def ships
    Ships.new(@board.carrier, 
      @board.battleship, 
      @board.cruiser, 
      @board.frigate, 
      @board.destroyer)
  end

end
