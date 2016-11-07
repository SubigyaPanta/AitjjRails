class Product < ApplicationRecord
  belongs_to :user
  has_many :product_photos

  has_many :product_categories
  has_many :categories, through: :product_categories

  # has_attached_file :photo
  # accepts_nested_attributes_for :product_photos
end
