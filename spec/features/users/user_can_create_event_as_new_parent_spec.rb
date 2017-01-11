require 'rails_helper'

describe "As a logged in user" do
  scenario "I can create an event with categories and choose my role" do
    user = create(:user)
    role = create(:role, name: "Organizer")
    role1 = create(:role, name: "New Parent")
    categories = create_list(:category, 3)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_on "Create a new event"

    expect(current_path). to eq(new_event_path)

    fill_in "event-name", with: "My event"

    choose("event_user_event_role_id_#{role.id}")


    check("event_category_ids_#{categories.first.id}")
    check("event_category_ids_#{categories.last.id}")

    click_on "Create Event"

    expect(current_path).to eq(edit_event_path(Event.last))
  end
end
