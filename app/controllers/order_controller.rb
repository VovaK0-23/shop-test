class OrderController < ApplicationController
  def new
    user_name_email
  end

  def create
    authorize Order.new(order_params)
    @order = Order.new(order_params)
    user_name_email
    if !@order.save
      flash.now[:alert] = 'Please fill all fields correctly'
      render :new
    else
      cart_items = CartItem.where(cart_id: @cart.id)
      cart_items.update_all(order_id: @order.id)
      redirect_to confirm_path(@order.id)
    end
  end

  def confirm
    authorize Order.find(params[:id])
    @order = Order.find(params[:id])
    @items = @order.cart_items
    @price = @items.map { |item| item.product.price * item.amount }.sum
  end

  def thanks; end

  private

  def user_name_email
    @user_id = current_user&.id
    @user_email = current_user&.email
  end

  def order_params
    params.require(:order).permit(:user_id, :name, :email, :address)
  end

end
