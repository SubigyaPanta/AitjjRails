class Role < ApplicationRecord
  # has_many :user_roles
  # has_many :users, through: :user_roles
  #has_many :users
  # has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true
end
