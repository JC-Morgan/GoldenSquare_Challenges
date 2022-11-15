require 'grammar_stats'

RSpec.describe GrammarStats do

  context "check when given an empty string" do
    it "fails" do
      stats = GrammarStats.new
      expect { stats.check("") }.to raise_error "Not a sentence."
    end
  end

  context "check when given a string with a capital letter at the start and incorrect end punctuation" do
    it "returns false" do
      stats = GrammarStats.new
      expect(stats.check("Hello")).to eq false
      expect(stats.check("Hello, my name is Lucas,")).to eq false
    end
  end

  context "check when given a string with no capital letter at the start and incorrect end punctuation" do
    it "fails" do
      stats = GrammarStats.new
      expect(stats.check("hello, my name is Lucas,")).to eq false
    end
  end

  context "check when given a string with no capital letter at the start and correct end punctuation" do
    it "fails" do
      stats = GrammarStats.new
      expect(stats.check("hello.")).to eq false
    end
  end

  context "check when given a string with a capital letter at the start and correct end punctuation" do
    it "returns true" do
      stats = GrammarStats.new
      expect(stats.check("Hello, my name is Lucas.")).to eq true
      expect(stats.check("Hello, my name is Lucas?")).to eq true
      expect(stats.check("Hello, my name is Lucas!")).to eq true
    end
  end

  context "when given a few texts to test" do
    it "returns the correct percentage of texts that passed" do
      stats = GrammarStats.new
      stats.check("Hello, my name is Lucas.")
      stats.check("Hello, my name is Lucas?")
      stats.check("Hello, my name is Lucas!")
      stats.check("hello.")
      stats.check("hi")
      expect(stats.percentage_good).to eq 60
    end
  end

end
