class ProductController < ApplicationController
  before_action :amount_sum, only: :index

  def index
    authorize Category.find(params[:id]).products

    @search = Category.find(params[:id]).products.ransack(params[:q])
    @products = @search.result
    @search.build_condition

    @shop_id = Category.find(params[:id]).shop_id
  end

  private

  def amount_sum
    @amount_sum = CartItem.where(cart_id: @cart.id).sum(&:amount)
  end
end
