module CurrentCart

  private

  def set_cart

  if user_signed_in? && shopping_cart.line_items != nil

      flash[:notice] = "User already has a cart with line items"

      @cart = Cart.find_by(user_id: current_user.id)

  else

  if user_signed_in? && shopping_cart.line_items == nil

      flash[:notice] = "User had empty cart, now has cart with line items from session"

      @cart = Cart.find(session[:cart_id])
      @cart.user_id = current_user.id
      @cart.save
      old_cart.destroy

  else

  if user_signed_in? && shopping_cart.none?

      flash[:notice] = "Already existing session cart assigned to new user"

      @cart = Cart.find(session[:cart_id])
      @cart.user_id = current_user.id
      @cart.save

  else

  if user_signed_in? && session[:cart_id] == nil

      flash[:notice] = "RESCUE"

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
end



def shopping_cart
  @cart = Cart.find_by(user_id: current_user.id) || @cart = Cart.find(session[:cart_id])
end

def old_cart
  oldCart = Cart.find_by(user_id: current_user.id)
  oldCart.id_asc.first
end
end
