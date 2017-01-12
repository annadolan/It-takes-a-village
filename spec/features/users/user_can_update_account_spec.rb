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

  scenario "I cannot update my account with an email address that exists on another user" do
    user = create(:user)
    user1 = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_user_path(user)

    fill_in "user[email]", with: user1.email
    click_button "Update Account"

    expect(page).to have_content("Account didn't update. Try again.")
  end
end
