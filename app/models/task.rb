class Task < ApplicationRecord
  belongs_to :event
  belongs_to :user
  belongs_to :category

  validates :name,
            :date,
            :time, presence: true

  def start_time
    self.date.to_datetime
  end
  
 end
