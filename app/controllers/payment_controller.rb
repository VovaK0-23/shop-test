class PaymentController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :new

  def new
    order = Order.find(params[:id])
    line_items = create_line_items(order)
    session = Stripe::Checkout::Session.create({
                                                 payment_method_types: ['card'],
                                                 line_items: line_items,
                                                 mode: 'payment',
                                                 success_url: "#{request.base_url}/thanks/#{order.id}",
                                                 cancel_url: "#{request.base_url}/payment_error/#{order.id}",
                                               })
    render json: session, only: [:id]
  end

  private

  def create_line_items(order)
    order.cart_items.map do |cart_item|
      product = cart_item.product
      { price_data: { product_data: { name: product.name }, currency: 'usd', unit_amount: product.price.to_i * 100 },
        quantity: cart_item.amount }
    end
  end
end
