require 'rails_helper'

describe ApplicationHelper do
  context "#find_task_name" do
    it "returns task name of associated event_task" do
      task = create(:task)
      events_task = create(:events_task, task_id: task.id)
      expect(find_task_name(events_task)).to eq(task.name)
    end
  end

  context "#find_category" do
    it "returns category name of associated event_task" do
      category = create(:category)
      task = create(:task, category: category)
      events_task = create(:events_task, task: task)
      expect(find_category(events_task).name).to eq(category.name)
    end
  end
end
