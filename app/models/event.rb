class Event < ApplicationRecord
  has_many :users, through: :user_events
  has_many :roles, through: :user_events
  has_many :user_events
  has_many :tasks
end
