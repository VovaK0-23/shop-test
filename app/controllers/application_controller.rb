class ApplicationController < ActionController::Base
  before_action :set_cart

  private

  def set_cart
    if user_signed_in?
      signed_user_cart
      return
    end
    unsigned_user_cart
  end

  def signed_user_cart
    if session[:cart_id].present?
      @cart = Cart.update(session[:cart_id], {user_id: current_user.id})
      return
    end
    #TODO fix new cart creates even if user already have cart
    @cart = Cart.find_or_create_by(user_id: current_user.id)
    session[:cart_id] = @cart.id
  end

  def unsigned_user_cart
    if session[:cart_id].present?
      @cart = Cart.find(session[:cart_id])
      return
    end
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
