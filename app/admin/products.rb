ActiveAdmin.register Product do
  after_create :upload_image
  after_update :upload_image
  permit_params :name, :price, :main_image, images: []

  filter :categories
  filter :name
  filter :price
  filter :created_at
  filter :updated_at

  controller do
    def upload_image(product)
      if product.main_image.present?
        image = product.main_image
        Cloudinary::Uploader.upload(ActiveStorage::Blob.service.send(:path_for, image.key), resource_type: :auto)
      end
      return if product.images.blank?

      images = product.images
      images.each do |image|
        Cloudinary::Uploader.upload(ActiveStorage::Blob.service.send(:path_for, image.key), resource_type: :auto)
      end
    end
  end

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
      if product.main_image.present?
        row :main_image do
          div do
            image_tag url_for(product.main_image), size: '200x200'
          end
        end
      end
      if product.images.present?
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
    end
    panel 'Categories' do
      table_for product.categories do
        column :name
      end
    end
  end
end
