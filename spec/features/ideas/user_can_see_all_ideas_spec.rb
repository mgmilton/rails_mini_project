require "rails_helper"

describe "User visits idea index page" do
  context "as logged in user" do
    it "allows default user to see all ideas" do
      user = create(:user)
      i1 = create(:idea, user: user)
      i2 = create(:idea, user: user)
      i3 = create(:idea, user: user)
      i1.images.create(name: 't', url: "http://i.telegraph.co.uk/multimedia/archive/03013/atlantic_3013875b.jpg")


      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_ideas_path(user)

      expect(page).to have_content(i1.title)
      expect(page).to have_content(i1.description)
      expect(page).to have_content(i2.title)
      expect(page).to have_content(i3.title)
    end
  end
end
