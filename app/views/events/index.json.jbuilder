json.array!(@events_tasks) do |task|
  json.extract! task, :id, :name
  json.start task.start_time
  json.end task.end_time
end
