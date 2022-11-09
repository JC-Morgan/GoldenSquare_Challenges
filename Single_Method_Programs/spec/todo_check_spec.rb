require 'todo_check'

describe 'todo_check method' do

  context "given an empty string" do
    it "fails" do
      expect { todo_check("") }.to raise_error "No #TODO in text."
    end
  end

  context "given a string containing #TODO" do
    it "returns true" do
      expect(todo_check("#TODO")).to eq true
      expect(todo_check("#TODO Feed the dog")).to eq true
    end
  end

  context "given a string containing #TODO with no spaces around it" do
    it "returns true" do
      expect(todo_check("Feed the cat#TODO Feed the dog")).to eq true
    end
  end

  context "given a string that does not contain #TODO" do
    it "fails" do
      expect { todo_check("This is a test sentence.#ToDO") }.to raise_error "No #TODO in text."
      expect { todo_check("This is a test sentence.") }.to raise_error "No #TODO in text."
    end
  end
end
