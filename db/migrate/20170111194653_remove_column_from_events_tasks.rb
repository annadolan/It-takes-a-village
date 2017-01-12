class RemoveColumnFromEventsTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :events_tasks, :start_time, :string
  end
end
