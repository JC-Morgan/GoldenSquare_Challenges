require 'count_words'

describe "count_words method" do

  context "given an empty string" do
    it "returns zero" do
      expect(count_words("")).to eq 0
    end
  end

  context "given a string" do
    it "returns an accurate length of that string" do
      expect(count_words("Test string with five words")).to eq 5
    end
  end

end
