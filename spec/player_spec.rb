require_relative '../lib/battleship'

describe Player do
  let(:player) { Player.new }

  it "has a name" do
    expect(player.name).to eql("Danny")
  end
end
