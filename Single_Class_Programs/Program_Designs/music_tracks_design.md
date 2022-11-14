# Music Tracks Class Design Recipe

## 1. Describe the Problem

_The user story and any clarifying notes:_

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

## 2. Design the Class Interface

_Class name, initializer and public methods with parameters and return values:_

```ruby
class TracksList
  def initialize
    # No return value.
  end

  def add(track) # track is a string (containing a track name)
    # No return value.
  end

  def list
    # returns the list of tracks (list of strings)
  end
end
```

## 3. Create Examples as Tests

_Examples of how the class will behave in different situations:_

```ruby
# 1
music_tracks = TracksList.new
music_tracks.list # => []

# 2
music_tracks = TracksList.new
music_tracks.add("Stars")
music_tracks.list # => ["Stars"]

# 3
music_tracks = TracksList.new
music_tracks.add("Stars")
music_tracks.add("Moon")
music_tracks.list # => ["Stars", "Moon"]

```

_These examples will be made into tests._

## 4. Implement the Behaviour

