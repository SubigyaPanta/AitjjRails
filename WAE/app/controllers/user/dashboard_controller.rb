class User::DashboardController < ApplicationController
  load_and_authorize_resource

  def index
    @products = Product.where(user: current_user)
    @user = current_user
    @notification_count = Notification.where(receiver: current_user)
                                    .where.not(sender:current_user)
                                    .where(is_seen: false)
                                    .size
  end

  def notification
    @notifications = Notification.where(receiver: current_user)
                                .where.not(sender: current_user)
                                .where(is_seen: false)
  end
end
