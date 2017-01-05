require "rails_helper"

describe "Visit new uer path" do
  context "guest sees fields to create account" do
    scenario "creates new account" do
      user = build(:user)

      visit new_user_path

      fill_in "user[first_name]", with: user.first_name
      fill_in "user[last_name]", with: user.last_name
      fill_in "user[street_number]", with: user.street_number
      fill_in "user[unit_number]", with: "45"
      fill_in "user[city]", with: user.city
      fill_in "user[state]", with: user.state
      fill_in "user[zip_code]", with: user.zip_code
      fill_in "user[email]", with: user.email
      fill_in "user[phone]", with: user.phone
      fill_in "user[password]", with: user.password
      fill_in "user[password_confirmation]", with: user.password
      fill_in "user[picture]", with: user.picture

      click_on "Create Account"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome #{user.first_name}")
    end

    scenario "Cannot sign up without all required info" do
      user = build(:user)

      visit new_user_path

      fill_in "user[first_name]", with: user.first_name
      fill_in "user[last_name]", with: user.last_name
      fill_in "user[street_number]", with: user.street_number
      fill_in "user[unit_number]", with: "45"
      fill_in "user[city]", with: user.city
      fill_in "user[state]", with: user.state
      fill_in "user[password]", with: user.password
      fill_in "user[password_confirmation]", with: user.password
      fill_in "user[picture]", with: user.picture

      click_on "Create Account"

      expect(page).to have_content("Create a new account")
    end

    scenario "Cannot enter invalid email address" do
      user = build(:user)

      visit new_user_path

      fill_in "user[first_name]", with: user.first_name
      fill_in "user[last_name]", with: user.last_name
      fill_in "user[street_number]", with: user.street_number
      fill_in "user[unit_number]", with: "45"
      fill_in "user[city]", with: user.city
      fill_in "user[state]", with: user.state
      fill_in "user[email]", with: "bademail"
      fill_in "user[email]", with: user.email
      fill_in "user[phone]", with: user.phone
      fill_in "user[password]", with: user.password
      fill_in "user[password_confirmation]", with: user.password
      fill_in "user[picture]", with: user.picture

      click_on "Create Account"

      expect(page).to have_content("Create a new account")
    end
  end
end
