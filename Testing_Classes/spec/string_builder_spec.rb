require 'string_builder'


describe StringBuilder do

  it "returns an empty string when no strings are added" do
    string = StringBuilder.new
    expect(string.output).to eq ""
  end

  it "returns a length of zero when no strings are added" do
    string = StringBuilder.new
    expect(string.size).to eq 0
  end

  it "returns the string when given a string" do
    string = StringBuilder.new
    string.add("Testing")
    expect(string.output).to eq "Testing"
  end

  it "returns an accurate length when given a string" do
    string = StringBuilder.new
    string.add("Testing")
    expect(string.size).to eq 7
  end

  it "returns an accurate string when given multiple strings" do
    string = StringBuilder.new
    string.add("Testing")
    string.add(" is ")
    string.add("fun!")
    expect(string.output).to eq "Testing is fun!"
  end

  it "returns an accurate length when given multiple strings" do
    string = StringBuilder.new
    string.add("Testing")
    string.add(" is ")
    string.add("fun!")
    expect(string.size).to eq 15
  end

end
