class EventsTask < ApplicationRecord
  belongs_to :event
  belongs_to :task

  def start_time
    self.date.to_date
  end

end
