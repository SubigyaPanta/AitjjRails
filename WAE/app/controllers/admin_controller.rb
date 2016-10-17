class AdminController < ApplicationController
  load_and_authorize_resource
  # authorize_resource :class => false

  def index
    @registeredUsers    = Admin.getRegisteredUsers
    @loggedInLastWeek   = Admin.getLoginActivity 1.week.ago
    @loggedInLastMonth  = Admin.getLoginActivity 1.month.ago
    @recentlyRegistered = Admin.getRecentlyRegistered
  end
end
