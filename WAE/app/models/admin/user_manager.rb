class Admin::UserManager
  include ActiveModel::Model

  def self.getUsers(id = nil)
    if id.nil?
      User.all
    else
      User.find(id)
    end
  end

  def self.getRoles(id = nil)
    if id.nil?
      Role.all
    else
      Role.find(id)
    end
  end
end