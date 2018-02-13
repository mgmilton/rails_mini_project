require "rails_helper"

describe "admin visits category new page" do
  context "as admin" do
    it "allows admin to create a category" do
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_image_path

      
      fill_in "image[name]", with: "Aquatic Animals"
      fill_in "image[url]", with: "AquaticAnimals.com"

      click_button "Create Image"

      expect(page).to have_content("Aquatic Animals")
    end
  end
end
