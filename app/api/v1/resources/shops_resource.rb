module V1::Resources
  class ShopsResource < Grape::API
    include V1::Defaults

    resource :shops do
      desc 'Return all shops'
      get '', root: :shops do
        shops = Shop.all
        present shops, with: V1::Entities::ShopEntity
      end

      desc 'Return a shop'
      params do
        requires :id, type: String, desc: 'ID of the shop'
      end
      get ':id', root: 'shop' do
        shop = Shop.find(permitted_params[:id])
        present shop, with: V1::Entities::ShopEntity
      end

      desc 'Return a products of shop'
      params do
        requires :id, type: String, desc: 'ID of the shop'
      end
      get 'products/:id', root: 'products' do
        products = Shop.find(permitted_params[:id]).products
        present products, with: V1::Entities::ProductEntity
      end
    end
  end
end
