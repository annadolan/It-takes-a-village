require "rails_helper"

describe "Visit root page" do
  context "guest sees sign up link" do
    scenario "clicks link and sees sign up page" do

      visit root_path

      expect(page).to have_link("SIGN UP")

      click_on "SIGN UP"

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Create a new account")
    end
  end
end
