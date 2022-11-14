require 'diary'
require 'diary_entry'

describe "integration" do

  context "When entries are added to the diary" do
    it "lists out the added entries" do
      diary = Diary.new
      diary_ent1 = DiaryEntry.new("Today", "I rode a bike.")
      diary_ent2 = DiaryEntry.new("Birthday", "It was my birthday today!")
      diary.add(diary_ent1)
      diary.add(diary_ent2)
      expect(diary.all).to eq [diary_ent1, diary_ent2]
    end
  end

  context "When the count_words method is called" do
    it "returns an accurate word count of all diary entries" do
      diary = Diary.new
      diary_ent1 = DiaryEntry.new("Today", "I rode a bike.")
      diary_ent2 = DiaryEntry.new("Birthday", "It was my birthday today!")
      diary.add(diary_ent1)
      diary.add(diary_ent2)
      expect(diary.count_words).to eq 9
    end
  end

  context "When the reading_time method is called" do

    it "returns an accurate reading time for all entries" do
      diary = Diary.new
      diary_ent1 = DiaryEntry.new("Today", "I rode a bike.")
      diary_ent2 = DiaryEntry.new("Birthday", "It was my birthday today!")
      diary.add(diary_ent1)
      diary.add(diary_ent2)
      expect(diary.reading_time(3)).to eq 3
      diary_ent3 = DiaryEntry.new("Test", "Test 1")
      diary.add(diary_ent3)
      expect(diary.reading_time(3)).to eq 4
    end

    it "fails when wpm is 0 or not a number" do
      diary = Diary.new
      diary_ent = DiaryEntry.new("Today", "I rode a bike.")
      diary.add(diary_ent)
      expect { diary.reading_time(0) }.to raise_error
      expect { diary.reading_time("Hello") }.to raise_error
    end

  end

  context "When the find_best_entry_for_reading_time method is called" do

    it "returns an entry that can be read within the time given (largest possible within time)" do
      diary = Diary.new
      diary_ent1 = DiaryEntry.new("Today", "I rode a bike.")
      diary_ent2 = DiaryEntry.new("Birthday", "It was my birthday today! We went to the park. It was nice.")
      diary.add(diary_ent1)
      diary.add(diary_ent2)
      expect(diary.find_best_entry_for_reading_time(6,2)).to eq diary_ent1
    end

    it "returns nil when there is not an entry that can be read within the time given" do
      diary = Diary.new
      diary_ent1 = DiaryEntry.new("Today", "I rode a bike.")
      diary.add(diary_ent1)
      expect(diary.find_best_entry_for_reading_time(1,1)).to eq nil
    end

    it "fails when wpm is 0 or not a number" do
      diary = Diary.new
      diary_ent = DiaryEntry.new("Today", "I rode a bike.")
      diary.add(diary_ent)
      expect { diary_ent.find_best_entry_for_reading_time(0,1) }.to raise_error
      expect { diary_ent.find_best_entry_for_reading_time("Hi",1) }.to raise_error
    end
  end

end
