require 'todo'

describe Todo do

  context "When initialized with an empty task" do

    it "returns an empty task" do
      todo = Todo.new("")
      expect(todo.task).to eq ""
    end

    it "done? returns false" do
      todo = Todo.new("")
      expect(todo.done?).to eq false
    end

  end

  context "When initialized with a task" do
    it "returns that task" do
      todo = Todo.new("Feed the dog")
      expect(todo.task).to eq "Feed the dog"
    end
  end

  context "When initialized with a task and then marked done" do
    it "done? returns true" do
      todo = Todo.new("Feed the dog")
      todo.mark_done!
      expect(todo.done?).to eq true
    end
  end

end

