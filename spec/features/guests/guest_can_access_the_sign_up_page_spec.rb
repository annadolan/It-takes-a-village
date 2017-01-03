require "rails_helper"

describe "Visit root page" do
  context "guest sees sign up link" do
    scenario "clicks link and sees sign up page" do

      visit root_path

      expect(page).to have_link("Sign Up")

      click_on "Sign Up"

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Create Your New Account and Help a Friend")
    end
  end
end
