require_relative '../lib/battleship'

describe Game do
  let(:game) { Game.new }

  it "sets up two empty game boards" do
    expect(game.player1.board.bombable?("A1")).to eql(true)
  end
end
