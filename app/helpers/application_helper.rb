module ApplicationHelper

def find_task_name(event_task)
  Task.find(event_task.task.id).name
end
end
