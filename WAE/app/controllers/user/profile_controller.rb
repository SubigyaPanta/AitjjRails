class User::ProfileController < ApplicationController
  load_and_authorize_resource

  before_action :set_profile_vars
  def index
  end

  def edit_contact
    @contact.phone = params[:contact][:phone]
    @contact.facebook = params[:contact][:facebook]
    @contact.twitter = params[:contact][:twitter]
    @contact.google = params[:contact][:google]

    puts @contact.inspect
    respond_to do |format|
      format.html { render :index, notice: 'Profile updated' }
    end
  end

  private

  def set_profile_vars
    @user = current_user
    @contact = Contact.find_or_create_by user: current_user
  end

  def contact_params
    params.permit(:contact => {})
  end
end
