require 'rails_helper'

describe "As a logged in user" do
  scenario "I can choose times for events task and see them on calendar to finish event creation" do
    user = create(:user)
    event = create(:event)
    task = create(:task)
    event.tasks << task

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_events_task_path(event)

    expect(page).to have_content("Last step:")
    expect(page).to have_content(task.name)

    fill_in 'Date', with: "January 12, 2017"
    click_on "Update these dates"

    expect(current_path). to eq(events_tasks_path(event))
    expect(page).to have_content("January 2017")
  end
end
