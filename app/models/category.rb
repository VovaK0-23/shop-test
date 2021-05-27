class Category < ApplicationRecord
  belongs_to :shop
  has_many :category_products, dependent: :destroy
  has_many :products, through: :category_products
end
