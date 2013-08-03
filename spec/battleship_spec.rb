require_relative '../lib/battleship'

describe PlayerBoard do
  let(:playerboard) { PlayerBoard.new }

  it "contains a ten by ten board" do
    expect(playerboard["A"][1].num).to eql(1)
  end
end
