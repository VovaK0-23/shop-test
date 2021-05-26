class Shop < ApplicationRecord
  has_many :categories, dependent: :destroy
end
