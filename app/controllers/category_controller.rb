class CategoryController < ApplicationController
  def index
    @categories = Shop.find(params[:id]).categories
    authorize @categories
  end
end
