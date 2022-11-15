require 'grammar'

describe "grammar_check method" do

  context "given an empty string" do
    it "fails" do
      expect { grammar_check("") }.to raise_error "Not a sentence."
    end
  end

  context "given a string with a capital letter at the start and incorrect end punctuation" do
    it "fails" do
      expect { grammar_check("Hello") }.to raise_error "Not a sentence."
      expect { grammar_check("Hello, my name is Lucas,") }.to raise_error "Not a sentence."
    end
  end

  context "given a string with no capital letter at the start and incorrect end punctuation" do
    it "fails" do
      expect { grammar_check("hello, my name is Lucas,") }.to raise_error "Not a sentence."
    end
  end

  context "given a string with no capital letter at the start and correct end punctuation" do
    it "fails" do
      expect { grammar_check("hello.") }.to raise_error "Not a sentence."
    end
  end

  context "given a string with a capital letter at the start and correct end punctuation" do
    it "returns true" do
      expect(grammar_check("Hello, my name is Lucas.")).to eq true
      expect(grammar_check("Hello, my name is Lucas?")).to eq true
      expect(grammar_check("Hello, my name is Lucas!")).to eq true
    end
  end

end
