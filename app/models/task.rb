class Task < ApplicationRecord
  belongs_to :event
  belongs_to :category
  has_many :users, through: :users_tasks

  validates :name,
            :date,
            :time, presence: true

  def start_time
    self.date.to_datetime
  end

 end
