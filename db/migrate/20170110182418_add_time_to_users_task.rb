class AddTimeToUsersTask < ActiveRecord::Migration[5.0]
  def change
    add_column :users_tasks, :time, :string
  end
end
