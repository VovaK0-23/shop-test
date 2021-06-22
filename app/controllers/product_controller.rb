class ProductController < ResourcesController
  before_action :amount_sum, only: %i[index show]
  before_action :save_previous_url, only: %i[show]

  def index
    super do
      @search = Category.find(params[:id]).products.ransack(params[:q])
      @products = @search.result(distinct: true)

      @shop_id = Category.find(params[:id]).shop_id
    end
  end

  private

  def save_previous_url
    cart_url = "#{request.base_url}/cart"
    @back_url = session[:product_url]
    return if request.url == request.referer || request.referer.nil?
    return if request.referer == cart_url

    session[:product_url] = URI(request.referer).path
    @back_url = session[:product_url]
  end
end
