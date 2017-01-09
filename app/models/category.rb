class Category < ApplicationRecord
  has_many :tasks
  has_many :events, through: :events_categories
  validates :name, presence: true
end
