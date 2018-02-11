require "rails_helper"

describe "User visits idea index page" do
  context "as logged in user" do
    it "allows default user to edit an idea" do
      user = create(:user)
      category = create(:category)
      idea = create(:idea)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit edit_idea_path(idea)


      fill_in "idea[title]", with: "test"
      fill_in "idea[description]", with: "testy test"
      select "#{category.name}", from: "idea[category_id]"
      click_button "Update"

      expect(page).to have_content("test")
      expect(page).to have_content("testy test")
    end
  end
end
