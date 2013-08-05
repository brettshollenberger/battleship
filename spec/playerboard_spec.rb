require_relative '../lib/battleship'

describe PlayerBoard do
  let(:playerboard) { PlayerBoard.new }

  it "contains a ten by ten board" do
    expect(playerboard.length).to eql(10)
    expect(playerboard["A"].length).to eql(10)
  end

  it "knows whether a gridlocation has been previously guessed" do
    expect(playerboard.bombable?("A1")).to eql(true)
  end

  it "can bomb a bombable location" do
    expect(playerboard.bomb("A1")).to eql("Miss.")
    expect(playerboard.bombable?("A1")).to eql(false)
  end

  it "cannot bomb an unbombable location" do
    playerboard.bomb("A1")
    expect{playerboard.bomb("A1")}.to raise_error(RuntimeError)
  end

  it "can set ships on the board" do
    expect(playerboard.frigate).to eql(nil)
    @frigate = playerboard.tray[:frigate]
    playerboard.set(playerboard.tray[:frigate], "A1", "A2", "A3")
    expect(playerboard.frigate).to eql(@frigate)
    expect(playerboard.frigate[0].x).to eql("A")
    expect(playerboard.frigate[0].y).to eql("1")
  end

  # it "contains the five ship types" do
  #   expect(playerboard.carrier.length).to eql(3)
  #   expect(playerboard.battleship.length).to eql(4)
  #   expect(playerboard.cruiser.length).to eql(2)
  #   expect(playerboard.frigate.length).to eql(5)
  #   expect(playerboard.destroyer.length).to eql(4)
  # end
end
