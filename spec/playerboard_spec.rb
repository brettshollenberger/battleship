require_relative '../lib/battleship'

describe PlayerBoard do
  let(:playerboard) { PlayerBoard.new }

  it "contains a ten by ten board" do
    expect(playerboard.length).to eql(10)
    expect(playerboard["A"].length).to eql(10)
  end
end
