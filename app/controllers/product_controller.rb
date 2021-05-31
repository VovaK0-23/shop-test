class ProductController < ApplicationController
  def index
    @products = Category.find(params[:id]).products
    @amount_cart = amount_sum
    @shop_id = Category.find(params[:id]).shop_id
  end

  private

  def amount_sum
    CartItem.where(cart_id: @cart.id).sum(&:amount)
  end
end
