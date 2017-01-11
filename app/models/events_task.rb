class EventsTask < ApplicationRecord
  belongs_to :event
  belongs_to :task

  def start_time
    binding.pry
    self.start_time.to_datetime
  end

end
