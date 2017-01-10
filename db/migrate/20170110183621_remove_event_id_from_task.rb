class RemoveEventIdFromTask < ActiveRecord::Migration[5.0]
  def change
    remove_reference :tasks, :event, foreign_key: true
  end
end
