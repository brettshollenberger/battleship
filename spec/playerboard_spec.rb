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
    expect(playerboard.bomb("A1")).to eql("Miss!")
    expect(playerboard.bombable?("A1")).to eql(false)
  end

  it "cannot bomb an unbombable location" do
    playerboard.bomb("A1")
    expect{playerboard.bomb("A1")}.to raise_error(RuntimeError)
  end
end
