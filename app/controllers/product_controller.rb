class ProductController < ApplicationController
  before_action :amount_sum, only: :index

  def index
    @products = Category.find(params[:id]).products
    @shop_id = Category.find(params[:id]).shop_id
  end

  private

  def amount_sum
    @amount_sum = CartItem.where(cart_id: @cart.id).sum(&:amount)
  end
end
