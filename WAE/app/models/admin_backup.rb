# module Admin
#   def self.table_name_prefix
#     'admin_'
#   end
# end

class Admin
  include ActiveModel::Model

  def self.getRegisteredUsers
    User.joins(:role).where(roles:{name: 'registered'}).count
  end

  def self.getLoginActivity(duration)
    User.where('last_sign_in_at > ?', duration ).count
  end

  def self.getRecentlyRegistered
    User.joins(:role).where(
        'users.created_at > :create_at AND roles.name = :rolename', {
        create_at: 1.month.ago,
        rolename:   'registered'})
  end
end
