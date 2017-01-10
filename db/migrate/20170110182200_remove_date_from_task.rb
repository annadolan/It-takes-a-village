class RemoveDateFromTask < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :date, :string
  end
end
