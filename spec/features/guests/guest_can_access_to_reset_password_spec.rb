require 'rails_helper'

feature "As a user who forgot my password" do
  scenario "I can navigate to a page to get a code to receive password" do
    user = create(:user)

    visit login_path

    click_on "Forgot your password?"

    expect(current_path).to eq(confirm_path)
  end

  scenario "I cannot get code without correct phone number" do
    user = create(:user)

    visit login_path
    expect(page).to have_link("Forgot your password?")

    click_on "Forgot your password?"

    expect(current_path).to eq(confirm_path)

    fill_in "user[phone]", with: "111-111-1111"

    expect(current_path).to eq(confirm_path)
  end
end
