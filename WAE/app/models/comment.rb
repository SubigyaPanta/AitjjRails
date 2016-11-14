class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :content, presence: true
  validates :product, presence: true
  validates :user, presence: {message: 'You need to login to comment'}
end
