class Product < ApplicationRecord
  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :price, presence: true, numericality: true
end
