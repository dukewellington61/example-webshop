class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create

    if @cart.user_id

      @cart = Cart.find_by(user_id: current_user)

    else

      @cart = Cart.find(session[:cart_id])

    end

      selected_product = Product.find(params[:product_id])


    if @cart.products.include?(selected_product)
      @line_item = @cart.line_items.find_by(product_id: selected_product)
      @line_item.quantity += line_item_params[:quantity].to_i
     else
      @line_item = @cart.line_items.create(line_item_params)
    end
      @line_item.save
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    @cart = Cart.find(session[:cart_id])
    @line_item = LineItem.find_by_id(params[:id])
    @line_item.increment(:quantity)
    @line_item.save
    respond_to do |format|
      format.js
    # format.html { redirect_to cart_path(@cart) }

    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @cart = Cart.find(session[:cart_id])
    @line_item = LineItem.find_by_id(params[:id])

    if @line_item.quantity > 1
      @line_item.decrement(:quantity)
      @line_item.save
      respond_to do |format|
        format.js
      end
    else
      @line_item.destroy
      respond_to do |format|
      format.html { redirect_to cart_path(@cart) }
      format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @line_item = LineItem.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :quantity)
    end


end
