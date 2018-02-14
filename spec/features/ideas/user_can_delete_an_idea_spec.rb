require "rails_helper"

describe "User visits idea index page" do
  context "as logged in user" do
    it "allows default user to delete an idea" do
      user = create(:user)
      idea = create(:idea, user: user)
      idea.images.create(name: 't', url: "http://i.telegraph.co.uk/multimedia/archive/03013/atlantic_3013875b.jpg")
      
      visit login_path

      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Log In Here"

      visit user_ideas_path(user)

      click_link "Delete"

      expect(page).to_not have_content(idea.title)
      expect(page).to_not have_content(idea.description)
    end
  end
end
