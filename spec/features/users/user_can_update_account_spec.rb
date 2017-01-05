require 'rails_helper'

feature "As a logged in user" do
  scenario "I can edit my account information" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_path(user)

    click_on "Edit your account"

    expect(current_path).to eq(edit_user_path(user))

    fill_in "user[email]", with: "newemail@email.com"
    fill_in "user[password]", with: "test"
    fill_in "user[password_confirmation]", with: "test"
    click_button "Update Account"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("#{user.first_name}'s account updated!")
  end

  scenario "I cannot edit my account information without my password" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_path(user)

    click_on "Edit your account"

    expect(current_path).to eq(edit_user_path(user))

    fill_in "user[email]", with: "newemail@email.com"
    click_button "Update Account"

    expect(page).to have_content("Account didn't update. Try again.")
  end
end
