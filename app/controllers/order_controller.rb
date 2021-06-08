class OrderController < ApplicationController
  before_action :user_name_email, only: %i[new create]

  def new; end

  def create
    @order = Order.new(order_params)
    authorize @order
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
    @order = Order.find(params[:id])
    authorize @order
    @items = @order.cart_items
    @price = @items.map { |item| item.product.price * item.amount }.sum
  end

  def thanks
    return if params[:id].blank?

    redirect_to confirm_path(params[:id]), alert: 'Payment failed, please try again or contact support'
  end

  private

  def user_name_email
    @user_id = current_user&.id
    @user_email = current_user&.email
  end

  def order_params
    params.require(:order).permit(:user_id, :name, :email, :address)
  end

end
