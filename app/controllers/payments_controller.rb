class PaymentsController < ApplicationController
    before_action :authenticate_user!

    def create

        @product = Product.find(params[:product_id])
        @user = current_user

        # Token is created using Checkout or Elements!
        # Get the payment token ID submitted by the form:
        token = params[:stripeToken]

        # Create the charge on Stripe's servers - this will charge the user's card
        begin
          charge = Stripe::Charge.create(
            amount: (@product.price * 100).to_i,
            currency: "GBP",
            source: token,
            description: params[:stripeEmail],
            receipt_email: @user.email
          )

          if charge.paid
            Order.create(
                product_id: @product.id,
                user_id: @user.id,
                total: @product.price
            )
            UserMailer.order_placed(@user, @product).deliver_now
            flash[:notice] = "Your payment has been accepted. Thank you for purchasing #{@product.name}"

          end

        rescue Stripe::CardError => e
          # The card has been declined
          body = e.json_body
          err = body[:error]
          flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
        end
        redirect_to product_path(@product)
    end
end
