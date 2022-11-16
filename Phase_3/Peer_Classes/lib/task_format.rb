class TaskFormatter
  def initialize(task)
    @task = task
  end

  def format
    return "- [x] #{@task.title}" if @task.complete?
    return "- [ ] #{@task.title}"
  end
end
