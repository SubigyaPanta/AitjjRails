class AdminController < ApplicationController
  load_and_authorize_resource
  # authorize_resource :class => false

  def index
  end
end
