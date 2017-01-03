require "rails_helper"

describe "Visit new uer path" do
  context "guest sees fields to create account" do
    scenario "creates new account" do

      cat_1, cat_2 = create_list(:category, 2)
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
      select("#{cat_1.name}", from: 'user[category_id]')

      click_on "Create Account!"

      expect(current_path).to eq(user_path(User.first))
      expect(page).to have_content("Hey #{user.first_name}")
    end

    scenario "Must enter required info or is shown sign up page again" do

      cat_1, cat_2 = create_list(:category, 2)
      user = build(:user)

      visit new_user_path

      fill_in "user[first_name]", with: user.first_name
      fill_in "user[last_name]", with: user.last_name
      fill_in "user[street_number]", with: user.street_number
      fill_in "user[unit_number]", with: "45"
      fill_in "user[city]", with: user.city
      fill_in "user[state]", with: user.state
      fill_in "user[email]", with: user.email
      fill_in "user[phone]", with: user.phone
      fill_in "user[password]", with: user.password
      fill_in "user[password_confirmation]", with: user.password
      fill_in "user[picture]", with: user.picture
      select("#{cat_1.name}", from: 'user[category_id]')

      click_on "Create Account!"

      expect(page).to have_content("Create Your New Account and Help a Friend")
    end
  end
end
