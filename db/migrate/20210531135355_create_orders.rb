class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.string :email
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
