require_relative '../lib/battleship'

describe Ship do
  let(:frigate) { Ship.new(3, "horizontal") }

  it "has a length" do
    expect(frigate.length).to eql(3)
  end

  it "has an orientation" do
    expect(frigate.orientation).to eql("horizontal")
  end

  it "in a row" do
    expect(frigate.in_a_row?("A1", "A2", "A3")).to eql(true)
  end
 
  it "sets ships on the board" do
    frigate.set("A1", "A2", "A3")
    expect(frigate[0].x).to eql("A")
    expect(frigate[0].y).to eql("1")
  end

  it "flips the ship" do
    frigate.flip
    expect(frigate.display).to eql([[1], [1], [1]])
    frigate.flip
    expect(frigate.display).to eql([1, 1, 1])
  end
end
