require "rails_helper"

feature "As a logged in user" do
  scenario "I can see my own profile" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit show_user_path(user.slug)

    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.city)
    expect(page).to have_content(user.state)
  end
end
