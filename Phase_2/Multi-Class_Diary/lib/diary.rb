class Diary

  def initialize
    @entries = []
  end

  def add(entry)
    @entries << entry
  end

  def all_entries
    @entries
  end

  def count_words(entry)
    return entry.split(" ").length
  end

  def reading_time(entry,wpm)
    return (count_words(entry)/wpm.to_f)
  end

  def readable_within_time(wpm,minutes)
    difference = 1000000000
    entry_hold = nil
    @entries.each do |entry|
      if reading_time(entry,wpm) <= minutes
        if difference > (minutes-(reading_time(entry,wpm)))
          difference = minutes-(reading_time(entry,wpm))
          entry_hold = entry
        end
      end
    end
    return entry_hold
  end

end
