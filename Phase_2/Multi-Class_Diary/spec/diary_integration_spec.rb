require 'diary'
require 'contacts'

describe "diary-contacts integration" do

  context "When there are no numbers in the diary entries" do
    it "(contacts_list) returns an empty list" do
      my_diary = Diary.new
      my_diary.add("Today, I rode a bike")
      numbers = Contacts.new(my_diary.all_entries)
      expect(numbers.contacts_list).to eq []
    end
  end

  context "When there is a number in the diary entries" do
    it "(contacts_list) returns that number in a list" do
      my_diary = Diary.new
      my_diary.add("Today, I rode a bike. 01453777555")
      numbers = Contacts.new(my_diary.all_entries)
      expect(numbers.contacts_list).to eq ["01453777555"]
    end
  end

  context "When there are numbers in the diary entries" do
    it "(contacts_list) returns those numbers in a list" do
      my_diary = Diary.new
      my_diary.add("Today, I rode a bike. 01453777555")
      my_diary.add("Jane: 01453654475")
      numbers = Contacts.new(my_diary.all_entries)
      expect(numbers.contacts_list).to eq ["01453777555", "01453654475"]
    end
  end

  context "When there is more than one number in each diary entry" do
    it "(contacts_list) returns those numbers in a list" do
      my_diary = Diary.new
      my_diary.add("Today, I rode a bike. 01453777555 01453654475")
      numbers = Contacts.new(my_diary.all_entries)
      expect(numbers.contacts_list).to eq ["01453777555", "01453654475"]
    end
  end

  context "When there is an embedded number in the diary entries" do
    it "(contacts_list) returns that number in a list" do
      my_diary = Diary.new
      my_diary.add("Today, I rode a bike. jkh01453777555ujg")
      numbers = Contacts.new(my_diary.all_entries)
      expect(numbers.contacts_list).to eq ["01453777555"]
    end
  end

  context "When there is a number that does not classify as a phone number" do
    it "(contacts_list) does not return that number in a list" do
      my_diary = Diary.new
      my_diary.add("Today, I rode a bike. 0643578")
      numbers = Contacts.new(my_diary.all_entries)
      expect(numbers.contacts_list).to eq []
    end
  end

end
