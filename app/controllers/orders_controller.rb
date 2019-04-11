class OrdersController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :json, :js

	def index
    if current_user.admin?
      @orders = Order.all
    else
      @orders = current_user.orders
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  	def new
  end

  	def create
      respond_to do |format|
      if @order.save
        format.html
        format.js
      end
      end
  end

  	def destroy
  end
end
