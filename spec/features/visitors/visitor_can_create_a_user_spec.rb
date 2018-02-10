require "rails_helper"

describe "As a visitor" do
  describe "when I visit the root" do
    it "he or she can create a user account" do

      visit '/'

      click_on "Sign Up"

      expect(current_path).to eq(new_user_path)

      fill_in "user[name]", with: "Tom Joad"
      fill_in "user[email]", with: "tomjoad@socialism.com"
      fill_in "user[password]", with: "test"

      click_on "Create User"

      expect(page).to have_content("Welcome, Tom Joad!")
    end
  end
end
