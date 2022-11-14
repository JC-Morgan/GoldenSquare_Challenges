require 'diary'

describe Diary do

  context "Upon initialization" do

    it "the all method returns an empty list" do
      diary = Diary.new
      expect(diary.all).to eq []
    end

    it "the count_words method returns a word count of 0" do
      diary = Diary.new
      expect(diary.count_words).to eq 0
    end

    it "the reading_time method returns a time of 0" do
      diary = Diary.new
      expect(diary.reading_time(2)).to eq 0
    end

  end

end
