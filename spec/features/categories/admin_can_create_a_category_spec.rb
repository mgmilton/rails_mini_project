require "rails_helper"

describe "user visits category new page" do
  context "as admin" do
    it "allows admin to create a category" do
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit categories_path


      click_link "Create A Category"

      fill_in "category[name]", with: "Aquatic Animals"
      click_button "Create Category"


      expect(page).to have_content("Aquatic Animals")
    end
  end
end
