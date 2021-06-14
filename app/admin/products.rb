ActiveAdmin.register Product do
  permit_params :name, :price, :main_image, images: []

  filter :categories
  filter :name
  filter :price
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :price
      f.input :name
      f.input :main_image, as: :file, input_html: { multiple: false }
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end

  action_item :add_category, only: :show do
    link_to 'Add category', new_admin_category_product_path(category_product: { product_id: product.id })
  end

  show do
    attributes_table :name, :price, :created_at, :updated_at
    attributes_table do
      row :main_image do
        div do
          image_tag url_for(product.main_image), size: '200x200'
        end
      end
      row :images do
        div do
          product.images.each do |img|
            div do
              image_tag url_for(img), size: '200x200'
            end
          end
        end
      end
    end
    panel 'Categories' do
      table_for product.categories do
        column :name
      end
    end
  end
end
