class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def order_success_email
    @order = params[:order]
    @url = 'http://localhost:3000/shops'
    mail(to: @order.email, subject: 'Successful order')
  end
end
