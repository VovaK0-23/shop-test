class OrderController < ApplicationController
  def new
    @user_id = current_user&.id
    @user_email = current_user&.email
  end

  def create
    @order = Order.create(order_params)
    cart_items = CartItem.where(cart_id: @cart.id)
    cart_items.update_all(order_id: @order.id)
    redirect_to confirm_path(@order.id)
  end

  def confirm
    @order = Order.find(params[:id])
    @items = @order.cart_items
    @price = @items.map { |item| item.product.price * item.amount }.sum
  end

  def thanks; end

  private

  def order_params
    params.require(:order).permit(:user_id, :name, :email, :address)
  end

end
