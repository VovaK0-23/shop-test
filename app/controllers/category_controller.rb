class CategoryController < ResourcesController
  def index
    super do
      @categories = Shop.find(params[:id]).categories
    end
  end
end
