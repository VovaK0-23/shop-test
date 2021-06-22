module V2::Resources
  class ShopsResource < Grape::API
    include V2::Defaults

    resource :shops do
      desc 'Return all shops'
      get do
        shops = Shop.all
        present shops, with: V2::Entities::ShopEntity
      end

      desc 'Return a shop'
      params do
        requires :id, type: String, desc: 'ID of the shop'
      end
      get ':id', root: 'shop' do
        shop = Shop.find(permitted_params[:id])
        present shop, with: V2::Entities::ShopEntity
      end

      desc 'Return a products of shop with categories'
      params do
        requires :id, type: String, desc: 'ID of the shop'
      end
      get 'products/:id', root: 'products' do
        products = Shop.find(permitted_params[:id]).products
        present products, with: V2::Entities::ProductEntity
      end
    end
  end
end
