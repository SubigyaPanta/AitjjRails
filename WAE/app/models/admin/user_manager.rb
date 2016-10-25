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

  # THis functoin is added just for compatibility with cancancan as it loads this function and throws
  # an error if not found.
  def self.find(arg)
  end
end