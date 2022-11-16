require "task_list"

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  # Unit test `#all` and `#all_complete?` behaviour
  it "returns an added task" do
    task_list = TaskList.new
    fake_task = double :fake_task
    task_list.add(fake_task)
    expect(task_list.all).to eq [fake_task]
  end

  it "returns multiple added tasks" do
    task_list = TaskList.new
    fake_task_1 = double :fake_task
    fake_task_2 = double :fake_task
    task_list.add(fake_task_1)
    task_list.add(fake_task_2)
    expect(task_list.all).to eq [fake_task_1, fake_task_2]
  end

  it "returns true if all tasks are completed" do
    task_list = TaskList.new
    fake_task_1 = (double(:fake_task, complete?: true))
    fake_task_2 = (double(:fake_task, complete?: true))
    task_list.add(fake_task_1)
    task_list.add(fake_task_2)
    expect(task_list.all_complete?).to eq true
  end

  it "returns false if not all tasks are completed" do
    task_list = TaskList.new
    fake_task_1 = (double(:fake_task, complete?: false))
    fake_task_2 = (double(:fake_task, complete?: true))
    task_list.add(fake_task_1)
    task_list.add(fake_task_2)
    expect(task_list.all_complete?).to eq false
  end
end
