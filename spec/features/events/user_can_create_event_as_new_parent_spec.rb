require 'rails_helper'

describe "As a logged in user" do
  scenario "I can create an event with categories and choose my role and tasks on each category" do
    user = create(:user)
    role = create(:role, name: "Organizer")
    role1 = create(:role, name: "New Parent")
    categories = create_list(:category, 3)
    task1 = create(:task, category_id: categories.first.id, name: "A")
    task2 = create(:task, category_id: categories.first.id, name: "B")
    task3 = create(:task, category_id: categories.last.id, name: "C")
    task4 = create(:task, category_id: categories.last.id, name: "D")

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

    within("#category-#{categories.first.id}") do
      expect(page.find('.multiselect')[:multiple]).to be_truthy
    end

    within("#category-#{categories.last.id}") do
      expect(page.find('.multiselect')[:multiple]).to be_truthy
    end

    expect(page).to have_button("Add selected tasks")
  end
end
