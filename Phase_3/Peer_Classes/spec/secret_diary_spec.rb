require 'secret_diary'

describe SecretDiary do

  it "returns the error 'Go away!' upon initialization (calling read without using the unlock method first)" do
    diary = double(:diary, read: "Today, I rode a bike.")
    my_diary = SecretDiary.new(diary)
    expect { my_diary.read }.to raise_error "Go away!"
  end

  it "returns the error 'Diary is already locked' upon initialization (calling lock without using the unlock method first)" do
    diary = double(:diary, read: "Today, I rode a bike.")
    my_diary = SecretDiary.new(diary)
    expect { my_diary.lock }.to raise_error "Diary is already locked"
  end

  it "returns the error 'Diary is not locked' when unlock is called if the diary is not locked" do
    diary = double(:diary, read: "Today, I rode a bike.")
    my_diary = SecretDiary.new(diary)
    my_diary.unlock
    expect { my_diary.unlock }.to raise_error "Diary is not locked"
  end

  it "returns the error 'Go away!' when the diary is locked using the lock method" do
    diary = double(:diary, read: "Today, I rode a bike.")
    my_diary = SecretDiary.new(diary)
    my_diary.unlock
    my_diary.lock
    expect { my_diary.read }.to raise_error "Go away!"
  end

  it "allows the user to unlock the diary and use the read method to return the contents" do
    diary = double(:diary, read: "Today, I rode a bike.")
    my_diary = SecretDiary.new(diary)
    my_diary.unlock
    expect(my_diary.read).to eq "Today, I rode a bike."
  end

end
