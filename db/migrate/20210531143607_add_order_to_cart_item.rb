class AddOrderToCartItem < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :order_id, :integer, null: true
  end
end
