class AddDateToUsersTask < ActiveRecord::Migration[5.0]
  def change
    add_column :users_tasks, :date, :string
  end
end
