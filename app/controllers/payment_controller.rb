class PaymentController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :new

  def new
    order = Order.find(params[:id])
    line_items = []
    order.cart_items.each do |cart_item|
      hh = {}
      product = cart_item.product
      hh[:price_data] = {}
      hh[:price_data][:currency] = 'usd'
      hh[:price_data][:unit_amount] = product.price.to_i * 100
      hh[:price_data][:product_data] = {}
      hh[:price_data][:product_data][:name] = product.name
      hh[:quantity] = cart_item.amount
      line_items << hh
    end

    session = Stripe::Checkout::Session.create({
                                         payment_method_types: ['card'],
                                         line_items: line_items,
                                         mode: 'payment',
                                         success_url: 'https://www.google.com',
                                         cancel_url: 'https://www.google.com',
                                     })

    render json: session, only: [:id]
  end
end
