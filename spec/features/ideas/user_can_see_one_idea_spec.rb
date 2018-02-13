require "rails_helper"

describe "User visits idea index page" do
  context "as logged in user" do
    it "allows default user to see an idea" do
      user = create(:user)
      idea = create(:idea, user: user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_idea_path(user, idea)

      expect(page).to have_content(idea.title)
      expect(page).to have_content(idea.description)
    end
  end
end
