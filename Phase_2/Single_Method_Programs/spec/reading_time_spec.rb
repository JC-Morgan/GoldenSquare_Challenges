require 'reading_time'

describe "reading_time method" do

  context "given an empty string" do
    it "returns a time of 0" do
      expect(reading_time("")).to eq "0 minute(s)"
    end
  end

  context "given a string with one or a few words (less than 200)" do
    it "returns a time of 1" do
      expect(reading_time("Word")).to eq "1 minute(s)"
    end
  end

  context "given a text with two hundred words" do
    it "returns a time of 1" do
      expect(reading_time("Word " * 200)).to eq "1 minute(s)"
    end
  end

  context "given a text with an amount of words that is more than two hundred but not divisible by two hundred" do
    it "returns an accurate time estimate" do
      expect(reading_time("Word " * 300)).to eq "2 minute(s)"
    end
  end

  context "given a text with an amount of words that is more than two hundred and divisible by two hundred" do
    it "returns an accurate time estimate" do
      expect(reading_time("Word " * 600)).to eq "3 minute(s)"
    end
  end

end
