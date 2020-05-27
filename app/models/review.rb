class Review < ApplicationRecord
  # A review must have a parent restaurant.
  belongs_to :restaurant
  # A review must have content 
  validates :content, presence: true
  # and a rating. The rating should be a number between 0 and 5.
  validates :rating, presence: true
  validates_inclusion_of :rating, in: (0..5), on: :create, message: "must be a number between 0 and 5"
  validates_numericality_of :rating, on: :create, message: "is not a number"
end
