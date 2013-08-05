require_relative '../lib/battleship'

describe Ship do
  let(:frigate) { Ship.new(3) }

  it "has a length" do
    expect(frigate.length).to eql(3)
  end

  it "has an orientation" do
    expect(frigate.orientation).to eql("horizontal")
  end
 
  it "sets ships on the board" do
    frigate.set("A1", "A2", "A3")
    expect(frigate[0].x).to eql("A")
    expect(frigate[0].y).to eql("1")
  end

  it "flips the ship" do
    frigate.flip
    expect(frigate.orientation).to eql("vertical")
    frigate.flip
    expect(frigate.orientation).to eql("horizontal")
  end

  it "starts unhit" do
    expect(frigate.hit?).to eql(false)
  end

  it "starts with each square unhit" do
    expect(frigate[0].status).to eql("unhit")
  end

  it "knows whether it is sunk" do
    expect(frigate.sunk?).to eql(false)
    (0..2).each { |num| frigate[num].status = "hit" }
    expect(frigate.sunk?).to eql(true)
  end
end
