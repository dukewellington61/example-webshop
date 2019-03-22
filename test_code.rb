module CurrentCart

  def set_cart

  if user_signed_in? && current_user.carts.any?

    flash[:notice] = "User already has a cart"

    @cart = Cart.find_by(user_id: current_user)

  else

  if user_signed_in? && current_user.carts.none?

    flash[:notice] = "Already existing session cart assigned to new user"

      @cart = Cart.create
      session[:cart_id] = @cart.id
      @cart.user_id = current_user.id
      @cart.save

  else

  if session[:cart_id] == nil

    flash[:notice] = "New session cart created"

    @cart = Cart.create
    session[:cart_id] = @cart.id

  else

    flash[:notice] = "Already existing session cart found"

     @cart = Cart.find(session[:cart_id])





  end
  end
  end
  end
  end
