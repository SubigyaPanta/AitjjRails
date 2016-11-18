class User::ProfileController < ApplicationController
  load_and_authorize_resource

  before_action :set_profile_vars
  def index
  end

  def edit_contact
    update_fields = {phone: params[:contact][:phone],
                     facebook: params[:contact][:facebook],
                     twitter: params[:contact][:twitter],
                     google: params[:contact][:google]}

    if @contact.update(update_fields)
      respond_to do |format|
        format.html { redirect_to action: 'index', notice: 'Profile updated' }
      end
    else
      respond_to do |format|
        format.html { render :index, notice: 'Profile was not updated' }
      end
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
