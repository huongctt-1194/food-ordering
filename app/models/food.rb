class Food < ApplicationRecord
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  validates :name, presence: true
  validates :description, presence: true, length: {minimum:Settings.minimum_length_description, maximum:Settings.maximum_length_description}
end
