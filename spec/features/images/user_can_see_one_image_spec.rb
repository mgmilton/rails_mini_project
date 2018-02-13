require "rails_helper"

describe "User visits image index page" do
  context "as logged in user" do
    it "allows default user to see an image" do
      user = create(:user)
      image = create(:image)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit images_path

      click_link "#{image.name}"

      expect(current_path).to eq(image_path(image))
      expect(page).to have_content(image.name)
    end
  end
end
