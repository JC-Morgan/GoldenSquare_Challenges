require 'counter'


describe Counter do

  it "returns a count of zero when no numbers are given" do
    count = Counter.new
    expect(count.report).to eq "Counted to 0 so far."
  end

  it "returns an accurate count when given one number" do
    count = Counter.new
    count.add(23)
    expect(count.report).to eq "Counted to 23 so far."
  end

  it "returns an accurate count when given multiple numbers" do
    count = Counter.new
    count.add(2)
    count.add(4)
    count.add(6)
    expect(count.report).to eq "Counted to 12 so far."
  end

end
