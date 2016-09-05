class PsTwo::QuotationsController < ApplicationController
  before_action :set_ps_two_quotation, only: [:show, :edit, :update, :destroy]

  # GET /ps_two/quotations
  # GET /ps_two/quotations.json
  def index
    if(!params[:search].present?)
      @ps_two_quotations = PsTwo::Quotation.where.not(id: JSON.parse(self.get_ids_from_cookie))
    else
      searchString = params[:search]
      @ps_two_quotations = PsTwo::Quotation.where(["quote ILIKE ?", '%'+searchString+'%'])
                                            .where.not(id: JSON.parse(self.get_ids_from_cookie))
    end

  end

  def kill
    if(!params[:id].present?)
      redirect_to action: 'index'
      return
    end

    respond_to do |format|
      @ps_two_quotations = PsTwo::Quotation.where.not(id: JSON.parse(self.get_ids_from_cookie))

      format.html { render :index }
    end

  end



  # GET /ps_two/quotations/1
  # GET /ps_two/quotations/1.json
  def show
  end

  def search

  end

  # GET /ps_two/quotations/new
  def new
    @ps_two_quotation = PsTwo::Quotation.new
  end

  # GET /ps_two/quotations/1/edit
  def edit
  end

  # POST /ps_two/quotations
  # POST /ps_two/quotations.json
  def create

    #Check if there is a new Author
    if(params[:ps_two_quotation][:ps_two_authors_id] == "-1")
      @author = PsTwo::Author.create(name: params[:new_author])
      params[:ps_two_quotation][:ps_two_authors_id] = @author.id
    end

    if(params[:ps_two_quotation][:ps_two_categories_id] == "-1")
      @category = PsTwo::Category.create(name: params[:new_category])
      params[:ps_two_quotation][:ps_two_categories_id] = @category.id
    end

    @ps_two_quotation = PsTwo::Quotation.new(ps_two_quotation_params)

    respond_to do |format|
      if @ps_two_quotation.save
        format.html { redirect_to @ps_two_quotation, notice: 'Quotation was successfully created.' }
        format.json { render :show, status: :created, location: @ps_two_quotation }
      else
        format.html { render :new }
        format.json { render json: @ps_two_quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ps_two/quotations/1
  # PATCH/PUT /ps_two/quotations/1.json
  def update
    respond_to do |format|
      if @ps_two_quotation.update(ps_two_quotation_params)
        format.html { redirect_to @ps_two_quotation, notice: 'Quotation was successfully updated.' }
        format.json { render :show, status: :ok, location: @ps_two_quotation }
      else
        format.html { render :edit }
        format.json { render json: @ps_two_quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ps_two/quotations/1
  # DELETE /ps_two/quotations/1.json
  def destroy
    @ps_two_quotation.destroy
    respond_to do |format|
      format.html { redirect_to ps_two_quotations_url, notice: 'Quotation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_ids_from_cookie
    if !cookies.has_key?(:ids)
      cookies[:ids] = JSON.generate([params[:id]])
    else
      cookies[:ids] = JSON.generate(JSON.parse(cookies[:ids]) << params[:id])
    end
    return cookies[:ids]
  end

  def reset
    cookies.delete :ids
    redirect_to action: 'index'
    return
  end

  def export
    if !params.has_key?(:type)
      redirect_to action: 'index'
      return
    end

    if params[:type] == 'json'
      self.export_json
    elsif params[:type] == 'xml'
      self.export_xml
    else
      redirect_to action: 'index'
      #log that invalid export type was entered
    end
  end

  def export_json
    quotations = PsTwo::Quotation.all.as_json(include: {:ps_two_authors => {only:[:name]},
                                                      :ps_two_categories => {only:[:name]}},
                                              except: [:ps_two_authors_id, :ps_two_categories_id]
                                              )
    render json: quotations
  end

  def export_xml
    quotations = PsTwo::Quotation.all.as_json(include: {:ps_two_authors => {only:[:name]},
                                                       :ps_two_categories => {only:[:name]}},
                                             except: [:ps_two_authors_id, :ps_two_categories_id])
    render xml: quotations
    # respond_to do |format|
    #   format.xml {render xml: quotations}
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ps_two_quotation
      @ps_two_quotation = PsTwo::Quotation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ps_two_quotation_params
      params.require(:ps_two_quotation).permit(:ps_two_authors_id, :ps_two_categories_id, :quote)
    end

end
