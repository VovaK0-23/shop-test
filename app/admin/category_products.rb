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

  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_product_path(params['category_product']['product_id']) }
      end
    end
  end
end
