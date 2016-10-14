class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_roles
  has_many :roles, through: :user_roles
  # has_and_belongs_to_many :roles

  # before_save :set_default_role
  before_create :set_default_role

  def role?
    if !self.roles.nil? && !self.roles.first.nil?
      return self.roles.first.name
    else
      return false
    end
  end

  private
  def set_default_role
    # puts 'wha t the fuck'
    # role = Role.find_by_name('registered')
    # puts role.inspect
    self.roles << Role.find_by_name('registered')
  end
end
