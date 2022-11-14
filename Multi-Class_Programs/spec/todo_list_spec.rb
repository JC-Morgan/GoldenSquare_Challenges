require 'todo_list'

describe TodoList do

  context "When initialized (without any additions)" do

    it "returns an empty complete list" do
      list = TodoList.new
      expect(list.complete).to eq []
    end

    it "returns an empty incomplete list" do
      list = TodoList.new
      expect(list.incomplete).to eq []
    end

  end
end
