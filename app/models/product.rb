class Product < ApplicationRecord
  has_many :categories, through: :category_product
end
