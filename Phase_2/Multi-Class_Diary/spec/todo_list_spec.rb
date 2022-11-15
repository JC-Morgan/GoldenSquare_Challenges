require 'todo_list'

describe TodoList do

  it "Returns an empty list when no todos have been added" do
    list = TodoList.new
    expect(list.see_list).to eq []
  end

  it "Returns a todo in a list when a todo is added" do
    list = TodoList.new
    list.add("Feed the dog")
    expect(list.see_list).to eq ["Feed the dog"]
  end

  it "Returns todos in a list when todos are added" do
    list = TodoList.new
    list.add("Feed the dog")
    list.add("Clean the kitchen")
    expect(list.see_list).to eq ["Feed the dog", "Clean the kitchen"]
  end

end
