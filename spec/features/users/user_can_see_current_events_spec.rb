require "rails_helper"

feature "As a logged in user" do
  scenario "I can see all events I am part of in dashboard" do
    user = create(:user)
    event = create(:event)
    role = create(:role)
    user.user_events.create(event_id: 1, role_id: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content(user.events.first.name)
    expect(page).to have_content("Your events")
    expect(page).to have_content("Create a new event")
  end
end
