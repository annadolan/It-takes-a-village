require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without name" do
        category = Category.new
        expect(category).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        category = Category.new(name: "Babysitting")
        expect(category).to be_valid
      end
    end

    context "relationships" do
      it "has many tasks" do
        category = create(:category)
        expect(category).to respond_to(:tasks)
      end

      it "has many events categories" do
        category = create(:category)
        expect(category).to respond_to(:events_categories)
      end

      it "has many events" do
        category = create(:category)
        expect(category).to respond_to(:events)
      end
    end
  end
end
