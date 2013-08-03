require_relative '../lib/battleship'

describe Square do
  let(:playerboard) { PlayerBoard.new }

  it "starts untaken" do
    expect(playerboard["A"][1].taken?).to eql(false)
  end

  it "knows its location in the board" do
    expect(playerboard["A"][1].location).to eql("A1")
  end
end
