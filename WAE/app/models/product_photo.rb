class ProductPhoto < ApplicationRecord
  belongs_to :product
  mount_uploader :link, ProductPhotoUploader
end
