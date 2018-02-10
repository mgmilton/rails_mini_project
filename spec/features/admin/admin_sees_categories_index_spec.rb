require "rails_helper"

describe "User visits categories index page" do
  context "as admin" do
    it "allows adin to see all categories" do
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path
      expect(page).to have_content("Admin Categories")
    end
  end

  context "as a default user" do
    it "does not allow default user to see categories index" do
      user = create(:user, role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit admin_categories_path
      expect(page).to_not have_content("Admin Categories")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
