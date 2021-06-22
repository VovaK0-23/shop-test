class ShopController < ResourcesController
  before_action :amount_sum, only: :index

  def index
    super do
      @search = Product.all.ransack(params[:q])
      @products = @search.result(distinct: true)
    end
  end
end
