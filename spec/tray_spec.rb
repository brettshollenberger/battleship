require_relative '../lib/battleship'

describe Tray do
  let(:tray)  { Tray.new }
  let(:board) { Board.new }

  it "starts with an aircraft carrier" do
    expect(tray[:carrier].length).to eql(5)
  end

  it "starts with a battleship" do
    expect(tray[:battleship].length).to eql(4)
  end

  it "starts with a frigate" do
    expect(tray[:frigate].length).to eql(3)
  end
  it "starts with a cruiser" do
    expect(tray[:cruiser].length).to eql(3)
  end

  it "starts with a destroyer" do
    expect(tray[:destroyer].length).to eql(2)
  end

  it "removes ships when they're set on the board" do
    board.set(board.tray[:frigate], "A1", "A2", "A3")
    expect(board.tray[:frigate]).to be(nil)
  end
end
