require "rails_helper"

describe "User visits idea index page" do
  context "as logged in user" do
    it "allows default user to create an idea" do
      user = create(:user)
      idea = create(:idea)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit idea_path(idea)

      expect(page).to have_content(idea.title)
      expect(page).to have_content(idea.description)
    end
  end
end
