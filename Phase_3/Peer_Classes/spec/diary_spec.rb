require 'diary'

describe Diary do

  it "returns contents when read method is called" do
    diary = Diary.new("Today, I rode a bike.")
    expect(diary.read).to eq "Today, I rode a bike."
  end

end
