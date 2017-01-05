require 'rails_helper'

RSpec.describe Role, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without name" do
        role = Role.new
        expect(role).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        role = Role.new(name: "Villager")
        expect(role).to be_valid
      end
    end

    context "relationships" do
      it "has many users" do
        role = create(:role)
        expect(role).to respond_to(:users)
      end

      it "has many events" do
        role = create(:role)
        expect(role).to respond_to(:events)
      end

      it "has many user events" do
        role = create(:role)
        expect(role).to respond_to(:user_events)
      end
    end
  end
end
