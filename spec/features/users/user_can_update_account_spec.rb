# require 'rails_helper'
#
# As a logged in user
# I can click on "Edit My Profile"
# I am taken to the edit page
# I can change my email to "test@test.com"
# I click on "Update My Info"
# and I am taken to my home page where I see my new email.

require 'rails_helper'

feature "As a logged in user" do
  scenario "I can edit my account information" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_path(user)

    click_on "Edit your account"

    expect(current_path).to eq(edit_user_path(user))

    fill_in "user[email]", with: "newemail@email.com"
    click_button "Update Account"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("#{user.first_name} account updated!")

  end
end
