require_relative '../lib/battleship'

describe Ship do
  let(:frigate) { Ship.new(3, "ltr") }

  it "has a length" do
    expect(frigate.length).to eql(3)
  end

  it "has an orientation" do
    expect(frigate.orientation).to eql("ltr")
  end
end
