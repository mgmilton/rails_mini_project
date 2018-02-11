require "rails_helper"

describe Idea, type: :model do
  describe "validations" do
    it "presence of title and description" do
      idea = Idea.create(title: "test")
      i2 = Idea.create(description: "test description")

      expect(idea).to_not be_valid
      expect(i2).to_not be_valid
    end

    it "uniqueness of title" do
      idea = Idea.create(title: "epiphany", description: 'it came to be in the bathtub')
      i2 = Idea.new(title: "epiphany", description: 'it came to be in the bathtub')

      expect(i2).to_not be_valid
    end
  end

  describe "relationships" do
    it {should belong_to(:category)}
    it {should belong_to(:user)}
  end
end
