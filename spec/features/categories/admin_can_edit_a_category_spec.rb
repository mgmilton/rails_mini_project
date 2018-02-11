require "rails_helper"

describe "user visits category new page" do
  context "as admin" do
    it "allows admin to edit a category" do
      admin = create(:user, role: 1)
      category = create(:category)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_category_path(category)

      fill_in "category[name]", with: "Aquatic Animals"
      click_button "Update"

      expect(page).to have_content("Aquatic Animals")
    end
  end
end
