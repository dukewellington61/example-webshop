module CurrentCart

  private

    # def set_cart
    #   @cart = Cart.find(session[:cart_id])
    # rescue ActiveRecord::RecordNotFound
    #   @cart = Cart.create
    #   session[:cart_id] = @cart.id
    # end

    def set_cart
    if user_signed_in? && current_user.carts.any? #load existing cart if signed in user has any
      @cart = Cart.find_by(user_id: current_user)

    else


      if user_signed_in? && current_user.carts.empty? #assign cart to current_user so it will be stored for the user


      @cart = Cart.create
      session[:cart_id] = @cart.id

    else

    if session[:cart_id]

      @cart = Cart.find(session[:cart_id])

    else

      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    end
    end
  end
end
