require 'task_format'

describe TaskFormatter do

  it "returns a completed task in the correct format" do
    task = double(:task, title: "Feed the dog", complete?: true)
    task_form = TaskFormatter.new(task)
    expect(task_form.format).to eq "- [x] Feed the dog"
  end

  it "returns a non-completed task in the correct format" do
    task = double(:task, title: "Clean the kitchen", complete?: false)
    task_form = TaskFormatter.new(task)
    expect(task_form.format).to eq "- [ ] Clean the kitchen"
  end

end
