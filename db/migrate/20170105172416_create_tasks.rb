class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.string :name
      t.string :date
      t.string :time

      t.timestamps
    end
  end
end
