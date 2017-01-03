class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_number
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :email
      t.string :picture

      t.timestamps
    end
  end
end
