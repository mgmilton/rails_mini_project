class Image < ApplicationRecord
  validates :url, presence: true, uniqueness: true
  has_many :idea_images, dependent: :nullify
  has_many :ideas, through: :idea_images
end
