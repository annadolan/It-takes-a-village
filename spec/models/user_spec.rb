require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    User.any_instance.stub(:generate_slug) { nil }
  end
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without first name" do
        user = User.new(last_name: "Jones", email: "bob@jones.com", password: "password")
        expect(user).to be_invalid
      end

      it "is invalid without last name" do
        user = user = User.new(first_name: "Bob", email: "bob@jones.com", password: "password")
        expect(user).to be_invalid
      end

      it "is invalid without email" do
        user = User.new(first_name: "Bob", last_name: "Jones", password: "password")
        expect(user).to be_invalid
      end

      it "is invalid without password" do
        user = User.new(first_name: "Bob", last_name: "Jones", email: "bob@jones.com")
        expect(user).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        user = User.new(first_name: "Bob", last_name: "Jones", email: "bob@jones.com", password: "password")
        expect(user).to be_valid
      end
    end

    context "Uniqueness" do
      it { should validate_uniqueness_of(:email)}
    end
  end

  describe ".full_street_address" do
    it "creates full address based on user attributes" do
      user = create(:user, street_number: "100 Main Street", city: "Denver", state: "CO", zip_code: "80000")

      expect(user.full_street_address).to eq("100 Main Street, Denver, CO, 80000")
    end
  end

  describe ".has_events?" do
    it "returns true if user has events" do
      user = create(:user)
      user_event = create(:user_event, user_id: user.id)
      expect(user.has_events?).to eq(true)
    end

    it "returns false if user has no events" do
      user = create(:user)
      expect(user.has_events?).to eq(false)
    end
  end


end
