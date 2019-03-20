if user_signed_in?
if current_user.carts.any?
@cart = Cart.find_by(user_id: current_user)
elsif session[:cart_id]
@cart = Cart.find(session[:cart_id])
@cart.update_attributes(:user_id, current_user.id)
else
@cart = Cart.create(user_id: current_user.id)
session[:cart_id] = @cart.id
end
else
if session[:cart_id]
@cart = Cart.find(session[:cart_id])
else
@cart = Cart.create
session[:cart_id] = @cart.id
end
end5
