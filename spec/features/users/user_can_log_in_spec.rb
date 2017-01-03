require "rails_helper"

describe "Registered user" do
  context "visits root page" do
    scenario "can see a log in link and can log into their account" do

      user  = create(:user)

      visit root_path

      click_on  "Log In"

      expect(current_path).to eq(login_path)

      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password
      click_on "Login"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Hey #{user.first_name}")
    end

    scenario "can see a log in link and can log into their account" do

      user  = create(:user)

      visit root_path

      click_on  "Log In"

      expect(current_path).to eq(login_path)

      fill_in "session[email]", with: user.email
      click_on "Login"

      expect(page).to have_content("Log In to Your Account")
    end
  end
end
