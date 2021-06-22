class Product < ApplicationRecord
  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products
  has_one_attached :main_image, dependent: :destroy
  has_many_attached :images, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :price, presence: true, numericality: true
end
