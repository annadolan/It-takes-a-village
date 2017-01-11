require 'rails_helper'

feature "As a logged in user" do
  scenario "I can edit my account information" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_user_path(user)

    fill_in "user[email]", with: "newemail@email.com"
    click_button "Update Account"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("#{user.first_name}'s account updated!")
  end
end
