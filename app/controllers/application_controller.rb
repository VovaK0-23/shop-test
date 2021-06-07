class ApplicationController < ActionController::Base
  include Pundit
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
    if session[:cart_id].blank?
      create_cart
      return
    end
    if find_cart_by_user_id.blank?
      @cart = Cart.update(session[:cart_id], { user_id: current_user.id })
      return
    end
    if find_cart_by_session.cart_items.blank?
      destroy_empty_cart
      return
    end
    update_cart
  end

  def unsigned_user_cart
    @cart = session[:cart_id].present? ? Cart.find(session[:cart_id]) : Cart.create
    session[:cart_id] ||= @cart.id
  end

  def create_cart
    @cart = if find_cart_by_user_id.present?
              find_cart_by_user_id
            else
              Cart.create(user_id: current_user.id)
            end
  end

  def destroy_empty_cart
    @cart = find_cart_by_user_id
    return if find_cart_by_session.id == find_cart_by_user_id.id

    find_cart_by_session.destroy
    session[:cart_id] = find_cart_by_user_id.id
  end

  def update_cart
    if find_cart_by_session.id != find_cart_by_user_id.id
      find_cart_by_user_id.destroy
      @cart = Cart.update(session[:cart_id], { user_id: current_user.id })
    else
      @cart = find_cart_by_user_id
    end
  end

  def find_cart_by_session
    Cart.find(session[:cart_id])
  end

  def find_cart_by_user_id
    Cart.find_by(user_id: current_user.id)
  end
end
