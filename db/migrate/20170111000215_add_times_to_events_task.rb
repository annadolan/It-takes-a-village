class AddTimesToEventsTask < ActiveRecord::Migration[5.0]
  def change
   add_column :events_tasks, :start_time, :datetime
   add_column :events_tasks, :end_time, :datetime
  end
end
