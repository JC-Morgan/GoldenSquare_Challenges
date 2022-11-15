class DiaryEntry

  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @start_pointer = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return @contents.split(" ").size
  end

  def reading_time(wpm)
    return (count_words/wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
    words_needed = wpm * minutes
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
