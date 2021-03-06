class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  # has_many :user_roles
  # has_many :roles, through: :user_roles
  # has_and_belongs_to_many :roles
  has_many :products
  has_many :comments
  has_one :contact
  # before_save :set_default_role
  before_create :set_default_role

  def role?
    if !self.role.nil? #&& !self.roles.first.nil?
      return self.role.name
    else
      return false
    end
  end

  private
  def set_default_role
    # puts 'wha t the fuck'
    # role = Role.find_by_name('registered')
    # puts role.inspect
    if self.role.nil?
      self.role = Role.find_by_name('registered')
    end
  end
end
