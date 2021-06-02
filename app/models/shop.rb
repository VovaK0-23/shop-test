class Shop < ApplicationRecord
  has_many :categories, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }, uniqueness: true
end
