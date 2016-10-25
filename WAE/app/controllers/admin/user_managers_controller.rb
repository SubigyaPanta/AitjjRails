class Admin::UserManagersController < ApplicationController
  # check_authorization
  load_and_authorize_resource
  before_action :set_admin_user_manager, only: [:edit, :update]


  # GET /admin/user_managers
  # GET /admin/user_managers.json
  def index
    @users = Admin::UserManager.getUsers
  end

  # GET /admin/user_managers/1
  # GET /admin/user_managers/1.json
  # def show
  # end

  # GET /admin/user_managers/new
  # def new
  #   @admin_user_manager = Admin::UserManager.new
  # end

  # GET /admin/user_managers/1/edit
  def edit
    # @user = Admin::UserManager.getUsers(params[:id])
    @roles = Admin::UserManager.getRoles
  end

  # POST /admin/user_managers
  # POST /admin/user_managers.json
  # def create
  #   @admin_user_manager = Admin::UserManager.new(admin_user_manager_params)
  #
  #   respond_to do |format|
  #     if @admin_user_manager.save
  #       format.html { redirect_to @admin_user_manager, notice: 'User manager was successfully created.' }
  #       format.json { render :show, status: :created, location: @admin_user_manager }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @admin_user_manager.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /admin/user_managers/1
  # PATCH/PUT /admin/user_managers/1.json
  def update
    respond_to do |format|
      @role = Admin::UserManager.getRoles params[:user][:role]
      if @user.update( role: @role )
        format.html { redirect_to admin_user_managers_path, notice: 'User manager was successfully updated.' }
        # format.json { render :show, status: :ok, location: @admin_user_manager }
      else
        format.html { render :edit }
        # format.json { render json: @admin_user_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/user_managers/1
  # DELETE /admin/user_managers/1.json
  # def destroy
  #   @admin_user_manager.destroy
  #   respond_to do |format|
  #     format.html { redirect_to admin_user_managers_url, notice: 'User manager was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_user_manager
    @user = Admin::UserManager.getUsers(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_user_manager_params
    params.fetch(:admin_user_manager, {})
  end
end
