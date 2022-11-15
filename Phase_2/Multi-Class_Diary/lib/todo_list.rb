class TodoList

  def initialize
    @list = []
  end

  def add(todo)
    @list << todo
  end

  def see_list
    @list
  end

end
