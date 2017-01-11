require 'rails_helper'

RSpec.describe EventsTask, type: :model do
  describe "validations" do
    context "relationships" do
      it "belongs to an event" do
        events_task = create(:events_task)
        expect(events_task).to respond_to(:event)
      end

      it "belongs to a task" do
        events_task = create(:events_task)
        expect(events_task).to respond_to(:task)
      end
    end
  end

  describe "#start_time" do
    context "start time method" do
      it "returns the start time of the event task" do
        events_task = create(:events_task, date: "January 12, 2017")
        expect(events_task.start_time.class).to eq(Date)
      end
    end
  end
end
