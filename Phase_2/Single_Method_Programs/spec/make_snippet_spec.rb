require 'make_snippet'

describe "make_snippet method" do

  context "given an empty string" do
    it "returns an empty string" do
      expect(make_snippet("")).to eq ""
    end
  end

  context "given a string of five words" do
    it "returns that string" do
      expect(make_snippet("Test sentence with five words")).to eq "Test sentence with five words"
    end
  end

  context "given a string of more than 5 words" do
    it "returns the first five words of that string + ..." do
      result = make_snippet("This is a test sentence with more than five words")
      expect(result).to eq "This is a test sentence..."
    end
  end

end
