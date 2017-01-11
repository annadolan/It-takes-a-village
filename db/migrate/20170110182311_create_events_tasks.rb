class CreateEventsTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :events_tasks do |t|
      t.references :event, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
