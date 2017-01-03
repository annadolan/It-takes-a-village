class AddCategoryToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :category, foreign_key: true
  end
end
