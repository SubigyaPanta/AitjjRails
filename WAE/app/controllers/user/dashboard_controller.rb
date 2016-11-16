class User::DashboardController < ApplicationController
  load_and_authorize_resource

  def index
    @products = Product.where(user: current_user)
    @user = current_user
  end
end
