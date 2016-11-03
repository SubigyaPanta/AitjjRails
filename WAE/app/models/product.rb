class Product < ApplicationRecord
  belongs_to :user
  has_many :product_photo

  has_many :product_categories
  has_many :categories, through: :product_categories
end
