class ShopController < ApplicationController
  def index
    authorize Shop.all
    @shops = Shop.all
  end
end
