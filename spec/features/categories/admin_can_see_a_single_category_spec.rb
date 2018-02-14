require "rails_helper"

describe "user visits category page" do
  context "as admin" do
    it "allows admin to see ideas associated with category" do
      admin = create(:user, role: 1)
      category = create(:category)
      idea = create(:idea, category: category)
      idea.images.create(name: 't', url: "http://i.telegraph.co.uk/multimedia/archive/03013/atlantic_3013875b.jpg")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit category_path(category)

      expect(page).to have_content(category.name)
      expect(page).to have_content(idea.title)
    end
  end
end
