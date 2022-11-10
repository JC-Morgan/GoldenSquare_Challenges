require 'diary_entry'

RSpec.describe DiaryEntry do

  it "returns title when title method is called upon" do
    entry = DiaryEntry.new("Today", "I rode a bike.")
    expect(entry.title).to eq "Today"
  end

  it "returns contents when contents method is called upon" do
    entry = DiaryEntry.new("Today", "I rode a bike.")
    expect(entry.contents).to eq "I rode a bike."
  end

  it "returns an accurate word count of the contents" do
    entry = DiaryEntry.new("Today", "I rode a bike.")
    expect(entry.count_words).to eq 4
  end

  it "returns an empty title when title is set to an empty string" do
    entry = DiaryEntry.new("","")
    expect(entry.title).to eq ""
  end

  it "returns an empty contents when contents is set to an empty string" do
    entry = DiaryEntry.new("","")
    expect(entry.contents).to eq ""
  end

  it "returns a word count of 0 when contents is an empty string" do
    entry = DiaryEntry.new("","")
    expect(entry.count_words).to eq 0
  end

  it "returns an accurate word count of the contents when string contains a number" do
    entry = DiaryEntry.new("Today","1 rode a b1ke.")
    expect(entry.count_words).to eq 4
  end

  it "returns an accurate reading time when given wpm" do
    entry = DiaryEntry.new("Today","Bike " * 60)
    expect(entry.reading_time(60)).to eq 1
    entry2 = DiaryEntry.new("Today","I rode a bike.")
    expect(entry2.reading_time(60)).to eq 0
    entry3 = DiaryEntry.new("Today","Bike " * 90)
    expect(entry3.reading_time(60)).to eq 2
  end

  it "reading_time fails when wpm is not an integer" do
    entry = DiaryEntry.new("Today","I rode a bike.")
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
