require "track"

describe Track do

  it "returns nil when neither the title nor the artist match the keyword" do
    track = Track.new("Hello", "Adele")
    expect(track.matches?("Hi")).to eq nil
  end

  it "returns true if the keyword matches the title" do
    track = Track.new("Hello", "Adele")
    expect(track.matches?("Hello")).to eq true
  end

  it "returns true if the keyword matches the artist" do
    track = Track.new("Hello", "Adele")
    expect(track.matches?("Adele")).to eq true
  end

end
