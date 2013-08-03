require_relative '../lib/battleship'

describe Ship do
  let(:frigate) { Ship.new(3, "horizontal") }

  it "has a length" do
    expect(frigate.length).to eql(3)
  end

  it "has an orientation" do
    expect(frigate.orientation).to eql("horizontal")
  end

  it "is a one-dimensional array as a horizontal ship" do
    expect(frigate.display).to eql([1, 1, 1])
  end

  it "is a two-dimensional array as a vertical ship" do
    frigate = Ship.new(3, "vertical")
    expect(frigate.display).to eql([[1], [1], [1]])
  end

  it "flips the ship" do
    frigate.flip
    expect(frigate.display).to eql([[1], [1], [1]])
    frigate.flip
    expect(frigate.display).to eql([1, 1, 1])
  end
end
