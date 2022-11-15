require 'tasks'

describe TodoList do

  context "When initialized" do
    it "returns an empty list when the list method is called" do
      todo_list = TodoList.new
      expect(todo_list.list).to eq []
    end
  end

  context "When a task is added to list" do
    it "returns that task in the list" do
      todo_list = TodoList.new
      todo_list.add("Feed the dog")
      expect(todo_list.list).to eq ["Feed the dog"]
    end
  end

  context "When tasks are added to list" do
    it "returns an accurate list" do
      todo_list = TodoList.new
      todo_list.add("Feed the dog")
      todo_list.add("Clean the kitchen")
      expect(todo_list.list).to eq ["Feed the dog", "Clean the kitchen"]
    end
  end


  context "When the complete method is called" do
    it "returns an accurate list (without the completed task)" do
      todo_list = TodoList.new
      todo_list.add("Feed the dog")
      todo_list.add("Clean the kitchen")
      todo_list.complete("Clean the kitchen")
      expect(todo_list.list).to eq ["Feed the dog"]
    end
  end

  context "When the complete method is called with a task that is not in the list" do
    it "fails" do
      todo_list = TodoList.new
      todo_list.add("Feed the dog")
      todo_list.add("Clean the kitchen")
      expect { todo_list.complete("Buy dog food") }.to raise_error "'Buy dog food' not found in list."
    end
  end

end
