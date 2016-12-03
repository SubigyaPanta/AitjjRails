class Product < ApplicationRecord
  belongs_to :user
  has_many :product_photos

  has_many :product_categories
  has_many :categories, through: :product_categories

  has_many :comments

  # has_attached_file :photo
  # accepts_nested_attributes_for :product_photos
  validates :name, presence: true
  validates :selling_price, presence: true

  # For pagination
  self.per_page = 10
end
