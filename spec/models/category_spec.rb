require "rails_helper"

describe Category, type: :model do
  describe "validations" do
    it "presence of name" do
      category = Category.new

      expect(category).to_not be_valid
    end

    it "uniqueness of name" do
      category = Category.create(name: "orgnization")
      c2 = Category.new(name: "orgnization")
      expect(c2).to_not be_valid
    end
  end

  describe "relationships" do
    it {should have_many(:ideas)}
  end
end
