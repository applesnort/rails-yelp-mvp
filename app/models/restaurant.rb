class Restaurant < ApplicationRecord
  CATEGORY_LIST = ["chinese", "italian", "japanese", "french", "belgian"]
  
  has_many :reviews, dependent: :destroy
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 250}
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY_LIST,
  message: "%{value} is not a valid category" }
  
end
