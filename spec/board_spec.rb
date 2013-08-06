require_relative '../lib/battleship'

describe Board do
  let(:game)  { Game.new }
  let(:board) { Board.new }

  it "contains a ten by ten board" do
    expect(board.length).to eql(10)
    expect(board["A"].length).to eql(10)
  end

  it "knows whether a gridlocation has been previously guessed" do
    expect(board.bombable?("A1")).to eql(true)
  end

  it "can bomb a bombable location" do
    expect(board.bomb("A1")).to eql("Miss.")
    expect(board.bombable?("A1")).to eql(false)
  end

  it "cannot bomb an unbombable location" do
    board.bomb("A1")
    expect{board.bomb("A1")}.to raise_error(RuntimeError)
  end

  it "can set ships on the board" do
    expect(board.frigate).to eql(nil)
    @frigate = board.tray[:frigate]
    board.set(board.tray[:frigate], "A1", "A2", "A3")
    expect(board.frigate).to eql(@frigate)
    expect(board.frigate[0].x).to eql("A")
    expect(board.frigate[0].y).to eql("1")
  end

  it "knows when the board is ready" do
    expect(board.ready?).to eql(false)
    board.set(board.tray[:frigate], "A1", "A2", "A3")
    board.set(board.tray[:battleship], "A4", "A5", "A6")
    board.set(board.tray[:carrier], "B1", "B2", "B3", "B4", "B5")
    board.set(board.tray[:cruiser], "B6", "B7", "B8")
    board.set(board.tray[:destroyer], "B9", "B10")
    expect(board.ready?).to eql(true)
  end

end
