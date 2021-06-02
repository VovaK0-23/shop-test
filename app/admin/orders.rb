ActiveAdmin.register Order do
  permit_params :user, :email, :name, :address

  filter :user
  filter :address
  filter :name
  filter :email
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    id_column
    column :user
    column :email
    column :name
    column :address
    column(:total_price) { |order| order.cart_items.map { |item| item.product.price * item.amount }.sum }
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :user
      row :address
      row :name
      row :email
      row :created_at
      row :updated_at
      row :total_price do |order|
        order.cart_items.map { |item| item.product.price * item.amount }.sum
      end
    end

    panel 'Items' do
      table_for order.cart_items do
        column :product
        column(:product_name) { |cart_item| cart_item.product.name }
        column(:product_price) { |cart_item| cart_item.product.price }
        column :amount
        column(:price) { |item| item.product.price * item.amount }
      end
    end
  end

end
