require_relative '../lib/battleship'

describe Player do
  let(:game)   { Game.new }

  it "has a name" do
    expect(game.player1.name).to eql("Danny")
  end
end
