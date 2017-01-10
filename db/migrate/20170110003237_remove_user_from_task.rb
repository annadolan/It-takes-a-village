class RemoveUserFromTask < ActiveRecord::Migration[5.0]
  def change
    remove_reference :tasks, :user, foreign_key: true
  end
end
