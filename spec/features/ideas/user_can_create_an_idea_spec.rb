require "rails_helper"

describe "User visits idea index page" do
  context "as logged in user" do
    it "allows default user to create an idea" do
      user = create(:user)
      idea = create(:idea, user: user)
      category = create(:category)
      
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_ideas_path(user)

      click_link "Create an Idea"

      fill_in "idea[title]", with: "test"
      fill_in "idea[description]", with: "testy test"
      select "#{category.name}", from: "idea[category_id]"
      click_button "Create Idea"

      expect(page).to have_content("test")
      expect(page).to have_content("testy test")
    end
  end
end
