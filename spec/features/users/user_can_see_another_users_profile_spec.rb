require "rails_helper"

feature "As a logged in user" do
  scenario "I can see another user's profile" do
    user = create(:user, first_name: "Bob", last_name: "Jones")
    user1 = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit show_user_path(user.slug)

    expect(page).to have_content("Bob Jones")
    expect(page).to have_content(user.city)
    expect(page).to have_content(user.state)
  end
end

feature "As a guest" do
  scenario "I cannot see another user's profile" do
    user = create(:user, first_name: "Bob", last_name: "Jones")

    visit show_user_path(user.slug)

    expect(page).to_not have_content("Bob Jones")
    expect(page).to_not have_content(user.city)
    expect(page).to_not have_content(user.state)
    expect(page).to have_content("404")
  end
end
