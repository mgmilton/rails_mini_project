require "rails_helper"
describe "User visits image index page" do
  context "as logged in user" do
    it "allows default user to create an idea" do
      user = create(:user)
      img1 = create(:image)
      img2 = create(:image)
      img3 = create(:image)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit images_path

      expect(page).to have_content(img1.name)
      expect(page).to have_content(img2.name)
      expect(page).to have_content(img3.name)
    end
  end
end
