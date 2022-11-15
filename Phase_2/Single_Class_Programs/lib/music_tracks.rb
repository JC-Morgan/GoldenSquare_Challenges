class TracksList

  def initialize
    @list = []
  end

  def list
    return @list
  end

  def add(track)
    @list.push(track)
  end

end
