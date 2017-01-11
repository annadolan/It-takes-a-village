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
end
