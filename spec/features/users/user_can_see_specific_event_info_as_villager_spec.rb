require "rails_helper"

feature "As a logged in villager" do
  scenario "I can see all event information on villager event show page" do
    user = create(:user)
    event = create(:event, id: 1)
    role = Role.create(id: 1, name: "Villager")
    user_event = user.user_events.create(event_id: 1, role_id: 1)
    task = create(:task, date: "January 10, 2017")
    event.tasks << task
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit event_path(event)

    expect(page).to have_content("Calendar")
    expect(page).to have_content(event.name)
    expect(page).to have_content(event.users.first.first_name)
  end
end
