require 'diary'

describe Diary do

  context "When no entries have been added to the diary" do
    it "(all_entries) returns an empty list" do
      my_diary = Diary.new
      expect(my_diary.all_entries).to eq []
    end
  end

  context "When an entry has been added to the diary" do
    it "(all_entries) returns that entry in a list" do
      my_diary = Diary.new
      my_diary.add("Today, I rode a bike")
      expect(my_diary.all_entries).to eq ["Today, I rode a bike"]
    end
  end

  context "When multiple entries have been added to the diary" do
    it "(all_entries) returns those entries in a list" do
      my_diary = Diary.new
      my_diary.add("Today, I rode a bike")
      my_diary.add("Hi Diary, It's my birthday!")
      expect(my_diary.all_entries).to eq ["Today, I rode a bike", "Hi Diary, It's my birthday!"]
    end
  end

  context "When readable_within_time is called when no entries have been added to the diary" do
    it "returns nil" do
      my_diary = Diary.new
      expect(my_diary.readable_within_time(2,4)).to eq nil
    end
  end

  context "When readable_within_time is called" do
    it "returns the largest entry that can be read within that time" do
      my_diary = Diary.new
      my_diary.add("Today, I rode a bike")
      my_diary.add("Hi Diary, it's my birthday today and we went to the arcade!")
      expect(my_diary.readable_within_time(2,7)).to eq "Hi Diary, it's my birthday today and we went to the arcade!"

      expect(my_diary.readable_within_time(2,3)).to eq "Today, I rode a bike"

      expect(my_diary.readable_within_time(2,2.5)).to eq "Today, I rode a bike"
    end
  end

end
