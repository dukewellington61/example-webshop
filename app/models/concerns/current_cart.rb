module CurrentCart

  def set_cart

  if user_signed_in? && current_user.line_items.any?

      flash[:notice] = "User already has a cart"

      @cart = Cart.find_by(user_id: current_user)

  else

  if user_signed_in? && session[:cart_id] == nil

      flash[:notice] = "RESCUE"

      @cart = Cart.create
      session[:cart_id] = @cart.id
      @cart.user_id = current_user.id
      @cart.save

  else

  if user_signed_in? && current_user.line_items.none?

    flash[:notice] = "Already existing session cart assigned to user"

      @cart = Cart.find(session[:cart_id])
      @cart.user_id = current_user.id
      @cart.save
      old_cart_set_nil

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

def old_cart_set_nil
  oldcart = Cart.where(:user_id => current_user.id)
  if oldcart.count > 1
  oldcart.sort_by &:created_at
  oldcart.update_all(:user_id => nil)
end
end

end
