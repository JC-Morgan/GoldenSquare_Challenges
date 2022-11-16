require "music_library"
require "track"

describe "music library integration" do

  it "returns an added track" do
    music_library = MusicLibrary.new
    track = Track.new("Hello", "Adele")
    music_library.add(track)
    expect(music_library.all).to eq [track]
  end

  it "returns multiple added tracks" do
    music_library = MusicLibrary.new
    track = Track.new("Hello", "Adele")
    track_2 = Track.new("Never gonna give you up", "Rick Astley")
    music_library.add(track)
    music_library.add(track_2)
    expect(music_library.all).to eq [track, track_2]
  end

  it "returns a track that matches the keyword (title)" do
    music_library = MusicLibrary.new
    track = Track.new("Hello", "Adele")
    track_2 = Track.new("Never gonna give you up", "Rick Astley")
    music_library.add(track)
    music_library.add(track_2)
    expect(music_library.search("Hello")).to eq [track]
  end

  it "returns a track that matches the keyword (artist)" do
    music_library = MusicLibrary.new
    track = Track.new("Hello", "Adele")
    track_2 = Track.new("Never gonna give you up", "Rick Astley")
    music_library.add(track)
    music_library.add(track_2)
    expect(music_library.search("Rick")).to eq [track_2]
  end

end
