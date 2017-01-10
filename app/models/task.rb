class Task < ApplicationRecord
  belongs_to :category
  has_many :users_tasks
  has_many :users, through: :users_tasks
  has_many :events, through: :events_tasks
  has_many :events_tasks

  validates :name, presence: true

  def start_time
    self.date.to_datetime
  end

 end
