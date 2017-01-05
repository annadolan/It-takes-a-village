class Role < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  has_many :events, through: :user_events

  validates :name, presence: true
end
