class CartController < ApplicationController
  before_action :save_previous_url, only: :show

  def show
    @cart_items = CartItem.where(cart_id: @cart.id).sort
    @back_url = session[:my_previous_url]
  end

  private

  def save_previous_url
    return if request.url == request.referer || request.referer.nil?

    session[:my_previous_url] = URI(request.referer).path
  end
end
