class Player

  attr_accessor :board

  def initialize
    @board = PlayerBoard.new
  end

  def name
    "Danny"
  end

end
