require "rails_helper"

describe "user visits category new page" do
  context "as admin" do
    it "allows admin to edit a category" do
      admin = create(:user, role: 1)
      category = create(:category)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit categories_path

      click_link "Delete"

      expect(page).to_not have_content(category.name)
    end
  end
end
