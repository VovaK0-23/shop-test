ActiveAdmin.register CategoryProduct do
  permit_params :category_id, :product_id
  menu false

  form do |f|
    f.inputs do
      f.input :product
      f.input :category
    end
    f.actions
  end
end
