class Order < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :user, optional: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true
end
