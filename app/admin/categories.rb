ActiveAdmin.register Category do
  permit_params :name, :shop_id

  filter :products
  filter :name
  filter :created_at
  filter :updated_at
end
