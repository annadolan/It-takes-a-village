require 'rails_helper'

describe "As a logged in user" do
  scenario "I can create an event as a new parent" do
    user = create(:user)
    role = create(:role, name: "New Parent")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_on "Create a new event"

    expect(path). to eq(new_event_path)
    

  end
end
