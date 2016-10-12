class PsThreeController < ApplicationController
  # before_action :authenticate_user!
  load_and_authorize_resource
  def index
  end

  def capistrano_log

  end
end
