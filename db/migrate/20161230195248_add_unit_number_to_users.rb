class AddUnitNumberToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :unit_number, :string
  end
end
