class CartItemController < ApplicationController

  def create
    session[:return_to] = request.referer
    return if update_amount

    @cart_item = CartItem.create(product_id: params[:id], cart_id: @cart.id, amount: 1)
    redirect_to session.delete(:return_to)
  end

  def destroy
    @cart_item = CartItem.destroy(params[:id])
    redirect_to request.referer
  end

  private

  def update_amount
    @cart_item = CartItem.find_by(product_id: params[:id], cart_id: @cart.id)
    return if @cart_item.blank?

    @cart_item.update(amount: @cart_item.amount + 1)
    redirect_to session.delete(:return_to)
  end
end
