class TodoList
  def initialize
    @list = []
  end

  def add(task)
    @list.push(task.to_s)
  end

  def list
    return @list
  end

  def complete(task)
    if @list.include? task
      @list.delete(task)
    else
      fail "'#{task}' not found in list."
    end
  end
end
