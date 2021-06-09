module API
  module V1
    class Shops < Grape::API
      include API::V1::Defaults

      resource :shops do
        desc 'Return all shops'
        get '', root: :shops do
          Shop.all
        end

        desc 'Return a shop'
        params do
          requires :id, type: String, desc: 'ID of the shop'
        end
        get ':id', root: 'shop' do
          Shop.find(permitted_params[:id])
        end

        desc 'Return a products of shop'
        params do
          requires :id, type: String, desc: 'ID of the shop'
        end
        get 'products/:id', root: 'products' do
          products = []
          Category.where(shop_id: permitted_params[:id]).each do |category|
            CategoryProduct.where(category_id: category.id).each do |category_product|
              products << category_product.product
            end
          end
          products
        end
      end
    end
  end
end
