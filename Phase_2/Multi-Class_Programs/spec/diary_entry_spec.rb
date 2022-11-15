require "diary_entry"

describe DiaryEntry do

  it "Sets up a correct diary entry" do
    diary_entry = DiaryEntry.new("Today", "I rode a bike.")
    expect(diary_entry.title).to eq "Today"
    expect(diary_entry.contents).to eq "I rode a bike."
  end

  it "Returns an accurate word count when the count_words method is called" do
    diary_entry = DiaryEntry.new("Today", "I rode a bike.")
    expect(diary_entry.count_words).to eq 4
  end

  it "Returns a word count of 0 when the count_words method is called with no contents given on initialization" do
    diary_entry = DiaryEntry.new("","")
    expect(diary_entry.count_words).to eq 0
  end

  it "Returns an accurate reading time when given wpm" do
    entry = DiaryEntry.new("Today","I rode a bike.")
    expect(entry.reading_time(2)).to eq 2
    entry2 = DiaryEntry.new("Today","I rode a bike.")
    expect(entry2.reading_time(60)).to eq 1
    entry3 = DiaryEntry.new("Today","Bike " * 90)
    expect(entry3.reading_time(60)).to eq 2
  end

  it "Fails if the wpm is 0 or not a number" do
    entry = DiaryEntry.new("Today","I rode a bike.")
    expect { entry.reading_time(0) }.to raise_error
    expect { entry.reading_time("Hello") }.to raise_error
  end

  it "returns a chunk of the contents that the user can read given their wpm and minutes available" do
    entry = DiaryEntry.new("Today","Bike " * 60)
    expect(entry.reading_chunk(60,1)).to eq ("Bike " * 59) + "Bike"
  end

  it "returns two separate chunks when user calls reading_chunk twice" do
    entry = DiaryEntry.new("Today",("Bike " * 30) + ("Car " * 30))
    expect(entry.reading_chunk(60,0.5)).to eq ("Bike " * 29) + "Bike"
    expect(entry.reading_chunk(60,0.5)).to eq ("Car " * 29) + "Car"
  end

  it "reading chunk is called three times, the first two times it is called- it will return the first two chunks, the third time it is called- it will return the first chunk again" do
    entry = DiaryEntry.new("Today",("Bike " * 30) + ("Car " * 30))
    expect(entry.reading_chunk(60,0.5)).to eq ("Bike " * 29) + "Bike"
    expect(entry.reading_chunk(60,0.5)).to eq ("Car " * 29) + "Car"
    expect(entry.reading_chunk(60,0.5)).to eq ("Bike " * 29) + "Bike"
  end


  it "reading chunk is called three times, the first two times it is called- it will return the first two chunks, the third time it is called- it will return the rest of the chunk" do
    entry = DiaryEntry.new("Today",("Bike " * 30) + ("Car " * 30))
    expect(entry.reading_chunk(60,0.2)).to eq ("Bike " * 11) + "Bike"
    expect(entry.reading_chunk(60,0.5)).to eq ("Bike " * 18) + ("Car " * 11) + "Car"
    expect(entry.reading_chunk(60,0.5)).to eq ("Car " * 17) + "Car"
  end

end

