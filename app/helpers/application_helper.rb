module ApplicationHelper

  def find_task_name(event_task)
    Task.find(event_task.task.id).name
  end

  def find_category(event_task)
    event_task.task.category
  end
end
