require 'rails_helper'

RSpec.describe EventsCategory, type: :model do
  describe "validations" do
    context "relationships" do
      it "belongs to an event" do
        events_category = create(:events_category)
        expect(events_category).to respond_to(:event)
      end

      it "belongs to a category" do
        events_category = create(:events_category)
        expect(events_category).to respond_to(:category)
      end
    end
  end
end
