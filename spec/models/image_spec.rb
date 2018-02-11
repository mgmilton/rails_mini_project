require "rails_helper"

describe Image, type: :model do
  describe "validations" do
    it "presence of url" do
      image = Image.new

      expect(image).to_not be_valid
    end


    it "uniqueness of url" do
      image = Image.create(url: "test.com")
      image_2 = Image.new(url: "test.com")

      expect(image_2).to_not be_valid
    end


    describe "relationships" do
      it {is_expected.to have_many(:ideas).through(:idea_images)}
    end
  end
end
