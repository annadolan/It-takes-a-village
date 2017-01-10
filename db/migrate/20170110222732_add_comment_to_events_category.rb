class AddCommentToEventsCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :events_categories, :comment, :text
  end
end
