require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without name" do
        event = Event.new
        expect(event).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        event = Event.new(name: "Baby time!")
        expect(event).to be_valid
      end
    end

    context "relationships" do
      it "has many users" do
        event = create(:event)
        expect(event).to respond_to(:users)
      end

      it "has many roles" do
        event = create(:event)
        expect(event).to respond_to(:roles)
      end

      it "has many user events" do
        event = create(:event)
        expect(event).to respond_to(:user_events)
      end

      it "has many tasks" do
        event = create(:event)
        expect(event).to respond_to(:tasks)
      end

      it "has many events tasks" do
        event = create(:event)
        expect(event).to respond_to(:events_tasks)
      end

      it "has many events categories" do
        event = create(:event)
        expect(event).to respond_to(:events_categories)
      end

      it "has many categories" do
        event = create(:event)
        expect(event).to respond_to(:categories)
      end
    end
  end
end
