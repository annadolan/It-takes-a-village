require 'rails_helper'

RSpec.describe UsersTask, type: :model do
  describe "validations" do
    context "relationships" do
      it "belongs to a user" do
        users_task = create(:users_task)
        expect(users_task).to respond_to(:user)
      end

      it "belongs to an task" do
        users_task = create(:users_task)
        expect(users_task).to respond_to(:task)
      end
    end
  end
end
