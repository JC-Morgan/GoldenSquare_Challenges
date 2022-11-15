require 'todo_list'
require 'todo'

describe "integration" do

  it "Successfully adds a task to the incomplete list" do
    todo = Todo.new("Feed the dog")
    list = TodoList.new
    list.add(todo)
    expect(list.incomplete).to eq ["Feed the dog"]
    expect(list.complete).to eq []
  end

  it "Successfully adds a task to the complete list" do
    todo = Todo.new("Feed the dog")
    todo.mark_done!
    list = TodoList.new
    list.add(todo)
    expect(list.incomplete).to eq []
    expect(list.complete).to eq ["Feed the dog"]
  end

  it "Successfully marks all incomplete tasks as complete when the user gives up" do
    todo = Todo.new("Feed the dog")
    todo.mark_done!
    list = TodoList.new
    list.add(todo)
    todo1 = Todo.new("Buy new phone")
    todo2 = Todo.new("Clean the kitchen")
    list.add(todo1)
    list.add(todo2)
    expect(list.complete).to eq ["Feed the dog"]
    expect(list.incomplete).to eq ["Buy new phone", "Clean the kitchen"]
    list.give_up!
    expect(list.complete).to eq ["Feed the dog", "Buy new phone", "Clean the kitchen"]
    expect(list.incomplete).to eq []
  end
end
