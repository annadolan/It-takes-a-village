require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without name" do
        category = create(:category)
        user = create(:user)
        event = create(:event)
        task = Task.new(date: "11/25/17", time: "11:00am", category_id: category.id, event_id: event.id, user_id: user.id)
        expect(task).to be_invalid
      end

      it "is invalid without date" do
        category = create(:category)
        user = create(:user)
        event = create(:event)
        task = Task.new(name: "Dogsit", time: "11:00am", category_id: category.id, event_id: event.id, user_id: user.id)
        expect(task).to be_invalid
      end

      it "is invalid without time" do
        category = create(:category)
        user = create(:user)
        event = create(:event)
        task = Task.new(name: "Dogsit", date: "11/25/17", category_id: category.id, event_id: event.id, user_id: user.id)
        expect(task).to be_invalid
      end

      it "is invalid without user id" do
        category = create(:category)
        user = create(:user)
        event = create(:event)
        task = Task.new(name: "Dogsit", date: "11/25/17", time: "11:00am", category_id: category.id, event_id: event.id)
        expect(task).to be_invalid
      end

      it "is invalid without event id" do
        category = create(:category)
        user = create(:user)
        event = create(:event)
        task = Task.new(name: "Dogsit", date: "11/25/17", time: "11:00am", category_id: category.id, user_id: user.id)
        expect(task).to be_invalid
      end

      it "is invalid without category id" do
        category = create(:category)
        user = create(:user)
        event = create(:event)
        task = Task.new(name: "Dogsit", date: "11/25/17", time: "11:00am", event_id: event.id, user_id: user.id)
        expect(task).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        category = create(:category)
        user = create(:user)
        event = create(:event)
        task = Task.new(name: "Dogsit", date: "11/25/17", time: "11:00am", category_id: category.id, event_id: event.id, user_id: user.id)
        expect(task).to be_valid
      end
    end

    context "relationships" do
      it "belongs to a user" do
        task = create(:task)
        expect(task).to respond_to(:user)
      end

      it "belongs to an event" do
        task = create(:task)
        expect(task).to respond_to(:event)
      end

      it "belongs to a category" do
        task = create(:task)
        expect(task).to respond_to(:category)
      end
    end
  end

  describe "#start_time" do
    it "it returns start time of task" do
      task = create(:task, date: "January 10, 2017")
      expect(task.start_time).to eq("Tue, 10 Jan 2017 00:00:00.000000000 +0000")
    end
  end
end
