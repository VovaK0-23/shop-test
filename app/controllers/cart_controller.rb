class CartController < ApplicationController
  def show
    @cart_items = CartItem.where(cart_id: current_user.cart.id).sort
  end
end
