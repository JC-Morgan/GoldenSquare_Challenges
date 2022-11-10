require 'todo_check_2'

describe 'todo_check2 method' do

  context "given an empty string" do
    it "returns false" do
      expect(todo_check2("")).to eq false
    end
  end

  context "given a string containing #TODO" do
    it "returns true" do
      expect(todo_check2("#TODO")).to eq true
      expect(todo_check2("#TODO Feed the dog")).to eq true
    end
  end

  context "given a string containing #TODO with no spaces around it" do
    it "returns true" do
      expect(todo_check2("Feed the cat#TODO Feed the dog")).to eq true
    end
  end

  context "given a string that does not contain #TODO" do
    it "returns false" do
      expect(todo_check2("This is a test sentence.#ToDO")).to eq false
      expect(todo_check2("This is a test sentence.")).to eq false
    end
  end
end
