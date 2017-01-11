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
  end
  #
  # context "Uniqueness" do
  #   it { should validate_uniqueness_of(:email)}
  # end
end
