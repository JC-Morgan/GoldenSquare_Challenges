class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @start_pointer = 0
  end

  def title
    # Returns the title as a string
    @title
  end

  def contents
    # Returns the contents as a string
    @contents
  end

  def count_words
    # Returns the number of words in the contents as an integer
    @contents.split(" ").size
  end

  def reading_time(wpm) # wpm is an integer representing the number of words the
                        # user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    (count_words/wpm.to_f).round
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.

    words_needed = wpm * minutes  # this is how many words the user will be able to read in the given time
    end_pointer = @start_pointer + words_needed
    contents_array = @contents.split(" ")
    contents = contents_array[@start_pointer,words_needed]
    if end_pointer >= count_words
      @start_pointer = 0
    else
      @start_pointer = end_pointer
    end
    contents.join(" ")

  end

end
