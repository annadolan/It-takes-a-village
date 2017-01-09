class CreateEventsCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :events_categories do |t|
      t.references :category, foreign_key: true
      t.references :event, foreign_key: true
    end
  end
end
