require 'music_tracks'

describe TracksList do

  context "When initialized, with no tracks added" do
    it "returns an empty list" do
      music_tracks = TracksList.new
      expect(music_tracks.list).to eq []
    end
  end


  context "When a track is added to the list" do
    it "returns that track in the list" do
      music_tracks = TracksList.new
      music_tracks.add("Stars")
      expect(music_tracks.list).to eq ["Stars"]
    end
  end

  context "When multiple tracks are added to the list" do
    it "returns an accurate list of tracks" do
      music_tracks = TracksList.new
      music_tracks.add("Stars")
      music_tracks.add("Moon")
      expect(music_tracks.list).to eq ["Stars", "Moon"]
    end
  end

end
