class CreateCategoryProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :category_products do |t|
      t.belongs_to :category
      t.belongs_to :product
      t.timestamps
    end
  end
end
