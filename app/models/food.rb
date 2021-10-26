class Food < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :description, presence: true, length: {minimum:Settings.minimum_length_description, maximum:Settings.maximum_length_description}
end
