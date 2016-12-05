class MessageTemplatesController < ApplicationController
  load_and_authorize_resource
  before_action :set_message_template, only: [:show, :edit, :update, :destroy]

  # GET /message_templates
  # GET /message_templates.json
  def index
    @message_templates = MessageTemplate.all
  end

  # GET /message_templates/1
  # GET /message_templates/1.json
  def show
  end

  # GET /message_templates/new
  def new
    @message_template = MessageTemplate.new
  end

  # GET /message_templates/1/edit
  def edit
  end

  # POST /message_templates
  # POST /message_templates.json
  def create
    @message_template = MessageTemplate.new(message_template_params)

    respond_to do |format|
      if @message_template.save
        format.html { redirect_to @message_template, notice: 'Message template was successfully created.' }
        format.json { render :show, status: :created, location: @message_template }
      else
        format.html { render :new }
        format.json { render json: @message_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /message_templates/1
  # PATCH/PUT /message_templates/1.json
  def update
    respond_to do |format|
      if @message_template.update(message_template_params)
        format.html { redirect_to @message_template, notice: 'Message template was successfully updated.' }
        format.json { render :show, status: :ok, location: @message_template }
      else
        format.html { render :edit }
        format.json { render json: @message_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_templates/1
  # DELETE /message_templates/1.json
  def destroy
    @message_template.destroy
    respond_to do |format|
      format.html { redirect_to message_templates_url, notice: 'Message template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_template
      @message_template = MessageTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_template_params
      params.require(:message_template).permit(:message, :name)
    end
end
