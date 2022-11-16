require "music_library"

describe MusicLibrary do

  it "returns an empty list when no tracks have been added" do
    music_library = MusicLibrary.new
    expect(music_library.all).to eq []
  end

  it "returns an added track" do
    music_library = MusicLibrary.new
    fake_track_1 = double :fake_track
    music_library.add(fake_track_1)
    expect(music_library.all).to eq [fake_track_1]
  end

  it "returns multiple added tracks" do
    music_library = MusicLibrary.new
    fake_track_1 = double :fake_track
    fake_track_2 = double :fake_track
    music_library.add(fake_track_1)
    music_library.add(fake_track_2)
    expect(music_library.all).to eq [fake_track_1, fake_track_2]
  end

  it "returns a track that matches the keyword" do
    music_library = MusicLibrary.new
    fake_track_1 = (double(:fake_track, matches?: true))
    fake_track_2 = (double(:fake_track, matches?: false))
    music_library.add(fake_track_1)
    music_library.add(fake_track_2)
    expect(music_library.search("hello")).to eq [fake_track_1]
  end

  it "returns a list of tracks that match the keyword" do
    music_library = MusicLibrary.new
    fake_track_1 = (double(:fake_track, matches?: true))
    fake_track_2 = (double(:fake_track, matches?: true))
    music_library.add(fake_track_1)
    music_library.add(fake_track_2)
    expect(music_library.search("hello")).to eq [fake_track_1, fake_track_2]
  end

end
