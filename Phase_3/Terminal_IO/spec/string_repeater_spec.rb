require "string_repeater"

describe StringRepeater do
  it "repeats a given input the specified amount of times" do
    io = double :io
    expect(io).to receive(:puts).with("Hello. I will repeat a string many times.")
    expect(io).to receive(:puts).with("Please enter a string")
    expect(io).to receive(:gets).and_return("TWIX")
    expect(io).to receive(:puts).with("Please enter a number of repeats")
    expect(io).to receive(:gets).and_return("10")
    expect(io).to receive(:puts).with("Here is your result:")
    expect(io).to receive(:puts).with("TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX")

    string_repeater = StringRepeater.new(io)
    string_repeater.run
  end

  it "repeats a given input the specified amount of times (another example)" do
    io = double :io
    expect(io).to receive(:puts).with("Hello. I will repeat a string many times.")
    expect(io).to receive(:puts).with("Please enter a string")
    expect(io).to receive(:gets).and_return("AGAIN")
    expect(io).to receive(:puts).with("Please enter a number of repeats")
    expect(io).to receive(:gets).and_return("5")
    expect(io).to receive(:puts).with("Here is your result:")
    expect(io).to receive(:puts).with("AGAINAGAINAGAINAGAINAGAIN")

    string_repeater = StringRepeater.new(io)
    string_repeater.run
  end
end
