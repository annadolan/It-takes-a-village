class Task < ApplicationRecord
  belongs_to :category
  has_many :users, through: :users_tasks
  has_many :events, through: :events_tasks
  has_many :events_tasks

  validates :name, presence: true
 end
