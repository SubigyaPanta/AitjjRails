class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    product = Product.find(params[:comment][:product_id])
    puts product.inspect
    user = current_user
    if !product.nil? && !user.nil?
      @comment = Comment.new :content => params[:comment][:content]
      @comment.product = product
      @comment.user = user
      respond_to do |format|
        if @comment.save
          media_html = render_to_string file: 'shared/_comment.html.erb', locals: {:comment => @comment}
          # format.html { render 'shared/comment', comment: @comment }
          @comment_json = {id: @comment.id, content: @comment.content, media_html: media_html}
          format.json { render :create, status: :created }
        else
          # format.html { render :new }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    else
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end

  def update

  end

  def destroy
    @comment.destroy
    respond_to do |format|
      # format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :product_id)
    # params.permit(:comment => {})
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
