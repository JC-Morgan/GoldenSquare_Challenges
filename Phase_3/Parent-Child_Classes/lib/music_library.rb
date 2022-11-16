class MusicLibrary

  def initialize
    @library = []
  end

  def add(track)
    @library << track
  end

  def all
    return @library
  end

  def search(keyword)
    @library.filter { |track| track.matches?(keyword) }
  end

end
