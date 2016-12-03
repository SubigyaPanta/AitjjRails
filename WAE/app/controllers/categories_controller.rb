class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  def index
    # @categories = Category.where(is_deleted: false)
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    puts @category.inspect

    respond_to do |format|
      if @category.save
        puts @category.inspect
        # redirect_back(fallback_location: root_path)
        format.html { redirect_to new_product_path, notice: 'Category was successfully created.' }
        # format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        # format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        # format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        # format.json { render json: @ps_two_quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @category.update(:is_deleted => true)
        format.html { redirect_to categories_path, notice: 'Category was successfully deleted.' }
        # format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        # format.json { render json: @ps_two_quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :id)
  end
end
