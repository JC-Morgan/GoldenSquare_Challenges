# Tasks Class Design Recipe

## 1. Describe the Problem

_The user story and any clarifying notes:_

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class Interface

_Class name, initializer and public methods with parameters and return values:_

```ruby
class TodoList
  def initialize
    # No return value
  end

  def add(task) # task is a string (containing a task)
    # No return value
  end

  def list
    # Returns the list of tasks to be completed(list of strings)
  end

  def complete(task) # task is a string (containing a task)
    # No return value
    # Fails if task does not exist in list
  end
end
```

## 3. Create Examples as Tests

_Examples of how the class will behave in different situations:_

```ruby
# 1
todo_list = TodoList.new
todo_list.list # => []

# 2
todo_list = TodoList.new
todo_list.add("Feed the dog")
todo_list.list # => ["Feed the dog"]

# 3
todo_list = TodoList.new
todo_list.add("Feed the dog")
todo_list.add("Clean the kitchen")
todo_list.list # => ["Feed the dog", "Clean the kitchen"]

# 4
todo_list = TodoList.new
todo_list.add("Feed the dog")
todo_list.add("Clean the kitchen")
todo_list.complete("Clean the kitchen")
todo_list.list # => ["Feed the dog"]

# 5
todo_list = TodoList.new
todo_list.add("Feed the dog")
todo_list.add("Clean the kitchen")
todo_list.complete("Buy dog food") # => fails "'Buy dog food' not found in list."
```

_These examples will be made into tests._

## 4. Implement the Behaviour

