require 'rails_helper'

RSpec.describe UserEvent, type: :model do
  describe "validations" do
    context "relationships" do
      it "belongs to a user" do
        user_event = create(:user_event)
        expect(user_event).to respond_to(:user)
      end

      it "belongs to an event" do
        user_event = create(:user_event)
        expect(user_event).to respond_to(:event)
      end

      it "belongs to a role" do
        user_event = create(:user_event)
        expect(user_event).to respond_to(:role)
      end
    end
  end
end
