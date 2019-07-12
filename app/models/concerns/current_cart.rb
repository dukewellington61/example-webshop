module CurrentCart

  private

  def set_cart

  if user_signed_in? && current_user.line_items.any?

      # flash[:notice] = "User already has a cart"

      @cart = Cart.find_by(user_id: current_user)

  else

  if user_signed_in? && session[:cart_id] == nil

      # flash[:notice] = "RESCUE"

      @cart = Cart.create
      session[:cart_id] = @cart.id
      @cart.user_id = current_user.id
      @cart.save

  else

  if user_signed_in? && current_user.line_items.none?

    # flash[:notice] = "Already existing session cart assigned to user"

      @cart = Cart.find(session[:cart_id])
      @cart.user_id = current_user.id
      @cart.save
      old_user_cart_set_nil
      old_carts_destroy

  else

  if session[:cart_id] == nil

    # flash[:notice] = "New session cart created"

    @cart = Cart.create
    session[:cart_id] = @cart.id

  else

    # flash[:notice] = "Already existing session cart found"

     @cart = Cart.find(session[:cart_id])

  end
  end
  end
  end
  end

def old_user_cart_set_nil
    old_user_cart = Cart.where(:user_id => current_user.id)
  if old_user_cart.count > 1
    old_user_cart.update_all(:user_id => nil)
end

def old_carts_destroy
    old_carts = Cart.where(:user_id => nil)
  if old_carts.count > 2
    old_carts.order("created_at asc")
    old_carts.offset(2).first.destroy
end
end
end
end
