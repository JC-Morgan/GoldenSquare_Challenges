class Track
  def initialize(title, artist)
    @title = title
    @artist = artist
  end

  def matches?(keyword)
    return true if @title.include? keyword
    return true if @artist.include? keyword
  end
end
