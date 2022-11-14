class TodoList

  def initialize
    @completedlist = []
    @todolist =[]
  end

  def add(todo)
    if todo.done? == true
      @completedlist.push(todo.task)
    else
      @todolist.push(todo.task)
    end
  end

  def incomplete
    return @todolist
  end

  def complete
    return @completedlist
  end

  def give_up!
    @todolist.each do |todo|
      @completedlist.push(todo)
    end
    @todolist = []
  end

end
