class CartController < ApplicationController
  def show
    @cart_items = CartItem.where(cart_id: @cart.id).sort
    save_previous_url
    @back_url = session[:my_previous_url]
  end

  private

  def save_previous_url
    session[:my_previous_url] = URI(request.referer || '').path unless URI(request.referer || '').path == '/cart'
  end
end
