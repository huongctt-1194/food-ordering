class Review < ApplicationRecord
  belongs_to :user
  belongs_to :food
  validates :comment, length: {maximum:Settings.maximum_length_comment}
end
