require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without name" do
        category = create(:category)
        user = create(:user)
        event = create(:event)
        task = Task.new(category_id: category.id)
        expect(task).to be_invalid
      end

      it "is invalid without category id" do
        category = create(:category)
        user = create(:user)
        event = create(:event)
        task = Task.new(name: "Dogsit")
        expect(task).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        category = create(:category)
        user = create(:user)
        event = create(:event)
        task = Task.new(name: "Dogsit", category_id: category.id)
        expect(task).to be_valid
      end
    end

    context "relationships" do

      it "belongs to a category" do
        task = create(:task)
        expect(task).to respond_to(:category)
      end
    end
  end
end
