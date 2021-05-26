class Category < ApplicationRecord
  belongs_to :shop
  has_many :products, through: :category_product
end
