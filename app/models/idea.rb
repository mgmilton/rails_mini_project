class Idea < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates_presence_of :description
  belongs_to :category
  belongs_to :user
end
