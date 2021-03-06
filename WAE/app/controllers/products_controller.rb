class ProductsController < ApplicationController
  load_and_authorize_resource :except => :create
  # load_and_authorize_resource

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    index_params
    set_sessions_and_page

    if !@@product_name.blank? && !@@product_category.blank?
      @products = Product.joins(:categories)
                      .where(:is_published => true)
                      .where("products.name ILIKE :name", :name => "%#{@@product_name}%")
                      .where("categories.name ILIKE :cat_name", :cat_name => "%#{@@product_category}%")
                      .paginate(:page => @@page)
                      .order(:created_at).reverse_order
                    # .where(:categories => {:name => category})
    elsif !@@product_name.blank?
      # where_clause += ' name ILIKE :name '
      @products = Product.where(:is_published => true)
                      .where("name ILIKE :name", :name => "%#{@@product_name}%")
                      .paginate(:page => @@page)
                      .order(:created_at).reverse_order
    elsif !@@product_category.blank?
      @products = Product.joins(:categories)
                      .where(:is_published => true)
                      .where("categories.name ILIKE :cat_name", :cat_name => "%#{@@product_category}%")
                      .paginate(:page => @@page)
                      .order(:created_at).reverse_order
    else
      @products = Product.where(:is_published => true).paginate(:page => @@page).order(:created_at).reverse_order
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @comments = @product.comments
  end

  # GET /products/new
  def new
    @product = Product.new
    @product_photos = ProductPhoto.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  # Authorization is pending
  def create
    picture = params[:product][:product_photos]
    params[:product].delete :product_photos
    puts picture.inspect
    @product = Product.new(product_params)
    # @photos = @product.product_photos.build
    category_ids = get_category_ids
    category_ids.each do |category|
      @product.categories << Category.find(category)
    end
    puts picture[:link].inspect
    @photo = ProductPhoto.new(link: picture[:link])
    # @photo = ProductPhoto.new({link:  params[:product][:photo]})
    # @product.product_photos.new({link: params[:product][:photo]})
    @product.product_photos << @photo

    #assign to current user
    @product.user = current_user
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.update(:is_deleted => true)
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def get_category_ids
      category_ids = params[:product][:category_ids]
      category_ids = category_ids.reject { |cat| cat.empty? } # to remove empty categories if selected by mistake
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      default = params
      params.require(:product).permit(:name, :description, :features, :product_no, :is_deleted, :is_published, :color, :standard_cost, :selling_price, :weight, :user_id, :quantity_total, :quantity_sold, :sell_start_date, :sell_end_date, :is_sold, :product_photos => [:link], :category_ids => [])
      # params.require([:product, :product_photo]).permit(:name, :description, :features, :product_no, :is_deleted, :is_published, :color, :standard_cost, :selling_price, :weight, :user_id, :quantity_total, :quantity_sold, :sell_start_date, :sell_end_date, :link, :category_ids => [])
    end

    def index_params
      # params[:page] = params[:page].nil? ? 0 : params[:page]
      #, :category, :page
      params.permit(:page, :product_name, :product_category)
    end

    def set_sessions_and_page
      @@page = params[:page]
      session[:product_name] = @@product_name = params[:product_name].nil? ? '' : params[:product_name]
      session[:product_category] = @@product_category = params[:product_category].nil? ? '' : params[:product_category]
    end
end
