class AddColumnToEventsTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :events_tasks, :date, :string
  end
end
