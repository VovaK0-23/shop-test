class ProductController < ApplicationController
  def index
    @products = Category.find(params[:id]).products
    @amount_cart = amount_sum
  end

  private

  def amount_sum
    items = CartItem.where(cart_id: current_user.cart.id)
    amount = []
    items.each do |item|
      amount << item.amount
    end
    amount.sum
  end
end
