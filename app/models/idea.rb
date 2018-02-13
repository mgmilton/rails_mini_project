class Idea < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates_presence_of :description
  belongs_to :category
  belongs_to :user
  has_many :idea_images, dependent: :nullify
  has_many :images, through: :idea_images

end
