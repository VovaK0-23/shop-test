class CategoryController < ResourcesController
  before_action :amount_sum, only: :index

  def index
    super do
      shop = Shop.find(params[:id])
      @search = shop.products.ransack(params[:q])
      @products = @search.result(distinct: true)

      @categories = shop.categories
    end
  end
end
