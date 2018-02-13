class IdeaImage < ApplicationRecord
  belongs_to :idea, dependent: :destroy
  belongs_to :image, dependent: :destroy
end
