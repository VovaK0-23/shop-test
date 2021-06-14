class ProductController < ResourcesController
  before_action :amount_sum, only: :index

  def index
    super do
      @search = Category.find(params[:id]).products.ransack(params[:q])
      @products = @search.result(distinct: true)

      @shop_id = Category.find(params[:id]).shop_id
    end
  end

  private

  def amount_sum
    @amount_sum = CartItem.where(cart_id: @cart.id).sum(&:amount)
  end
end
