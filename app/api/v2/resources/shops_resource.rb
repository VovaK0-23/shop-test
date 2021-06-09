module V2::Resources
    class ShopsResource < Grape::API
      include V2::Defaults

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

        desc 'Return a products of shop with categories'
        params do
          requires :id, type: String, desc: 'ID of the shop'
        end
        get 'products/:id', root: 'products' do
          products = []
          Category.where(shop_id: permitted_params[:id]).each do |category|
            CategoryProduct.where(category_id: category.id).each do |category_product|
              product = category_product.product.as_json
              product[:category] = category_product.category
              products << product
            end
          end
          products
        end
      end
    end
  end
