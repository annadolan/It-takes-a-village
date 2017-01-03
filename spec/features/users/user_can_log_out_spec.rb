require "rails_helper"

describe "User can log out" do
  scenario "A logged in user can log out" do
    user = create(:user)

    visit root_path

    click_on "Log In"

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password

    click_on "Login"

    visit user_path(user)
    expect(page).to have_content("Log Out")

    click_on "Log Out"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Log In")
  end
end
