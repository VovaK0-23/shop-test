ActiveAdmin.register Product do
  permit_params :name, :price

  filter :categories
  filter :name
  filter :price
  filter :created_at
  filter :updated_at

  action_item :add_category, only: :show do
    link_to 'Add category', new_admin_category_product_path(category_product: { product_id: product.id })
  end

  show do
    attributes_table :name, :price, :created_at, :updated_at
    panel 'Categories' do
      table_for product.categories do
        column :name
      end
    end
  end
end
