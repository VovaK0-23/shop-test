class ProductController < ApplicationController
  def index
    @products = Category.find(params[:id]).products
  end
end
