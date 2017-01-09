require "rails_helper"

describe "User can log out" do
  scenario "A logged in user can log out" do
    user = create(:user)


    visit root_path

    click_on "LOG IN"

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password

    click_on "Login"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("LOG OUT")

    click_on "LOG OUT"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("SIGN UP")
    expect(page).to have_content("LOG IN")
  end
end
