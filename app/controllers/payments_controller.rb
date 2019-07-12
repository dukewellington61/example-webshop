class PaymentsController < ApplicationController
    before_action :authenticate_user!
    respond_to :html, :json, :js

    def create

        @cart = Cart.find(session[:cart_id])
        @user = current_user
        @line_item = LineItem.where(:cart_id => @cart.id)

        # Token is created using Checkout or Elements!
        # Get the payment token ID submitted by the form:
        token = params[:stripeToken]

        # Create the charge on Stripe's servers - this will charge the user's card
        begin
          charge = Stripe::Charge.create(
            amount: (@cart.total_price_cart * 100).to_i,
            currency: "GBP",
            source: token,
            description: params[:stripeEmail],
            receipt_email: @user.email
          )

          if charge.paid
            @order = Order.create(user_id: @user.id)
            @order.total_price = @cart.total_price_cart

            # @orders = Order.all
            #
            # @orders.each do |order|
            #   order.update(:created_at=>Time.now)
            #   @order.created_at = order.created_at
            # end

            @order.save

            @line_item.update(:order_id => @order.id)

            @line_item.update(:cart_id => nil)

            UserMailer.order_placed(@user, @line_item_product).deliver_now
            flash[:notice] = "Your payment has been accepted. Thank you."

          end

          rescue Stripe::CardError => e
            # The card has been declined
            body = e.json_body
            err = body[:error]
            flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
          end

          respond_to do |format|
          if @order.save
            format.html
            format.js

          end
          end



        end

      def show
        render "payments/create"
      end

      end
