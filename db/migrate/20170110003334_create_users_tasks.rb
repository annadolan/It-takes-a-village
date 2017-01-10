class CreateUsersTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :users_tasks do |t|
      t.references :user
      t.references :task

      t.timestamps
    end
  end
end
