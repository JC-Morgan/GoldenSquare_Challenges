class Todo
  def initialize(task)
    @task = task
    @completed = false
  end

  def task
    return @task.to_s
  end

  def mark_done!
    @completed = true
  end

  def done?
    if @completed == true
      return true
    else
      return false
    end
  end
end
