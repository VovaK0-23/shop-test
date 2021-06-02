class CategoryController < ApplicationController
  def index
    authorize Shop.find(params[:id]).categories
    @categories = Shop.find(params[:id]).categories
  end
end
