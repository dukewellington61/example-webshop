class CommentsController < ApplicationController

  load_and_authorize_resource only: :destroy

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    
    respond_to do |format|
    if @comment.save
      ActionCable.server.broadcast 'product_channel', comment: @comment, average_rating: @comment.product.average_rating
      format.html { redirect_to @product, notice: 'Review was created successfully.' }
      format.json { render :show, status: :created, location: @product }
      format.js
    else
      format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end
end

  def destroy
    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy
    redirect_to product
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def must_be_admin
  unless current_user && current_user.admin?
    redirect_to products_path, notice: "This is only for Admins"
  end
end

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end


end
