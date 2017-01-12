class RemoveColumnEndTimeFromEventsTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :events_tasks, :end_time, :string
  end
end
